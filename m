Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27D0EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:26:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1044.1688577965800761975
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9EE1763;
	Wed,  5 Jul 2023 10:26:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7EDA63F762;
	Wed,  5 Jul 2023 10:26:04 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] poppler: fix missing include
Date: Wed,  5 Jul 2023 18:26:00 +0100
Message-Id: <20230705172601.3887976-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103672

From: Ross Burton <ross.burton@arm.com>

Backport a patch to ensure that stdio.h is included before jpeglib.h.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../poppler/poppler/jpeg-stdio.patch          | 41 +++++++++++++++++++
 .../poppler/poppler_23.04.0.bb                |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/jpeg-stdio.pa=
tch

diff --git a/meta-oe/recipes-support/poppler/poppler/jpeg-stdio.patch b/m=
eta-oe/recipes-support/poppler/poppler/jpeg-stdio.patch
new file mode 100644
index 0000000000..70ba1cf123
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/jpeg-stdio.patch
@@ -0,0 +1,41 @@
+From 2986f06c7cc9d64a506ebe861b8bf38f73386e86 Mon Sep 17 00:00:00 2001
+From: Jordan Abrahams-Whitehead <ajordanr@google.com>
+Date: Tue, 16 May 2023 18:52:19 +0000
+Subject: [PATCH] Add missing #include <cstdio> prior to jpeglib.h
+
+Fixes #1398
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ goo/JpegWriter.cc              | 2 +-
+ poppler/ImageEmbeddingUtils.cc | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/goo/JpegWriter.cc b/goo/JpegWriter.cc
+index ca69fd055..566ee38f8 100644
+--- a/goo/JpegWriter.cc
++++ b/goo/JpegWriter.cc
+@@ -23,7 +23,7 @@
+ #ifdef ENABLE_LIBJPEG
+=20
+ #    include "poppler/Error.h"
+-
++#    include <cstdio>
+ extern "C" {
+ #    include <jpeglib.h>
+ }
+diff --git a/poppler/ImageEmbeddingUtils.cc b/poppler/ImageEmbeddingUtil=
s.cc
+index 0c13fe968..07b9dfb62 100644
+--- a/poppler/ImageEmbeddingUtils.cc
++++ b/poppler/ImageEmbeddingUtils.cc
+@@ -14,6 +14,7 @@
+=20
+ #include <memory>
+ #ifdef ENABLE_LIBJPEG
++#    include <cstdio>
+ extern "C" {
+ #    include <jpeglib.h>
+ }
+--=20
+GitLab
diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe=
/recipes-support/poppler/poppler_23.04.0.bb
index 099be58a42..896176801b 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -7,6 +7,7 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.tar.xz =
\
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
+           file://jpeg-stdio.patch \
            "
 SRC_URI[sha256sum] =3D "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cace=
e0674670693951a1"
=20
--=20
2.34.1


