Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 78B7F65CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 06:47:38 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ZH4rO-0002pc-G0 for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2015 08:47:34 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 08:47:34 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 08:47:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 20 Jul 2015 08:47:22 +0200
Message-ID: <moi5hq$ahj$1@ger.gmane.org>
References: <1437119410-3462-1-git-send-email-kai.kang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
In-Reply-To: <1437119410-3462-1-git-send-email-kai.kang@windriver.com>
Subject: Re: [meta-oe][PATCH] dracut: upgrade from 038 to 043
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
X-List-Received-Date: Mon, 20 Jul 2015 06:47:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Kai Kang schreef op 17-07-15 om 09:50:
> Upgrade dracut from 038 to 043. Update SRC_URI by replacing git with tar 
> ball.

Why? That makes it really hard to pull in post-release fixes :(


> And update bb file name at same time.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com> --- 
> .../recipes-devtools/dracut/dracut_043.bb          | 53
> +++++++++++++++++++++ .../recipes-devtools/dracut/dracut_git.bb
> | 55 ---------------------- 2 files changed, 53 insertions(+), 55
> deletions(-) create mode 100644
> meta-initramfs/recipes-devtools/dracut/dracut_043.bb delete mode 100644
> meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> 
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_043.bb
> b/meta-initramfs/recipes-devtools/dracut/dracut_043.bb new file mode
> 100644 index 0000000..22c6bae --- /dev/null +++
> b/meta-initramfs/recipes-devtools/dracut/dracut_043.bb @@ -0,0 +1,53 @@ 
> +SUMMARY = "Initramfs generator using udev" +DESCRIPTION = "Dracut is an
> event driven initramfs infrastructure. dracut (the tool) is used to
> create an initramfs image by copying tools and files from an installed
> system and combining it with the dracut framework, usually found in
> /usr/lib/dracut/modules.d." + +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" + +PE = "1" + 
> +SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/boot/dracut/dracut-043.tar.xz" + 
> +SRC_URI[md5sum] = "85de75ddf00962e7bb0ae387f05794e5" +SRC_URI[sha256sum]
> = "1484b558ed20330125aa04dcccab84da15c5689e19068285aa011f7177889cd1" + 
> +inherit distro_features_check +REQUIRED_DISTRO_FEATURES = "systemd" + 
> +EXTRA_OECONF = "--prefix=${prefix} \ +                --libdir=${libdir}
> \ +                --datadir=${datadir} \ +
> --sysconfdir=${sysconfdir} \ +                --sbindir=${sbindir} \ +
> --disable-documentation \ +                --bindir=${bindir} \ +
> --includedir=${includedir} \ +
> --localstatedir=${localstatedir} \ +
> --systemdsystemunitdir=${systemd_unitdir}/system" + +do_configure() { +
> ./configure ${EXTRA_OECONF} +} + +do_install() { +    oe_runmake install
> DESTDIR=${D} +} + +PACKAGES =+ "${PN}-bash-completion" + 
> +FILES_${PN}-bash-completion = "${datadir}/bash-completion" + 
> +FILES_${PN} += " ${libdir}/kernel \ +                ${systemd_unitdir}
> \ +               " +CONFFILES_${PN} += "${sysconfdir}/dracut.conf" + 
> +RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid
> util-linux-getopt bash ldd" +RDEPENDS_${PN}-bash-completion =
> "bash-completion" + +# This could be optimized a bit, but let's avoid
> non-booting systems :) +RRECOMMENDS_${PN} = " \ +
> kernel-modules \ +                     busybox \ +
> coreutils \ +                    " diff --git
> a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb deleted file mode
> 100644 index 77c137c..0000000 ---
> a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb +++ /dev/null @@
> -1,55 +0,0 @@ -SUMMARY = "Initramfs generator using udev" -DESCRIPTION =
> "Dracut is an event driven initramfs infrastructure. dracut (the tool) is
> used to create an initramfs image by copying tools and files from an
> installed system and combining it with the dracut framework, usually
> found in /usr/lib/dracut/modules.d." - -LICENSE = "GPLv2" 
> -LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" - -PE = "1" -PV =
> "038" - -# v038 tag -SRCREV = "267a109a81715c8957f14659593deb7b6255d40e" 
> -SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git" - -S =
> "${WORKDIR}/git" - -inherit distro_features_check 
> -REQUIRED_DISTRO_FEATURES = "systemd" - -EXTRA_OECONF =
> "--prefix=${prefix} \ -                --libdir=${libdir} \ -
> --datadir=${datadir} \ -                --sysconfdir=${sysconfdir} \ -
> --sbindir=${sbindir} \ -                --disable-documentation \ -
> --bindir=${bindir} \ -                --includedir=${includedir} \ -
> --localstatedir=${localstatedir} \ -
> --systemdsystemunitdir=${systemd_unitdir}/system" - -do_configure() { -
> ./configure ${EXTRA_OECONF} -} - -do_install() { -    oe_runmake install
> DESTDIR=${D} -} - -PACKAGES =+ "${PN}-bash-completion" - 
> -FILES_${PN}-bash-completion = "${datadir}/bash-completion" - 
> -FILES_${PN} += " ${libdir}/kernel \ -                ${systemd_unitdir}
> \ -               " -CONFFILES_${PN} += "${sysconfdir}/dracut.conf" - 
> -RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid
> util-linux-getopt bash ldd" -RDEPENDS_${PN}-bash-completion =
> "bash-completion" - -# This could be optimized a bit, but let's avoid
> non-booting systems :) -RRECOMMENDS_${PN} = " \ -
> kernel-modules \ -                     busybox \ -
> coreutils \ -                    "
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVrJl6MkyGM64RGpERAjOSAJ0eXwXMBI1/z6Gy3xLv/iGi5oMZXgCdGeGG
VmSTSLZO3ncjQ0jfrdIFa98=
=hnRL
-----END PGP SIGNATURE-----


