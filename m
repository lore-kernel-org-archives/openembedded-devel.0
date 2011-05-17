Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QME4S-0003Ro-5J for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 08:47:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QME1g-0000Lb-Qt for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 08:45:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 08:45:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 08:45:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 17 May 2011 08:40:20 +0200
Message-ID: <iqt58k$59d$2@dough.gmane.org>
References: <1305578605-17041-1-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305578605-17041-1-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH v1] freerdp: update to 2011-05-16 snapshot
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
X-List-Received-Date: Tue, 17 May 2011 06:47:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-05-11 22:43, Otavio Salvador wrote:
> This version includes major improvements since last version
> packages. It also had the plugins packages redone so they can be
> choosen depending on the environment needs.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

This one doesn't have the colourbug you mentioned earlier? And it
doesn't need xprop anymore, right?


> ---
>  meta-oe/recipes-support/freerdp/freerdp.inc    |   40 +++++++++++++++++++----
>  meta-oe/recipes-support/freerdp/freerdp_git.bb |    4 +-
>  2 files changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
> index f8402c7..71dab97 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp.inc
> +++ b/meta-oe/recipes-support/freerdp/freerdp.inc
> @@ -3,22 +3,48 @@
>  
>  DESCRIPTION = "FreeRDP RDP client"
>  HOMEPAGE = "http://freerdp.sourceforge.net"
> -DEPENDS = "virtual/libx11 openssl libxcursor cups alsa-lib"
> +DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio pcsc-lite"
>  SECTION = "x11/network"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -INC_PR = "r0"
> +INC_PR = "r1"
>  
>  inherit pkgconfig autotools
>  
> -do_configure_prepend() {
> -	# workaround gcc linking bug
> -	find ${S} -name 'Makefile.am' | xargs -n 1 sed 's,-pthread,-lpthread -D_REENTRANT,g' -i
> -}
> +EXTRA_OECONF += "--with-smartcard --with-xvideo"
>  
>  do_install_append() {
>  	rm ${D}${libdir}/freerdp/*.a ${D}${libdir}/freerdp/*.la
>  }
>  
> -RDEPENDS_${PN} += "xprop"
> +PACKAGES =+ "libfreerdp"
> +
> +LEAD_SONAME = "libfreerdp.so"
> +FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
> +
> +PACKAGES_DYNAMIC = "libfreerdp-plugin-*"
> +
> +python populate_packages_prepend () {
> +        freerdp_root = bb.data.expand('${libdir}/freerdp', d)
> +
> +        do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
> +                output_pattern='libfreerdp-plugin-%s',
> +                description='FreeRDP plugin %s',
> +                prepend=True, extra_depends='libfreerdp-plugin-audin')
> +
> +        do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
> +                output_pattern='libfreerdp-plugin-%s',
> +                description='FreeRDP plugin %s',
> +                prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
> +
> +        do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
> +                output_pattern='libfreerdp-plugin-%s',
> +                description='FreeRDP plugin %s',
> +                prepend=True, extra_depends='libfreerdp-plugin-tsmf')
> +
> +        do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
> +                output_pattern='libfreerdp-plugin-%s',
> +                description='FreeRDP plugin %s',
> +                prepend=True, extra_depends='')
> +}
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> index fa4ba9a..e135902 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> @@ -7,9 +7,9 @@ inherit gitpkgv
>  
>  PV = "gitr${SRCPV}"
>  PKGV = "${GITPKGVTAG}"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
> -SRCREV = "7bbde4fb3bc3a781364d0a626c49bc165cc507fd"
> +SRCREV = "f5aef3be8fac9a02b0c7bbb5424831a7b285e7bb"
>  SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;protocol=git"
>  
>  S = "${WORKDIR}/git"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN0hhUMkyGM64RGpERAldWAJ4klXnI/UCCepTMCPEGHuUiRu/4QgCgsg4q
Im7pc9nkpsoXCtHT3lzsIRs=
=GtPm
-----END PGP SIGNATURE-----



