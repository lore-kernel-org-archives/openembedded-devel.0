Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C5912601A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 11:58:17 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 196so42077578wmm.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 03:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0/nqrp5O6SN3BVSGo3I3YU/dz61acZuJ0PDecJtRFC4=;
	b=bzkN859/XHbx0GL6/mnzvvfVEBYl1AizYnw1PXDlM2LQ+++W2Fci/+Wj21bFbOnjLJ
	MySZ0+v4gsoQ3/Cnrrt/UmI22CAg1UkGFr9UnOXPNi/FHKqlEhRFgbYWmdhb5ob22zah
	vGS6p+ilxFnVoRdfB8wMg6vo9pN9otBnjzN9vKw5OE/+pxVdKqhCnxHUtbIP96tnKeG3
	PLMCnN4eYjEuMoxidnztaF/PvV930sHb7MowLbF1rgN6cPHDHFhOCF3yBNm6Kl5sbkpm
	Yqj1QF9gF3rDMOKaW2MEntUSGqVa2X398UYwDmysKv581yv+v5RZbWXxOfAgHUmGEm3t
	qm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0/nqrp5O6SN3BVSGo3I3YU/dz61acZuJ0PDecJtRFC4=;
	b=tu86j3+/aZwSXa4o+pJ22dmcCB1/IwewmR7uxuN6+lZJmPfTVvfDnmfD48dC4FosBI
	P+9hYO3LFiZqpUtLz7sJ5McUEBqRQdlIpVEBbPq4ZHLVM77VuRZfsev3I7Mmaq5k8eRi
	kEuu6nOvjDxC+1zorYKwcN/LdFkVH/BviGZTlsEe0sN5wd6EB8R48yWtqy8SLyw96y/i
	KBGBw2pc974JvXoo4y6mU9Xxnes2P02CeTHh2H6+MdEMC6siS1VgWJoIw2rxTbD69JlG
	inW97qK76CVqTuehrY34M+sbbj4pp1sUxKzId296/8G1SicBSZB45Dhz4iGk9ep0ObUY
	XxYQ==
X-Gm-Message-State: AMke39kwbRUyZl9wBfTvcaUBFRIDCijR1LlmJQcE0MMAvCvDNIrgyAvQB6O7ZMHWn1hodw==
X-Received: by 10.28.128.205 with SMTP id b196mr12231414wmd.21.1486468697528; 
	Tue, 07 Feb 2017 03:58:17 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c9sm18327035wmf.18.2017.02.07.03.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Feb 2017 03:58:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Feb 2017 12:58:17 +0100
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20170207115817.GB3276@jama>
References: <1485682404-2336-1-git-send-email-obi@opendreambox.org>
	<20170206222811.149afc17@t510.zcs.saftware.de>
MIME-Version: 1.0
In-Reply-To: <20170206222811.149afc17@t510.zcs.saftware.de>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtwebkit: add necessary dependency on gperf-native
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
X-List-Received-Date: Tue, 07 Feb 2017 11:58:20 -0000
X-Groupsio-MsgNum: 65018
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 10:28:11PM +0100, Andreas Oberritter wrote:
> Ping. In Patchwork this was archived, but it's not in master-next.

Merged now, thanks for ping.

I've merged different version of the same change:
https://patchwork.openembedded.org/patch/136444/

and interestingly enough I was able to build qtwebkit 5.8 last week
without this change, that's why it wasn't in master-next yet.

> On Sun, 29 Jan 2017 10:33:24 +0100
> Andreas Oberritter <obi@opendreambox.org> wrote:
>=20
> > QtWebKit refuses to build if gperf is not found in PATH.
> >=20
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> >  recipes-qt/qt5/qtwebkit_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_g=
it.bb
> > index 2d69bb8..4845d0f 100644
> > --- a/recipes-qt/qt5/qtwebkit_git.bb
> > +++ b/recipes-qt/qt5/qtwebkit_git.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
> >      file://Source/JavaScriptCore/parser/Parser.h;endline=3D21;md5=3Dbd=
69f72183a7af673863f057576e21ee \
> >  "
> > =20
> > -DEPENDS +=3D "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 li=
bxslt"
> > +DEPENDS +=3D "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 li=
bxslt gperf-native"
> > =20
> >  # qemuarm build fails with:
> >  # | {standard input}: Assembler messages:
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJm2KgAKCRA3VSO3ZXaA
HPehAJ93eWWElGzuyXbyz62NzZa2ljgFfACeOyvihkPwUtwIwT3WCHnx1CuP8kY=
=ovtI
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
