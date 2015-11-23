Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 60168601A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 20:21:25 +0000 (UTC)
Received: by wmec201 with SMTP id c201so178616274wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 12:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GfSzmdJ//4f8x0wV50zVsGMClCywpcseKW0WHVeM/pU=;
	b=V9ZemKtyMQLDPs6AAW0JXD55YBb9U8JyU5Z2+KdjLVquNKS1h0BDTb3JWjkjyO8Nex
	6RLfZtuSPlEjwSLkbAtfi2PVuFQ+v+aZ7l1qH4OWw2zp0bUcbgTThed/tjgxPwCg+qqs
	gjKoJpDvZsP7ehj7ZwM2IJ7sMHK39j4tRg3JpVt6Ki/5VCvPdGmq5E8UFpKkM5vqlxmE
	9f8E8hbs6qgJO1AddiTx+YcFkUqM599Gcrpxp1AsohnJBLj2Wh8JJIavXi9rz+O+sqVo
	OZq1qisawnHCC/QqIB19SbakBNNMV/GhAtk8/6x4hHX2VvG1JetZH9w8cqu0TjZREfnw
	yxtA==
X-Received: by 10.28.126.215 with SMTP id z206mr19061573wmc.71.1448310086266; 
	Mon, 23 Nov 2015 12:21:26 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	an7sm14862174wjc.44.2015.11.23.12.21.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Nov 2015 12:21:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Nov 2015 21:21:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151123202155.GA17303@jama>
References: <1448279098-24980-1-git-send-email-otavio@ossystems.com.br>
	<87h9kcoqw5.fsf@email.parenteses.org>
	<CAP9ODKqRoEzU_uHtuBNRzq=3tQi5Um0PV+io6bcCcfm8dfWsjQ@mail.gmail.com>
	<D00C1F8D-0789-4430-BFF0-392336C81D37@gmail.com>
	<CAP9ODKoxbai1=yE4+XBAXOrQ7-JObwGhdOc7zRcuvz6EcbwGtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoxbai1=yE4+XBAXOrQ7-JObwGhdOc7zRcuvz6EcbwGtw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-ruby][meta-xfce][PATCH] Move imsettings from meta-ruby to meta-xfce
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
X-List-Received-Date: Mon, 23 Nov 2015 20:21:26 -0000
X-Groupsio-MsgNum: 58793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2015 at 05:25:59PM -0200, Otavio Salvador wrote:
> On Mon, Nov 23, 2015 at 2:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Nov 23, 2015, at 4:29 AM, Otavio Salvador <otavio.salvador@ossystem=
s.com.br> wrote:
> >>
> >> On Mon, Nov 23, 2015 at 10:13 AM, Mario Domenech Goulart
> >> <mario.goulart@gmail.com> wrote:
> >>> On Mon, 23 Nov 2015 09:44:58 -0200 Otavio Salvador <otavio@ossystems.=
com.br> wrote:
> >>>
> >>>> The imsettings requires xfconf to run, making it dependent of XFCE. =
It
> >>>> makes no sense to make meta-ruby dependent of XFCE so we move the
> >>>> imsettings recipe to meta-xfce and add the meta-ruby dependency ther=
e.
> >>>
> >>> s/dependent of/dependent on/
> >>
> >> Agreed; Martin, can you fix it when applying or do you wish me to send=
 a v2?
> >
> > I have sent a patch for same last week see.
> >
> > http://permalink.gmane.org/gmane.comp.handhelds.openembedded/72211
>=20
> You missed the addition of meta-ruby dependency for meta-xfce now.

I think he didn't because ruby was moved from meta-ruby to oe-core.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZTdWMACgkQN1Ujt2V2gBwZLQCePsMy6u1vzOGA8WHaJL9DY/jq
OxMAnRlLA7ymPwIJoKS241GtkdN8cmYG
=q8rD
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
