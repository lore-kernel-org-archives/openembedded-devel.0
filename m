Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB52CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13703.1762853877417538376
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=keNcHzA/;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29555415c5fso50598605ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853877; x=1763458677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNDzVJEbOpWhucRQ/ugtyWdVE+Y8tkt5fJyMJ1EEGo4=;
        b=keNcHzA/QcniO4omxHfoAt7eZbazKtTjYZHB7tkogBNBZX4ajNqHFC0PbqH+EJyAHy
         8xLPLbW5E1E29LD7KChs528kVuIsSGOt/hlDL80K0g3YhamWuwUVxstpQ4wWyYTAfbpt
         Ac8ZV3iHJ9N022IynfhM+vLi5wJjy9g2uOJCNi0Ztb20Zrwo0iCmzhNfU0mlP3DtCfsA
         oj2fdj9RqKc0gK+fCHhLQdDxkdvFlkJM49gSFlpJTpfnD7f7YEZyoQ1+69+mK0e/Q/Vm
         3yUn+ZbLSDRK4y4wbm2FvnvBdbk+75IfFxixqO6HDEFjusXUiCqzgi/mh7V6dtD4xASv
         xVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853877; x=1763458677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNDzVJEbOpWhucRQ/ugtyWdVE+Y8tkt5fJyMJ1EEGo4=;
        b=PxuhCWUizfkVEbU7C4tSnHzd3ZKsWTR5pnH9yq9vMm9Kiz6964Hl1rCbcRu8ohwaJi
         ra8XIw/vkRVDK+eZtW3GBT0FiwQ7GbSWX9RfCtMT4+Lzqd5f/XIN7+xGz+2x7f/qiBlH
         zqP83i/E5cRBq1aPMKPiA+7327kgR6y2ovTWDI2SB3hvwMz/1jwTYe0lWBzL2oMqHeAd
         No/8NZAINdDBBj7GXl7d6ZZKa5oJm6c/ZjvGxAjLhlZJ9s0acgsjSnIznmWJz9YxxdFy
         S5AdopiKxZ8L4kvX791kDYjx2la2IKE/TAKN7BOk5eYVYjG3aTNYoVQLAOP8ST5b5p+8
         nodw==
X-Gm-Message-State: AOJu0YwfVt0MpZRONIYLSFD0PKXcX0fCyewSScWR8JsN1KMDQWE0vISj
	d5qaXTBjRqrUiBpiEpc2MhspUAekC/iJ0TyC/6CEHU1zTtUbgjkZulL+NnQP6dIq8ZM=
X-Gm-Gg: ASbGncucJElnDox7vEe0PV9mO+busUtbDjWZ8PjH19QYmGUC1TwrEWuGGSaLEWF6HlX
	chN2aGpRJHG0armdSPvMvczO+2jxjfPNTIfVPVzb5eqDvpGKSRxLdilKJ6y3rOqFXwQuU4guqqQ
	jHswAViKf0rM2ZYd9rECtgptxXFZW2enOiH5XH+7vB6W8viOxLTXKGSdwOuHXofGSyYEIGPs1nn
	NVkqGqHU1Pji8ludwat0QTMWFkEwvNhqUunpiTq2jJaz6lGvB8/AtEkYcTpheV7bT3Shca2Ddpm
	LqM3jPyMuWuX0qnPDCh7xd3HverpL6eE81A8godu7AWdFKVtOzocrdiFXONJta+BosBFZGi0rdo
	0D3b1+hpDkaA2X2zYU+ccM+2QuRt0oaLStmusUyYEy349ijtJCPs1tC9K9s9k+q57xq7CwA4TOY
	IQT2nLGz8M+bU/4A==
X-Google-Smtp-Source: AGHT+IEp+qhtRDPMLWdv9+q4Js99ueKZh/Q4BEwHWKxKRS83SkpBNtCRxPEkJsoPZh+7AKswra8StA==
X-Received: by 2002:a17:903:1b67:b0:295:1e50:e7cb with SMTP id d9443c01a7336-297e5648887mr146593195ad.23.1762853876480;
        Tue, 11 Nov 2025 01:37:56 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:37:56 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 06/18] squid: upgrade 6.10 -> 6.12
Date: Tue, 11 Nov 2025 22:37:21 +1300
Message-ID: <20251111093733.1393568-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121509

From: Peter Marko <peter.marko@siemens.com>

License-Update: copyright year updated

Add patch to fix new build failure from release tarball.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 928ef34eadcab1272a2bc3a694873eede05a746d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...e-reference-to-nonexisting-directory.patch | 55 +++++++++++++++++++
 .../squid/{squid_6.10.bb => squid_6.12.bb}    |  5 +-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
 rename meta-networking/recipes-daemons/squid/{squid_6.10.bb => squid_6.12.bb} (95%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
new file mode 100644
index 0000000000..9babcfb24d
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
@@ -0,0 +1,55 @@
+From a6638a007a42917fea4b03e5c30d9b7208c634c4 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Thu, 7 Nov 2024 22:04:40 +0100
+Subject: [PATCH] libltdl: remove reference to nonexisting directory
+
+Commit [1] removed directory libltdl/m4 from release tarball by merging
+all those files into libltdl/aclocal.m4, however makefiles still
+reference it causing following error in do_configure:
+
+| autoreconf: Entering directory 'libltdl'
+| autoreconf: configure.ac: not using Gettext
+| autoreconf: running: aclocal --system-acdir=WORKDIR/recipe-sysroot/usr/share/aclocal/ -I WORKDIR/squid-6.12/acinclude/ -I WORKDIR/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
+| aclocal: error: couldn't open directory 'm4': No such file or directory
+| autoreconf: error: aclocal failed with exit status: 1
+
+Remove these invalid references.
+
+[1] https://github.com/squid-cache/squid/commit/b4addc2262e5bee37543f8d1ab9dd98337bafba3
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Upstream-Status: Inappropriate [upstream ticket https://lists.squid-cache.org/pipermail/squid-users/2024-November/027244.html]
+---
+ libltdl/Makefile.am | 2 +-
+ libltdl/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libltdl/Makefile.am b/libltdl/Makefile.am
+index aad98e2..8a9539b 100644
+--- a/libltdl/Makefile.am
++++ b/libltdl/Makefile.am
+@@ -29,7 +29,7 @@
+ ## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+ #####
+ 
+-ACLOCAL_AMFLAGS = -I m4
++ACLOCAL_AMFLAGS =
+ AUTOMAKE_OPTIONS = foreign
+ AM_CPPFLAGS =
+ AM_LDFLAGS =
+diff --git a/libltdl/Makefile.in b/libltdl/Makefile.in
+index 9929557..c77df2e 100644
+--- a/libltdl/Makefile.in
++++ b/libltdl/Makefile.in
+@@ -448,7 +448,7 @@ target_alias = @target_alias@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-ACLOCAL_AMFLAGS = -I m4
++ACLOCAL_AMFLAGS =
+ AUTOMAKE_OPTIONS = foreign
+ 
+ # -I$(srcdir) is needed for user that built libltdl with a sub-Automake
+-- 
+2.30.2
+
diff --git a/meta-networking/recipes-daemons/squid/squid_6.10.bb b/meta-networking/recipes-daemons/squid/squid_6.12.bb
similarity index 95%
rename from meta-networking/recipes-daemons/squid/squid_6.10.bb
rename to meta-networking/recipes-daemons/squid/squid_6.12.bb
index 332390d365..4c00d12900 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.10.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.12.bb
@@ -19,14 +19,15 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://volatiles.03_squid \
            file://0002-squid-make-squid-conf-tests-run-on-target-device.patch \
+           file://0001-libltdl-remove-reference-to-nonexisting-directory.patch \
            file://squid.nm \
            file://CVE-2025-59362.patch \
            "
 
-SRC_URI[sha256sum] = "0b07b187e723f04770dd25beb89aec12030a158696aa8892d87c8b26853408a7"
+SRC_URI[sha256sum] = "f3df3abb2603a513266f24a5d4699a9f0d76b9f554d1848b67f9c51cd3b3cb50"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://errors/COPYRIGHT;md5=d324bc1f9447d1d1588d75b22a678dc4 \
+                    file://errors/COPYRIGHT;md5=6fbb6a2adc362e206da7b4f42846cdec \
                     "
 DEPENDS = "libtool"
 

