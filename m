Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F1DC0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 15:16:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.44628.1738422993769826044
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Feb 2025 07:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LsKkf2Vh;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso30562105e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 07:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738422992; x=1739027792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LqmeJzpiD8YZ1xvymTNQrsOQlg/IaFv47yCbvup3U4c=;
        b=LsKkf2VhPhIwX98ascQOsE1tXFV3pKkQkFqLrbZF976AIy9P6TgFDx3Np8LjiMQ+16
         /11M6rrYsxc4cqPrmbAk0IPsK++mqak1mS1VtWrrSpEbUk1zfCNuqZzcL1yGPVM0ffk5
         tMambjGPmZSGv5cMNh38zp+AysVftzDzdrNnoBL96cYxE2aYY+CkFSirj9x+4C789Y0E
         BOvZXUfSYfma4J82nRSXoZLCERREajEagjVnFP1jwjsJU+iepZuhuZfTJTsZV16eBivA
         3wlKuMEs7p9srFEHVdqux/O3X9x4aq1AccQnZEvVF8wnGhhvAHi42wi6wrZ1lQoskRaj
         85Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738422992; x=1739027792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqmeJzpiD8YZ1xvymTNQrsOQlg/IaFv47yCbvup3U4c=;
        b=uF5tKDLmjl79ALFqSb0n2oHU+ypSFRIRAutL6YDKp5OsmAJiQ3EHYv3l11GhsdmlZ/
         Ku60ob9mhw4PsvZ7eRm7it3Ilg15ryfIIyLAf2PiTxqNjzTZILNV0VRIxWSsy1AvGTEn
         uG+zBrWIocexV//Qsdf9ZlSkkDkk2KMIbAVSkt6fBTP0Ij5wCoFOOzoQAZVigEM0QqqE
         iXP0DWhV1Cs9ZYV6+WkbIc8MSj7HRskFoZm8iaKUeAgtINEYjLUm1O9bJaP8WUIXlQyo
         hQboawhKFQVWbyP1/mYfn6SVOgXaJMHi8BMRpA1LxNG7CiHmdhWoGlk/TPzgVFCF47z/
         D2ng==
X-Gm-Message-State: AOJu0YyLUmrNkxBnLVYUCnUvrsQEZ+FXT1D+lbTgYzR+LNxzhO7NSOv2
	XX7v58/TjMAtfj6VrubGUPdlCgxc2w9jy4G1xnRpn2hLzmfyQ1+POXHxIu2h
X-Gm-Gg: ASbGncuMsUl2VKLjghapABFpDAPjsIVCDpshddUH9KAIlrxtnGx2ichSdOvGYZICHtK
	4xpB3jdmqKMaEy6GXhR6DJjGn7/scPUr4p6O8ZR570rARo9El7P+J82Zp4cuKfRWQ01Z9yOVy4X
	1NcO1hQKJxqPToOKALShTS6zLbHlkznYzoc5o/NHONPKtZJoQkkiwQUgHz4mDLFD1NeSP3Y6qkg
	59mVhk09r05qnxcQrUtGep+wdi68ssAWCp6i2JtEJfJ8UWdxAIoM4SZv/9cEvYYx2rUcQI9/It8
	J3i/uxv6Cwwzuv8bhWk1NgzxyDWr4P0=
X-Google-Smtp-Source: AGHT+IHUSRrydIS7WKaX9buLY27ZIQevzpc8GcO7sfD53MmeVb3d7eprvLJGXjz0/liVdd4RmSAgXg==
X-Received: by 2002:a05:6000:154e:b0:38a:88bc:d57d with SMTP id ffacd0b85a97d-38c5192f555mr11672222f8f.2.1738422992139;
        Sat, 01 Feb 2025 07:16:32 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bc0sm7603025f8f.35.2025.02.01.07.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 07:16:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-networking][PATCH] open62541: fix qa error with encryption-openssl PACKAGECONFIG
Date: Sat,  1 Feb 2025 16:16:24 +0100
Message-ID: <20250201151624.1314816-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Feb 2025 15:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115211

In case "encryption-openssl" PACKAGECONFIG is enabled, do_package_qa fails:

ERROR: open62541-1.3.8-r0 do_package_qa: QA Issue: File /usr/lib/cmake/open62541/open62541Targets.cmake in package open62541-dev contains reference to TMPDIR [buildpaths]

Fix it by changing the value of RECIPE_SYSROOT to CMAKE_SYSROOT variable,
so the qa check passes, and other CMake projects should be still able to find the
CMake package provided by this recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-protocols/opcua/open62541_1.3.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.3.8.bb b/meta-networking/recipes-protocols/opcua/open62541_1.3.8.bb
index 19a50aee3..1be0fc4ec 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.3.8.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.3.8.bb
@@ -51,3 +51,6 @@ do_configure:prepend:toolchain-clang:riscv32() {
     sed -i -e 's/set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)/set(CMAKE_INTERPROCEDURAL_OPTIMIZATION OFF)/' ${S}/CMakeLists.txt
 }
 
+do_install:append(){
+    sed -i 's|${RECIPE_SYSROOT}|\$\{CMAKE_SYSROOT\}|g' ${D}${libdir}/cmake/open62541/open62541Targets.cmake
+}

