Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6E06FF4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 10:09:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 20so13199938wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=W+RjXsJOJfHHPgO1ag9jkuc/9d6L/3dyz3zvTSPJAMY=;
	b=RfnaClus9I1TGq67u++X8D8vgkfwVlemEh5mPim55RkTXL3257E5G9csSySN6jf5wn
	oo6P2lIpujB0Q9Ba4naQ4VL1SPBZaf6f9mJwnXIJwPLs2w+vcqw/GLDaNL/GcKeUdvi6
	wCi4QM6KrCStjpj2mMacXla6LChHf1SukAkDZJ3QRtHCvK/xYDcf2EJzjDPYccsRFMdB
	3v4qX1UdjxmgmkQJentrbR8yRlQKhzA2zK2QOO3dlzL3RYFcJ1uLFCM5FTBgFVIB2Zsd
	xqjGbkfCmjNX6ZUymBKXPoKeKHwVDSkYtFC7R/Jd1Zru0UMPctl6awJRopvtwlxKB1Ep
	LCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=W+RjXsJOJfHHPgO1ag9jkuc/9d6L/3dyz3zvTSPJAMY=;
	b=Qch/2ENjaq//YRDvwsuQx4hbg6oJWowcK6BpooacTATqM4b4hz8tWiTzyoQjmM1Ahg
	fQEIpgJvNPKpc0S4wnV6iYmRayIiPJmurqNDUrpA+mgQzkdhs0ZZ1E6wubJ2JoRZpQkd
	9XuT3hXsYMxeP7hnw2PTxyJpg4FNmWKkopHhLH3PR2rN5pycrG2JWha1fAM0dq9/K+ac
	PKIvm4HIB3LJ63Ap5e42ajEk/tnezbmsHUPfzOE0JZdIJ4A7oAtgI1th9hYk02XzTlcA
	gMNXlOB0YgUXtt0Jw7mq12cf+Dx9IOoVaoNhPNy3FMvUdRnbfugkqnGgWd6CJZfBdEo5
	Qw9w==
X-Gm-Message-State: AD7BkJIE64Y4+OA08IyhPLZB3S+e5tCGNFaHlMIXVlnGsdy3T4XtC67xBOrG9aH6+7AGag==
X-Received: by 10.28.57.132 with SMTP id g126mr6600560wma.74.1459332551600;
	Wed, 30 Mar 2016 03:09:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jk1sm1742843wjb.27.2016.03.30.03.09.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Mar 2016 03:09:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Mar 2016 12:09:11 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160330100911.GC2557@jama>
References: <1459328901-21333-1-git-send-email-catalin.enache@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1459328901-21333-1-git-send-email-catalin.enache@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] net-snmp: fix invalid paths in target net-snmp-config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Mar 2016 10:09:11 -0000
X-Groupsio-MsgNum: 60735
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Content-Disposition: inline

--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 12:08:21PM +0300, Catalin Enache wrote:
> Only net-snmp-config used for sysroot should have sysroot
> specific paths.
>=20
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 10 +++++-=
----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index 63e0fc7..1a50932 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -70,11 +70,6 @@ do_install_append() {
>      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/snmpd
>      install -m 644 ${WORKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
>      install -m 644 ${WORKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
> -    sed    -e "s@^prefix=3D.*@prefix=3D${STAGING_DIR_HOST}@g" \
> -        -e "s@^exec_prefix=3D.*@exec_prefix=3D${STAGING_DIR_HOST}@g" \
> -        -e "s@^includedir=3D.*@includedir=3D${STAGING_INCDIR}@g" \
> -        -e "s@^libdir=3D.*@libdir=3D${STAGING_LIBDIR}@g" \
> -        -i ${D}${bindir}/net-snmp-config

What about target ${bindir}/net-snmp-config? Isn't it installed in some
net-snmp-dev package with incorrect paths?

>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/syst=
em
>      install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/=
system
> @@ -109,6 +104,11 @@ net_snmp_sysroot_preprocess () {
>          install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>          install -m 755 ${D}${bindir}/net-snmp-config ${SYSROOT_DESTDIR}$=
{bindir_crossscripts}/
>          sed -e "s@-I/usr/include@-I${STAGING_INCDIR}@g" \
> +            -e "s@^prefix=3D.*@prefix=3D${STAGING_DIR_HOST}${prefix}@g" \
> +            -e "s@^exec_prefix=3D.*@exec_prefix=3D${STAGING_EXECPREFIXDI=
R}@g" \
> +            -e "s@^includedir=3D.*@includedir=3D${STAGING_INCDIR}@g" \
> +            -e "s@^libdir=3D.*@libdir=3D${STAGING_LIBDIR}@g" \
> +            -e "s@^NSC_SRCDIR=3D.*@NSC_SRCDIR=3D${S}@g" \
>            -i  ${SYSROOT_DESTDIR}${bindir_crossscripts}/net-snmp-config
>      fi
>  }
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb7pcYACgkQN1Ujt2V2gBxLxgCeODZTCjMPBoFBvNgO1aSvRgh5
uOkAoKjq/kNDdbqy6iKdDFD6p/X9d/EA
=mdvw
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
