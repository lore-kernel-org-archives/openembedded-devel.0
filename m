Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 08D896B333
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:25 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id t10so213390eei.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qz+4oHskkd9YeGJRCTedghU+9P8LBP6tnlJ/UVEVjtw=;
	b=GBFskPIzX7JgEXA06mW1KyN5dXlxTJFZ2lTHzdgfqYlH4xLWgNJN3BZZMQuY0wUh/+
	Zo9500RU9Odu5yQ77Til+t5FwyhP+JqJF7uO63i52UpsO5VB2x0/FZXBMLsxdHAKZoXp
	SSckT750+vFQjaJwF4wDjOca7z8Z3bo+tfF0UhrVZSyWAlCPIlGUdOGZYINBGnF1aQjt
	FW+3ukUP2dqZwCxXWfy2Wbl1jfr/tP3dojMEiktZKXOQ+wvrQD+UB2Y8Xm2H1MAZaXHp
	T8EOA9R+C3U0u4p1btEqIJ7xLNmdPqQ13paNPpPyQ3P2NRCHmDs8KSGY/8YpVg+qnFZv
	9oPg==
X-Received: by 10.15.61.130 with SMTP id i2mr36204124eex.122.1374669686353;
	Wed, 24 Jul 2013 05:41:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r54sm65869266eev.8.2013.07.24.05.41.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:07 +0200
Message-Id: <d2abc46074fe995ab020a144fe99cb005c9b34c3.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 23/29] libgphoto2: add PACKAGECONFIG for serial
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:26 -0000

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


