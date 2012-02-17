Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RyKLV-0004ud-5r
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 10:43:17 +0100
Received: by eekd41 with SMTP id d41so1122368eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xxe07i2Aoiynpw3WEYUyd4XrJzdv2eqteMFQUHA4kNE=;
	b=wU8CL3EAGfn4Ym8cBEWvY2JTqy0sqwZSlgQxANXgQbALvborm+glM5twR7BTkcWzbp
	NKqUguRhHnRNRx+S7ENvxNysX/pOKMc2r/XLKX06YacK0U50H8Sj2Kk2Bkv9gDVbmd9X
	I5bD06cNz2+tPRAsZeYRHF1D6ybZjN7lAgknc=
Received: by 10.14.100.134 with SMTP id z6mr3439401eef.124.1329471303177;
	Fri, 17 Feb 2012 01:35:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm7173639eef.10.2012.02.17.01.35.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 01:35:01 -0800 (PST)
Date: Fri, 17 Feb 2012 10:34:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120217093459.GG5822@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-6-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1329357796-27398-6-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][v2] 05/22] automatically install all *.service and *.socket supplied in recipe's SRC_URI
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
X-List-Received-Date: Fri, 17 Feb 2012 09:43:17 -0000
X-Groupsio-MsgNum: 37203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline

--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 03:02:59AM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>


After reading today's gentoo systemd news:
We have decided to move our systemd installation into /usr prefix.
After the upgrade, the main systemd executable will be installed
as /usr/bin/systemd and the unit files will be installed
to /usr/lib/systemd; however, systemd will still look for unit files
in the /lib location.

I think we should abstract
${base_libdir}/systemd
to some variable inside systemd.bbclass, so if we ever decide to move it
to /usr/lib too, then not only automatically installed *.service files
=66rom SRC_URI are installalled to right directory.

Cheers,

> ---
>  meta-oe/classes/systemd.bbclass |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bb=
class
> index 0ea03ee..b2cf775 100644
> --- a/meta-oe/classes/systemd.bbclass
> +++ b/meta-oe/classes/systemd.bbclass
> @@ -78,6 +78,17 @@ python __anonymous() {
>      systemd_after_parse(d)
>  }
> =20
> +# automatically install all *.service and *.socket supplied in recipe's =
SRC_URI
> +do_install_append() {
> +    install -d ${D}${base_libdir}/systemd/system
> +    for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -na=
me '*.socket'` ; do
> +	# ensure installing systemd-files only (e.g not avahi *.service)
> +	if grep -q '\[Unit\]' $service ; then
> +	        install -m 644 $service ${D}${base_libdir}/systemd/system
> +	fi
> +    done
> +}
> +
>  python populate_packages_prepend () {
>  	def systemd_generate_package_scripts(pkg):
>  		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8+H0MACgkQN1Ujt2V2gBygigCfWQSn14KOjNhRol1+Dhn3QW2b
ADEAmwT4Js84hbVBICqdKMqX2GNCYe+R
=SYGt
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
