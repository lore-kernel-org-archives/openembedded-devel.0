Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PceSM-0006Y8-KY for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 14:40:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PceRp-00071S-9s for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 14:39:41 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 14:39:41 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 14:39:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 11 Jan 2011 14:39:29 +0100
Message-ID: <ighmih$lbd$1@dough.gmane.org>
References: <ighiieMAN_POSIXLY_CORRECT=1@dough.gmane.org>
	<1294774001-29322-1-git-send-email-sledz@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294774001-29322-1-git-send-email-sledz@dresearch.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH v2] alsa-lib: fix packaging error
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
X-List-Received-Date: Tue, 11 Jan 2011 13:40:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-01-11 20:26, Steffen Sledz wrote:
> * symlink libasound.so -> libasound.so.2.0.0 in /usr/lib was missing in
>   dev package
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  recipes/alsa/alsa-lib_1.0.20.bb |    2 +-
>  recipes/alsa/alsa-lib_1.0.23.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/alsa/alsa-lib_1.0.20.bb b/recipes/alsa/alsa-lib_1.0.20.bb
> index de522c7..fc508ec 100644
> --- a/recipes/alsa/alsa-lib_1.0.20.bb
> +++ b/recipes/alsa/alsa-lib_1.0.20.bb
> @@ -34,7 +34,7 @@ FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
>  FILES_libasound = "${libdir}/libasound.so.*"
>  FILES_alsa-server = "${bindir}/*"
>  FILES_alsa-conf = "${datadir}/alsa/"
> -FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
> +FILES_alsa-dev += "${libdir}/libasound.so ${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
>  FILES_alsa-conf-base = "\
>  ${datadir}/alsa/alsa.conf \
>  ${datadir}/alsa/cards/aliases.conf \
> diff --git a/recipes/alsa/alsa-lib_1.0.23.bb b/recipes/alsa/alsa-lib_1.0.23.bb
> index 0f9b14c..0085047 100644
> --- a/recipes/alsa/alsa-lib_1.0.23.bb
> +++ b/recipes/alsa/alsa-lib_1.0.23.bb
> @@ -36,7 +36,7 @@ FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
>  FILES_libasound = "${libdir}/libasound.so.*"
>  FILES_alsa-server = "${bindir}/*"
>  FILES_alsa-conf = "${datadir}/alsa/"
> -FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
> +FILES_alsa-dev += "${libdir}/libasound.so ${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
>  FILES_alsa-conf-base = "\
>  ${datadir}/alsa/alsa.conf \
>  ${datadir}/alsa/cards/aliases.conf \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNLF2RMkyGM64RGpERAv8DAJ9ipAyHrIazFiPN/+GdTRzaIWYMSgCeIUFx
Q0W7A2UtNVuNrVFkUwdht9g=
=1noC
-----END PGP SIGNATURE-----



