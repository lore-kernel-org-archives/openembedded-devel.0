Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.34937.1622399679900733906
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QL3EYGA7;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 133so1638628pgf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EkwHp9yOleC05X1KG9pMHA/ejD7AlxUnAjXMmZhe06U=;
        b=QL3EYGA7d+woYjokfqsqDNZ/7/adipoz3xWHslRvy/tuIuYBLiIcbyjbosZafappB3
         Wsi0UzIXSFUPsk6EEqUmuwRSv6zz4SlDtQr5A9VSpLX6e24BPZ0L4QMFspimEPJOM0PI
         6zZ0xTtArSMgagKNVscf2+KpNLE6iPduM0eNE59MUO1pNU9QezyKGoB8NFcGRXVu0cWx
         YXuxppsA0oYGPvZYoVZpmG3qOWBamtH1e/0MzqCd8K2lLZ2kwHO+CieMIkT730ZgM3EE
         RuTlox0XC5XT2IHPDHtLnpCJXVmQqRKQwgunxaxJcbfCLY9yasAY6bQyT+4aGy36SwcR
         Vzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EkwHp9yOleC05X1KG9pMHA/ejD7AlxUnAjXMmZhe06U=;
        b=AEq6Y6jHgo7ivARpWh+7hOTsgdvezk5OuBUSmwfPdWHHdxBZW7U6jKrmqhcpMBh7Tl
         VJbNTnf14wSjRxPLER70qNyPJYBg5lbN7UBhN1sHZrrcDxhJUa0rZ0/awGgNvt/o/C/p
         FcAHIpAUklZ2pDJ4htqzOF7zrcJslWDD7CWboeP4mneoxbJ7yW3LhMar9XKKb8lI97mk
         rsxVYvu0z/synNDtH/KFtws7Xpb6eDTTGCbory/VneFCA6Ns7rffaRHQ8CQLDaalSKZR
         tf2QSgnqLyuk6kZt56/XTYahX3llhg6g6z987NHhkHnDeb9lQQLUmfTeyexnA3OuTUcf
         m38A==
X-Gm-Message-State: AOAM5323yqc2t2qH3acam9oC8BupczDHFoaK8Qmn3KrXw/XtNpX1tKTD
	A0adZ+0CfRuvESobDkKFqWjKfHpW99VrRA==
X-Google-Smtp-Source: ABdhPJxg3y44GMSkc81X0OTvvd5cT7dyaZCDI2bcJERkQ9MZGAtvqAgM2BGGPQxZWyUU4FpynhbWcQ==
X-Received: by 2002:a62:7587:0:b029:2e9:a997:1449 with SMTP id q129-20020a6275870000b02902e9a9971449mr7782482pfc.57.1622399679327;
        Sun, 30 May 2021 11:34:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:39 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/12] exiv2: Fix CVE-2021-29473
Date: Sun, 30 May 2021 11:34:17 -0700
Message-Id: <a3a0e023193ee465f8a4d408339352c85a20e80d.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29473

      The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file.
      An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2,
      if they can trick the victim into running Exiv2 on a crafted image file.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/pull/1587/commits/e6a0982f7cd9282052b6e3485a458d60629ffa0b]
      CVE: CVE-2021-29473

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a9aecd2c32fc8f238f62ef70813e032b6b52c2f2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-29473.patch          | 21 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
new file mode 100644
index 0000000000..4afedf8e59
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
@@ -0,0 +1,21 @@
+From e6a0982f7cd9282052b6e3485a458d60629ffa0b Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 23 Apr 2021 11:44:44 +0100
+Subject: [PATCH] Add bounds check in Jp2Image::doWriteMetadata().
+
+---
+ src/jp2image.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index 1694fed27..ca8c9ddbb 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -908,6 +908,7 @@ static void boxes_check(size_t b,size_t m)
+ 
+                 case kJp2BoxTypeUuid:
+                 {
++                    enforce(boxBuf.size_ >= 24, Exiv2::kerCorruptedMetadata);
+                     if(memcmp(boxBuf.pData_ + 8, kJp2UuidExif, 16) == 0)
+                     {
+ #ifdef EXIV2_DEBUG_MESSAGES
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 2419bab352..d5d9e62ff2 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.pat
             file://CVE-2021-29463.patch \
             file://CVE-2021-29464.patch \
             file://CVE-2021-29470.patch \
+            file://CVE-2021-29473.patch \
             file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
-- 
2.17.1

