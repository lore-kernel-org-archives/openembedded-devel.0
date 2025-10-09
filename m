Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D4CCCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 04:11:13 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.4419.1759983065053803185
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 21:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YZNgatgX;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-42f9353c810so746765ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 21:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759983064; x=1760587864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRoftXzelSRwfQhqqIwZTEKaUbh30y+Rn4zxGOGdtOo=;
        b=YZNgatgX2bYJCfuVK5YqlF8ScXHVgNlcFUxMn+xELx3ci8hquUqd9IbiSYRfaja8sl
         +NcW53XLEmLUKYdeAZTkJLH9hP5YQLCcLGd6Gg3e7B/05RiU2HfFy6ZDSb5HSI/E0iEm
         dB+Dn+3/axX2ptSs/wSHY/pV4maPeuhuBPsV2FnC8avJUtjGTHrqeohjDlYMNcuzIZaC
         jHaQ0PKNcbvYL7aV9K2rT4/n7GuC8KJCKfGSK4o72j4AFRxGlzHRjznSKU6FfqqBiwSV
         PZjbPh3at0IcrFYgHtpD3fX1SkGkpmg78ImmcktK+lmwEypY7cN+FhKxb3ROWp98CyRV
         BJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759983064; x=1760587864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRoftXzelSRwfQhqqIwZTEKaUbh30y+Rn4zxGOGdtOo=;
        b=bZmEqMn1lvgBJW+r8KOXE10rKRxelpzI2t1TiPhRK3sC2utYjb5mFimXhF3ughjJMC
         Nyi6RGZKDycYECw4pDrhCObNHvhXnIVgxjJ+yYgxM1eDST5uIuGhlHOLqDi7klqT+NMK
         Nk38PzZjaRTNJRC//ePazJ1Tz1wtRyID8hw7kemu85B7Mv0jF6AnG19Y/tI4O16KukMk
         kKOmsOi1IaDgmnUBcImCCwzXH+F1y2peHJR4DeRtpOA2hGZ1IKg/g4ESUskT37tsgR4J
         upeAFweTQClYFEaffnIBNH0O3KZSVKUP2QJcFIn5IVxOhc/Qs8vCBIJDBxrNYsyQSYTL
         cYPQ==
X-Gm-Message-State: AOJu0YymL82MAxcofTbtCcWSY/BNB0rH3OedeffbFuQfoCy0h+wxYCf+
	hhlXXxl9jIt/9EDhg5G7hbfGTn++dpTOPhseCbpmFJB3Gc5sG8q5rH0+K36tpQ==
X-Gm-Gg: ASbGncsAnz1ak0j+nd/H7OXf1tRPdg5VjsKJs7NQLreJlFeUjn9vYg524Q3ZZpoSSvK
	0Oeqm/ntl2tcsH4eTJzni9upJYmxvBYlfIePT6B+ySQXAKioaxZ5prQTqjZg1k35aG8BAumeqFh
	7+w9YvdBDkfguoq2V0MN6jCm0OMgbdJvDf35dPKZG6jeMQKWMUfshmJHXYfnhow6c1x5h6WlCPT
	JqVQo1gpjlq8AK6sIPvyfTe0eTJCw50FYlLtfnkkIzYtMzNdJLJgpdScNxd6ziV3b8VAIbm9ajB
	cbT8lQ+yOZ0zgH7N9TFkGgkz+vIEcg5NWkqA5qkrH7g5/G7Q/DigVSQp9o3wD6HRFQv4Yube0bD
	8lbCYG0Lyr5gaXFaFiSsr00+C9hysQJ9y7xp1bnxMXoEGTnk4HaojPbYKJiDdTRwTbDxOsz+cMg
	01odX5ikz7J4E=
X-Google-Smtp-Source: AGHT+IHjBw3WQIUuFC6m89QB1h82AiY9Rh4/z6CxSbttd2fOavhh5DcxFWrt6aaeKV9JSQsnUw1YFg==
X-Received: by 2002:a05:6e02:1c2e:b0:42d:86a7:164f with SMTP id e9e14a558f8ab-42f8737587emr53080315ab.11.1759983063792;
        Wed, 08 Oct 2025 21:11:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9036e8a3sm6373825ab.31.2025.10.08.21.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 21:11:03 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][walnascar][PATCH 2/3] libiec61850: patch CVE-2024-45971
Date: Thu,  9 Oct 2025 17:10:48 +1300
Message-ID: <20251009041049.3279700-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009041049.3279700-1-ankur.tyagi85@gmail.com>
References: <20251009041049.3279700-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 04:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120396

Details https://nvd.nist.gov/vuln/detail/CVE-2024-45971

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...laced-unsafe-function-StringUtils_cr.patch | 218 ++++++++++++++++++
 .../libiec61850/libiec61850_1.5.3.bb          |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0004-LIB61850-447-replaced-unsafe-function-StringUtils_cr.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0004-LIB61850-447-replaced-unsafe-function-StringUtils_cr.patch b/meta-networking/recipes-connectivity/libiec61850/files/0004-LIB61850-447-replaced-unsafe-function-StringUtils_cr.patch
new file mode 100644
index 0000000000..4d98df490e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0004-LIB61850-447-replaced-unsafe-function-StringUtils_cr.patch
@@ -0,0 +1,218 @@
+From c8fa1fb0e11eb3993faa5f3df09c6d3c4d2305c1 Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Mon, 22 Jul 2024 16:34:03 +0100
+Subject: [PATCH] LIB61850-447: replaced unsafe function
+ StringUtils_createStringFromBufferInBuffer with function with length check to
+ not exceed target buffer
+
+CVE: CVE-2024-45971
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/1f52be9ddeae00e69cd43e4cac3cb4f0c880c4f0]
+
+(cherry picked from commit 1f52be9ddeae00e69cd43e4cac3cb4f0c880c4f0)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/common/inc/string_utilities.h             |  3 ++
+ src/common/string_utilities.c                 | 12 +++++
+ src/iec61850/server/mms_mapping/mms_mapping.c |  6 ++-
+ src/mms/iso_mms/client/mms_client_identify.c  |  6 +--
+ .../server/mms_named_variable_list_service.c  | 52 +++++++++----------
+ 5 files changed, 48 insertions(+), 31 deletions(-)
+
+diff --git a/src/common/inc/string_utilities.h b/src/common/inc/string_utilities.h
+index b6b238ff..9a5d868a 100644
+--- a/src/common/inc/string_utilities.h
++++ b/src/common/inc/string_utilities.h
+@@ -63,6 +63,9 @@ StringUtils_createStringFromBuffer(const uint8_t* buf, int size);
+ LIB61850_INTERNAL char*
+ StringUtils_createStringFromBufferInBuffer(char* newString, const uint8_t* buf, int size);
+ 
++LIB61850_INTERNAL char*
++StringUtils_createStringFromBufferInBufferMax(char* newString, const uint8_t* buf, int size, int maxBufSize);
++
+ LIB61850_INTERNAL void
+ StringUtils_replace(char* string, char oldChar, char newChar);
+ 
+diff --git a/src/common/string_utilities.c b/src/common/string_utilities.c
+index 37e62ad7..378acbde 100644
+--- a/src/common/string_utilities.c
++++ b/src/common/string_utilities.c
+@@ -85,6 +85,18 @@ StringUtils_createStringFromBufferInBuffer(char* newString, const uint8_t* buf,
+     return newString;
+ }
+ 
++char*
++StringUtils_createStringFromBufferInBufferMax(char* newString, const uint8_t* buf, int size, int maxBufSize)
++{
++    if (size >= maxBufSize)
++        size = maxBufSize - 1;
++
++    memcpy(newString, buf, size);
++    newString[size] = 0;
++
++    return newString;
++}
++
+ char*
+ StringUtils_createStringInBuffer(char* newStr, int bufSize, int count, ...)
+ {
+diff --git a/src/iec61850/server/mms_mapping/mms_mapping.c b/src/iec61850/server/mms_mapping/mms_mapping.c
+index 707e8b57..4a700a27 100644
+--- a/src/iec61850/server/mms_mapping/mms_mapping.c
++++ b/src/iec61850/server/mms_mapping/mms_mapping.c
+@@ -3268,7 +3268,9 @@ mmsReadAccessHandler (void* parameter, MmsDomain* domain, char* variableId, MmsS
+                 }
+                 else 
+                 {
+-                    StringUtils_createStringFromBufferInBuffer(str, (uint8_t*) variableId, separator - variableId);
++                    char str[65];
++
++                    StringUtils_createStringFromBufferInBufferMax(str, (uint8_t*) variableId, separator - variableId, sizeof(str));
+ 
+                     LogicalNode* ln = LogicalDevice_getLogicalNode(ld, str);
+ 
+@@ -3286,7 +3288,7 @@ mmsReadAccessHandler (void* parameter, MmsDomain* domain, char* variableId, MmsS
+                             else {
+                                 doEnd--;
+ 
+-                                StringUtils_createStringFromBufferInBuffer(str, (uint8_t*) (doStart + 1), doEnd - doStart);
++                                StringUtils_createStringFromBufferInBufferMax(str, (uint8_t*) (doStart + 1), doEnd - doStart, sizeof(str));
+                             }
+ 
+                             if (fc == IEC61850_FC_SP) {
+diff --git a/src/mms/iso_mms/client/mms_client_identify.c b/src/mms/iso_mms/client/mms_client_identify.c
+index 831b439d..c679a423 100644
+--- a/src/mms/iso_mms/client/mms_client_identify.c
++++ b/src/mms/iso_mms/client/mms_client_identify.c
+@@ -84,15 +84,15 @@ mmsClient_parseIdentifyResponse(MmsConnection self, ByteBuffer* response, uint32
+ 
+         switch (tag) {
+         case 0x80: /* vendorName */
+-            vendorName = StringUtils_createStringFromBufferInBuffer(vendorNameBuf, buffer + bufPos, length);
++            vendorName = StringUtils_createStringFromBufferInBufferMax(vendorNameBuf, buffer + bufPos, length, sizeof(vendorNameBuf));
+             bufPos += length;
+             break;
+         case 0x81: /* modelName */
+-            modelName = StringUtils_createStringFromBufferInBuffer(modelNameBuf, buffer + bufPos, length);
++            modelName = StringUtils_createStringFromBufferInBufferMax(modelNameBuf, buffer + bufPos, length, sizeof(modelNameBuf));
+             bufPos += length;
+             break;
+         case 0x82: /* revision */
+-            revision = StringUtils_createStringFromBufferInBuffer(revisionBuf, buffer + bufPos, length);
++            revision = StringUtils_createStringFromBufferInBufferMax(revisionBuf, buffer + bufPos, length, sizeof (revisionBuf));
+             bufPos += length;
+             break;
+         case 0x83: /* list of abstract syntaxes */
+diff --git a/src/mms/iso_mms/server/mms_named_variable_list_service.c b/src/mms/iso_mms/server/mms_named_variable_list_service.c
+index 3365f771..757d0ed3 100644
+--- a/src/mms/iso_mms/server/mms_named_variable_list_service.c
++++ b/src/mms/iso_mms/server/mms_named_variable_list_service.c
+@@ -401,13 +401,13 @@ createNamedVariableList(MmsServer server, MmsDomain* domain, MmsDevice* device,
+ 		    char variableName[65];
+ 		    char domainId[65];
+ 
+-		    StringUtils_createStringFromBufferInBuffer(variableName,
+-		            varSpec->choice.name.choice.domainspecific.itemId.buf,
+-                    varSpec->choice.name.choice.domainspecific.itemId.size);
++			StringUtils_createStringFromBufferInBufferMax(variableName,
++					varSpec->choice.name.choice.domainspecific.itemId.buf,
++					varSpec->choice.name.choice.domainspecific.itemId.size, sizeof(variableName));
+ 
+-		    StringUtils_createStringFromBufferInBuffer(domainId,
+-		            varSpec->choice.name.choice.domainspecific.domainId.buf,
+-                    varSpec->choice.name.choice.domainspecific.domainId.size);
++			StringUtils_createStringFromBufferInBufferMax(domainId,
++					varSpec->choice.name.choice.domainspecific.domainId.buf,
++					varSpec->choice.name.choice.domainspecific.domainId.size, sizeof(domainId));
+ 
+ 			MmsDomain* elementDomain = MmsDevice_getDomain(device, domainId);
+ 
+@@ -494,9 +494,9 @@ mmsServer_handleDefineNamedVariableListRequest(
+             goto exit_free_struct;
+         }
+ 
+-        StringUtils_createStringFromBufferInBuffer(domainName,
+-                request->variableListName.choice.domainspecific.domainId.buf,
+-                request->variableListName.choice.domainspecific.domainId.size);
++		StringUtils_createStringFromBufferInBufferMax(domainName,
++				request->variableListName.choice.domainspecific.domainId.buf,
++				request->variableListName.choice.domainspecific.domainId.size, sizeof(domainName));
+ 
+         MmsDomain* domain = MmsDevice_getDomain(device, domainName);
+ 
+@@ -517,9 +517,9 @@ mmsServer_handleDefineNamedVariableListRequest(
+                 goto exit_free_struct;
+             }
+ 
+-            StringUtils_createStringFromBufferInBuffer(variableListName,
+-                    request->variableListName.choice.domainspecific.itemId.buf,
+-                    request->variableListName.choice.domainspecific.itemId.size);
++			StringUtils_createStringFromBufferInBufferMax(variableListName,
++					request->variableListName.choice.domainspecific.itemId.buf,
++					request->variableListName.choice.domainspecific.itemId.size, sizeof(variableListName));
+ 
+             if (MmsDomain_getNamedVariableList(domain, variableListName) != NULL) {
+                 mmsMsg_createServiceErrorPdu(invokeId, response, MMS_ERROR_DEFINITION_OBJECT_EXISTS);
+@@ -567,9 +567,9 @@ mmsServer_handleDefineNamedVariableListRequest(
+                 goto exit_free_struct;
+             }
+ 
+-	        StringUtils_createStringFromBufferInBuffer(variableListName,
+-	                request->variableListName.choice.aaspecific.buf,
+-	                request->variableListName.choice.aaspecific.size);
++			StringUtils_createStringFromBufferInBufferMax(variableListName,
++					request->variableListName.choice.aaspecific.buf,
++					request->variableListName.choice.aaspecific.size, sizeof(variableListName));
+ 
+             if (MmsServerConnection_getNamedVariableList(connection, variableListName) != NULL) {
+                 mmsMsg_createServiceErrorPdu(invokeId, response, MMS_ERROR_DEFINITION_OBJECT_EXISTS);
+@@ -611,9 +611,9 @@ mmsServer_handleDefineNamedVariableListRequest(
+                 goto exit_free_struct;
+ 	        }
+ 
+-	        StringUtils_createStringFromBufferInBuffer(variableListName,
+-                    request->variableListName.choice.vmdspecific.buf,
+-                    request->variableListName.choice.vmdspecific.size);
++			StringUtils_createStringFromBufferInBufferMax(variableListName,
++					request->variableListName.choice.vmdspecific.buf,
++					request->variableListName.choice.vmdspecific.size, sizeof(variableListName));
+ 
+ 	        if (mmsServer_getNamedVariableListWithName(MmsDevice_getNamedVariableLists(connection->server->device), variableListName) != NULL) {
+ 	            mmsMsg_createServiceErrorPdu(invokeId, response, MMS_ERROR_DEFINITION_OBJECT_EXISTS);
+@@ -757,11 +757,11 @@ mmsServer_handleGetNamedVariableListAttributesRequest(
+ 	        goto exit_function;
+ 	    }
+ 
+-	    StringUtils_createStringFromBufferInBuffer(domainName, request->choice.domainspecific.domainId.buf,
+-	            request->choice.domainspecific.domainId.size);
++	    StringUtils_createStringFromBufferInBufferMax(domainName, request->choice.domainspecific.domainId.buf,
++	            request->choice.domainspecific.domainId.size, sizeof(domainName));
+ 
+-	    StringUtils_createStringFromBufferInBuffer(itemName, request->choice.domainspecific.itemId.buf,
+-                request->choice.domainspecific.itemId.size);
++				StringUtils_createStringFromBufferInBufferMax(itemName, request->choice.domainspecific.itemId.buf,
++                request->choice.domainspecific.itemId.size, sizeof(itemName));
+ 
+ 		MmsDevice* mmsDevice = MmsServer_getDevice(connection->server);
+ 
+@@ -798,8 +798,8 @@ mmsServer_handleGetNamedVariableListAttributesRequest(
+             goto exit_function;
+         }
+ 
+-	    StringUtils_createStringFromBufferInBuffer(listName, request->choice.aaspecific.buf,
+-	            request->choice.aaspecific.size);
++	    StringUtils_createStringFromBufferInBufferMax(listName, request->choice.aaspecific.buf,
++	            request->choice.aaspecific.size, sizeof(listName));
+ 
+ 	    MmsNamedVariableList varList = MmsServerConnection_getNamedVariableList(connection, listName);
+ 
+@@ -817,8 +817,8 @@ mmsServer_handleGetNamedVariableListAttributesRequest(
+             goto exit_function;
+ 	    }
+ 
+-	    StringUtils_createStringFromBufferInBuffer(listName, request->choice.vmdspecific.buf,
+-                request->choice.vmdspecific.size);
++		StringUtils_createStringFromBufferInBufferMax(listName, request->choice.vmdspecific.buf,
++				request->choice.vmdspecific.size, sizeof(listName));
+ 
+ 	    MmsDevice* mmsDevice = MmsServer_getDevice(connection->server);
+ 
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
index 3fff45670f..962fca1c07 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
            file://0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
            file://0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch \
+           file://0004-LIB61850-447-replaced-unsafe-function-StringUtils_cr.patch \
 "
 
 S = "${WORKDIR}/git"

