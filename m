Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB634106121C
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 11:12:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18843.1773227517472256902
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 04:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JD4Yv1Hl;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439bcec8613so7854095f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773227516; x=1773832316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1g3V1RGigSmFlriHV7BkG3QyyVY2tPGITL4A3OXjRR8=;
        b=JD4Yv1HlJLLS0gCXk9A1CbBfe/KIHjAz1/+zMsUdvw2hOlZVSO9uXoVJtxvnVYJUvE
         /KzFvPaMpoB6Wt/g62MK6W92XQitP2r6VAZEpLXqRChoIkEcbJsptoRhb4kd9M2OFXqa
         OFHkce3P55i8IVLy1r+f2YcRtwXD0aTByAgAJ9xGCu5NVMMiwZtRu1xZDX9OErziu5C+
         F8OOhgfulqwMPuvhNuszwqy4y3KM1A9ERE2bSUCcNs917uPXPMXl5GkYtG1Mqsknz+Rn
         cmFOPmeWiGfnzbh1ZMp8vUPECvYJa5R7h815qAWk6fkJ0nmUZIDM2jdgQ+ZiufyWv2rb
         v0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773227516; x=1773832316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1g3V1RGigSmFlriHV7BkG3QyyVY2tPGITL4A3OXjRR8=;
        b=lzpr/4JuVu1BhRs2Aveszy3S2nA1ad5WLRcve5+EIJZEZyUpt3Y44JUbi5/uKUHEjT
         b4LnRFAS0rnqr2ftb9dV5cRCieC9RNn/YMykYUGpjsFeRZbRzccLoau/3k/s149w6AZL
         ZnVlpB7DGhda5G2ujrMcWlEBXSVmHWhP2zFjFLBqZrBcyUUBQdip2elJqoK0gy0jtoTB
         Y4C7C0UUAkmD+KxL142VFd88Q1QQY/IocCw+orm/NNtRRv/JFx4SwLWCY2cX0K2MQBW8
         B88271hdSWdPMZ5UP0SnFxfimQnr1/pJ74w42fwsgUPm4RdqAyncvZLJ/ZEAWc4lx325
         qW/g==
X-Gm-Message-State: AOJu0YxG+lG1lHGYl8EwMiM/plfrCS0QmjAGZE9rMkavc1dtrks819DV
	VeQZQKVIike1ct8ktjhnKYft4l9rG6ZLJ/dFvjxdLGHhAujsqhniG07h3xAs6g==
X-Gm-Gg: ATEYQzyYCxPNA+kFlhMqnR85DSQIwta6wO3n4GKlGST6QfH31zKEAQo6EjPRcu0tV+N
	ONPE6nqTsR/FhlAv5Nl9jwHj1F8/Fi2YoCGkvCUHNTYbx9Qq2m3r5I8xMAXmhoHM7DpA/bsOwnv
	17Q6xWyx6XAOoIh5Z0r7dGrThKl+zUDFVIQjHI5V/ohxqcLAQnJIOFxacyl3js5TIRNQEdGu5wg
	JA4pFRMnA5oq8tNYRyl+OLsaPDgreXKKNJIiRxhm2+DaSQdfT7nOcQBMvrngmwfqvfIwSYM8dOR
	0SnKYlHDCzJjkkGbT952NXG7QNUl5UpUyJdEaHODS1Pa/QeU/GMy8JRyhUUvtvIKh8a18KvdMHA
	VCn1Oqfh2p0hNu26reF104UINbv7OdC+cRkso6Yhtt+7UKelLvuJD3aoAyuP4EubjIa14fPbjf0
	QTHv3aCAutR6kxi/9rDGcg
X-Received: by 2002:a05:600c:c4b7:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-4854b0a6fadmr34037705e9.3.1773227515538;
        Wed, 11 Mar 2026 04:11:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0c3a10sm16201995e9.12.2026.03.11.04.11.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:11:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/2] exiv2: patch CVE-2026-25884
Date: Wed, 11 Mar 2026 12:11:53 +0100
Message-ID: <20260311111154.1737998-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 11:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125082

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25884

Backport the commits referenced by the NVD advisory.

Note that the regression tests are not included in this test. The
patch contains binary data, which cannot be applied with any of
the PATCHTOOLs in do_patch task.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2026-25884.patch          | 25 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884.patch
new file mode 100644
index 0000000000..624c53f49b
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884.patch
@@ -0,0 +1,25 @@
+From cfbe7e48cbfa63b88b3dcf9d99272330f8349c4f Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Sat, 31 Jan 2026 15:31:55 +0000
+Subject: [PATCH] Fix out-of-bounds read.
+
+CVE: CVE-2026-25884
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/5b8f1f4d92b8f27a5a80e0c3d3eb9dce7620d9f1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/crwimage_int.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
+index 570de75..8791dbd 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -812,7 +812,7 @@ namespace Exiv2 {
+                                     Image&         image,
+                                     ByteOrder      /*byteOrder*/)
+     {
+-        std::string s(reinterpret_cast<const char*>(ciffComponent.pData()));
++        auto s = std::string(reinterpret_cast<const char*>(ciffComponent.pData()), ciffComponent.size());
+         image.setComment(s);
+     } // CrwMap::decode0x0805
+ 
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 4700173de4..602ef3910f 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-37621-2.patch \
            file://CVE-2021-37622-1.patch \
            file://CVE-2021-37622-2.patch \
+           file://CVE-2026-25884.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

