Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9071B6AC35
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 13:42:27 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YJMhI-0006Yh-3u for openembedded-devel@lists.openembedded.org;
	Thu, 05 Feb 2015 14:42:20 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 14:42:20 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 14:42:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 05 Feb 2015 14:42:12 +0100
Message-ID: <mavrvk$83v$1@ger.gmane.org>
References: <1423075243-24859-1-git-send-email-danismostlikely@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
In-Reply-To: <1423075243-24859-1-git-send-email-danismostlikely@gmail.com>
Subject: Re: [meta-initramfs][PATCH 5/5] dracut: recipe cleanup
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
X-List-Received-Date: Thu, 05 Feb 2015 13:42:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dan McGregor schreef op 04-02-15 om 19:40:
> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> Split out bash-completion data Update RDEPENDS: getopt is
> util-linux-getopt now Use distro_features_check to require systemd 
> Recommend busybox
> 
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca> --- 
> .../recipes-devtools/dracut/dracut_git.bb          | 25
> ++++++++++++++++------ 1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb index
> ea55a4d..8ef0749 100644 ---
> a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb +++
> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb @@ -4,6 +4,8 @@
> DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut
> (the t LICENSE = "GPLv2" LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> 
> +PACKAGES =+ "${PN}-bash-completion"

PACKAGES is runtime, so move that below do_install


> + PE = "1" PV = "038"
> 
> @@ -13,8 +15,10 @@ SRC_URI =
> "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
> 
> S = "${WORKDIR}/git"
> 
> -do_configure() { -    ./configure --prefix=${prefix} \ +inherit
> distro_features_check +REQUIRED_DISTRO_FEATURES = "systemd" + 
> +EXTRA_OECONF = "--prefix=${prefix} \ --libdir=${libdir} \ 
> --datadir=${datadir} \ --sysconfdir=${sysconfdir} \ @@ -23,20 +27,29 @@
> do_configure() { --bindir=${bindir} \ --includedir=${includedir} \ 
> --localstatedir=${localstatedir} \ +
> --systemdsystemunitdir=${systemd_unitdir}/system" + +do_configure() { +
> ./configure ${EXTRA_OECONF} }
> 
> do_install() { oe_runmake install DESTDIR=${D} }
> 
> -FILES_${PN} += "${datadir}/bash-completion \ -
> ${libdir}/kernel \ +FILES_${PN}-bash-completion =
> "${datadir}/bash-completion" + +FILES_${PN} += " ${libdir}/kernel \ +
> ${systemd_unitdir} \ " +CONFFILES_${PN} += "${sysconfdir}/dracut.conf" + 
> +RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid
> util-linux-getopt util-linux bash ldd" +RDEPENDS_${PN}-bash-completion =
> "bash-completion"
> 
> -# 'getopt' is in the util-linux main package -RDEPENDS_${PN} = "systemd
> findutils cpio util-linux-blkid util-linux bash ldd" # This could be
> optimized a bit, but let's avoid non-booting systems :) RRECOMMENDS_${PN}
> = " \ kernel-modules \ +                     busybox \ coreutils \ "
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFU03M0MkyGM64RGpERAsSgAJ4sxWUVqtCD2DKYpzAca3LK73vuXgCgnww/
s7RbVFpxvlWMqI2+kurk6E8=
=GmZH
-----END PGP SIGNATURE-----


