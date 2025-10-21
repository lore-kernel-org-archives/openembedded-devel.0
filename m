Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA83CCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:36:02 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.5173.1761028555992958593
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 23:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OO5OYan/;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so4354220a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 23:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761028555; x=1761633355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=He5wMSMJ1/9cythpUvdHABlHJwlFG/tQP8VSXCaVTr0=;
        b=OO5OYan/6pi8XZsetZ55JTBxQLZ9kSrxk9O5rvTaSBWvT0Wm09tPh14Hhi/e4mjkcY
         j2zv+UrcttZRWExIybGSYaIidtJooNx53kO2m4Lr7uEbw3uw0E6QvbLh5L54snUUYSNi
         2GOMW32lT6c0j36DktMznkq1pG7/RBIqJDAHXDYbmHs8adFhsOGWZzbLwonCGDD3iK3L
         V4A4c8LXhGjyM73FZDkrOZ94L94OwF/vcbOzHyrGA2LulXIQfx7udUnH+EBcRpIwW8w/
         meiN3Z8IdsN54ZGATR+yLAiKp7dtfy04R7vJO/T5HqZSrKOyjYyWvfhgL9q4kazRv13q
         lSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761028555; x=1761633355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He5wMSMJ1/9cythpUvdHABlHJwlFG/tQP8VSXCaVTr0=;
        b=SML0hZSXtvnwF4bpWseVD7tOTugchjUAPrdD1qVYoVhvJEVByn5Y4GfIs5lEkxuJ0o
         qcla+HXymZbgh41Kx327m1yauDbz0VzZlHu5yU+MhD24YkWe4vHcMJJEK5f17RhbSMdx
         t/JceaeTlZZzV9tRXZ9KnsZLS64LO70ecpWJaXQwOyIQowGtRAQ4iT5g+8bXcM1WFMkd
         6oGwnksWnR39xGu/oK/+Sge1/XRWzXCuSHOTpmqcKvZPo5exjZFHJYMfqBIksMmH2By+
         LZJznuwWFV4I255UmwSvfGgtczhtArlrcc6SzIMaLuHH72LoO8RVhRqXFg1BYb4EsTXr
         9U9g==
X-Gm-Message-State: AOJu0YwOb5oblEKQIFSwiAS7+JyWYebCXTtBzk/X6cQt8r1KNkVtVxJ6
	YFiLutpQK814RTdt7n10ifCSLqnPjGq6srhyuj00MRPl4a/3Cw7jncIdNDli9Q==
X-Gm-Gg: ASbGncvn5ftCJnN+iItIJdjigaytsrx6x+NS6BXiZ4v5FPA0QBPycs3YWatOvBPoJRG
	RovP1uD/+QEI/Sm++7/tMiWyzJSmiTbtWP5Zi2vgpdeX2u953TrjCG9Ccn3njkqvs8FXIja1fYB
	xP4wO+/1tgRkm7QsBKYIx9anYFoARYE2Vpqw10jWFSXpm+TacuuytTpYUu2Z4R6sTTSiIJ0VOUw
	nLi8fOjkZV/6HW/Mom03FQTzLsQUAis2buHS8MJv9zx+/iREbRbaJjNRHzdz8P42l6we/O4eTED
	ootjLdUKaAFVzJ272rlVEOcO0zz3r9VmUX8ll8aoRzuQfadnZs6+FoLQG1QjqKKL4QbLMtGXbyn
	yicdbjB/BDbqjrvWLvu5Y8SPKUNql+aipyLgr7X6XoHjisZ0eMp4zQ8EOWnJc5O7VWvBSFeK10k
	Rl2uFcNxC4AZzoBw==
X-Google-Smtp-Source: AGHT+IEKcgdVV60HZyZWJV2qYXW72hBITmlWDnl2EfUuJH0BlVkWYfOvFNX/efwb0a4gInEOr6Xqiw==
X-Received: by 2002:a17:902:ea03:b0:27e:d66e:8729 with SMTP id d9443c01a7336-290c63145f2mr221233865ad.0.1761028555001;
        Mon, 20 Oct 2025 23:35:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471da2f9sm99609595ad.62.2025.10.20.23.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 23:35:54 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 5/5] libiec61850: patch CVE-2024-45971
Date: Tue, 21 Oct 2025 19:34:07 +1300
Message-ID: <20251021063407.232340-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021063407.232340-1-ankur.tyagi85@gmail.com>
References: <20251021063407.232340-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 06:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120831

Details https://nvd.nist.gov/vuln/detail/CVE-2024-45971

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/files/CVE-2024-45971.patch    | 218 ++++++++++++++++++
 .../libiec61850/libiec61850_1.5.3.bb          |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45971.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45971.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45971.patch
new file mode 100644
index 0000000000..bc71261f3c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45971.patch
@@ -0,0 +1,218 @@
+From b9bebc0d74998195422d104e4d430e2511d6c40f Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Mon, 22 Jul 2024 16:34:03 +0100
+Subject: [PATCH] CVE-2024-45971
+
+LIB61850-447: replaced unsafe function StringUtils_createStringFromBufferInBuffer with function with length check to not exceed target buffer
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
index 70d3b6d2c9..462a7092c8 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
            file://CVE-2024-26529.patch \
            file://CVE-2024-45970.patch \
+           file://CVE-2024-45971.patch \
 "
 
 S = "${WORKDIR}/git"

