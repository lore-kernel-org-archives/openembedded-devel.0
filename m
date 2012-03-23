Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4JM-0002xv-9l
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 14:13:44 +0100
Received: by wera1 with SMTP id a1so2639564wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0lkkULzPGm88IPKob98+FRYLrnOYbCEFiw7PLZkOMAE=;
	b=OwtbnS0HGrYWwBrKiiWawDoO3NKou0Mqq0l+2/8rXiGgz2Sk2K6o0fcr1R05oN66VV
	u6OR9m9yKGgSCljjLWCX4b4woxNJOB8NuWTqC4fYmddag9xXqJhqSVyW1FTgWC41JkeZ
	KHcsy4Np9DlURjm0jbMroO6u61e4oL9BR57qga9AUfJfG+o/n5vMo9xxNJ3LWWuW+iB0
	qYi07ozC3SytKvhNdNbX4STrSYZSy8IDrtp5TcPHG/uMN18eTSAjqMBmLXJUl4xUzS+u
	yN+lvEKZ+rtlMCJ5MNuwM70PExtwPPi7BLtAhHAUbi1BCqUWtEwRPzGJ6BevLNutKwIe
	A6IQ==
Received: by 10.216.139.129 with SMTP id c1mr6897607wej.48.1332507888408;
	Fri, 23 Mar 2012 06:04:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm13691228wix.8.2012.03.23.06.04.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 06:04:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 14:04:14 +0100
Message-Id: <170e03358dd3fd5da26e476a5f2c03dbdcc87796.1332507730.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
References: <3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332507730.git.Martin.Jansa@gmail.com>
References: <cover.1332507730.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] kernel.bbclass: don't create /etc/modutils/*
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
X-List-Received-Date: Fri, 23 Mar 2012 13:13:44 -0000

* update-modules was updated to read /etc/modules-load.d/*.conf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 3636ff0..9ce2f44 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -128,7 +128,6 @@ kernel_do_install() {
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}/etc/modutils
 	install -d ${D}/etc/modules-load.d
 	install -d ${D}/etc/modprobe.d
 
@@ -416,7 +415,7 @@ python populate_packages_prepend () {
 
 		dvar = d.getVar('PKGD', True)
 
-		# If autoloading is requested, output /etc/modutils/<name> and append
+		# If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
 		# appropriate modprobe commands to the postinst
 		autoload = d.getVar('module_autoload_%s' % basename, True)
 		if autoload:
@@ -425,9 +424,6 @@ python populate_packages_prepend () {
 			for m in autoload.split():
 				f.write('%s\n' % m)
 			f.close()
-			modutils_name = '%s/etc/modutils/%s' % (dvar, basename)
-			modutils_target = '../modules-load.d/%s.conf' % (basename)
-			os.symlink(modutils_target, modutils_name)
 			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
 			if not postinst:
 				bb.fatal("pkg_postinst_%s not defined" % pkg)
@@ -443,7 +439,7 @@ python populate_packages_prepend () {
 			f.close()
 
 		files = d.getVar('FILES_%s' % pkg, True)
-		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename, basename)
+		files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
 		d.setVar('FILES_%s' % pkg, files)
 
 		if vals.has_key("description"):
@@ -469,11 +465,11 @@ python populate_packages_prepend () {
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
 
-	# If modutils and modprobe.d are empty at this point, remove them to
+	# If modules-load.d and modprobe.d are empty at this point, remove them to
 	# avoid warnings. removedirs only raises an OSError if an empty
 	# directory cannot be removed.
 	dvar = d.getVar('PKGD', True)
-	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
+	for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
 		if len(os.listdir(dir)) == 0:
 			os.rmdir(dir)
 
-- 
1.7.8.5



