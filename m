Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HRQxr-0001MM-4H
	for openembedded-devel@openembedded.org; Wed, 14 Mar 2007 11:44:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2EAiEPI032025
	for <openembedded-devel@openembedded.org>; Wed, 14 Mar 2007 10:44:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31626-03 for <openembedded-devel@openembedded.org>;
	Wed, 14 Mar 2007 10:44:12 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2EAi9TB032012
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 14 Mar 2007 10:44:09 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Wed, 14 Mar 2007 10:44:08 +0000
Message-Id: <1173869049.5834.16.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: RFC: Kernel image packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2007 10:44:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

The kernel packaging has given various people concern for a while. The
problem is some devices don't want a kernel binary installed into the
root filesystem. We can do this at the moment but the kernel doesn't end
up packaged and we would like those packages to be available even if
they're not installed by default on a given device.

I'm proposing the patch below. This basically adds a
kernel-${KERNEL_VERSION} package to the mix. This package is in the
Dependencies of all kernel modules instead of
kernel-image-${KERNEL_VERSION}. As standard, kernel-${KERNEL_VERSION}
also RDEPENDS on the kernel-image.

For a device that doesn't want the kernel in the rootfs, it would simply
set:

RDEPENDS_kernel-base = ""

in the appropriate kernel file. Perhaps the definition below should be
a ?= and the above could then be set in the machine.conf file.

Does anyone see a nicer way to handle this or have an alternative?

If nobody objects, this will probably get committed at the weekend.

Cheers,

Richard

# 
# old_revision [50c9ee81517d5a1c32a7a7afe7a00793aabceb33]
# 
# patch "classes/kernel.bbclass"
#  from [237ec9e436415eab3772495898c0921de38b3c07]
#    to [17662f6347d7aa822bbb7a5455926a96c9149132]
# 
============================================================
--- classes/kernel.bbclass	237ec9e436415eab3772495898c0921de38b3c07
+++ classes/kernel.bbclass	17662f6347d7aa822bbb7a5455926a96c9149132
@@ -169,13 +169,18 @@ EXPORT_FUNCTIONS do_compile do_install d
 
 EXPORT_FUNCTIONS do_compile do_install do_stage do_configure
 
-PACKAGES = "kernel kernel-image kernel-dev"
+# kernel-base becomes kernel-${KERNEL_VERSION}
+# kernel-image becomes kernel-image-${KERNEL_VERISON}
+PACKAGES = "kernel kernel-base kernel-image kernel-dev"
 FILES = ""
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
 FILES_kernel-dev = "/boot/System.map* /boot/config*"
-RDEPENDS_kernel = "kernel-image-${KERNEL_VERSION}"
+RDEPENDS_kernel = "kernel-${KERNEL_VERSION}"
+RDEPENDS_kernel-base = "kernel-image-${KERNEL_VERSION}"
 PKG_kernel-image = "kernel-image-${KERNEL_VERSION}"
+PKG_kernel-base = "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
+ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
 
 pkg_postinst_kernel-image () {
@@ -362,13 +367,13 @@ python populate_packages_prepend () {
 
 	postinst = bb.data.getVar('pkg_postinst_modules', d, 1)
 	postrm = bb.data.getVar('pkg_postrm_modules', d, 1)
-	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-image-%s' % bb.data.getVar("KERNEL_VERSION", d, 1))
+	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % bb.data.getVar("KERNEL_VERSION", d, 1))
 
 	import re, os
 	metapkg = "kernel-modules"
 	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
 	bb.data.setVar('FILES_' + metapkg, "", d)
-	blacklist = [ 'kernel-dev', 'kernel-image' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))




