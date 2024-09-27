Return-Path: <r.czerwinski@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60363CDD1BC
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:31:05 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.72012.1727451063319559785
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Sep 2024 08:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rcz@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rcz@pengutronix.de>)
	id 1suCvs-0007nn-Ta; Fri, 27 Sep 2024 17:31:00 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rcz@pengutronix.de>)
	id 1suCvr-001xN4-RE; Fri, 27 Sep 2024 17:30:59 +0200
Received: from rcz by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rcz@pengutronix.de>)
	id 1suCvr-00019d-2X;
	Fri, 27 Sep 2024 17:30:59 +0200
From: r.czerwinski@pengutronix.de
To: openembedded-devel@lists.openembedded.org
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Subject: [meta-oe][PATCH] softhsm: add destroyed global access prevention patch
Date: Fri, 27 Sep 2024 17:30:47 +0200
Message-Id: <20240927153046.4410-1-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rcz@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 15:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112532

From: Rouven Czerwinski <r.czerwinski@pengutronix.de>

Currently softhsm will try to access deleted obejcts due to the order of
atexit handler implementations. Add a patch which adds a global variable
to track whether objects are deleted and prevents access if this is the
case.

This fixes a failure with the signing.bbclass where when signing
multiple fitimage configurations the second signing operation will lead
to a segfault.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 ...g-of-global-c-objects-once-they-are-.patch | 672 ++++++++++++++++++
 .../recipes-security/softhsm/softhsm_2.6.1.bb |   1 +
 2 files changed, 673 insertions(+)
 create mode 100644 meta-oe/recipes-security/softhsm/files/0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch

diff --git a/meta-oe/recipes-security/softhsm/files/0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch b/meta-oe/recipes-security/softhsm/files/0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch
new file mode 100644
index 000000000..6e61aeac3
--- /dev/null
+++ b/meta-oe/recipes-security/softhsm/files/0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch
@@ -0,0 +1,672 @@
+From 41968e7b742ad59046523a7eeb63514237fb63af Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@openssl.org>
+Date: Fri, 27 Oct 2023 14:57:37 -0400
+Subject: [PATCH] Prevent accessing of global c++ objects once they are deleted
+
+Fixes (Maybe) #729.
+Reset objects_deleted after reset is called.
+
+Upstream-Status: Submitted [https://github.com/opendnssec/SoftHSMv2/pull/742]
+---
+ src/lib/SoftHSM.cpp |   5 ++
+ src/lib/main.cpp    | 138 ++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 143 insertions(+)
+
+diff --git a/src/lib/SoftHSM.cpp b/src/lib/SoftHSM.cpp
+index 02c0f95..95bf208 100644
+--- a/src/lib/SoftHSM.cpp
++++ b/src/lib/SoftHSM.cpp
+@@ -89,6 +89,8 @@
+ 
+ // Initialise the one-and-only instance
+ 
++int objects_deleted = 0;
++
+ #ifdef HAVE_CXX11
+ 
+ std::unique_ptr<MutexFactory> MutexFactory::instance(nullptr);
+@@ -406,6 +408,8 @@ void SoftHSM::reset()
+ {
+ 	if (instance.get())
+ 		instance.reset();
++
++	objects_deleted = 0;
+ }
+ 
+ // Constructor
+@@ -445,6 +449,7 @@ SoftHSM::~SoftHSM()
+ 
+ 	isInitialised = false;
+ 
++	objects_deleted = 1;
+ 	resetMutexFactoryCallbacks();
+ }
+ 
+diff --git a/src/lib/main.cpp b/src/lib/main.cpp
+index 2dfd0eb..e89f18c 100644
+--- a/src/lib/main.cpp
++++ b/src/lib/main.cpp
+@@ -49,6 +49,8 @@
+ #define PKCS_API
+ #endif
+ 
++extern int objects_deleted;
++
+ // PKCS #11 function list
+ static CK_FUNCTION_LIST functionList =
+ {
+@@ -130,6 +132,8 @@ PKCS_API CK_RV C_Initialize(CK_VOID_PTR pInitArgs)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_Initialize(pInitArgs);
+ 	}
+ 	catch (...)
+@@ -145,6 +149,8 @@ PKCS_API CK_RV C_Finalize(CK_VOID_PTR pReserved)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_Finalize(pReserved);
+ 	}
+ 	catch (...)
+@@ -160,6 +166,8 @@ PKCS_API CK_RV C_GetInfo(CK_INFO_PTR pInfo)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetInfo(pInfo);
+ 	}
+ 	catch (...)
+@@ -175,6 +183,8 @@ PKCS_API CK_RV C_GetFunctionList(CK_FUNCTION_LIST_PTR_PTR ppFunctionList)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		if (ppFunctionList == NULL_PTR) return CKR_ARGUMENTS_BAD;
+ 
+ 		*ppFunctionList = &functionList;
+@@ -194,6 +204,8 @@ PKCS_API CK_RV C_GetSlotList(CK_BBOOL tokenPresent, CK_SLOT_ID_PTR pSlotList, CK
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetSlotList(tokenPresent, pSlotList, pulCount);
+ 	}
+ 	catch (...)
+@@ -209,6 +221,8 @@ PKCS_API CK_RV C_GetSlotInfo(CK_SLOT_ID slotID, CK_SLOT_INFO_PTR pInfo)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetSlotInfo(slotID, pInfo);
+ 	}
+ 	catch (...)
+@@ -224,6 +238,8 @@ PKCS_API CK_RV C_GetTokenInfo(CK_SLOT_ID slotID, CK_TOKEN_INFO_PTR pInfo)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetTokenInfo(slotID, pInfo);
+ 	}
+ 	catch (...)
+@@ -239,6 +255,8 @@ PKCS_API CK_RV C_GetMechanismList(CK_SLOT_ID slotID, CK_MECHANISM_TYPE_PTR pMech
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetMechanismList(slotID, pMechanismList, pulCount);
+ 	}
+ 	catch (...)
+@@ -254,6 +272,8 @@ PKCS_API CK_RV C_GetMechanismInfo(CK_SLOT_ID slotID, CK_MECHANISM_TYPE type, CK_
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetMechanismInfo(slotID, type, pInfo);
+ 	}
+ 	catch (...)
+@@ -269,6 +289,8 @@ PKCS_API CK_RV C_InitToken(CK_SLOT_ID slotID, CK_UTF8CHAR_PTR pPin, CK_ULONG ulP
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_InitToken(slotID, pPin, ulPinLen, pLabel);
+ 	}
+ 	catch (...)
+@@ -284,6 +306,8 @@ PKCS_API CK_RV C_InitPIN(CK_SESSION_HANDLE hSession, CK_UTF8CHAR_PTR pPin, CK_UL
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_InitPIN(hSession, pPin, ulPinLen);
+ 	}
+ 	catch (...)
+@@ -299,6 +323,8 @@ PKCS_API CK_RV C_SetPIN(CK_SESSION_HANDLE hSession, CK_UTF8CHAR_PTR pOldPin, CK_
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SetPIN(hSession, pOldPin, ulOldLen, pNewPin, ulNewLen);
+ 	}
+ 	catch (...)
+@@ -314,6 +340,8 @@ PKCS_API CK_RV C_OpenSession(CK_SLOT_ID slotID, CK_FLAGS flags, CK_VOID_PTR pApp
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_OpenSession(slotID, flags, pApplication, notify, phSession);
+ 	}
+ 	catch (...)
+@@ -329,6 +357,8 @@ PKCS_API CK_RV C_CloseSession(CK_SESSION_HANDLE hSession)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_CloseSession(hSession);
+ 	}
+ 	catch (...)
+@@ -344,6 +374,8 @@ PKCS_API CK_RV C_CloseAllSessions(CK_SLOT_ID slotID)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_CloseAllSessions(slotID);
+ 	}
+ 	catch (...)
+@@ -359,6 +391,8 @@ PKCS_API CK_RV C_GetSessionInfo(CK_SESSION_HANDLE hSession, CK_SESSION_INFO_PTR
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetSessionInfo(hSession, pInfo);
+ 	}
+ 	catch (...)
+@@ -374,6 +408,8 @@ PKCS_API CK_RV C_GetOperationState(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pOper
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetOperationState(hSession, pOperationState, pulOperationStateLen);
+ 	}
+ 	catch (...)
+@@ -389,6 +425,8 @@ PKCS_API CK_RV C_SetOperationState(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pOper
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SetOperationState(hSession, pOperationState, ulOperationStateLen, hEncryptionKey, hAuthenticationKey);
+ 	}
+ 	catch (...)
+@@ -404,6 +442,8 @@ PKCS_API CK_RV C_Login(CK_SESSION_HANDLE hSession, CK_USER_TYPE userType, CK_UTF
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_Login(hSession, userType, pPin, ulPinLen);
+ 	}
+ 	catch (...)
+@@ -419,6 +459,8 @@ PKCS_API CK_RV C_Logout(CK_SESSION_HANDLE hSession)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_Logout(hSession);
+ 	}
+ 	catch (...)
+@@ -434,6 +476,8 @@ PKCS_API CK_RV C_CreateObject(CK_SESSION_HANDLE hSession, CK_ATTRIBUTE_PTR pTemp
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_CreateObject(hSession, pTemplate, ulCount, phObject);
+ 	}
+ 	catch (...)
+@@ -449,6 +493,8 @@ PKCS_API CK_RV C_CopyObject(CK_SESSION_HANDLE hSession, CK_OBJECT_HANDLE hObject
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_CopyObject(hSession, hObject, pTemplate, ulCount, phNewObject);
+ 	}
+ 	catch (...)
+@@ -464,6 +510,8 @@ PKCS_API CK_RV C_DestroyObject(CK_SESSION_HANDLE hSession, CK_OBJECT_HANDLE hObj
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DestroyObject(hSession, hObject);
+ 	}
+ 	catch (...)
+@@ -479,6 +527,8 @@ PKCS_API CK_RV C_GetObjectSize(CK_SESSION_HANDLE hSession, CK_OBJECT_HANDLE hObj
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetObjectSize(hSession, hObject, pulSize);
+ 	}
+ 	catch (...)
+@@ -494,6 +544,8 @@ PKCS_API CK_RV C_GetAttributeValue(CK_SESSION_HANDLE hSession, CK_OBJECT_HANDLE
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetAttributeValue(hSession, hObject, pTemplate, ulCount);
+ 	}
+ 	catch (...)
+@@ -509,6 +561,8 @@ PKCS_API CK_RV C_SetAttributeValue(CK_SESSION_HANDLE hSession, CK_OBJECT_HANDLE
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SetAttributeValue(hSession, hObject, pTemplate, ulCount);
+ 	}
+ 	catch (...)
+@@ -524,6 +578,8 @@ PKCS_API CK_RV C_FindObjectsInit(CK_SESSION_HANDLE hSession, CK_ATTRIBUTE_PTR pT
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_FindObjectsInit(hSession, pTemplate, ulCount);
+ 	}
+ 	catch (...)
+@@ -539,6 +595,8 @@ PKCS_API CK_RV C_FindObjects(CK_SESSION_HANDLE hSession, CK_OBJECT_HANDLE_PTR ph
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_FindObjects(hSession, phObject, ulMaxObjectCount, pulObjectCount);
+ 	}
+ 	catch (...)
+@@ -554,6 +612,8 @@ PKCS_API CK_RV C_FindObjectsFinal(CK_SESSION_HANDLE hSession)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_FindObjectsFinal(hSession);
+ 	}
+ 	catch (...)
+@@ -569,6 +629,8 @@ PKCS_API CK_RV C_EncryptInit(CK_SESSION_HANDLE hSession, CK_MECHANISM_PTR pMecha
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_EncryptInit(hSession, pMechanism, hObject);
+ 	}
+ 	catch (...)
+@@ -584,6 +646,8 @@ PKCS_API CK_RV C_Encrypt(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pData, CK_ULONG
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_Encrypt(hSession, pData, ulDataLen, pEncryptedData, pulEncryptedDataLen);
+ 	}
+ 	catch (...)
+@@ -599,6 +663,8 @@ PKCS_API CK_RV C_EncryptUpdate(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pData, CK
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_EncryptUpdate(hSession, pData, ulDataLen, pEncryptedData, pulEncryptedDataLen);
+ 	}
+ 	catch (...)
+@@ -614,6 +680,8 @@ PKCS_API CK_RV C_EncryptFinal(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pEncrypted
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_EncryptFinal(hSession, pEncryptedData, pulEncryptedDataLen);
+ 	}
+ 	catch (...)
+@@ -629,6 +697,8 @@ PKCS_API CK_RV C_DecryptInit(CK_SESSION_HANDLE hSession, CK_MECHANISM_PTR pMecha
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DecryptInit(hSession, pMechanism, hObject);
+ 	}
+ 	catch (...)
+@@ -644,6 +714,8 @@ PKCS_API CK_RV C_Decrypt(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pEncryptedData,
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_Decrypt(hSession, pEncryptedData, ulEncryptedDataLen, pData, pulDataLen);
+ 	}
+ 	catch (...)
+@@ -659,6 +731,8 @@ PKCS_API CK_RV C_DecryptUpdate(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pEncrypte
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DecryptUpdate(hSession, pEncryptedData, ulEncryptedDataLen, pData, pDataLen);
+ 	}
+ 	catch (...)
+@@ -674,6 +748,8 @@ PKCS_API CK_RV C_DecryptFinal(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pData, CK_
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DecryptFinal(hSession, pData, pDataLen);
+ 	}
+ 	catch (...)
+@@ -689,6 +765,8 @@ PKCS_API CK_RV C_DigestInit(CK_SESSION_HANDLE hSession, CK_MECHANISM_PTR pMechan
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DigestInit(hSession, pMechanism);
+ 	}
+ 	catch (...)
+@@ -704,6 +782,8 @@ PKCS_API CK_RV C_Digest(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pData, CK_ULONG
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_Digest(hSession, pData, ulDataLen, pDigest, pulDigestLen);
+ 	}
+ 	catch (...)
+@@ -719,6 +799,8 @@ PKCS_API CK_RV C_DigestUpdate(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pPart, CK_
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DigestUpdate(hSession, pPart, ulPartLen);
+ 	}
+ 	catch (...)
+@@ -734,6 +816,8 @@ PKCS_API CK_RV C_DigestKey(CK_SESSION_HANDLE hSession, CK_OBJECT_HANDLE hObject)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DigestKey(hSession, hObject);
+ 	}
+ 	catch (...)
+@@ -749,6 +833,8 @@ PKCS_API CK_RV C_DigestFinal(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pDigest, CK
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DigestFinal(hSession, pDigest, pulDigestLen);
+ 	}
+ 	catch (...)
+@@ -764,6 +850,8 @@ PKCS_API CK_RV C_SignInit(CK_SESSION_HANDLE hSession, CK_MECHANISM_PTR pMechanis
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SignInit(hSession, pMechanism, hKey);
+ 	}
+ 	catch (...)
+@@ -779,6 +867,8 @@ PKCS_API CK_RV C_Sign(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pData, CK_ULONG ul
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_Sign(hSession, pData, ulDataLen, pSignature, pulSignatureLen);
+ 	}
+ 	catch (...)
+@@ -794,6 +884,8 @@ PKCS_API CK_RV C_SignUpdate(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pPart, CK_UL
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SignUpdate(hSession, pPart, ulPartLen);
+ 	}
+ 	catch (...)
+@@ -809,6 +901,8 @@ PKCS_API CK_RV C_SignFinal(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pSignature, C
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SignFinal(hSession, pSignature, pulSignatureLen);
+ 	}
+ 	catch (...)
+@@ -824,6 +918,8 @@ PKCS_API CK_RV C_SignRecoverInit(CK_SESSION_HANDLE hSession, CK_MECHANISM_PTR pM
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SignRecoverInit(hSession, pMechanism, hKey);
+ 	}
+ 	catch (...)
+@@ -839,6 +935,8 @@ PKCS_API CK_RV C_SignRecover(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pData, CK_U
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SignRecover(hSession, pData, ulDataLen, pSignature, pulSignatureLen);
+ 	}
+ 	catch (...)
+@@ -854,6 +952,8 @@ PKCS_API CK_RV C_VerifyInit(CK_SESSION_HANDLE hSession, CK_MECHANISM_PTR pMechan
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_VerifyInit(hSession, pMechanism, hKey);
+ 	}
+ 	catch (...)
+@@ -869,6 +969,8 @@ PKCS_API CK_RV C_Verify(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pData, CK_ULONG
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_Verify(hSession, pData, ulDataLen, pSignature, ulSignatureLen);
+ 	}
+ 	catch (...)
+@@ -884,6 +986,8 @@ PKCS_API CK_RV C_VerifyUpdate(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pPart, CK_
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_VerifyUpdate(hSession, pPart, ulPartLen);
+ 	}
+ 	catch (...)
+@@ -899,6 +1003,8 @@ PKCS_API CK_RV C_VerifyFinal(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pSignature,
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_VerifyFinal(hSession, pSignature, ulSignatureLen);
+ 	}
+ 	catch (...)
+@@ -914,6 +1020,8 @@ PKCS_API CK_RV C_VerifyRecoverInit(CK_SESSION_HANDLE hSession, CK_MECHANISM_PTR
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_VerifyRecoverInit(hSession, pMechanism, hKey);
+ 	}
+ 	catch (...)
+@@ -929,6 +1037,8 @@ PKCS_API CK_RV C_VerifyRecover(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pSignatur
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_VerifyRecover(hSession, pSignature, ulSignatureLen, pData, pulDataLen);
+ 	}
+ 	catch (...)
+@@ -944,6 +1054,8 @@ PKCS_API CK_RV C_DigestEncryptUpdate(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pPa
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DigestEncryptUpdate(hSession, pPart, ulPartLen, pEncryptedPart, pulEncryptedPartLen);
+ 	}
+ 	catch (...)
+@@ -959,6 +1071,8 @@ PKCS_API CK_RV C_DecryptDigestUpdate(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pPa
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DecryptDigestUpdate(hSession, pPart, ulPartLen, pDecryptedPart, pulDecryptedPartLen);
+ 	}
+ 	catch (...)
+@@ -974,6 +1088,8 @@ PKCS_API CK_RV C_SignEncryptUpdate(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pPart
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SignEncryptUpdate(hSession, pPart, ulPartLen, pEncryptedPart, pulEncryptedPartLen);
+ 	}
+ 	catch (...)
+@@ -989,6 +1105,8 @@ PKCS_API CK_RV C_DecryptVerifyUpdate(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pEn
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DecryptVerifyUpdate(hSession, pEncryptedPart, ulEncryptedPartLen, pPart, pulPartLen);
+ 	}
+ 	catch (...)
+@@ -1004,6 +1122,8 @@ PKCS_API CK_RV C_GenerateKey(CK_SESSION_HANDLE hSession, CK_MECHANISM_PTR pMecha
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GenerateKey(hSession, pMechanism, pTemplate, ulCount, phKey);
+ 	}
+ 	catch (...)
+@@ -1029,6 +1149,8 @@ PKCS_API CK_RV C_GenerateKeyPair
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GenerateKeyPair(hSession, pMechanism, pPublicKeyTemplate, ulPublicKeyAttributeCount, pPrivateKeyTemplate, ulPrivateKeyAttributeCount, phPublicKey, phPrivateKey);
+ 	}
+ 	catch (...)
+@@ -1052,6 +1174,8 @@ PKCS_API CK_RV C_WrapKey
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_WrapKey(hSession, pMechanism, hWrappingKey, hKey, pWrappedKey, pulWrappedKeyLen);
+ 	}
+ 	catch (...)
+@@ -1077,6 +1201,8 @@ PKCS_API CK_RV C_UnwrapKey
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_UnwrapKey(hSession, pMechanism, hUnwrappingKey, pWrappedKey, ulWrappedKeyLen, pTemplate, ulCount, phKey);
+ 	}
+ 	catch (...)
+@@ -1100,6 +1226,8 @@ PKCS_API CK_RV C_DeriveKey
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_DeriveKey(hSession, pMechanism, hBaseKey, pTemplate, ulCount, phKey);
+ 	}
+ 	catch (...)
+@@ -1115,6 +1243,8 @@ PKCS_API CK_RV C_SeedRandom(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pSeed, CK_UL
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_SeedRandom(hSession, pSeed, ulSeedLen);
+ 	}
+ 	catch (...)
+@@ -1130,6 +1260,8 @@ PKCS_API CK_RV C_GenerateRandom(CK_SESSION_HANDLE hSession, CK_BYTE_PTR pRandomD
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GenerateRandom(hSession, pRandomData, ulRandomLen);
+ 	}
+ 	catch (...)
+@@ -1145,6 +1277,8 @@ PKCS_API CK_RV C_GetFunctionStatus(CK_SESSION_HANDLE hSession)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_GetFunctionStatus(hSession);
+ 	}
+ 	catch (...)
+@@ -1160,6 +1294,8 @@ PKCS_API CK_RV C_CancelFunction(CK_SESSION_HANDLE hSession)
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_CancelFunction(hSession);
+ 	}
+ 	catch (...)
+@@ -1175,6 +1311,8 @@ PKCS_API CK_RV C_WaitForSlotEvent(CK_FLAGS flags, CK_SLOT_ID_PTR pSlot, CK_VOID_
+ {
+ 	try
+ 	{
++		if (objects_deleted == 1)
++			return CKR_FUNCTION_FAILED;
+ 		return SoftHSM::i()->C_WaitForSlotEvent(flags, pSlot, pReserved);
+ 	}
+ 	catch (...)
+-- 
+2.42.0
+
diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index 930bca96f..66f048879 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -7,6 +7,7 @@ DEPENDS = "sqlite3"
 
 SRC_URI = "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz \
            file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
+           file://0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch \
 "
 SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2"
 
-- 
2.39.5


