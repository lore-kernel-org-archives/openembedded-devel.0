Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qd6yZ-0008P7-K5 for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 22:39:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qd6ut-0001Od-W8 for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 22:35:51 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 22:35:51 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 22:35:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 02 Jul 2011 22:35:40 +0200
Message-ID: <iunves$mg5$1@dough.gmane.org>
References: <1309564608-32683-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1309564608-32683-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH 1/2] kernel.bbclass: Sync with oe-core
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
X-List-Received-Date: Sat, 02 Jul 2011 20:39:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This one is already in in a different form :)

Op 02-07-11 01:56, Khem Raj schreef:
> This syncs the class with oe-core after 3.0 changes
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- 
> meta-oe/classes/kernel.bbclass |   22 ++++++---------------- 1 files
> changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/meta-oe/classes/kernel.bbclass
> b/meta-oe/classes/kernel.bbclass index 2d051f4..9043b4e 100644 ---
> a/meta-oe/classes/kernel.bbclass +++
> b/meta-oe/classes/kernel.bbclass @@ -1,7 +1,7 @@ inherit
> linux-kernel-base module_strip
> 
> PROVIDES += "virtual/kernel" -DEPENDS += "virtual/${TARGET_PREFIX}gcc
> virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')}
> virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules" 
> +DEPENDS += "virtual/${TARGET_PREFIX}gcc
> virtual/${TARGET_PREFIX}depmod
> virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> 
> # we include gcc above, we dont need virtual/libc 
> INHIBIT_DEFAULT_DEPS = "1" @@ -65,7 +65,6 @@ KERNEL_IMAGEDEST =
> "boot" export CMDLINE_CONSOLE =
> "console=${@bb.data.getVar("KERNEL_CONSOLE",d,1) or "ttyS0"}"
> 
> KERNEL_VERSION = "${@get_kernelversion('${B}')}" 
> -KERNEL_MAJOR_VERSION =
> "${@get_kernelmajorversion('${KERNEL_VERSION}')}"
> 
> KERNEL_LOCALVERSION ?= ""
> 
> @@ -85,9 +84,6 @@ KERNEL_ALT_IMAGETYPE ??= "" kernel_do_compile() { 
> unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE oe_runmake
> include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}" -	if [
> "${KERNEL_MAJOR_VERSION}" != "2.6" ]; then -		oe_runmake dep
> CC="${KERNEL_CC}" LD="${KERNEL_LD}" -	fi oe_runmake
> ${KERNEL_IMAGETYPE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}"
> LD="${KERNEL_LD}" }
> 
> @@ -123,9 +119,7 @@ kernel_do_install() { install -m 0644 vmlinux
> ${D}/boot/vmlinux-${KERNEL_VERSION} [ -e Module.symvers ] && install
> -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION} 
> install -d ${D}/etc/modutils -	if [ "${KERNEL_MAJOR_VERSION}" = "2.6"
> ]; then -		install -d ${D}/etc/modprobe.d -	fi +	install -d
> ${D}/etc/modprobe.d
> 
> # # Support for external module building - create a minimal copy of
> the @@ -267,7 +261,7 @@ if [ ! -e "$D/lib/modules/${KERNEL_VERSION}"
> ]; then mkdir -p $D/lib/modules/${KERNEL_VERSION} fi if [ -n "$D" ];
> then -	${HOST_PREFIX}depmod-${KERNEL_MAJOR_VERSION} -A -b $D -F
> ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION} 
> +	${HOST_PREFIX}depmod -A -b $D -F
> ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION} 
> else depmod -a fi @@ -275,7 +269,7 @@ fi
> 
> pkg_postinst_modules () { if [ -n "$D" ]; then -
> ${HOST_PREFIX}depmod-${KERNEL_MAJOR_VERSION} -A -b $D -F
> ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION} 
> +	${HOST_PREFIX}depmod -A -b $D -F
> ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION} 
> else depmod -a update-modules || true @@ -348,9 +342,8 @@ python
> populate_packages_prepend () { kernelver_stripped = m.group(1) path =
> bb.data.getVar("PATH", d, 1) host_prefix =
> bb.data.getVar("HOST_PREFIX", d, 1) or "" -		major_version =
> bb.data.getVar('KERNEL_MAJOR_VERSION', d, 1)
> 
> -		cmd = "PATH=\"%s\" %sdepmod-%s -n -a -r -b %s -F
> %s/boot/System.map-%s %s" % (path, host_prefix, major_version, dvar,
> dvar, kernelver, kernelver_stripped) +		cmd = "PATH=\"%s\" %sdepmod
> -n -a -r -b %s -F %s/boot/System.map-%s %s" % (path, host_prefix,
> dvar, dvar, kernelver, kernelver_stripped) f = os.popen(cmd, 'r')
> 
> deps = {} @@ -427,10 +420,7 @@ python populate_packages_prepend () { 
> # Write out any modconf fragment modconf =
> bb.data.getVar('module_conf_%s' % basename, d, 1) if modconf: -			if
> bb.data.getVar("KERNEL_MAJOR_VERSION", d, 1) == "2.6": -				name =
> '%s/etc/modprobe.d/%s.conf' % (dvar, basename) -			else: -				name =
> '%s/etc/modutils/%s.conf' % (dvar, basename) +			name =
> '%s/etc/modprobe.d/%s.conf' % (dvar, basename) f = open(name, 'w') 
> f.write("%s\n" % modconf) f.close()

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOD4EcMkyGM64RGpERAuv3AKCfkCXcHOT/ywgr88l5A9liAqsUowCfUEpA
Vfo6alYXSY6njroProtZHnc=
=0RMq
-----END PGP SIGNATURE-----



