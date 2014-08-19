Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 17C0260030
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:40:29 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so5293025wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 06:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VNQBqYH5ZuLBe5T9j+LR6hW9VpY71QrqMNDA5repF1s=;
	b=vyGNMMUhf2NHEog99NGq88JDEwkvonsS44nkQ+q9Lrm8taBjDqELoc4qg3rwOJq9eg
	WWhL9YiXrnDHy/FSBG7yPNQT3lAWvtz+f9z6iS4G+jVhAKCrrqBgSGqaZkeamvNUGISf
	X9imcJNl45LAlIV/sAcoMtqo/gnesTUP8DYpjp3G2StX0H2aPBKShefnWPBZLhfyudRH
	fN9vZigILn56Oy8UgDFKrZPI9MHHVkCvrYJOKAaLIx/FSXeu64rxCqJGTDE1ROfarfdX
	ijb+7nhptmJWfEXY5F1SZUQ9rqPY4YubhzjiugnmZ84q+t5G252ZK2RDX3x6U20ZF6Sw
	SY5Q==
X-Received: by 10.194.205.70 with SMTP id le6mr49554325wjc.25.1408455627785;
	Tue, 19 Aug 2014 06:40:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lj18sm12861147wic.8.2014.08.19.06.40.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 06:40:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Aug 2014 15:40:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140819134027.GT3660@jama>
References: <1408431709-5955-1-git-send-email-b40869@freescale.com>
	<20140819100731.GO3660@jama>
MIME-Version: 1.0
In-Reply-To: <20140819100731.GO3660@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: YangHaibo <b40869@freescale.com>
Subject: Re: [meta-oe][meta-webserver][PATCH] move fcgi-2.4.0 recipe and patch to correct folder
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
X-List-Received-Date: Tue, 19 Aug 2014 13:40:32 -0000
X-Groupsio-MsgNum: 51778
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="msgLTjjeumHWYklJ"
Content-Disposition: inline

--msgLTjjeumHWYklJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 12:07:31PM +0200, Martin Jansa wrote:
> On Tue, Aug 19, 2014 at 03:01:49PM +0800, YangHaibo wrote:
> > ---
> >  meta-webserver/recipes-support/{ =3D> fcgi}/fcgi_2.4.0.bb             =
      | 0
> >  .../recipes-support/fcgi/{ =3D> files}/Fix_EOF_not_declared_issue.patc=
h     | 0
> >  .../fcgi/{ =3D> files}/add_foreign_to_AM_INIT_AUTOMAKE.patch          =
      | 0
> >  3 files changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-webserver/recipes-support/{ =3D> fcgi}/fcgi_2.4.0.bb (100%)
> >  rename meta-webserver/recipes-support/fcgi/{ =3D> files}/Fix_EOF_not_d=
eclared_issue.patch (100%)
> >  rename meta-webserver/recipes-support/fcgi/{ =3D> files}/add_foreign_t=
o_AM_INIT_AUTOMAKE.patch (100%)
> >=20
> > diff --git a/meta-webserver/recipes-support/fcgi_2.4.0.bb b/meta-webser=
ver/recipes-support/fcgi/fcgi_2.4.0.bb
> > similarity index 100%
> > rename from meta-webserver/recipes-support/fcgi_2.4.0.bb
> > rename to meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb
> > diff --git a/meta-webserver/recipes-support/fcgi/Fix_EOF_not_declared_i=
ssue.patch b/meta-webserver/recipes-support/fcgi/files/Fix_EOF_not_declared=
_issue.patch
> > similarity index 100%
> > rename from meta-webserver/recipes-support/fcgi/Fix_EOF_not_declared_is=
sue.patch
> > rename to meta-webserver/recipes-support/fcgi/files/Fix_EOF_not_declare=
d_issue.patch
> > diff --git a/meta-webserver/recipes-support/fcgi/add_foreign_to_AM_INIT=
_AUTOMAKE.patch b/meta-webserver/recipes-support/fcgi/files/add_foreign_to_=
AM_INIT_AUTOMAKE.patch
> > similarity index 100%
> > rename from meta-webserver/recipes-support/fcgi/add_foreign_to_AM_INIT_=
AUTOMAKE.patch
> > rename to meta-webserver/recipes-support/fcgi/files/add_foreign_to_AM_I=
NIT_AUTOMAKE.patch
>=20
> Please use fcgi (BPN) instead of "files" for slightly faster lookup.

I've moved them when cherry-picking to master-next, but it's also
missing your SOB line, I've added it too, but please ack it here.

>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--msgLTjjeumHWYklJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPzU8sACgkQN1Ujt2V2gBx23ACeLMFSgqYhiidXjX5YC7LDfDl3
ddcAniJFjEdVHcqLlpHzpJmnOpmkFNvN
=XQKj
-----END PGP SIGNATURE-----

--msgLTjjeumHWYklJ--
