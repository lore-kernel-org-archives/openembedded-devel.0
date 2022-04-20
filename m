Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235E8C3A589
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.5622.1650445941359386835
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 02:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MdW24mEo;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650445942;
  x=1681981942;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=itrozxziQDHX3I/SWPJQdM/7/CiVT4ztaTg0mOeFlBE=;
  b=MdW24mEoqCV9x3qMq9ThndyS3Qj5YuExN0qxah+oFJ9g3DAKh962Gskr
   cItjPCtOdqItchl9SFy/+pLDolj2naVDxIMGi2WcOs/zz+xvA+Z//o/ma
   Ldg4OeGnbY7eVSEndeOxn74o1XKRi/17RGNsJLxzOpIQhEjSqEmR8OIIS
   0r8S8v21Ml7Zl0dbtpQcAkBSQmCXWt4kR+KjiP/g9bVFU79p+UpsSqJHI
   S91jH9/71KFtycKx7Gx72d+ebvP2rqWM45FQy3RceEVxhaPXuiN7vMo1H
   yFhf65QPj64L2+s8XU2kl+WYpH0/1bjpnd3xDja//bh4IAyUzZjtqunyf
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] poppler: Support building for native
Date: Wed, 20 Apr 2022 11:12:16 +0200
Message-ID: <20220420091216.11337-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96712

* Disable RUN_GPERF_IF_PRESENT. Otherwise cmake will look for gperf. For
  target, it will not find it and proceeds to use the pregenerated
  files. However, for native it finds `/usr/bin/gperf`, but then tries
  to run `gperf` instead, which fails since it is not in hosttools.
* Disable ENABLE_CPP for native. Otherwise it needs iconv, which it
  cannot find.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/poppler/poppler_22.04.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index 9c9122160..b7cdb4f1b 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -33,9 +33,11 @@ EXTRA_OECMAKE += " \
     -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
     -DBUILD_GTK_TESTS=OFF \
     -DENABLE_ZLIB=ON \
+    -DRUN_GPERF_IF_PRESENT=OFF \
     -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH='${STAGING_INCDIR}' \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_GOBJECT_INTROSPECTION=ON', '-DENABLE_GOBJECT_INTROSPECTION=OFF', d)} \
 "
+EXTRA_OECMAKE:append:class-native = " -DENABLE_CPP=OFF"
 
 do_configure:append() {
     # poppler macro uses pkg-config to check for g-ir runtimes. Something
@@ -49,3 +51,5 @@ FILES:libpoppler = "${libdir}/libpoppler.so.*"
 FILES:libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
 
 RDEPENDS:libpoppler = "poppler-data"
+
+BBCLASSEXTEND = "native"

