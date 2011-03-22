Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q1zHu-0007Jt-Im
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 11:58:10 +0100
Received: by bwz10 with SMTP id 10so5518995bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 03:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Ceqx6jCIUQ5dtvTulLVBwTsLhSxk0+/O4m1umI1KL5s=;
	b=bDrGpOCWDLb+Vw+wIYgm0qqo+SUPGSb0CPVAAKLaZ/8jMpT4wF+iAmaWNzd9ecdTie
	bOK+6ES42E1BlI6vJF4vPw/o9LyRZmjF/mGE4VsmVErXF9K+jJJ+1sQmzxZkx7Ebkx03
	hH5Bxxmr2Hfk9e/JD69CFDmOKFNtLXItXdRz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Ee8W7IGzB3wSYbv+RpSll3ndIrvtg6xRsHOEV34AR2FpxMXvPYg4/jtiZMgPbpSQ4x
	gDGW/m9L8ZDOXtfVkbPMb5ik9yU+p1TLVwl6XEvQeCbxGtXOv9s/LRV/B48C50A+Wr2y
	PG2m/b5lYJTXgkCJLHZahRCBByUJOmZR5AH8k=
Received: by 10.204.20.146 with SMTP id f18mr4828693bkb.176.1300791377103;
	Tue, 22 Mar 2011 03:56:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm1743120bkm.6.2011.03.22.03.56.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 03:56:15 -0700 (PDT)
Date: Tue, 22 Mar 2011 11:56:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322105613.GC3418@jama.jama.net>
References: <1300790542.3827.19.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1300790542.3827.19.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] ipkg: remove legacy staging and install `libipkg.pc` properly
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
X-List-Received-Date: Tue, 22 Mar 2011 10:58:10 -0000
X-Groupsio-MsgNum: 30495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 11:42:22AM +0100, Paul Menzel wrote:
> Date: Tue, 22 Mar 2011 10:51:47 +0100
>=20
> Convert to new style staging [1] and install `libipkg.pc` properly as don=
e in [2][3].
>=20
> [1] http://openembedded.org/index.php/Legacy_staging
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc2c8f=
e4c5629add94bd0b922f5b3446624a9f4d8
> [3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D48838=
f0fca6b00767115dd13bce2537f035fd3ba

Is it worth to update it now when I hope last bits were also converted
to opkg?

git mv to obsolete would be easier to review :).

Cheers,

> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> CC: Andreas Oberritter <obi@opendreambox.org>
> ---
> Another time I do not understand why `libipkg.pc` is not installed
> automatically. I did not find =BBlibipkg.pc was not installed.=AB from
> `pkgconfig.bbclass` in `log.do_install`. Is that an error in the
> Makefile of `ipkg`?
> ---
>  recipes/ipkg/ipkg_0.99.163.bb |   13 ++++---------
>  1 files changed, 4 insertions(+), 9 deletions(-)
>=20
> diff --git a/recipes/ipkg/ipkg_0.99.163.bb b/recipes/ipkg/ipkg_0.99.163.bb
> index 8eb83a1..09068d4 100644
> --- a/recipes/ipkg/ipkg_0.99.163.bb
> +++ b/recipes/ipkg/ipkg_0.99.163.bb
> @@ -1,5 +1,5 @@
>  include ipkg.inc
> -PR =3D "r8"
> +PR =3D "r9"
> =20
>  S =3D "${WORKDIR}/ipkg-${PV}"
> =20
> @@ -12,15 +12,10 @@ SRC_URI =3D "http://www.handhelds.org/pub/packages/ip=
kg/ipkg-${PV}.tar.gz \
>  	file://lonk-link-name.patch \
>  	"
> =20
> -do_stage() {
> -	oe_libinstall -so libipkg ${STAGING_LIBDIR}
> -	install -d ${STAGING_INCDIR}/libipkg/
> -	for f in *.h
> -	do
> -		install -m 0644 $f ${STAGING_INCDIR}/libipkg/
> -	done
> +do_install () {
> +	install -d ${D}${libdir}/pkgconfig
> +	install -m 0644 ${WORKDIR}/libipkg.pc ${D}${libdir}/pkgconfig/libipkg.pc
>  }
> =20
> -
>  SRC_URI[md5sum] =3D "0b10ad2924611bccaea8ddf98481a192"
>  SRC_URI[sha256sum] =3D "405743e1ba320ed6095d42a898f1486e3af1d745cae2bd45=
dfe1d8403a4d8995"
> --=20
> 1.7.4.1



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2IgE0ACgkQN1Ujt2V2gBwxGQCeJTIg/0kU6oB2quBup+yA0W8J
+iEAmgI3tiYT71+9c00jRxhg6bjP48Ue
=OhKD
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
