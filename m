Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TfnS4-0004yM-M0
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 09:02:00 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2025394eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 23:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QSRgl4SfG0JNVIf2AwZHR7g96v0gE+z8d1aMW38WuCo=;
	b=ANRji+xA7gjvWcqM9CaiEreNpkWgkUOeM9zOW+zBWzmY2chqZ4yypH5PqB2c8Hj+EN
	tZjpHNdMWk/sC1hVBqqTqV44UF1OoGtuyMmKn8Z18awh18dV6JOAhb1ePP1+J2IMd+W5
	+R13fD7XZDNV9BgwwJ0GQGxDirq795dVkWLmbrZUSh3CWrvn4o3FPkSSBw+SSDsJ+sHO
	zbu5h97i1CRo1cLEbD8j0nd+IG2e9TDlqGPex6S7wBETDrdIu43j8zuJ86NLrFEx51WM
	KfcQpXSOSYZG1bWAs817vso942DhbudHzHjExXBSmr/LrFAJFc9sNe2LC96ULajL0Wmy
	jw5A==
Received: by 10.14.203.8 with SMTP id e8mr42927244eeo.2.1354607258509;
	Mon, 03 Dec 2012 23:47:38 -0800 (PST)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-119.unitymediagroup.de. [178.200.247.119])
	by mx.google.com with ESMTPS id r1sm1085608eeo.2.2012.12.03.23.47.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 23:47:37 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 08:46:49 +0100
Message-Id: <1354607209-18071-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe] maliit-framework: Don't build the SDK
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
X-List-Received-Date: Tue, 04 Dec 2012 08:02:00 -0000

The SDK installs binaries in the /usr/share/doc directory

This fixes QA errors like:

ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/usr/share/doc/maliit-framework/maliit-sdk/examples/apps/settings/.debug/maliit-exampleapp-settings

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../recipes-support/maliit/maliit-framework_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index 534a3c8..a164e78 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -19,7 +19,6 @@ PV = "0.92.3+git${SRCPV}"
 PACKAGES =+ "${PN}-gtk"
 GTKIMMODULES_PACKAGES = "${PN}-gtk"
 
-# Maliit needs Qt configured with -accessibility, a patch for that was already sent and will get merged in post 1.2.
 RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
 
 RRECOMMENDS_${PN} = "maliit-plugins"
@@ -55,6 +54,7 @@ EXTRA_QMAKEVARS_PRE = "\
     CONFIG+=disable-gconf \
     CONFIG+=disable-gtk-cache-update \
     CONFIG+=local-install \
+    CONFIG+=nosdk \
     "
 
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
-- 
1.7.9.5



