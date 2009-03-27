Received: from [206.83.81.187] (helo=smtp1.irobot.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tharvey@irobot.com>) id 1LnJG9-0005y4-O9
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 22:06:37 +0100
Received: from fever2.wardrobe.irobot.com ([192.168.163.187]) by
	smtp1.irobot.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 27 Mar 2009 17:04:46 -0400
Received: from [192.168.69.73] ([192.168.69.73]) by fever2.wardrobe.irobot.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 27 Mar 2009 17:04:46 -0400
Message-ID: <49CD3F6D.1080106@irobot.com>
Date: Fri, 27 Mar 2009 14:04:45 -0700
From: Tim Harvey <tharvey@irobot.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 27 Mar 2009 21:04:46.0231 (UTC)
	FILETIME=[A87BEA70:01C9AF1F]
Subject: [PATCH/RFC] kernel.bbclass: add kernel-headers package
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
X-List-Received-Date: Fri, 27 Mar 2009 21:06:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Add a kernel-headers package suitable for building kernel modules 
against and add it to the target sdk

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 4c1dbda..efdaf96 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -56,6 +56,9 @@ KERNEL_LD = "${LD}${KERNEL_LDSUFFIX} 
${HOST_LD_KERNEL_ARCH}"
 KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
 KERNEL_IMAGEDEST = "boot"
 
+# Where kernel headers get installed
+KERNEL_HEADERS_DEST ?= 
"/usr/src/linux-headers-${KERNEL_VERSION}-${MACHINE}"
+
 #
 # configuration
 #
@@ -163,6 +166,19 @@ kernel_do_install() {
        else
                oenote "no modules to install"
        fi
+       oenote "installing kernel headers"
+       install -d ${D}${KERNEL_HEADERS_DIR}/${KERNEL_HEADERS_DEST}
+       find . -path './include/*' -prune -o -path './.pc/*' -prune \
+               -o -path './scripts/*' -prune -o -type f \
+               \( -name 'Makefile*' -o -name 'Kconfig*' -o -name 
'Kbuild*' -o \
+               -name '*.sh' -o -name '*.pl' -o -name '*.lds' \) \
+               -print | cpio -pd --preserve-modification-time 
${D}${KERNEL_HEADERS_DIR}/${KERNEL_HEADERS_DEST}
+       cp -a drivers/media/dvb/dvb-core/*.h 
${D}${KERNEL_HEADERS_DIR}/${KERNEL_HEADERS_DEST}/drivers/media/dvb/dvb-core
+       cp -a drivers/media/video/*.h 
${D}${KERNEL_HEADERS_DIR}/${KERNEL_HEADERS_DEST}/drivers/media/video
+       cp -a drivers/media/dvb/dvb-core/*.h 
${D}${KERNEL_HEADERS_DIR}/${KERNEL_HEADERS_DEST}/drivers/media/dvb/dvb-core
+       cp -a drivers/media/dvb/frontends/*.h 
${D}${KERNEL_HEADERS_DIR}/${KERNEL_HEADERS_DEST}/drivers/media/dvb/frontends
+       cp -a scripts include 
${D}${KERNEL_HEADERS_DIR}/${KERNEL_HEADERS_DEST}/
+       install -m 0644 Module.symvers 
${D}${KERNEL_HEADERS_DIR}/${KERNEL_HEADERS_DEST}/
        
        install -d ${D}/${KERNEL_IMAGEDEST}
        install -d ${D}/boot
@@ -217,11 +233,12 @@ EXPORT_FUNCTIONS do_compile do_install do_stage 
do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux"
+PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux 
kernel-headers"
 FILES = ""
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
 FILES_kernel-dev = "/boot/System.map* /boot/config*"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
+FILES_kernel-headers = "${KERNEL_HEADERS_DEST}/*"
 RDEPENDS_kernel = "kernel-base"
 RRECOMMENDS_kernel-module-hostap-cs += 
'${@base_version_less_or_equal("KERNEL_VERSION", "2.6.17", "", 
"apm-wifi-suspendfix", d)}'
 RRECOMMENDS_kernel-module-orinoco-cs += 
'${@base_version_less_or_equal("KERNEL_VERSION", "2.6.17", "", 
"apm-wifi-suspendfix", d)}'
@@ -446,7 +463,7 @@ python populate_packages_prepend () {
        metapkg = "kernel-modules"
        bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
        bb.data.setVar('FILES_' + metapkg, "", d)
-       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 
'kernel-vmlinux' ]
+       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 
'kernel-vmlinux', 'kernel-headers' ]
        for l in module_deps.values():
                for i in l:
                        pkg = module_pattern % 
legitimize_package_name(re.match(module_regex, 
os.path.basename(i)).group(1))
diff --git a/recipes/tasks/task-sdk-bare.bb b/recipes/tasks/task-sdk-bare.bb
index 85d3626..7c837bf 100644
--- a/recipes/tasks/task-sdk-bare.bb
+++ b/recipes/tasks/task-sdk-bare.bb
@@ -30,4 +30,5 @@ RDEPENDS_${PN} = "\
     libgcc \
     libstdc++ \
     libstdc++-dev \
+    kernel-headers \
 "



