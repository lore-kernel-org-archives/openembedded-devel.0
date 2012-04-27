Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNqD5-0005MS-Dl
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 20:48:03 +0200
Received: by wgbdr1 with SMTP id dr1so812740wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 11:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1Dt5iOjj/FEDGbKe5SlIPTFZtpwFHBghjkBF/upCtfw=;
	b=mJC3nEWmu/xBnHvjhIJM4QU3xFyGBgETRCgg49tIcGH0u04AL2hl/6V2Bal8IpVXTn
	/AJD0pyExvJcBMbSHRWJFLRFsb/6M6uU26jQj40w510/G4pj087FcejIOrWTVz+ndQjm
	MVw06TKNNTrhqByaGFsFUsPTHd0o+KrUZTuaEYXAeR5DZyJJKPObgW5HQACLpsdhFOCM
	DhANvXLZmzcikcAt6E3E2WQ9yJN72/UTFaHXZETW/JlBeDDf2B04AQ3zLu1tIcH4xpVB
	Eco1Ft1LrQa7ovu86uOKlBW820rm03CHpvcTX+zsHBZcORca3mD1pZO4S2LblO2bwrhd
	J8Dg==
Received: by 10.180.101.8 with SMTP id fc8mr8393510wib.12.1335551540114;
	Fri, 27 Apr 2012 11:32:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ea6sm6289069wib.5.2012.04.27.11.32.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 11:32:19 -0700 (PDT)
Date: Fri, 27 Apr 2012 20:32:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120427183222.GE3635@jama.jama.net>
References: <1335531435-25806-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1335531435-25806-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] busybox 1.19.4 bbapped: create dir before installing into it, fixes build failures on the autobuilder
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
X-List-Received-Date: Fri, 27 Apr 2012 18:48:03 -0000
X-Groupsio-MsgNum: 38440
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Content-Disposition: inline

--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 27, 2012 at 02:57:15PM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-=
oe/recipes-core/busybox/busybox_1.19.4.bbappend
> index 2c73732..786e1d5 100644
> --- a/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
> +++ b/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
> @@ -1,6 +1,6 @@
>  inherit systemd
> =20
> -PRINC :=3D "${@int(PRINC) + 3}"
> +PRINC :=3D "${@int(PRINC) + 4}"
> =20
>  # look for files in the layer first
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> @@ -16,6 +16,7 @@ do_install_append() {
>  	install -d ${D}${sysconfdir}/default
>  	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/def=
ault/busybox-syslog
> =20
> +	install -d ${D}${systemd_unitdir}/system
>  	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.se=
rvice.in \
>  	     > ${D}${systemd_unitdir}/system/busybox-syslog.service
>  	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.ser=
vice.in \
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+a5jYACgkQN1Ujt2V2gBzs7QCgqyIJ6VPUJntINXZOBdXsD1K7
j2MAnA6K3lDrsB3SB5jkuet+sCUL5pdh
=haKL
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--
