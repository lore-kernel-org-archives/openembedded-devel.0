Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 00E176AD09
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:38:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HDcNCG023276 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:38:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Y5CR2sHotEIC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:38:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HDcJHg023262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:38:20 +0100
Message-ID: <1405604294.3668.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jul 2014 14:38:14 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gupnp-av: Upgrade to 0.12.6, drop previous versions
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
X-List-Received-Date: Thu, 17 Jul 2014 13:38:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Means we no longer need to set PREFERRED_VERSION to make other things build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.10.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.10.3.bb
deleted file mode 100644
index 5f8e73a..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.10.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gupnp-av.inc
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.10/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2c57e56b201765b2297946d8d99bd01c"
-SRC_URI[sha256sum] = "d0dbb727d87bc9f2dc834455d14a30700b16b41a57e9dcde2e822b378ca8f1e2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp-av/gupnp-av.h;beginline=1;endline=22;md5=d344132a8766641fcb11213ff5982086"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.11.6.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.11.6.bb
deleted file mode 100644
index b402dd8..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.11.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require gupnp-av.inc
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.11/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "ee200393207323f0b594f11d6184556c"
-SRC_URI[sha256sum] = "401991336babb18c4ebed16e75e0b4d3e5848cff7bb878bbfd54a5d15203c4cc"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp-av/gupnp-av.h;beginline=1;endline=22;md5=2b47b7b5f799d2ebabe62b895e848820"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb
new file mode 100644
index 0000000..b1b793b
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.6.bb
@@ -0,0 +1,8 @@
+require gupnp-av.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.12/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "f56cdb269376a9e6cb062eb9960ccf57"
+SRC_URI[sha256sum] = "e0553d60dd7c7277c65c02a68a270c4dcb9036a4c7075c902fc8111c6a5e6a44"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp-av/gupnp-av.h;beginline=1;endline=22;md5=2b47b7b5f799d2ebabe62b895e848820"



