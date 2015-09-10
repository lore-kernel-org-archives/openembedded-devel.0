Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id D3F136E26B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:36:34 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ZZzDU-0005eO-Af for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2015 12:36:32 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:36:32 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:36:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Sep 2015 12:36:12 +0200
Message-ID: <msrmes$se8$1@ger.gmane.org>
References: <cover.1441869690.git.wenzong.fan@windriver.com>
	<d3f90d1e80c9db274e5d021e5e7973e6fb22a7e6.1441869690.git.wenzong.fan@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
In-Reply-To: <d3f90d1e80c9db274e5d021e5e7973e6fb22a7e6.1441869690.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 1/2][meta-initramfs] dracut: RDEPEND on systemd optionally
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
X-List-Received-Date: Thu, 10 Sep 2015 10:36:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 10-09-15 om 09:26 schreef wenzong.fan@windriver.com:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> Use PACKAGECONFIG to depend on systemd optionally.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com> Signed-off-by:
> Wenzong Fan <wenzong.fan@windriver.com> --- 
> meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 11 ++++++----- 1
> file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb index
> b7d88fd..3a72251 100644 ---
> a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb +++
> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb @@ -13,9 +13,6 @@
> SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
> 
> S = "${WORKDIR}/git"
> 
> -inherit distro_features_check -REQUIRED_DISTRO_FEATURES = "systemd" - 
> EXTRA_OECONF = "--prefix=${prefix} \ --libdir=${libdir} \ 
> --datadir=${datadir} \ @@ -25,7 +22,7 @@ EXTRA_OECONF =
> "--prefix=${prefix} \ --bindir=${bindir} \ --includedir=${includedir} \ 
> --localstatedir=${localstatedir} \ -
> --systemdsystemunitdir=${systemd_unitdir}/system" +               "
> 
> do_configure() { ./configure ${EXTRA_OECONF} @@ -44,9 +41,13 @@
> FILES_${PN} += " ${libdir}/kernel \ " CONFFILES_${PN} +=
> "${sysconfdir}/dracut.conf"
> 
> -RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid
> util-linux-getopt bash ldd" +RDEPENDS_${PN} = "findutils cpio
> util-linux-blkid util-linux-getopt bash ldd" 
> RDEPENDS_${PN}-bash-completion = "bash-completion"
> 
> +# RDEPEND on systemd optionally +PACKAGECONFIG ??=
> "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}" 
> +PACKAGECONFIG[systemd] =
> "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,,systemd"

Since packageconfig deals with do_configure, it needs to go next to
EXTRA_OECONF, not next to R*

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFV8V0cMkyGM64RGpERAioKAJ0eFaToEpbhH9mu4J8r02DP9KM1NgCgtHTx
ESYXBkXqAe55sypT5UjiyiE=
=Ueoe
-----END PGP SIGNATURE-----


