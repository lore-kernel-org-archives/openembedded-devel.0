Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C986B7066B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:44:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HDiOsA023761 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:44:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CSZhrT1JHMRh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:44:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HDiLbw023747
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:44:22 +0100
Message-ID: <1405604656.26348.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jul 2014 14:44:16 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gssdp: Upgrade to 0.14.8, drop previous versions
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
X-List-Received-Date: Thu, 17 Jul 2014 13:44:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Means we no longer need to set PREFERRED_VERSION to make other things build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
deleted file mode 100644
index 29cc721..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require gssdp.inc
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.12/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "8ac3a544ef0dcf8caaf7c249d2a50dc2"
-SRC_URI[sha256sum] = "928aa257815d044fdbfc740f5799530d41897947b5d7854173f636b36d728414"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
deleted file mode 100644
index c308fa0..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gssdp.inc
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.13/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "758ed423cdd258a9a22d59c321b535ed"
-SRC_URI[sha256sum] = "8f663f8a72b66254f5c20a3610ff853ac8d00bf6f253828e37e51579caa34dce"
-
-# This is a development release so don't prefer it
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb
new file mode 100644
index 0000000..9fda51d
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb
@@ -0,0 +1,9 @@
+require gssdp.inc
+
+inherit gtk-doc
+
+PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+3"
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.14/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "b8658e480d047caf2d92baa4a51b9ae7"
+SRC_URI[sha256sum] = "4c3ffa01435e84dc31c954e669e1ca0749b962f76a333e74f5c2cb0de5803a13"




