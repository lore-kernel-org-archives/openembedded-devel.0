Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAyRh-000630-VE
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 07:57:58 +0100
Received: by mail-wg0-f43.google.com with SMTP id dr12so1655903wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GTsU0VD+2GioB+evm0Y6OziXIGx+TuE+/kO9IrrLTHc=;
	b=eGRxETvOwjBQOnuqdYEo6jHawg4sEQXphKgLGcgiGKt6G7PNXNhkuQx6fhG38Bl+BW
	6pK/XxA50z61GY3lCvg7mKroGOtv4/vegIdvq+E/ijbPkeRD8fRD0tMzHzh7OZB/4cMx
	6gvEKLuMH+9KtBEt5DxUAsfF5vPbSgsG6TPtY7GOm+UxoQitSM1OF12GuG1DEZqTkXq7
	nbWASNcZWVopaAXS99NCqK+opiFdvPjeHw4fSsqucu9N4DQq0gEruxeAAZPR2qADjSvA
	yl6W2VBtRZXuXGhd0qdE8NdHY8ElvnossAvdqwZcvZIO7199ptHKyyx0sA8CSjtcmCiD
	1tow==
Received: by 10.180.84.164 with SMTP id a4mr3858562wiz.2.1332485342757;
	Thu, 22 Mar 2012 23:49:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm11396505wib.4.2012.03.22.23.49.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 23:49:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 07:48:43 +0100
Message-Id: <d8ef36fc72da33dc38af72faee0bcbd893c55433.1332485253.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <c49db2c3482e38a5a2671b147a0a8dbcbcb5baa4.1332485253.git.Martin.Jansa@gmail.com>
References: <c49db2c3482e38a5a2671b147a0a8dbcbcb5baa4.1332485253.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332485253.git.Martin.Jansa@gmail.com>
References: <cover.1332485253.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Fri, 23 Mar 2012 06:57:58 -0000

* /etc/modules-load.d/foo.conf is used by systemd like /etc/modutils/foo was with sysvinit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index cd36e55..41a741f 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -127,6 +127,7 @@ kernel_do_install() {
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}/etc/modutils
+	install -d ${D}/etc/modules-load.d
 	install -d ${D}/etc/modprobe.d
 
 	#
@@ -416,6 +417,11 @@ python populate_packages_prepend () {
 			for m in autoload.split():
 				f.write('%s\n' % m)
 			f.close()
+			name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
+			f = open(name, 'w')
+			for m in autoload.split():
+				f.write('%s\n' % m)
+			f.close()
 			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
 			if not postinst:
 				bb.fatal("pkg_postinst_%s not defined" % pkg)
@@ -431,7 +437,7 @@ python populate_packages_prepend () {
 			f.close()
 
 		files = d.getVar('FILES_%s' % pkg, True)
-		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename)
+		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename, basename)
 		d.setVar('FILES_%s' % pkg, files)
 
 		if vals.has_key("description"):
@@ -461,7 +467,7 @@ python populate_packages_prepend () {
 	# avoid warnings. removedirs only raises an OSError if an empty
 	# directory cannot be removed.
 	dvar = d.getVar('PKGD', True)
-	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar)]:
+	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
 		if len(os.listdir(dir)) == 0:
 			os.rmdir(dir)
 
-- 
1.7.8.5



