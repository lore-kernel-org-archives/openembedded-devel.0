Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CF5D3C902
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:28:13 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15372.1765373288475165155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSpVIJ6N;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso8783699b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373288; x=1765978088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uy9JBOWj4DT60B847djuDGLr2Wq5ZB99XaelAcmkto=;
        b=iSpVIJ6NyW9eKy7wE8eCUh4jiM4K5k1zLa3deBeiMs0/G9MeSXph4aBN9jFpolQ4aa
         QFQ/Y4XYxW7EermvcXKqX0JpWqFI8hqYClthqdBOw8EZCaOOzBowOKOjBDy857+aml26
         AIjDfGdqZoqmOej6V7F28HIt0BYmvdTuRPi14BQP4xBpToo/FnbFUkrX33xGs5fykWEz
         jy8IjEJsJIUzYy1t4FZdJ0+RnuUOGLugz/BLN3XSkKbWszkhGeVO7kfMsYdf+gU0eXjD
         Dyty33d7/J1gwmIGHxkaLZdfXXuIODNJJHFaGag27WUP4745Rm1CyBnwYZzLSS+kBHbR
         gXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373288; x=1765978088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5uy9JBOWj4DT60B847djuDGLr2Wq5ZB99XaelAcmkto=;
        b=JgCplAF8qD8n3sUjm0d7qkrIl0XWIfnpMS3jWPdny8tVveFlmuZ8i60PkUzGV0dDhh
         6aFJe159x1tntnOsDiK0bE6+hlU6yx21rrKQzcJFXAyEzhGjNke2BflX10Fz9DqO2dnR
         KKlqBKuQxvvNcP82IXL6bIXyuupe+c5Qq3Rob4Bu1N03h25Vg2PmY1xIy8DWz5u3Jnb6
         0b6fC4PG45dWuOVa2aKVuS3nd3s3TwIY4paEy5tyV0DhyNttoJiIsR3oONP7B3HeRA/Z
         PzRIWDhUIfoZhXx3elYu0fKSs9W3jasF3vKvSOzo1flUe1JlruXQccGzFfRqGB8FJi/k
         mxEQ==
X-Gm-Message-State: AOJu0YwTHsgxmcDD861mDtpN6trk+D2YEcTJW7j4RwRyg12e2FgDn0xi
	2wEnzO7Cig1G3uSbPNTN2o1U7TSBpyD4dXOQiNDmOWZC6j5u0Btr0un4VTkNzA==
X-Gm-Gg: AY/fxX5C+rVrU5bVBxSuizRTi4Z/SgnARGu3B49LpVkM5Y8chTdVTmhs6+Kfg7MdNHL
	NaU0FbjwfWh6TQmmZFBbAj/hBZXvm0oX729z79SBOTj69RsjVQakAcy7XRYQT4VOoHlqK7YNdO1
	PsbdsazhBhzakSQAyql5NWTXkuW4s1u0eIao45NMR02ioNy57KkRtgrQufes0nsWR//N1139leC
	a27dj0nS9SE26G4GFe4EucVmqeCmn/XTvayCkgG7vOBomEbBVjk7qz2qKp+kcxp4qxmccbPwbOs
	OD6PfjrK8ESJ4KEBeqKAMRJW2ojD6xTBgY2qpV3CgLkiEsVcbP0dqz3Ahq+PcOGs3H6tlltNX5c
	7zdOkxXAcReHwqAR3xGDhpOTIogQW2V8RphPerHXC/DtZXgnpZJm+zemnOVbijCVSHTzBFnYFhq
	LX1PZljODFewbaE6sDuiZCKAgogWg0EhP5gQ==
X-Google-Smtp-Source: AGHT+IHCRnjBJSFvzmEyBSqNh4/6WmXIBgoU08MvD+bgvM266I10toFUImKOCsWYLvvtn1e8EGxLGQ==
X-Received: by 2002:aa7:888b:0:b0:7e8:4433:8fb9 with SMTP id d2e1a72fcca58-7f2303aeebemr1917126b3a.65.1765373287631;
        Wed, 10 Dec 2025 05:28:07 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa824sm19163006b3a.47.2025.12.10.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:28:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 42/43] libmng: correct version of libmng
Date: Wed, 10 Dec 2025 18:57:43 +0530
Message-ID: <20251210132744.336180-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
References: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122546

From: Changqing Li <changqing.li@windriver.com>

Current version is 2.0.3, the lastrelease of libmng is in 2015,
add a patch to fix it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c91f9c0a4bd7175c108ff89d8e80a134c84d7e1a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...0001-configura.ac-update-the-version.patch | 32 +++++++++++++++++++
 .../recipes-graphics/libmng/libmng_2.0.3.bb   |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-version.patch

diff --git a/meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-version.patch b/meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-version.patch
new file mode 100644
index 0000000000..f0f644f807
--- /dev/null
+++ b/meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-version.patch
@@ -0,0 +1,32 @@
+From 8bf709daf0fe0657b55dad50a3a04854140c69a3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 3 Dec 2025 13:57:39 +0800
+Subject: [PATCH] configura.ac: update the version
+
+current version is 2.0.3
+
+Upstream-Status: Inactive-Upstream [ lastrelease: 2015-04-20 ]
+
+https://sourceforge.net/projects/libmng/files/libmng-devel/
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 04f9c7a..a7ca9d8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@ AC_PREREQ(2.65)
+ #
+ define([MAJ_NR],[2])
+ define([MIN_NR],[0])
+-define([REL_NR],[2])
++define([REL_NR],[3])
+ #
+ #AC_INIT (PACKAGE, VERSION, [BUG-REPORT], [TARNAME], [URL])
+ AC_INIT( [libmng],[MAJ_NR.MIN_NR.REL_NR],
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
index c92696b8bf..fe76520d15 100644
--- a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
+++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=32becdb8930f90eab219a8021130ec09"
 SECTION = "devel"
 DEPENDS = "zlib"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://0001-configura.ac-update-the-version.patch"
 
 SRC_URI[sha256sum] = "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c44014125874b14b7dfaa"
 

