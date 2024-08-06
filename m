Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD8FC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 06:40:05 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.142])
 by mx.groups.io with SMTP id smtpd.web11.1339.1722926402923675536
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Aug 2024 23:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=A7uqb1it;
 spf=pass (domain: kpit.com, ip: 40.107.57.142, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7wwk/syKRGji1m5xk/9WyN4syPfrikIcMDfurS+FS7CdK/VgmGSmerVHB4V5a3pTX0uYcMTaLNSAGPqr74Q22SCyaNA4ZB6E10VJYSeGrC23YDv2HIeYisXdK5Fcy4CeaLGPZIi4qfBZzccbBLMHGmgArrfkEki4u0Ct+WlIi1Oy0iSjVxQuPLr5WGJ+EJHA0Bo+us2jL1Gs4wgTqmHxwmy9tA2VXpFz8RTFG5uO3hJqeRy4w3ZBPeFMFZ0Hevae2nrnbDN+FzcWQmGYZAfu1fHv95CxEL0Z6KDhfImEPMJjbUHJI6mLZ8RpbGQ3gMQQFFMhybTLLLvzfgk/M4EZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvbYfTIrWKt0bVNt03GIhWv8Ku+YHuBtXR1MOi/WcLQ=;
 b=lJkERb5nb4usQHjdKJRKJ7VHlF6hFk0xnxziezLS6ciAFNdduTyQ7HX77O9Vr9bzSaQqJkFEKrl0RGR0UpjTgMIBZbY/8lS5ytHZryUK/8dwaI1H8j1j/4qOqiLPQ4SIMZ5sE0uSSGe5s5zLva+2gMY4vIZXOUHx95VHIQ3biZWeHvBfM7acOWxcQbXjBFk5JKKaWcrme3NGKyudcMCdZW/Wlh6iZDD7oMrSx04LU+uYbE/eZv383DdbFMTRTn7KsapcBY9XtDfVl4ZrfI9OgDn2xupTPBzzbNMNOF8gDDqQhnW3kfcmiL/jy7yvw4yCIZ0yBLR0LcMqN8WjRtYvGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvbYfTIrWKt0bVNt03GIhWv8Ku+YHuBtXR1MOi/WcLQ=;
 b=A7uqb1itPAYLQbH3DHybwC/vPTCP1uAUmSbaZbAtkcBqwyguBgLtKTQed4CFW/1rQ0NOU2oSN3NW/oMIKNbjfajLohCUy7RE3ib2cy6dcfIAhn0m2DBLGcWXq8kRIy4wdEGZfBnf+7gCZEGMgjzWjqqz4sY0MH+bJshdcDQNKxQ=
Received: from SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) by PN3PR01MB7270.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:92::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28; Tue, 6 Aug
 2024 06:39:56 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::89) by SI2PR01CA0011.outlook.office365.com
 (2603:1096:4:191::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Tue, 6 Aug 2024 06:39:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Tue, 6 Aug 2024 06:39:55 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 6 Aug
 2024 12:09:53 +0530
From: Nikhil R <nikhil.r@kpit.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <ranjitsinh.rathod@kpit.com>
Subject: [oe][kirkstone][PATCH] opensc: Fix CVE CVE-2023-5992
Date: Tue, 6 Aug 2024 12:09:39 +0530
Message-ID: <20240806063939.527656-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|PN3PR01MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afb6c4f-03d1-4aa7-e907-08dcb5e29590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QeckYCujkf1oXVP6z9lT38GDdq/DoPBinjFPU43Gu41Z7o1z9h6gr191AVS3?=
 =?us-ascii?Q?ddiP/fkEQsKOzAzLWoOAxRCEPfwtdeKOduMl8IP/quT6ktZR8WLA/zXziiGn?=
 =?us-ascii?Q?zjPogtuRVnUCT0VeS3XvCso6m0LwLur6fAzuzSs8vz8w0fbbsVCI0KaVgub6?=
 =?us-ascii?Q?RzJB27VIAZiMA/EhFAdajF8PthGZfHdyaUx2OIqqIN2N7EgXgIXdjyeD8X5U?=
 =?us-ascii?Q?QK9g1X6Hb/zogPApzg1fuyusasOdOEkbGK4uf7Fr7Nc8OqaohlVcox5Boymo?=
 =?us-ascii?Q?GUQzJYASat3/8oQBibvk9n+4WfUnMmGnCzwMX8LS7wsR53PsBOry/c4bfeLW?=
 =?us-ascii?Q?YYVrBt6L/PpicE6YzfZQCGlpLigreb8n3SL9Gs7ZtClgeR/V3aq57l2JFDLF?=
 =?us-ascii?Q?94KxzYtazd3Ad2FeFb7YJp8hkesjELqHatgjLGx3eszdPwGwWwkrfSUCMAj7?=
 =?us-ascii?Q?H1scqMXxUEdgvaZZeLpBGTgtsw8eWuEiV3Mw85C0tpkSRWsEgxRoIXoObVFe?=
 =?us-ascii?Q?7Xx0hBhQQY0R24e5WKijGxnLvEqFSB08gOgjeMk0akjMKa3dVHqul76URxkP?=
 =?us-ascii?Q?eRruV17mZS+jlsR6vmliipFrzOBy9dzh55H/a0y/MZ1mLqnWO4sVP40lO2vW?=
 =?us-ascii?Q?3DvL+S4zz5YMq9bxLnKhNkUbWL10nM7Q8xGQWXQx4MXIJvMAMAVjz2sxt5pm?=
 =?us-ascii?Q?14971PKCG9nOJfyGc2OdQdD0sNT+WJwGj+GQ6KylCAPrYNN7OfuPYoiHkMb8?=
 =?us-ascii?Q?A6v7Wn14nIx7sLt429J78m1f9aJaRUbLGTWk/G47gFytoDwyc4z8Vx/7f+zO?=
 =?us-ascii?Q?BsAGOP8rI/nM3n1o5WvL0j07M+7GgdqWwP1RH/yXTGWOv40B/i2YdOsU+ZHQ?=
 =?us-ascii?Q?9+gtjDj/CHnLuqq1RWEhTY2XY+/5E6pgUN/4jt5Fj63EC4+/8Umsih4sYHWn?=
 =?us-ascii?Q?VKi58aXtBuWA/tXb7Xg4kVklUIfGPQv50J1Qytx2eG+VoB8JTw4a8DTVc47H?=
 =?us-ascii?Q?7h0UpRV7MtGANHcfs3jbpBORFvjWo2xVzdqn4XF6TyF72CoKpCWjN8msfJe2?=
 =?us-ascii?Q?oML91H6WJYnVNjP6SP3m3l1StL/VjxFioELrhX3bTH3hIaQg00+ROidgjOyP?=
 =?us-ascii?Q?zgiwZTyYMMLD0bSrfLsa+8iqOlBVRFEeW6ak7o6/Hb0iPijz2T52SeIJXPSm?=
 =?us-ascii?Q?dXOb4bzth+Fljic3wtFzbxxvJVvlSU2hSAwHktJxO3QdC+dPkW7uDotQnsWH?=
 =?us-ascii?Q?6xceTMAEYEjLoFVGlTpmn9Q88gU0xfIB3SlxKUs8hoOL4spQqjySJfq/18gf?=
 =?us-ascii?Q?7jBmAWBmQbEZ12g2mju8g+moecU+2ujjsL3isnfhM/0dyOHDj0RaXLMTMG0w?=
 =?us-ascii?Q?/EeluK/+1OmC1/z0yObvz/xzgwGX3IDBJwYYbeE+JJQ0XFBPiQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 06:39:55.5056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afb6c4f-03d1-4aa7-e907-08dcb5e29590
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7270
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 06:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111517

A vulnerability was found in OpenSC where PKCS#1
encryption padding removal is not implemented as
side-channel resistant. This issue may result in
the potential leak of private data.

Links: https://github.com/OpenSC/OpenSC/pull/2948/commits
https://github.com/OpenSC/OpenSC/pull/3016

Link: https://github.com/xhanulik/OpenSC/commit/bb9bd627462af4d61943a33d6e5=
4308e103618f0
Add the above commit to fix the below error
Error:
| ../../../git/src/pkcs11/mechanism.c: In function 'sc_pkcs11_decrypt':
| ../../../git/src/pkcs11/mechanism.c:1093:24: error: 'rv' undeclared (firs=
t use in this function)

The below commits were not added as they are part
of unittests
https://github.com/OpenSC/OpenSC/pull/2948/commits/708ce24c6b9f92a9f39bb7ac=
cda601b2891304a3
https://github.com/OpenSC/OpenSC/pull/3016/commits/7309b37eb82496e732467128=
3a39f9291be09830

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 ...lement-the-C_DecryptFinalize-and-C_D.patch | 110 ++++++
 .../opensc/opensc/CVE-2023-5992-1.patch       | 357 ++++++++++++++++++
 .../opensc/opensc/CVE-2023-5992-2.patch       |  39 ++
 .../opensc/opensc/CVE-2023-5992-3.patch       | 105 ++++++
 .../opensc/opensc/CVE-2023-5992-4.patch       |  47 +++
 .../opensc/opensc/CVE-2023-5992-5.patch       | 115 ++++++
 .../opensc/opensc/CVE-2023-5992-6.patch       |  47 +++
 .../opensc/opensc/CVE-2023-5992-7.patch       |  33 ++
 .../opensc/opensc/CVE-2023-5992-8.patch       |  71 ++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |   9 +
 10 files changed, 933 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Preparing-to=
-implement-the-C_DecryptFinalize-and-C_D.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.p=
atch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.p=
atch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.p=
atch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.p=
atch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.p=
atch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.p=
atch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.p=
atch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.p=
atch

diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implem=
ent-the-C_DecryptFinalize-and-C_D.patch b/meta-oe/recipes-support/opensc/op=
ensc/0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch
new file mode 100644
index 000000000..619ab522e
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-the=
-C_DecryptFinalize-and-C_D.patch
@@ -0,0 +1,110 @@
+From bb9bd627462af4d61943a33d6e54308e103618f0 Mon Sep 17 00:00:00 2001
+From: Peter Popovec <popovec.peter@gmail.com>
+Date: Mon, 20 Dec 2021 08:43:49 +0100
+Subject: [PATCH] Preparing to implement the C_DecryptFinalize and
+ C_DecryptUpdate functions.
+
+The C_Decrypt() and pkcs15_prkey_decrypt() functions have been changed to
+allow pkcs15_prkey_decrypt() to be called from C_DecryptInit(),
+C_DecryptUpdate() and C_DecryptFinalize().
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/xhanulik/OpenSC/commit/bb9bd=
627462af4d61943a33d6e54308e103618f0]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Refreshed hunk to match latest kirkstone
+---
+ src/pkcs11/framework-pkcs15.c | 15 +++++++++++++
+ src/pkcs11/mechanism.c        | 42 ++++++++++++++++++++++++++++++-----
+ 2 files changed, 51 insertions(+), 6 deletions(-)
+
+diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15.c
+index 688cd84fdc..18f94271ed 100644
+--- a/src/pkcs11/framework-pkcs15.c
++++ b/src/pkcs11/framework-pkcs15.c
+@@ -4345,6 +4345,21 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_se
+       int rv, flags =3D 0, prkey_has_path =3D 0;
+       CK_ULONG mask, good, rv_pkcs11;
+
++      if (pulDataLen =3D=3D NULL) {
++              /* This is call from the C_DecyptInit function */
++              sc_log(context, "C_DecryptInit...");
++              return CKR_OK;
++      }
++      if (pEncryptedData =3D=3D NULL && ulEncryptedDataLen =3D=3D 0) {
++              /* This is call from the C_DecryptFinalize function */
++              sc_log(context, "C_DecryptFinalize...");
++              *pulDataLen =3D 0;
++              return CKR_OK;
++      }
++      /* DecryptUpdate: we assume this code is called only once per sessi=
on, either
++       * from the C_Decrypt function or from an application using the C_D=
ecryptUpdate call
++       */
++
+       sc_log(context, "Initiating decryption.");
+
+       if (!p11card)
+diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c
+index 3035e8a763..a81b58fea6 100644
+--- a/src/pkcs11/mechanism.c
++++ b/src/pkcs11/mechanism.c
+@@ -1072,9 +1072,11 @@ sc_pkcs11_decrypt_init(sc_pkcs11_operati
+                       LOG_FUNC_RETURN(context, (int) rv);
+               }
+       }
+-
+       operation->priv_data =3D data;
+-      return CKR_OK;
++
++      /* The last parameter is NULL - this is call to INIT code in underl=
ying functions */
++      return key->ops->decrypt(operation->session,
++                      key, &operation->mechanism, NULL, 0, NULL, NULL);
+ }
+
+ static CK_RV
+@@ -1084,14 +1086,42 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t
+ {
+       struct signature_data *data;
+       struct sc_pkcs11_object *key;
++      CK_RV rv;
++      CK_ULONG ulDataLen, ulLastDataLen;
++
++      /* PKCS#11: If pBuf is not NULL_PTR, then *pulBufLen must contain t=
he size in bytes.. */
++      if (pData && !pulDataLen)
++              return CKR_ARGUMENTS_BAD;
++
++      ulDataLen =3D pulDataLen ? *pulDataLen : 0;
++      ulLastDataLen =3D ulDataLen;
+
+       data =3D (struct signature_data*) operation->priv_data;
+
+       key =3D data->key;
+-      return key->ops->decrypt(operation->session,
+-                              key, &operation->mechanism,
+-                              pEncryptedData, ulEncryptedDataLen,
+-                              pData, pulDataLen);
++
++      /* Decrypt */
++      rv =3D key->ops->decrypt(operation->session, key, &operation->mecha=
nism,
++                      pEncryptedData, ulEncryptedDataLen, pData, &ulDataL=
en);
++
++      if (pulDataLen)
++              *pulDataLen =3D ulDataLen;
++
++      if (rv !=3D CKR_OK)
++              return rv;
++
++      /* recalculate buffer space */
++      if (ulDataLen <=3D ulLastDataLen)
++              ulLastDataLen -=3D ulDataLen;
++      else
++              ulLastDataLen =3D 0;
++
++      /* DecryptFinalize */
++      rv =3D key->ops->decrypt(operation->session, key, &operation->mecha=
nism,
++                      NULL, 0, pData + ulDataLen, &ulLastDataLen);
++      if (pulDataLen)
++              *pulDataLen =3D ulDataLen + ulLastDataLen;
++      return rv;
+ }
+
+ static CK_RV
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch b/=
meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
new file mode 100644
index 000000000..8450ed010
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
@@ -0,0 +1,357 @@
+From b9e1d344df1f850a9b15bce6294f72c1620d0b45 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanulik@=
redhat.com>
+Date: Mon, 13 Nov 2023 13:54:54 +0100
+Subject: [PATCH] Reimplement removing of PKCS#1 v1.5 padding to be time
+ constant
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/comm=
its/b9e1d344df1f850a9b15bce6294f72c1620d0b45]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Refreshed hunks to match latest kirkstone
+---
+ src/common/Makefile.am      |   6 +-
+ src/common/constant-time.h  | 128 ++++++++++++++++++++++++++++++++++++
+ src/libopensc/internal.h    |   4 +-
+ src/libopensc/padding.c     | 102 +++++++++++++++++++---------
+ src/libopensc/pkcs15-sec.c  |   5 +-
+ src/minidriver/minidriver.c |   4 +-
+ 6 files changed, 210 insertions(+), 39 deletions(-)
+ create mode 100644 src/common/constant-time.h
+
+diff --git a/src/common/Makefile.am b/src/common/Makefile.am
+index 5153428dce..9ecbffe8fd 100644
+--- a/src/common/Makefile.am
++++ b/src/common/Makefile.am
+@@ -8,7 +8,8 @@ dist_noinst_DATA =3D \
+       LICENSE.compat_getopt compat_getopt.txt \
+       compat_getopt_main.c \
+       README.compat_strlcpy compat_strlcpy.3
+-noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.h com=
pat_getpass.h compat_getopt.h simclist.h libpkcs11.h libscdl.h
++noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.h com=
pat_getpass.h \
++      compat_getopt.h simclist.h libpkcs11.h libscdl.h constant-time.h
+
+ AM_CPPFLAGS =3D -I$(top_srcdir)/src
+
+@@ -40,7 +41,8 @@ TIDY_FILES =3D \
+       compat_report_rangecheckfailure.c \
+       compat___iob_func.c \
+       simclist.c simclist.h \
+-      libpkcs11.c libscdl.c
++      libpkcs11.c libscdl.c \
++      constant-time.h
+
+ check-local:
+       if [ -x "$(CLANGTIDY)" ]; then clang-tidy -config=3D'' --checks=3D'=
$(TIDY_CHECKS)' -header-filter=3D.* $(addprefix $(srcdir)/,$(TIDY_FILES)) -=
- $(TIDY_FLAGS); fi
+diff --git a/src/common/constant-time.h b/src/common/constant-time.h
+new file mode 100644
+index 0000000000..40c3e500c2
+--- /dev/null
++++ b/src/common/constant-time.h
+@@ -0,0 +1,128 @@
++/* Original source: https://github.com/openssl/openssl/blob/9890cc42daff5=
e2d0cad01ac4bf78c391f599a6e/include/internal/constant_time.h */
++
++#ifndef CONSTANT_TIME_H
++#define CONSTANT_TIME_H
++
++#include <stdlib.h>
++#include <string.h>
++
++#if !defined(inline)
++#if defined(__STDC_VERSION__) && __STDC_VERSION__ >=3D 199901L
++#define constant_inline inline
++#elif defined(__GNUC__) && __GNUC__ >=3D 2
++#elif defined(__GNUC__) && __GNUC__ >=3D 2
++#elif defined(_MSC_VER)
++#define constant_inline __inline
++#else
++#define constant_inline
++#endif
++#else                        /* use what caller wants as inline  may be f=
rom config.h */
++#define constant_inline inline /* inline */
++#endif
++
++/*-
++ * The boolean methods return a bitmask of all ones (0xff...f) for true
++ * and 0 for false. For example,
++ *      if (a < b) {
++ *        c =3D a;
++ *      } else {
++ *        c =3D b;
++ *      }
++ * can be written as
++ *      unsigned int lt =3D constant_time_lt(a, b);
++ *      c =3D constant_time_select(lt, a, b);
++ */
++
++static constant_inline unsigned int
++value_barrier(unsigned int a)
++{
++      volatile unsigned int r =3D a;
++      return r;
++}
++
++static constant_inline size_t
++value_barrier_s(size_t a)
++{
++      volatile size_t r =3D a;
++      return r;
++}
++
++/* MSB */
++static constant_inline size_t
++constant_time_msb_s(size_t a)
++{
++      return 0 - (a >> (sizeof(a) * 8 - 1));
++}
++
++static constant_inline unsigned int
++constant_time_msb(unsigned int a)
++{
++      return 0 - (a >> (sizeof(a) * 8 - 1));
++}
++
++/* Select */
++static constant_inline unsigned int
++constant_time_select(unsigned int mask, unsigned int a, unsigned int b)
++{
++      return (value_barrier(mask) & a) | (value_barrier(~mask) & b);
++}
++
++static constant_inline unsigned char
++constant_time_select_8(unsigned char mask, unsigned char a, unsigned char=
 b)
++{
++      return (unsigned char)constant_time_select(mask, a, b);
++}
++
++static constant_inline size_t
++constant_time_select_s(size_t mask, size_t a, size_t b)
++{
++      return (value_barrier_s(mask) & a) | (value_barrier_s(~mask) & b);
++}
++
++/* Zero */
++static constant_inline unsigned int
++constant_time_is_zero(unsigned int a)
++{
++      return constant_time_msb(~a & (a - 1));
++}
++
++static constant_inline size_t
++constant_time_is_zero_s(size_t a)
++{
++      return constant_time_msb_s(~a & (a - 1));
++}
++
++/* Comparison*/
++static constant_inline size_t
++constant_time_lt_s(size_t a, size_t b)
++{
++      return constant_time_msb_s(a ^ ((a ^ b) | ((a - b) ^ b)));
++}
++
++static constant_inline unsigned int
++constant_time_lt(unsigned int a, unsigned int b)
++{
++      return constant_time_msb(a ^ ((a ^ b) | ((a - b) ^ b)));
++}
++
++static constant_inline unsigned int
++constant_time_ge(unsigned int a, unsigned int b)
++{
++      return ~constant_time_lt(a, b);
++}
++
++/* Equality*/
++
++static constant_inline unsigned int
++constant_time_eq(unsigned int a, unsigned int b)
++{
++      return constant_time_is_zero(a ^ b);
++}
++
++static constant_inline size_t
++constant_time_eq_s(size_t a, size_t b)
++{
++      return constant_time_is_zero_s(a ^ b);
++}
++
++#endif /* CONSTANT_TIME_H */
+diff --git a/src/libopensc/internal.h b/src/libopensc/internal.h
+index 7531260c14..2a98f0e966 100644
+--- a/src/libopensc/internal.h
++++ b/src/libopensc/internal.h
+@@ -166,8 +166,8 @@ int _sc_card_add_xeddsa_alg(struct sc_ca
+
+ int sc_pkcs1_strip_01_padding(struct sc_context *ctx, const u8 *in_dat, s=
ize_t in_len,
+               u8 *out_dat, size_t *out_len);
+-int sc_pkcs1_strip_02_padding(struct sc_context *ctx, const u8 *data, siz=
e_t len,
+-              u8 *out_dat, size_t *out_len);
++int sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned i=
nt n, const u8 *data,
++              unsigned int data_len, u8 *out, unsigned int *out_len);
+ int sc_pkcs1_strip_digest_info_prefix(unsigned int *algorithm,
+               const u8 *in_dat, size_t in_len, u8 *out_dat, size_t *out_l=
en);
+
+diff --git a/src/libopensc/padding.c b/src/libopensc/padding.c
+index ca47733a4e..ddb3061134 100644
+--- a/src/libopensc/padding.c
++++ b/src/libopensc/padding.c
+@@ -32,10 +32,13 @@
+ #include <string.h>
+ #include <stdlib.h>
+
++#include "common/constant-time.h"
+ #include "internal.h"
+
+ /* TODO doxygen comments */
+
++#define SC_PKCS1_PADDING_MIN_SIZE 11
++
+ /*
+  * Prefixes for pkcs-v1 signatures
+  */
+@@ -143,45 +146,82 @@ sc_pkcs1_strip_01_padding(struct sc_context *ctx, co=
nst u8 *in_dat, size_t in_le
+       return SC_SUCCESS;
+ }
+
+-
+-/* remove pkcs1 BT02 padding (adding BT02 padding is currently not
+- * needed/implemented) */
++/* Remove pkcs1 BT02 padding (adding BT02 padding is currently not
++ * needed/implemented) in constant-time.
++ * Original source: https://github.com/openssl/openssl/blob/9890cc42daff5=
e2d0cad01ac4bf78c391f599a6e/crypto/rsa/rsa_pk1.c#L171 */
+ int
+-sc_pkcs1_strip_02_padding(sc_context_t *ctx, const u8 *data, size_t len, =
u8 *out, size_t *out_len)
++sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned int n=
, const u8 *data, unsigned int data_len, u8 *out, unsigned int *out_len)
+ {
+-      unsigned int    n =3D 0;
+-
++      unsigned int i =3D 0;
++      u8 *msg, *msg_orig =3D NULL;
++      unsigned int good, found_zero_byte, mask;
++      unsigned int zero_index =3D 0, msg_index, mlen =3D -1, len =3D 0;
+       LOG_FUNC_CALLED(ctx);
+-      if (data =3D=3D NULL || len < 3)
++
++      if (data =3D=3D NULL || data_len <=3D 0 || data_len > n || n < SC_P=
KCS1_PADDING_MIN_SIZE)
+               LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
+
+-      /* skip leading zero byte */
+-      if (*data =3D=3D 0) {
+-              data++;
+-              len--;
++      msg =3D msg_orig =3D calloc(n, sizeof(u8));
++      if (msg =3D=3D NULL)
++              LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
++
++      /*
++       * We can not check length of input data straight away and still we=
 need to read
++       * from input even when the input is not as long as needed to keep =
the time constant.
++       * If data has wrong size, it is padded by zeroes from left and the=
 following checks
++       * do not pass.
++       */
++      len =3D data_len;
++      for (data +=3D len, msg +=3D n, i =3D 0; i < n; i++) {
++              mask =3D ~constant_time_is_zero(len);
++              len -=3D 1 & mask;
++              data -=3D 1 & mask;
++              *--msg =3D *data & mask;
++      }
++      // check first byte to be 0x00
++      good =3D constant_time_is_zero(msg[0]);
++      // check second byte to be 0x02
++      good &=3D constant_time_eq(msg[1], 2);
++
++      // find zero byte after random data in padding
++      found_zero_byte =3D 0;
++      for (i =3D 2; i < n; i++) {
++              unsigned int equals0 =3D constant_time_is_zero(msg[i]);
++              zero_index =3D constant_time_select(~found_zero_byte & equa=
ls0, i, zero_index);
++              found_zero_byte |=3D equals0;
+       }
+-      if (data[0] !=3D 0x02)
+-              LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
+-      /* skip over padding bytes */
+-      for (n =3D 1; n < len && data[n]; n++)
+-              ;
+-      /* Must be at least 8 pad bytes */
+-      if (n >=3D len || n < 9)
+-              LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
+-      n++;
+-      if (out =3D=3D NULL)
+-              /* just check the padding */
+-              LOG_FUNC_RETURN(ctx, SC_SUCCESS);
+
+-      /* Now move decrypted contents to head of buffer */
+-      if (*out_len < len - n)
+-              LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
+-      *out_len =3D len - n;
+-      memmove(out, data + n, *out_len);
++      // zero_index stands for index of last found zero
++      good &=3D constant_time_ge(zero_index, 2 + 8);
++
++      // start of the actual message in data
++      msg_index =3D zero_index + 1;
++
++      // length of message
++      mlen =3D data_len - msg_index;
++
++      // check that message fits into out buffer
++      good &=3D constant_time_ge(*out_len, mlen);
++
++      // move the result in-place by |num|-SC_PKCS1_PADDING_MIN_SIZE-|mle=
n| bytes to the left.
++      *out_len =3D constant_time_select(constant_time_lt(n - SC_PKCS1_PAD=
DING_MIN_SIZE, *out_len),
++                      n - SC_PKCS1_PADDING_MIN_SIZE, *out_len);
++      for (msg_index =3D 1; msg_index < n - SC_PKCS1_PADDING_MIN_SIZE; ms=
g_index <<=3D 1) {
++              mask =3D ~constant_time_eq(msg_index & (n - SC_PKCS1_PADDIN=
G_MIN_SIZE - mlen), 0);
++              for (i =3D SC_PKCS1_PADDING_MIN_SIZE; i < n - msg_index; i+=
+)
++                      msg[i] =3D constant_time_select_8(mask, msg[i + msg=
_index], msg[i]);
++      }
++      // move message into out buffer, if good
++      for (i =3D 0; i < *out_len; i++) {
++              unsigned int msg_index;
++              // when out is longer than message in data, use some bogus =
index in msg
++              mask =3D good & constant_time_lt(i, mlen);
++              msg_index =3D constant_time_select(mask, i + SC_PKCS1_PADDI=
NG_MIN_SIZE, 0); // to now overflow msg buffer
++              out[i] =3D constant_time_select_8(mask, msg[msg_index], out=
[i]);
++      }
+
+-      sc_log(ctx, "stripped output(%"SC_FORMAT_LEN_SIZE_T"u): %s", len - =
n,
+-             sc_dump_hex(out, len - n));
+-      LOG_FUNC_RETURN(ctx, len - n);
++      free(msg_orig);
++      return constant_time_select(good, mlen, SC_ERROR_WRONG_PADDING);
+ }
+
+ /* add/remove DigestInfo prefix */
+diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
+index 2ac6ca7ddf..a019af460f 100644
+--- a/src/libopensc/pkcs15-sec.c
++++ b/src/libopensc/pkcs15-sec.c
+@@ -308,8 +308,9 @@ int sc_pkcs15_decipher(struct sc_pkcs15_
+
+       /* Strip any padding */
+       if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
+-              size_t s =3D r;
+-              r =3D sc_pkcs1_strip_02_padding(ctx, out, s, out, &s);
++              int s =3D r;
++              int key_size =3D alg_info->key_length;
++              r =3D sc_pkcs1_strip_02_padding_constant_time(ctx, key_size=
 / 8, out, s, out, &s);
+               LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
+       }
+
+diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
+index 3391994abe..5248d9758a 100644
+--- a/src/minidriver/minidriver.c
++++ b/src/minidriver/minidriver.c
+@@ -4582,9 +4582,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
+                                         "sc_pkcs15_decipher: DECRYPT-INFO=
 dwVersion=3D%lu\n",
+                                         (unsigned long)pInfo->dwVersion);
+                               if (pInfo->dwPaddingType =3D=3D CARD_PADDIN=
G_PKCS1)   {
+-                                      size_t temp =3D pInfo->cbData;
++                                      unsigned int temp =3D pInfo->cbData=
;
+                                       logprintf(pCardData, 2, "sc_pkcs15_=
decipher: stripping PKCS1 padding\n");
+-                                      r =3D sc_pkcs1_strip_02_padding(vs-=
>ctx, pbuf2, pInfo->cbData, pbuf2, &temp);
++                                      r =3D sc_pkcs1_strip_02_padding_con=
stant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData, p=
buf2, &temp);
+                                       pInfo->cbData =3D (DWORD) temp;
+                                       if (r < 0)   {
+                                               logprintf(pCardData, 2, "Ca=
nnot strip PKCS1 padding: %i\n", r);
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch b/=
meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
new file mode 100644
index 000000000..1d8bc1259
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
@@ -0,0 +1,39 @@
+From 1a6a18c51a1d6239850b61d19aed6424afd4912f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanulik@=
redhat.com>
+Date: Thu, 16 Nov 2023 10:38:12 +0100
+Subject: [PATCH] pkcs15-sec: Remove logging after PKCS#1 v1.5 depadding
+
+To prevent Marvin attack on RSA PKCS#1 v1.5 padding
+when logging the return value, signaling the padding error.
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/comm=
its/1a6a18c51a1d6239850b61d19aed6424afd4912f]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Refreshed hunk to match latest kirkstone
+---
+ src/libopensc/pkcs15-sec.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
+index a019af460f..f7ee819d65 100644
+--- a/src/libopensc/pkcs15-sec.c
++++ b/src/libopensc/pkcs15-sec.c
+@@ -308,13 +308,14 @@ int sc_pkcs15_decipher(struct sc_pkcs15_
+
+       /* Strip any padding */
+       if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
+-              int s =3D r;
+-              int key_size =3D alg_info->key_length;
++              unsigned int s =3D r;
++              unsigned int key_size =3D (unsigned int)alg_info->key_lengt=
h;
+               r =3D sc_pkcs1_strip_02_padding_constant_time(ctx, key_size=
 / 8, out, s, out, &s);
+-              LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
++              /* for keeping PKCS#1 v1.5 depadding constant-time, do not =
log error here */
+       }
+
+-      LOG_FUNC_RETURN(ctx, r);
++      /* do not log error code to prevent side channel attack */
++      return r;
+ }
+
+ /* derive one key from another. RSA can use decipher, so this is for only=
 ECDH
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch b/=
meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
new file mode 100644
index 000000000..d3846e5da
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
@@ -0,0 +1,105 @@
+From a8ac5930ab8f2da5cb93793d05389761c342f995 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanulik@=
redhat.com>
+Date: Thu, 16 Nov 2023 15:49:15 +0100
+Subject: [PATCH] framework-pkcs15.c: Handle PKCS#1 v1.5 depadding
+ constant-time
+
+In order to not disclose time side-channel when the depadding
+fails, do the same operations as for case when depadding ends
+with success.
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/comm=
its/a8ac5930ab8f2da5cb93793d05389761c342f995]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Refreshed hunks to match latest kirkstone
+---
+ src/pkcs11/framework-pkcs15.c | 54 ++++++++++++++++++++++++++---------
+ 1 file changed, 41 insertions(+), 13 deletions(-)
+
+diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15.c
+index f75a3dbaec..632681df63 100644
+--- a/src/pkcs11/framework-pkcs15.c
++++ b/src/pkcs11/framework-pkcs15.c
+@@ -18,6 +18,7 @@
+  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
+  */
+
++#include "common/constant-time.h"
+ #include "config.h"
+ #include <stdlib.h>
+ #include <string.h>
+@@ -4341,7 +4342,8 @@
+       struct pkcs15_fw_data *fw_data =3D NULL;
+       struct pkcs15_prkey_object *prkey;
+       unsigned char decrypted[512]; /* FIXME: Will not work for keys abov=
e 4096 bits */
+-      int     buff_too_small, rv, flags =3D 0, prkey_has_path =3D 0;
++      int rv, flags =3D 0, prkey_has_path =3D 0;
++      CK_ULONG mask, good, rv_pkcs11;
+
+       sc_log(context, "Initiating decryption.");
+
+@@ -4415,27 +4417,53 @@
+       rv =3D sc_pkcs15_decipher(fw_data->p15_card, prkey->prv_p15obj, fla=
gs,
+                       pEncryptedData, ulEncryptedDataLen, decrypted, size=
of(decrypted));
+
+-      if (rv < 0 && !sc_pkcs11_conf.lock_login && !prkey_has_path)
++      /* skip for PKCS#1 v1.5 padding prevent side channel attack */
++      if (!(flags & SC_ALGORITHM_RSA_PAD_PKCS1) &&
++                      rv < 0 && !sc_pkcs11_conf.lock_login && !prkey_has_=
path)
+               if (reselect_app_df(fw_data->p15_card) =3D=3D SC_SUCCESS)
+                       rv =3D sc_pkcs15_decipher(fw_data->p15_card, prkey-=
>prv_p15obj, flags,
+                                       pEncryptedData, ulEncryptedDataLen,=
 decrypted, sizeof(decrypted));
+
+       sc_unlock(p11card->card);
+
+-      sc_log(context, "Decryption complete. Result %d.", rv);
++      sc_log(context, "Decryption complete.");
+
+-      if (rv < 0)
+-              return sc_to_cryptoki_error(rv, "C_Decrypt");
++      /* Handle following code in constant-time
++       * to prevent Marvin attack for PKCS#1 v1.5 padding. */
+
+-      buff_too_small =3D (*pulDataLen < (CK_ULONG)rv);
+-      *pulDataLen =3D rv;
+-      if (pData =3D=3D NULL_PTR)
+-              return CKR_OK;
+-      if (buff_too_small)
+-              return CKR_BUFFER_TOO_SMALL;
+-      memcpy(pData, decrypted, *pulDataLen);
++      /* only padding error must be handled in constant-time way,
++       * other error can be returned straight away */
++      if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) & constant_tim=
e_lt_s(sizeof(decrypted), rv)))
++              return sc_to_cryptoki_error(rv, "C_Decrypt");
+
+-      return CKR_OK;
++      /* check rv for padding error */
++      good =3D ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
++      rv_pkcs11 =3D sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING, "C_Decry=
pt");
++      rv_pkcs11 =3D constant_time_select_s(good, CKR_OK, rv_pkcs11);
++
++      if (pData =3D=3D NULL_PTR) {
++              /* set length only if no error */
++              *pulDataLen =3D constant_time_select_s(good, rv, *pulDataLe=
n);
++              /* return error only if original rv < 0 */
++              return rv_pkcs11;
++      }
++
++      /* check whether *pulDataLen < rv and set return value for small ou=
tput buffer */
++      mask =3D good & constant_time_lt_s(*pulDataLen, rv);
++      rv_pkcs11 =3D constant_time_select_s(mask, CKR_BUFFER_TOO_SMALL, rv=
_pkcs11);
++      good &=3D ~mask;
++
++      /* move everything from decrypted into out buffer constant-time, if=
 rv is ok */
++      for (CK_ULONG i =3D 0; i < *pulDataLen; i++) { /* iterate over whol=
e pData to not disclose real depadded length */
++              CK_ULONG msg_index;
++              mask =3D good & constant_time_lt_s(i, sizeof(decrypted));  =
           /* i should be in the bounds of decrypted */
++              mask &=3D constant_time_lt_s(i, constant_time_select_s(good=
, rv, 0)); /* check that is in bounds of depadded message */
++              msg_index =3D constant_time_select_s(mask, i, 0);
++              pData[i] =3D constant_time_select_8(mask, decrypted[msg_ind=
ex], pData[i]);
++      }
++      *pulDataLen =3D constant_time_select_s(good, rv, *pulDataLen);
++      /* do not log error code to prevent side channel attack */
++      return rv_pkcs11;
+ }
+
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch b/=
meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
new file mode 100644
index 000000000..e113df7c4
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
@@ -0,0 +1,47 @@
+From 32cdab44f6b1e6343f029879a8ab32de4f32743f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanulik@=
redhat.com>
+Date: Mon, 8 Jan 2024 14:59:22 +0100
+Subject: [PATCH] mechanism: Handle PKCS#1 v1.5 depadding constant-time
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/comm=
its/32cdab44f6b1e6343f029879a8ab32de4f32743f]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: 1 hunk removed and refreshed hunks to match latest kirkstone
+---
+ src/pkcs11/mechanism.c | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c
+index 03495265a4..d3f0434231 100644
+--- a/src/pkcs11/mechanism.c
++++ b/src/pkcs11/mechanism.c
+@@ -23,6 +23,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+
++#include "common/constant-time.h"
+ #include "sc-pkcs11.h"
+
+ /* Also used for verification data */
+@@ -844,7 +845,9 @@ sc_pkcs11_decr(struct sc_pkcs11_session
+       rv =3D op->type->decrypt(op, pEncryptedData, ulEncryptedDataLen,
+                              pData, pulDataLen);
+
+-      if (rv !=3D CKR_BUFFER_TOO_SMALL && pData !=3D NULL)
++      /* terminate session for any return value except CKR_BUFFER_TOO_SMA=
LL,
++       * perform check in time side-channel free way to prevent Marvin at=
tack */
++      if (!constant_time_eq_s(rv, CKR_BUFFER_TOO_SMALL) && pData !=3D NUL=
L)
+               session_stop_operation(session, SC_PKCS11_OPERATION_DECRYPT=
);
+
+       return rv;
+@@ -1107,6 +1107,10 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t
+       if (pulDataLen)
+               *pulDataLen =3D ulDataLen;
+
++      /* Skip DecryptFinalize for PKCS#1 v1.5 padding to prevent time sid=
e-channel leakage */
++      if (((CK_MECHANISM_PTR)&operation->mechanism)->mechanism =3D=3D CKM=
_RSA_PKCS)
++              return rv;
++
+       if (rv !=3D CKR_OK)
+               return rv;
+
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch b/=
meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
new file mode 100644
index 000000000..7bb862194
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
@@ -0,0 +1,115 @@
+From 1fe1a78610b00b9db83a03396762c72c1371bd02 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanulik@=
redhat.com>
+Date: Wed, 22 Nov 2023 15:02:57 +0100
+Subject: [PATCH] minidriver: Make CardRSADecrypt constant-time
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/comm=
its/1fe1a78610b00b9db83a03396762c72c1371bd02]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Refreshed hunks to match latest kirkstone
+---
+ src/minidriver/minidriver.c | 37 +++++++++++++++++++++++--------------
+ 1 file changed, 23 insertions(+), 14 deletions(-)
+
+diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
+index 5248d9758a..b99b6cff89 100644
+--- a/src/minidriver/minidriver.c
++++ b/src/minidriver/minidriver.c
+@@ -41,6 +41,7 @@
+ #include "cardmod.h"
+
+ #include "common/compat_strlcpy.h"
++#include "common/constant-time.h"
+ #include "libopensc/asn1.h"
+ #include "libopensc/cardctl.h"
+ #include "libopensc/opensc.h"
+@@ -4463,13 +4464,15 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
+
+ {
+       DWORD dwret;
+-      int r, opt_crypt_flags =3D 0;
++      int r, opt_crypt_flags =3D 0, good =3D 0;
+       unsigned ui;
+       VENDOR_SPECIFIC *vs;
+       struct sc_pkcs15_prkey_info *prkey_info;
+       BYTE *pbuf =3D NULL, *pbuf2 =3D NULL;
+       struct sc_pkcs15_object *pkey =3D NULL;
+       struct sc_algorithm_info *alg_info =3D NULL;
++      unsigned int wrong_padding =3D 0;
++      unsigned int pbufLen =3D 0;
+
+       MD_FUNC_CALLED(pCardData, 1);
+
+@@ -4570,11 +4573,11 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
+               goto err;
+       }
+
++      pbufLen =3D pInfo->cbData;
+       if (alg_info->flags & SC_ALGORITHM_RSA_RAW)   {
+               logprintf(pCardData, 2, "sc_pkcs15_decipher: using RSA-RAW =
mechanism\n");
+               r =3D sc_pkcs15_decipher(vs->p15card, pkey, opt_crypt_flags=
, pbuf, pInfo->cbData, pbuf2, pInfo->cbData);
+-              logprintf(pCardData, 2, "sc_pkcs15_decipher returned %d\n",=
 r);
+-
++              /* do not log return value to not leak it */
+               if (r > 0) {
+                       /* Need to handle padding */
+                       if (pInfo->dwVersion >=3D CARD_RSA_KEY_DECRYPT_INFO=
_VERSION_TWO) {
+@@ -4586,13 +4589,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
+                                       logprintf(pCardData, 2, "sc_pkcs15_=
decipher: stripping PKCS1 padding\n");
+                                       r =3D sc_pkcs1_strip_02_padding_con=
stant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData, p=
buf2, &temp);
+                                       pInfo->cbData =3D (DWORD) temp;
+-                                      if (r < 0)   {
+-                                              logprintf(pCardData, 2, "Ca=
nnot strip PKCS1 padding: %i\n", r);
+-                                              pCardData->pfnCspFree(pbuf)=
;
+-                                              pCardData->pfnCspFree(pbuf2=
);
+-                                              dwret =3D SCARD_F_INTERNAL_=
ERROR;
+-                                              goto err;
+-                                      }
++                                      wrong_padding =3D constant_time_eq_=
s(r, SC_ERROR_WRONG_PADDING);
++                                      /* continue without returning error=
 to not leak that padding is wrong
++                                         to prevent time side-channel lea=
k for Marvin attack*/
+                               }
+                               else if (pInfo->dwPaddingType =3D=3D CARD_P=
ADDING_OAEP)   {
+                                       /* TODO: Handle OAEP padding if pre=
sent - can call PFN_CSP_UNPAD_DATA */
+@@ -4640,28 +4639,38 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
+               goto err;
+       }
+
+-      if ( r < 0)   {
++      good =3D constant_time_eq_s(r, 0);
++      /* if no error or padding error, do not return here to prevent Marv=
in attack */
++      if (!(good | wrong_padding) && r < 0)   {
+               logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i): %s\n=
", r, sc_strerror(r));
+               pCardData->pfnCspFree(pbuf);
+               pCardData->pfnCspFree(pbuf2);
+               dwret =3D md_translate_OpenSC_to_Windows_error(r, SCARD_E_I=
NVALID_VALUE);
+               goto err;
+       }
++      dwret =3D constant_time_select_s(good, SCARD_S_SUCCESS, SCARD_F_INT=
ERNAL_ERROR);
+
+       logprintf(pCardData, 2, "decrypted data(%lu):\n",
+                 (unsigned long)pInfo->cbData);
+       loghex(pCardData, 7, pbuf2, pInfo->cbData);
+
+       /*inversion donnees */
+-      for(ui =3D 0; ui < pInfo->cbData; ui++)
+-              pInfo->pbData[ui] =3D pbuf2[pInfo->cbData-ui-1];
++      /* copy data in constant-time way to prevent leak */
++      for (ui =3D 0; ui < pbufLen; ui++) {
++              unsigned int mask, msg_index, inv_ui;
++              mask =3D good & constant_time_lt_s(ui, pInfo->cbData); /* u=
i should be in the bounds of pbuf2 */
++              inv_ui =3D pInfo->cbData - ui - 1;
++              msg_index =3D constant_time_select_s(mask, inv_ui, 0);
++              pInfo->pbData[ui] =3D constant_time_select_8(mask, pbuf2[ms=
g_index], pInfo->pbData[ui]);
++      }
+
+       pCardData->pfnCspFree(pbuf);
+       pCardData->pfnCspFree(pbuf2);
+
+ err:
+       unlock(pCardData);
+-      MD_FUNC_RETURN(pCardData, 1, dwret);
++      /* do not log return value to not leak it */
++      return dwret;
+ }
+
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch b/=
meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
new file mode 100644
index 000000000..5deeacc25
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
@@ -0,0 +1,47 @@
+From 306dc92bd4d2d74203f53cf3d9ea68c223115375 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanulik@=
redhat.com>
+Date: Fri, 24 Nov 2023 20:59:07 +0100
+Subject: [PATCH] pkcs11-object: Remove return value logging
+
+To prevent Marvin attack on RSA PKCS#1 v1.5 padding
+when logging the return value, signaling the padding error.
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/comm=
its/306dc92bd4d2d74203f53cf3d9ea68c223115375]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Two hunks removed from pkcs11-object.c and refreshed sc-pkcs11.h
+---
+ src/pkcs11/pkcs11-object.c | 9 ++++++---
+ src/pkcs11/sc-pkcs11.h     | 5 +++++
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/pkcs11/pkcs11-object.c b/src/pkcs11/pkcs11-object.c
+index f04c0b4c56..b023911213 100644
+--- a/src/pkcs11/pkcs11-object.c
++++ b/src/pkcs11/pkcs11-object.c
+@@ -930,7 +930,8 @@ CK_RV C_Decrypt(CK_SESSION_HANDLE hSessi
+               rv =3D reset_login_state(session->slot, rv);
+       }
+
+-      sc_log(context, "C_Decrypt() =3D %s", lookup_enum ( RV_T, rv ));
++      /* do not log error code to prevent side channel attack */
++      SC_LOG("C_Decrypt()");
+       sc_pkcs11_unlock();
+       return rv;
+ }
+diff --git a/src/pkcs11/sc-pkcs11.h b/src/pkcs11/sc-pkcs11.h
+index 66dfcdde67..510017ed2a 100644
+--- a/src/pkcs11/sc-pkcs11.h
++++ b/src/pkcs11/sc-pkcs11.h
+@@ -226,6 +226,11 @@
+ };
+ typedef struct sc_pkcs11_slot sc_pkcs11_slot_t;
+
++#define SC_LOG(fmt) \
++      do { \
++              sc_log(context, (fmt)); \
++      } while (0)
++
+ /* Debug virtual slots. S is slot to be highlighted or NULL
+  * C is a comment format string and args It will be preceded by "VSS " */
+ #define DEBUG_VSS(S, ...) do { sc_log(context,"VSS " __VA_ARGS__); _debug=
_virtual_slots(S); } while (0)
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch b/=
meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
new file mode 100644
index 000000000..7b41abc0e
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
@@ -0,0 +1,33 @@
+From aa6bf2b65fe432e8f234a132268b79ea54d5d74b Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanulik@=
redhat.com>
+Date: Fri, 24 Nov 2023 21:00:23 +0100
+Subject: [PATCH] misc: Compare return value constant-time
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/comm=
its/aa6bf2b65fe432e8f234a132268b79ea54d5d74b]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+---
+ src/pkcs11/misc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/pkcs11/misc.c b/src/pkcs11/misc.c
+index 5ca1176b1d..1d893d6181 100644
+--- a/src/pkcs11/misc.c
++++ b/src/pkcs11/misc.c
+@@ -23,6 +23,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+
++#include "common/constant-time.h"
+ #include "sc-pkcs11.h"
+
+ #define DUMP_TEMPLATE_MAX     32
+@@ -174,7 +175,7 @@ CK_RV reset_login_state(struct sc_pkcs11_slot *slot, C=
K_RV rv)
+                       slot->p11card->framework->logout(slot);
+               }
+
+-              if (rv =3D=3D CKR_USER_NOT_LOGGED_IN) {
++              if (constant_time_eq_s(rv, CKR_USER_NOT_LOGGED_IN)) {
+                       slot->login_user =3D -1;
+                       pop_all_login_states(slot);
+               }
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch b/=
meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
new file mode 100644
index 000000000..3ad681ecb
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
@@ -0,0 +1,71 @@
+From fd80ba7c00bb87f52a63f628509955ccee5b09e4 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanulik@=
redhat.com>
+Date: Mon, 5 Feb 2024 13:33:05 +0100
+Subject: [PATCH] Fix constant-time comparison of negative values
+
+Thanks Coverity CID 414687
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/3016/comm=
its/fd80ba7c00bb87f52a63f628509955ccee5b09e4]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+---
+ src/common/constant-time.h    | 6 ++++++
+ src/minidriver/minidriver.c   | 4 ++--
+ src/pkcs11/framework-pkcs15.c | 4 ++--
+ 3 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/src/common/constant-time.h b/src/common/constant-time.h
+index 40c3e500c2..3f4446d4d8 100644
+--- a/src/common/constant-time.h
++++ b/src/common/constant-time.h
+@@ -125,4 +125,10 @@ constant_time_eq_s(size_t a, size_t b)
+       return constant_time_is_zero_s(a ^ b);
+ }
+
++static constant_inline unsigned int
++constant_time_eq_i(int a, int b)
++{
++      return constant_time_eq((unsigned int)a, (unsigned int)b);
++}
++
+ #endif /* CONSTANT_TIME_H */
+diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
+index a3c738966b..d146b42549 100644
+--- a/src/minidriver/minidriver.c
++++ b/src/minidriver/minidriver.c
+@@ -4660,7 +4660,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardDat=
a,
+                                       logprintf(pCardData, 2, "sc_pkcs15_=
decipher: stripping PKCS1 padding\n");
+                                       r =3D sc_pkcs1_strip_02_padding_con=
stant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData, p=
buf2, &temp);
+                                       pInfo->cbData =3D (DWORD) temp;
+-                                      wrong_padding =3D constant_time_eq_=
s(r, SC_ERROR_WRONG_PADDING);
++                                      wrong_padding =3D constant_time_eq_=
i(r, SC_ERROR_WRONG_PADDING);
+                                       /* continue without returning error=
 to not leak that padding is wrong
+                                          to prevent time side-channel lea=
k for Marvin attack*/
+                               }
+@@ -4710,7 +4710,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardDat=
a,
+               goto err;
+       }
+
+-      good =3D constant_time_eq_s(r, 0);
++      good =3D constant_time_eq_i(r, 0);
+       /* if no error or padding error, do not return here to prevent Marv=
in attack */
+       if (!(good | wrong_padding) && r < 0)   {
+               logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i): %s\n=
", r, sc_strerror(r));
+diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15.c
+index cb4df7a64f..11cfc51273 100644
+--- a/src/pkcs11/framework-pkcs15.c
++++ b/src/pkcs11/framework-pkcs15.c
+@@ -4627,11 +4627,11 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_session *ses=
sion, void *obj,
+
+       /* only padding error must be handled in constant-time way,
+        * other error can be returned straight away */
+-      if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) & constant_tim=
e_lt_s(sizeof(decrypted), rv)))
++      if ((~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING) & constant_tim=
e_lt_s(sizeof(decrypted), (size_t)rv)))
+               return sc_to_cryptoki_error(rv, "C_Decrypt");
+
+       /* check rv for padding error */
+-      good =3D ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
++      good =3D ~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING);
+       rv_pkcs11 =3D sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING, "C_Decry=
pt");
+       rv_pkcs11 =3D constant_time_select_s(good, CKR_OK, rv_pkcs11);
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.22.0.bb
index 770c2d686..16b3ec292 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -23,6 +23,15 @@ SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dmas=
ter;protocol=3Dhttps \
            file://CVE-2023-40661-5.patch \
            file://CVE-2023-40661-6.patch \
            file://CVE-2023-40661-7.patch \
+           file://CVE-2023-5992-1.patch \
+           file://CVE-2023-5992-2.patch \
+           file://CVE-2023-5992-3.patch \
+           file://0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_=
D.patch \
+           file://CVE-2023-5992-4.patch \
+           file://CVE-2023-5992-5.patch \
+           file://CVE-2023-5992-6.patch \
+           file://CVE-2023-5992-7.patch \
+           file://CVE-2023-5992-8.patch \
           "

 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

