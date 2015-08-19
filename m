Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 617D975E7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 12:55:26 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so7558019wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iaI9sgVeO+rF6TgssMDREDPwXmEK7EEBIPWIeYjknaQ=;
	b=a94y5EUYG8QvjFufxgIi+OkVBqh5EJd3SDD7+QMwYH9/w3eLB2wizbRSgCxvc8/hg5
	41g7C9qXNKFyuGe59jWnUCUibamL3Ac1lEUNmzieCQDfYupnd12HPBS3uHHehl3N3Yhd
	0ykjKA9ecFmFxFf19KJSj01kZ8i0a+0pCNnpKq6YSFGCHf3sTswwOrG94Z/YBOaQ5qyf
	ZJGNfAsYlUNaW3C49qqu7jgZjpn4CgX6u8t5JltYpbypftTq2vxScjWX8rozVm8RsRDS
	2YXCYkw7ZmopIaKPLBJvtyiXlNEa/fXYPE+UCrtsYHs1nagUYU+BiFg+h1z9PcsvSwI0
	WwvA==
X-Received: by 10.180.75.78 with SMTP id a14mr53644189wiw.43.1439988926897;
	Wed, 19 Aug 2015 05:55:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id go5sm1517000wib.5.2015.08.19.05.55.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 05:55:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Aug 2015 14:55:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150819125540.GA2442@jama>
References: <1438562844-16736-1-git-send-email-TicoTimo@gmail.com>
	<1438562844-16736-2-git-send-email-TicoTimo@gmail.com>
	<CANx9H-DRLk5sOcmPtoGgHQRAa5y+Ef8ihbBvMAb7S7ptOaE7dQ@mail.gmail.com>
	<20150818094429.GI2458@jama>
	<CANx9H-D_onDGKhvi08xPXXuNwzJ13dfYObE_=k+J0g2G4-R1aQ@mail.gmail.com>
	<55D41EB8.5050503@videolan.org>
MIME-Version: 1.0
In-Reply-To: <55D41EB8.5050503@videolan.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][meta-multimedia][PATCH 2/2] vlc: update to 2.2.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Aug 2015 12:55:27 -0000
X-Groupsio-MsgNum: 56803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2015 at 08:14:16AM +0200, Rafa=EBl Carr=E9 wrote:
> On 08/19/2015 05:05 AM, Tim Orling wrote:
> > On Tue, Aug 18, 2015 at 2:44 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >=20
> >> On Sun, Aug 02, 2015 at 06:07:57PM -0700, Tim Orling wrote:
> >>> I accidentally left libvorbis as a dependency in vlc.inc, which is not
> >>> needed (tremor provides what was needed).
> >>>
> >>> You can pull the corrected recipes from:
> >>>
> >>>
> >> http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/vl=
c-2.2.1
> >>>
> >>> --Tim
> >>
> >> It still fails with that libtool error:
> >> http://errors.yoctoproject.org/Errors/Details/14498/
> >> but I'll merge it anyway, because it doesn't make things worse than old
> >> version.
> >>
> >> It is having a problem with the assembly files (e.g.
> > vlc-2.2.1/modules/arm_neon/i422_yuyv.S )
> >=20
> >=20
> > Anybody have any ideas? I would guess that --tag=3DCC would still apply=
, but
> > I don't see any obvious support for assembly files in the libtool docs.
> >=20
> > --Tim
>=20
> This vlc.inc diff lets VLC build correctly for me:
>=20
> -    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g
> ${B}/doltlibtool
> +    sed -i -e
> s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${TARGET_SYS}-lib=
tool:g
> ${B}/doltlibtool

Can you please send this as proper patch? Then I'll include it in next
jenkins build to verify.

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXUfMsACgkQN1Ujt2V2gBwOEgCffp8PtdohbVONsUEE65HZlPZz
u2sAnRxTzvsC0jvvF5nrFJ/qP4jzUPB+
=+FU1
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
