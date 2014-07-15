Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9F06870196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:47:11 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so4566611wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hp7GyOAHBgRfcWmSZwx0Vmek3cCWlkxW82rcMiUqERI=;
	b=c9gnI9Oofm088WGLWyA3k7ZQOvM/ZsjS2ptYa+9ZL2EBv1MrzUMTkYO42rKzExNM0n
	7n9KOrTcDlNITPjiG/7pbr8fi6Db7TkK7FlBCgOlSW53qREKi9ZhmJkD1QKjdo70MdBg
	4mLh6ROrrv8hFgKJie/R3jkqd615wPc9IDZ7uwsxnZICViepUyk2O+JbcAx/hb9Z36Xi
	ErgF6JrDm8rl59w0a2k32A7xzHa6ATYwx5xoEN1vmrUBr2Qp3hi/5mIx1stTx9kdyw/9
	9hKcDIAWoEsTl/XlOk0hoz4keq3LvBkpOyqLXgXifVPjLSwR5H1h9N2Y3mkyZVJdXFlq
	F5Bg==
X-Received: by 10.180.91.194 with SMTP id cg2mr7961588wib.12.1405450031986;
	Tue, 15 Jul 2014 11:47:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb8sm46750438wib.15.2014.07.15.11.47.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 11:47:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 20:47:20 +0200
Message-Id: <1405450040-7193-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][PATCH] libnice: create ${S}/m4 directory before gtkdocize is called
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 18:47:21 -0000

* otherwise it fails with:
+ gtkdocize --docdir /OE/build/shr-core/tmp-eglibc/work/core2-64-oe-linux/libnice/0.0.13-r4/libnice-0.0.13
  ln: target 'm4/' is not a directory: No such file or directory
  cp: cannot create regular file 'm4/': Not a directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 2d7cff3..711b6bd 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -23,6 +23,10 @@ FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 
+do_configure_prepend() {
+    mkdir ${S}/m4 || true
+}
+
 do_compile_append() {
     for i in $(find ${S} -name "*.pc") ; do
         sed -i -e s:${STAGING_DIR_TARGET}::g \
-- 
2.0.0


