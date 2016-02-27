Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id F1C51771FF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 21:40:33 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so14526904wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 13:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=41jk7stAM6rAZr2Om52yS1xPnwUuaF0pDJETkYMKoGk=;
	b=TMrD7B5tAQ83Vuvg/Uj2SPo5PxjK0vda4du6R5Fz9Z2URWE1qcyr2JL19Wujm7V9A5
	1roybmK4yIoJqr2dwNqEVTcWAlyLL3LSaKZF93miOFL54Jo0b0qm03hT1/wxyuSJ/k38
	YQORzbdSK6HF2AMxLtyJsIMcVPZ0XJfTGWUlxHjTfi7H49WcB6lwGOUO69tOGDtUdEZg
	JJtH80lilowKuCuLM3kUApIKiZ3+u84lkwSJ7T8Ix9IruRr8QA6mk0R9W7p8QoyVkNZH
	rQgcQgiDVrGQ+go8kDQwFfHVIn3FHqDu/rwg1sfmDdMrcjK6DLj/V2ZwqMBStc1BJIJJ
	MKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=41jk7stAM6rAZr2Om52yS1xPnwUuaF0pDJETkYMKoGk=;
	b=PhJbuPGiRryJ1o1jKQvX5Zj13n6M+2zwjnP3zGLjfTgl/X+4kgHKH+2zFAl/3gXmFu
	4YzgKFMcV0o5r4EKWH1jvVArn+uI3HEieH5vp7/IaZDtkanTc1NcIpGu1BO3c7t7IkpL
	VQJ1eSnBX5r/pQldJ6kHsdFV3iPA40VBEvyf2uon0a7hoCWsmjwqzkTETMaS/KRe2CGq
	GeFoMJTjBaKlrMJebPai0/DxnXx1AyIjn1UJWmg7+PxdmWYA6sH/NCeR+s7vxS1yKWRp
	fZwsaEV0J1xu7mh4/V7lqh6/KjXjUn+bCSvsF/TC0uJF3ef0X/QdmGq3Pq5D4oktFSnX
	Eg/Q==
X-Gm-Message-State: AD7BkJIvgOhTO4XlGnOhLFCLW5lh9kME9L4nEg1feKdulCJIWZYK7ekzvknLFFU7r4iTDg==
X-Received: by 10.28.9.71 with SMTP id 68mr4143706wmj.33.1456609233876;
	Sat, 27 Feb 2016 13:40:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id c7sm8786906wmd.13.2016.02.27.13.40.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Feb 2016 13:40:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 27 Feb 2016 22:41:59 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160227214159.GC2554@jama>
References: <1456608134-4063-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1456608134-4063-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] ne10: fix parsing
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
X-List-Received-Date: Sat, 27 Feb 2016 21:40:35 -0000
X-Groupsio-MsgNum: 60243
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 27, 2016 at 10:22:14PM +0100, Andreas M=FCller wrote:
> ERROR: ParseError at /home/superandy/data/oe-core/sources/meta-openembedd=
ed/meta-oe/recipes-support/ne10/ne10_1.2.1.bb:41: unparsed line: 'in .text =
[textrel]'      | ETA:  00:00:13

Thanks.

Lesson learned, don't drink and push (unless the patch is from someone
else who fixed your mistake).

Cheers,

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes=
-support/ne10/ne10_1.2.1.bb
> index 5bfe80a..4d753a0 100644
> --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> @@ -37,8 +37,6 @@ do_install() {
>      cp -a ${B}/modules/libNE10.so ${D}${libdir}/
>  }
> =20
> -# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib=
/libNE10.so.10' has relocations
> -in .text [textrel]                                                      =
                              =20
> -# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib=
/libNE10.so.10' has relocations
> -in .text [textrel]
> +# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib=
/libNE10.so.10' has relocations in .text [textrel]
> +# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib=
/libNE10.so.10' has relocations in .text [textrel]
>  INSANE_SKIP_${PN} +=3D "textrel"
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbSGCYACgkQN1Ujt2V2gBxd/wCfUz2gAqzNh2AjYlCWthBQV2v1
HU4Ani6u1o2x5on920Ki4u2u2zjVTH1l
=7uFJ
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
