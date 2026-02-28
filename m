Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE914FEE4FF
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 20:24:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126232.1772310275336662264
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 12:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C0P5JneL;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371bb515eso46624665e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 12:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310274; x=1772915074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pbp41OXKy/l8ITGQoNUSNDuPnoUsyqIXVlK0t99yqgI=;
        b=C0P5JneL1/cHZ/FXv3qaDPGo3mYxZ2VKIWwCL1u0vvwB98LB1IQJUYYSI8qiVC8UMn
         FPGuwK40TaZAowqniuMz1blEHt7A0Gf4mnqX+XfmbDBFUZR++mlWa9INK86M6lPrXEuc
         EPIULpx3BSEeSO1LpP3etA0Fso6N0djZURKIT+jG/8Q0EjpHoV+QA90loQL/DFyBFzqk
         ra+owgfTTF79AOLehoQOwtjUTYhuqwN+AEduXN3Iemb/wXDOHvYF4wwkM40THvY2WwTT
         1H3xjKZwkR5fGegcY7asZMbub3ChmciDisBr7pHeX2x/5rE0xSCF1L05SFtzK1jegJ03
         EMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310274; x=1772915074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pbp41OXKy/l8ITGQoNUSNDuPnoUsyqIXVlK0t99yqgI=;
        b=udxuq9SPtqORrCFqbSGd8arppa9kuVs3aVfYLt/zZMiy5irc7R9DQcJZNge5M6ieRF
         8OPRYsKOCTglDhckALf8OiaezP4rQY7xM6mNwUGzLd6kvLhNFKfKu1CX6p0PRFUfTm4D
         qsqgz1tonnDdwSfg2Tyj8mLXFtBIy4BLSC9D+V8EqIbb354ODhOJyX8wx3n9sPD9Ux6u
         PcJS0ef5TE9daqtFlHd+mj+nZuqDmfBp0ryTyBQ8fZfXJG1us9Zhl6O1kOpbbpnZySaO
         zPjuZGam9zQpAXHNwq2YkEHn0K2gWAMHy+ECaHXFC3/tLU20DYkftSiSa5T7adetDsJq
         YZSw==
X-Gm-Message-State: AOJu0YyIwr99+V+J3QizN91w7HclSGOw7tzZJe73bysglqgXudMsKTq8
	BJu74LMALnbBHdgDAvK9KLhXlSG4kvEN0Bz2To8gXPcNU05cEF8hELZM7mhVsQ==
X-Gm-Gg: ATEYQzwW5L+SoJZHAS4BP77gbx8HiZTQV5lBEHQYSGvqJ1JCCLB0xWq/hCAvZKQnr/+
	r5T192bvX0eDCLp/BdbDqpBb7O2zAb7q0f4/AbO3YcEgreDOV/98yne7GSoAnWRKZFmEkwouUAk
	c6ybR8BI6PTs3uVM0fBkb5EmQTVdRyBF0J8dzyTUoAxwe53VD878VZlUlb2UXB+irSwiaAR2/3/
	UxQPzBbZEsk54+hKl9hhtcFDK+gBRbU8oLegmM2K1K6iINcKHA7CuDrk3mYK7udqL1IvWYyOxkS
	P8NDaMR/aPyYGx/wCht9f0m9caJ4FhVCM742LZr7F1j8EhZjoHBWgaa/WM7fOcZHHZBuxcjd3yz
	XEpvfwnBg0qX+6K1Q/a8YhJrsS8To2xenWre+oOa7sX6PmnbRpTJCMnDzK3Kqx5UmonVRrf+Q1k
	Ku7QLZKPOqlialmv4sxtBw
X-Received: by 2002:a05:600c:4e08:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-483c9c0bb0amr118577695e9.17.1772310273512;
        Sat, 28 Feb 2026 12:24:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776b0sm94889995e9.1.2026.02.28.12.24.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:24:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] exiv2: patch CVE-2021-37619
Date: Sat, 28 Feb 2026 21:24:27 +0100
Message-ID: <20260228202429.2424513-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228202429.2424513-1-skandigraun@gmail.com>
References: <20260228202429.2424513-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 20:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124786

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-37619

Pick the patch from the PR referenced by the NVD advisory.

Note that the regression test is not part of this patch,
as no patchtool could apply it in do_patch task.

The test patch was however manually applied during preparing
this patch, and all tests were executed successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-37619.patch          | 37 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37619.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37619.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37619.patch
new file mode 100644
index 0000000000..9faf778743
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37619.patch
@@ -0,0 +1,37 @@
+From 0b74e631713d328a5f2bd1d9d26baf2e12b9da56 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Wed, 30 Jun 2021 18:02:43 +0100
+Subject: [PATCH] fix: fix incorrect loop condition (#1752)
+
+* Regression test for https://github.com/Exiv2/exiv2/security/advisories/GHSA-mxw9-qx4c-6m8v
+
+* Fix incorrect loop condition.
+
+CVE: CVE-2021-37619
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/86d0a1d5d9f6dc41013a6690408add974e59167c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/jp2image.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index 2da69f1..482ef63 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -658,12 +658,14 @@ static void boxes_check(size_t b,size_t m)
+         char*         p      = (char*) boxBuf.pData_;
+         bool          bWroteColor = false ;
+ 
+-        while ( count < length || !bWroteColor ) {
++        while ( count < length && !bWroteColor ) {
+             enforce(sizeof(Jp2BoxHeader) <= length - count, Exiv2::kerCorruptedMetadata);
+             Jp2BoxHeader* pSubBox = (Jp2BoxHeader*) (p+count) ;
+ 
+             // copy data.  pointer could be into a memory mapped file which we will decode!
+-            Jp2BoxHeader   subBox = *pSubBox ;
++            // pSubBox isn't always an aligned pointer, so use memcpy to do the copy.
++            Jp2BoxHeader   subBox;
++            memcpy(&subBox, pSubBox, sizeof(Jp2BoxHeader));
+             Jp2BoxHeader   newBox =  subBox;
+ 
+             if ( count < length ) {
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 3d41bc93b2..e7eac337dc 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-37615-1.patch \
            file://CVE-2021-37615-2.patch \
            file://CVE-2021-37618.patch \
+           file://CVE-2021-37619.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

