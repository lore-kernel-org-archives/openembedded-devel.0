Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B549A766A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:32:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n129so9048519wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=m1DqTF7QxG5LRvZQKQCBEcB+gA74bs7Th1KAqoY/tiw=;
	b=l89v5SROS9GBdvZtOWp99/qdl55qslMiCZ73WYHdsSHybICcSL6ZjckUcJ7k7CeeUC
	uRIkTTDrHnXRI10W2rJayf1JskwOcTEfbUmJygfxmLQiEpKkNboqeB6FFDYCPyhVxGBV
	JlftzFRUGGXDxUYPKU0kcU4jqMe3dh+ld+kQM4WRJJQEYCoegf9cXgIa3hmw2xm9ZBIU
	W0+yQdTxgepYu3kOQlJ/YS6smfL5FNAFCywsu55TAe3CQPUUxX8pyqLHYjvtcHuIoPuz
	bS9AYq5XqC1ZsX0pajAWkIktfEW60H80dik7O0NZVdsM/3/qPn99WIXsd9QbFSCDtcL/
	ocEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=m1DqTF7QxG5LRvZQKQCBEcB+gA74bs7Th1KAqoY/tiw=;
	b=dlyBfmw2u0suUCxOcJG4Q5fe6t9kGWKLZnIrPfU/7bMUiMqU16bTToHTDmTzAWDgWt
	99c0PjTiMgIc4uFCL2+9mUfTb76L70Go5lOps3Ae7zX7W9iwJczgmx6AgMnPWMoFZzLP
	Wrjfwgc9ww5zd9/tAi0vWVdNdqztJUMuesXipKCc0T456yQ2y5G6UuRFr88f99zX4rqM
	DbByZAeYk+HPBpjdbhmmmIBHXREfq8jHwnkn1QcdweCGy0H914dnbo4DLSzFuRK7Ir8u
	IMNKipNa3icXF1kdKoQ0P1iBKoiEWDottXZg6r3GoumKFL6QL5TFsMs+os8i89ux5+mm
	NHDw==
X-Gm-Message-State: AOPr4FV6//EqFnVANEppjV/BCxydvo9/fz9F6BZrMo9tbMQVT1afYQBO2NJCOAypPkuuzw==
X-Received: by 10.194.9.201 with SMTP id c9mr20368692wjb.7.1462545137761;
	Fri, 06 May 2016 07:32:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s10sm15354232wjp.3.2016.05.06.07.32.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:32:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 May 2016 16:33:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160506143347.GF2544@jama>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
	<1462543259-7206-8-git-send-email-otavio@ossystems.com.br>
	<20160506141621.GD2544@jama>
	<CAP9ODKq_Jkd912c8TwBS7u1+M_hwHjM6DKxAM15TuUzBsrgvxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq_Jkd912c8TwBS7u1+M_hwHjM6DKxAM15TuUzBsrgvxg@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-oe backport krogoth PATCH 08/22] ltrace: Error Fix for ARM
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
X-List-Received-Date: Fri, 06 May 2016 14:32:18 -0000
X-Groupsio-MsgNum: 61388
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Content-Disposition: inline

--4f28nU6agdXSinmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2016 at 11:20:56AM -0300, Otavio Salvador wrote:
> On Fri, May 6, 2016 at 11:16 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, May 06, 2016 at 11:00:45AM -0300, Otavio Salvador wrote:
> >> From: Li xin <lixin.fnst@cn.fujitsu.com>
> >>
> >> 1) The error is as following:
> >>      root # ltrace ls
> >>      __libc_start_main(0xb6fbc018, 1, 0xbed8fdc4, 0xb6fd0b88PTRACE_SIN=
GLESTEP: Input/output error
> >>      2747 couldn't continue when handling __libc_start_main (0xb6fbbde=
0) at 0xb6fbbde0
> >>    The master branch fix it.
> >>
> >> 2) remove unused patch:
> >>      --0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
> >>      --ltrace-0.7.2-unused-typedef.patch
> >
> > This still has issue reported here:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/1=
07207.html
> >
> > I would prefer not to backport it to kergoth until it's fixed.
>=20
> Sure; makes sense. Do you want me to resend the patches with this one
> dropped or you drop it when queueing?

I'll let Armin to consolidate pending changes and send pull-request
after he tests them, so the question is for him not me :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcsq0oACgkQN1Ujt2V2gBxd6wCbBSM8G+WiS7EkVxqrUi9vlAbT
k1YAoLpAHpPPCzU2CqOb9tTyYa51wbA6
=duDB
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--
