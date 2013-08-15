Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 937BE6B83E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:08 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so179061eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=qz+4oHskkd9YeGJRCTedghU+9P8LBP6tnlJ/UVEVjtw=;
	b=V58t7T1YNa5ZIfh+xAw9IwtZgD3C0Lu5cNREo2g4WNwJ5auKUYBSiZOy7P9bNeloik
	VMKTKlammdbnsgF4qFI9tO04vHn58lFro7zgGewiMznSu1EahB2695jJW/5FPCfX3dzb
	IjPuyFk6Z51MQiWd4dySwy/iN4bc9LXTi1jxEtG69hgniAyx/BCu/nIlJUiFOo0zRcAL
	MmHxxV5T/bv/2/Q/NEAnIiQgHGrQDuzfibnP7eO0e3RvnY9CFNjfbuJg1U1imPvBYK9h
	Dz0zfz5ITwYCDuPvJP/+MndDjyrZlXmjlZFb23ZOPrHlfdaU2G5BvhW4uvBSOTTpitjA
	PCyQ==
X-Received: by 10.15.98.129 with SMTP id bj1mr229547eeb.75.1376551209043;
	Thu, 15 Aug 2013 00:20:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm81960153eeg.13.2013.08.15.00.20.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:37 +0200
Message-Id: <6a141d7eadf996b23262a9c69ec6e44bb369dbba.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 57/60] libgphoto2: add PACKAGECONFIG for serial
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:09 -0000

* fixes undeterministic dependency on lockdev

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index ae783b8..ccca0c9 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -28,6 +28,7 @@ EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dl
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gd] = "--enable-gd,--disable-gd,gd"
+PACKAGECONFIG[serial] = "--enable-serial,--disable-serial,lockdev"
 
 do_configure_append() {
     cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
-- 
1.8.3.2


