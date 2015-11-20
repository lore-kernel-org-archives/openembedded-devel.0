Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0F08B60112
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:41:51 +0000 (UTC)
Received: by wmec201 with SMTP id c201so63624857wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 01:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jQAWoJP7/oOGZCZS0I6nv+P9EL3i5xh9vuqi0qJXLa0=;
	b=cmM6eyhTTha7x7vE7L5IBdxcw3i6TCQ4ySuuqky2G3uoWJ2+45DOHUIhjcUyO84JkJ
	Y9827g2BKhG0bnzyuWF/H0J7T72voRfD8XOCNUxWkWJc5wTeDA9YG3VqwZF9lEJVXsr0
	oxsL0nSnMKsNSAiRlVyM6A3oRmHgB+MmXTWguiFm3EiohRRWzwQApM2iRgT8aZxPLLEl
	lR3C9ZYWcGOGV4WbRzrgtzNvV+eEzn0IbOE5u6iGgU/vWbf7Mi9Q+YPVLAFGCxD8pY0m
	HVI0JswMioAhsrqLJF9m5pOOnBo4o/07OTv8APQkRK319061buvs8/hdIv2iig7RhQ3N
	UevQ==
X-Received: by 10.28.180.9 with SMTP id d9mr1326580wmf.62.1448012512107;
	Fri, 20 Nov 2015 01:41:52 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl4sm11851407wjd.17.2015.11.20.01.41.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Nov 2015 01:41:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Nov 2015 10:42:15 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151120094215.GC2241@jama>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
	<38e43117d054d710c263514f45aaa69c14b53d51.1448011904.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <38e43117d054d710c263514f45aaa69c14b53d51.1448011904.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 5/8] cim-schema-exper: fix host-user-contaminated
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
X-List-Received-Date: Fri, 20 Nov 2015 09:41:54 -0000
X-Groupsio-MsgNum: 58751
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline

--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 01:32:44AM -0800, Robert Yang wrote:
> Issue: LIN8-1632
>=20
> Fixed:
> cim-schema-exper-2.39.0: cim-schema-exper: /cim-schema-exper/usr/share/mo=
f/cimv2.39.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
> cim-schema-final-2.40.0: cim-schema-final: /cim-schema-final/usr/share/mo=
f/cimv2.40.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
> lib32-cim-schema-exper-2.39.0: lib32-cim-schema-exper: /lib32-cim-schema-=
exper/usr/share/mof/cimv2.39.0/Network/CIM_IPAddressRange.mof is owned by u=
id 15220, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]
> lib32-cim-schema-final-2.40.0: lib32-cim-schema-final: /lib32-cim-schema-=
final/usr/share/mof/cimv2.40.0/Network/CIM_IPAddressRange.mof is owned by u=
id 15220, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]
>=20
> It uses cp -a to install the files, so fix the owner to root:root
>=20
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151120
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../cim-schema/cim-schema-exper_2.39.0.bb          |    1 +
>  .../cim-schema/cim-schema-final_2.40.0.bb          |    1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_=
2.39.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.3=
9.0.bb
> index 62e50df..e4ed7b3 100644
> --- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.=
bb
> +++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.=
bb
> @@ -17,6 +17,7 @@ do_install() {
>          install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-=
${PV}
> =20
>          cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/=09
> +        chown -R root:root ${D}${datadir}/mof/cimv${PV}

Why don't you fix it to use install instead of cp -a + chown?

>          for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
>                  sed -i -e 's/\r//g' $i
>          done
> diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_=
2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.4=
0.0.bb
> index 1694f31..7ab9c4d 100644
> --- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.=
bb
> +++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.=
bb
> @@ -22,6 +22,7 @@ do_install() {
>          install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-=
${PV}
> =20
>          cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/=09
> +        chown -R root:root ${D}${datadir}/mof/cimv${PV}/
>          for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
>                  sed -i -e 's/\r//g' $i
>          done
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZO6vYACgkQN1Ujt2V2gBxEtACdEptXrArOMF4hXJyC8J22+qA3
fesAnimr4GbjelZiRjbqB7AX2WzQjisO
=Qw+6
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
