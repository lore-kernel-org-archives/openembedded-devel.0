Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A5EB36AD09
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:42:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HDg94T023605 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:42:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5flviYLFERyW
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:42:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HDg3lQ023588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:42:04 +0100
Message-ID: <1405604518.26348.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jul 2014 14:41:58 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gupnp: Upgrade to 0.20.12, drop previous versions
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
X-List-Received-Date: Thu, 17 Jul 2014 13:42:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Means we no longer need to set PREFERRED_VERSION to make other things build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
deleted file mode 100644
index 4fb1d05..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gupnp.inc
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.18/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "0e15fa26be7b1a0255e6dec07c285527"
-SRC_URI[sha256sum] = "6b437d5711b212292c6080626b97480268310da636a6cf937ad6119291af78a1"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=28c49b17d623afc3335efc2e511879e1"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb
deleted file mode 100644
index bab74b8..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require gupnp.inc
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.19/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "8165c3ad3d16576a0a99250b75df23f8"
-SRC_URI[sha256sum] = "0d3097c419e1f8af0ff8ee91318d75e8896b3b92924cb1a5cf93010795a7118b"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
new file mode 100644
index 0000000..bba86a9
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
@@ -0,0 +1,8 @@
+require gupnp.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.20/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "c01aa6d3a78792b3a24591f036dd91f4"
+SRC_URI[sha256sum] = "205d47b950a1b7190df1115f454cb38a44d71aacfec75d4287299e400e139b69"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"




