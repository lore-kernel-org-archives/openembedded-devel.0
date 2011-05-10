Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJleM-0007XM-2f for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 14:02:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJlbg-0000za-HB for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 14:00:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 14:00:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 14:00:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 May 2011 13:58:44 +0200
Message-ID: <iqb99k$uh2$3@dough.gmane.org>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
	<3ce8046fc75c61d0eed6b58152acee0c665383e7.1305027503.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <3ce8046fc75c61d0eed6b58152acee0c665383e7.1305027503.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 1/9] udev: drop udev-compat for zaurus devices
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
X-List-Received-Date: Tue, 10 May 2011 12:02:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

We should consider using 168 in meta-oe, it's a lot faster than 168. 169
breaks crosscompilation, I'm talking to Kay to get that fixed before the
release.

On 10-05-11 13:39, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-core/udev/udev_165.bb |   26 --------------------------
>  1 files changed, 0 insertions(+), 26 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/udev/udev_165.bb b/meta-oe/recipes-core/udev/udev_165.bb
> index 2c4171d..e8e6ddd 100644
> --- a/meta-oe/recipes-core/udev/udev_165.bb
> +++ b/meta-oe/recipes-core/udev/udev_165.bb
> @@ -93,32 +93,6 @@ FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
>  FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
>  FILES_${PN}-dbg += "/lib/udev/.debug"
>  
> -RPROVIDES_udev_append = " udev-compat-wrapper"
> -RDEPENDS_udev_append_spitz = " udev-compat"
> -do_unpack_append_spitz() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_akita = " udev-compat"
> -do_unpack_append_akita() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_c7x0 = " udev-compat"
> -do_unpack_append_c7x0() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_poodle = " udev-compat"
> -do_unpack_append_poodle() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -
> -# Modify init script on platforms that need to boot old kernels:
> -do_apply_compat_wrapper() {
> -	cd ${WORKDIR}
> -	sed -i "s:/sbin/udevd:\$UDEVD:g;s:/sbin/udevadm:\$UDEVADM:g" init
> -	patch <udev-compat-wrapper-patch
> -	cd -
> -}
> -
>  do_install () {
>  	install -d ${D}${usrsbindir} \
>  		   ${D}${sbindir}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNySh0MkyGM64RGpERApb8AJ9FdRGGPOLFm0wHC17RJQ0+ghlH/gCfSXzo
joJcRTKPRdHzyuMMt6k3rzY=
=TBuV
-----END PGP SIGNATURE-----



