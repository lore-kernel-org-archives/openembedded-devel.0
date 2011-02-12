Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PoETP-0003kL-I8 for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 13:21:11 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PoESK-0001Dd-MH for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 13:20:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 13:20:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 13:20:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 12 Feb 2011 13:16:56 +0100
Message-ID: <ij5tno$9u6$2@dough.gmane.org>
References: <1297509134-31435-1-git-send-email-Martin.Jansa@gmail.com>
	<1297509134-31435-2-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1297509134-31435-2-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/2] eject: use u-a for /usr/bin/volname
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
X-List-Received-Date: Sat, 12 Feb 2011 12:21:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-02-11 12:12, Martin Jansa wrote:
> * resolves conflict with latest busybox
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  recipes/eject/eject_2.1.5.bb |   16 +++++++++++++---
>  1 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/eject/eject_2.1.5.bb b/recipes/eject/eject_2.1.5.bb
> index 7c46432..06328dc 100644
> --- a/recipes/eject/eject_2.1.5.bb
> +++ b/recipes/eject/eject_2.1.5.bb
> @@ -2,12 +2,22 @@ DESCRIPTION = "Eject allows removable media (typically a CD-ROM, floppy disk, ta
>  HOMEPAGE = "http://eject.sourceforge.net/"
>  LICENSE = "GPLv2"
>  
> -inherit autotools gettext
> +PR = "r1"
>  
> -SRC_URI = "http://sources.openembedded.org/eject-2.1.5.tar.gz"
> +inherit autotools gettext update-alternatives
>  
> -S = "${WORKDIR}/${PN}"
> +ALTERNATIVE_NAME = "volname"
> +ALTERNATIVE_LINK = "${bindir}/volname"
> +ALTERNATIVE_PATH = "${bindir}/volname.${PN}"
> +ALTERNATIVE_PRIORITY = "100"
>  
> +SRC_URI = "http://sources.openembedded.org/${P}.tar.gz"
>  
>  SRC_URI[md5sum] = "b96a6d4263122f1711db12701d79f738"
>  SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
> +
> +do_install_append() {
> +  mv ${D}/${bindir}/volname ${D}/${bindir}/volname.${PN}
> +}
> +
> +S = "${WORKDIR}/${PN}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNVno4MkyGM64RGpERAshlAJ4oAJzSTfXQVAqil/IFhAqz6zbomQCgsYA2
F1wpuukUUqbH7AfKomMU/uE=
=iZKg
-----END PGP SIGNATURE-----



