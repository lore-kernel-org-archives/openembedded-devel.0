Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Rvyox-0002T2-7b
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Feb 2012 23:19:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 2FF653158BC1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 23:11:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dHA1FBh1KwIP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 23:11:48 +0100 (CET)
Received: from [172.22.22.61] (drms-590ec8a5.pool.mediaWays.net
	[89.14.200.165])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 31CD73158BC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 23:11:48 +0100 (CET)
Message-ID: <4F359623.9080505@opendreambox.org>
Date: Fri, 10 Feb 2012 23:11:47 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] udev: consolekit package requires x11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2012 22:19:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

* consolekit fails to build without x11, so disable
  creation of udev-consolekit, if x11 is unavailable.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* I build-tested udev-180 only.
* Related patch for OE-core:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/017681.html

 meta-oe/recipes-core/udev/udev_173.bb |    2 +-
 meta-oe/recipes-core/udev/udev_175.bb |    2 +-
 meta-oe/recipes-core/udev/udev_180.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index e4e634a..cbbe910 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -59,7 +59,7 @@ do_configure_prepend() {
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit"
+PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils ${@base_contains('DISTRO_FEATURES', 'x11', 'udev-consolekit', '', d)}"
 
 FILES_${PN}-systemd = "${base_libdir}/systemd"
 RDEPENDS_${PN}-systemd += "udev"
diff --git a/meta-oe/recipes-core/udev/udev_175.bb b/meta-oe/recipes-core/udev/udev_175.bb
index b6484d9..6560b5d 100644
--- a/meta-oe/recipes-core/udev/udev_175.bb
+++ b/meta-oe/recipes-core/udev/udev_175.bb
@@ -55,7 +55,7 @@ do_configure_prepend() {
 	cp ${WORKDIR}/gtk-doc.make ${S}
 }
 
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit"
+PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils ${@base_contains('DISTRO_FEATURES', 'x11', 'udev-consolekit', '', d)}"
 
 FILES_${PN}-systemd = "${base_libdir}/systemd"
 RDEPENDS_${PN}-systemd += "udev"
diff --git a/meta-oe/recipes-core/udev/udev_180.bb b/meta-oe/recipes-core/udev/udev_180.bb
index 4cabcce..bc1b8a4 100644
--- a/meta-oe/recipes-core/udev/udev_180.bb
+++ b/meta-oe/recipes-core/udev/udev_180.bb
@@ -53,7 +53,7 @@ do_configure_prepend() {
 	cp ${WORKDIR}/gtk-doc.make ${S}
 }
 
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-consolekit udev-utils"
+PACKAGES =+ "${PN}-systemd libudev libgudev ${@base_contains('DISTRO_FEATURES', 'x11', 'udev-consolekit', '', d)} udev-utils"
 
 FILES_${PN}-systemd = "${base_libdir}/systemd"
 RDEPENDS_${PN}-systemd += "udev"
-- 
1.7.5.4



