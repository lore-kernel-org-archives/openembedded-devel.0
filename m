Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7F31D6FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 13:53:04 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n186so30469116wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 05:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jWL/+EFdHZrBXk0SE9RTC+BbYUGRusNz5h7GaP3Adp8=;
	b=bWZA7qKaJVbZ7Rhh7rWB6EioKFccu0uGFh+RIgrUdq2pUPqB7DANwiJDvdXtJ3chUk
	Kx0B5zdZzB7ZbbeDMJBVORlZwX2B1+FN7hXhn4+ZakHmJh6ya4uKu4YUHP0yxIqld5Jd
	Q1AExPVV5L+V83o0SgyEopn2IeAdpvWBl45REO8nxeFrEmWofrQyXoK6TU3mQb1oLJzF
	UwCVgkhnKGSWA7kq7ozAMUkqjt+gdZ6WBggZJrZUjnzM8+/n57nlJK4lp86+SElGkxgj
	0dm02IUKY5g4ixOPxj7bWUUrwvJ+llun76lOaG6OxrJIk3zCQp3aqFr3dxHR7IfHeW1A
	U20A==
X-Received: by 10.28.184.134 with SMTP id i128mr6422941wmf.12.1449841984789;
	Fri, 11 Dec 2015 05:53:04 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q6sm17034227wjx.28.2015.12.11.05.53.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Dec 2015 05:53:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Dec 2015 14:54:54 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151211135454.GA2248@jama>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
	<d7b393011e851acffece951cf1ad7c332c19f8c4.1448011904.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <d7b393011e851acffece951cf1ad7c332c19f8c4.1448011904.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 2/8] lldpad: fix installed-vs-shipped
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
X-List-Received-Date: Fri, 11 Dec 2015 13:53:06 -0000
X-Groupsio-MsgNum: 58972
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 01:32:41AM -0800, Robert Yang wrote:
> Issue: LIN8-1622
>=20
> Fixed when multilib:
> lldpad-0.9.46: lldpad: Files/directories were installed but not shipped i=
n any package:
>   /usr/lib
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> lldpad: 1 installed and not shipped files. [installed-vs-shipped]
>=20
> This is because /usr/lib/systemd has been moved, but /usr/lib was left
> in multilib, use "rmdir -p" to fix the problem.
>=20
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151120

doesn't apply because it was removed a while back:

commit 1a57f561caea01e6a19313af019138c783e9f964
Author: Joe MacDonald <joe_macdonald@mentor.com>
Date:   Thu Oct 22 09:46:48 2015 -0400

    lldpad: remove obsolete recipe

>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-daemons/lldpad/lldpad_0.9.46.bb        |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb b/me=
ta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> index b191df5..b66344f 100644
> --- a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> +++ b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> @@ -23,7 +23,7 @@ do_configure_prepend() {
>  do_install_append () {
>      install -m 0755 -d ${D}${systemd_unitdir}
>      mv ${D}${prefix}${systemd_unitdir}/* ${D}${systemd_unitdir}/
> -    rmdir ${D}${prefix}${systemd_unitdir}
> +    rmdir -p --ignore-fail-on-non-empty ${D}${prefix}${systemd_unitdir}
>  }
> =20
>  FILES_${PN} +=3D "${systemd_unitdir}"
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

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZq1a0ACgkQN1Ujt2V2gByCtACeNjVPFdcKiDm6HB2oYPSOnpGw
6PEAni8LYZB2lKXYmCyGnu9OhRJU+N+/
=F256
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
