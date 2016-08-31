Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE5D73243
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d196so5084850wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sg0rcMq/VX8gb8b1PdpGZ2qWHlW1obcmD8Qie9bsjn4=;
	b=EZUoSytX+cZ7Dsu9IOQfCnYMwdkjYOYE0HZ/xxI4yBRQdavIyxkdnTK+gMhCqKWEJu
	bX4Zqr0y764O088QDhoHQkwAqhKCz2Wr1Ktyl3R3cKNGy0EjVIBrcvOPV58EuSyyQiRB
	998BF1x4FZYuUhi8zrxeilos6bFi2o9pytQnASx97luqWGd8G8wA/kLicJxnefOooymL
	7DTEqY1/I8QsFDnC6Wz1GbhoRK+/W7D+1VbNWztxUeyAbLyt6WgQoUzIxwBQtZTSnMo8
	DpcVzkAVSFKGbpG1KosgoC/vh2f+uGRO3GVpDVUkoesUvT2JiZ4yfWdyJeJ60mCwM+lq
	O8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sg0rcMq/VX8gb8b1PdpGZ2qWHlW1obcmD8Qie9bsjn4=;
	b=DR1a/Hc9/gJMYijiLRzRktg7bB2z5xGyUxYHNcEDzHZ2Mj9gRii18xMGWR9Mt6uxfO
	sRgfRuvQvQGmfvsz1oNrwLRAZ885qqCwvlQdqexPVZq8z9ozSm59xjyIfv4w0+HPQdgj
	mhHCuI8jJCNgmHTRZRgE96yud1X3CXdSzgJwL8HKi7fMAfDCQPNjOqGc0+9pxTFzByW3
	1K1Gk8bhXbFyx4csS9Zv3NNBGaGP1zp7ZuRvZBd4mTxk4380Cwt379muoDEsgPI3p/lU
	EH5hX75EFDdterU5d0i/5fbbXGRxL5UQiQh31Um7GXW5AflKMi0by+Vw675M2YBuNKyr
	PQAw==
X-Gm-Message-State: AE9vXwOmvo1eIKk2TXBaB/DlG5yj27eQ5FJJNehNmsqY0MU1STsqIyYT2fNRTHTFizKk/g==
X-Received: by 10.28.24.73 with SMTP id 70mr11618787wmy.96.1472672477272;
	Wed, 31 Aug 2016 12:41:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	uo4sm1351512wjc.36.2016.08.31.12.41.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:40:59 +0200
Message-Id: <20160831194106.14065-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/11] gpsd, foxtrotgps: blacklist, fails to build with new binutils-2.27
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2016 19:41:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb | 3 ++-
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb              | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index d91cbcb..32b20c3 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -6,7 +6,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ libglade sqlite3 libexif gpsd bluez4 intltool-native"
 
-PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+PNBLACKLIST[foxtrotgps] ?= "Depends on broken gpsd"
+#PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
 
 SRC_URI = "http://www.foxtrotgps.org/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "6777d448ee9d3ba195f9d26ea90e3163"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 6b883a8..822fc24 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -137,3 +137,6 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.socket"
+
+# http://errors.yoctoproject.org/Errors/Details/81000/
+PNBLACKLIST[gpsd] ?= "BROKEN: fails to build with new binutils 2.27"
-- 
2.9.2


