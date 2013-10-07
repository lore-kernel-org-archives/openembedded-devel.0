Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 54D0A60FAF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 19:32:57 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so3498597eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 12:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4mdtOMOUQlSM8O6pfAGfoUQ/Nf128Zrc+e9TTlxS7LE=;
	b=iW+kc1XtR6Ou1WUNPXYbYMF+yYlyr53pJT96C4//6543sMRW+vzIGVcC64wfLRXF+8
	ZcN9H9orIU6Sn6PJuEqAiV8LYMndFNZY7IZb3uOJtN771ZQhHX3u5UAUqbtW/1FswNKT
	n6AIPIKm2SR/siJ9CL6GbTsbvqFEZ6KFPOVN6ryLkIkcShPTdwJT+LUOoJBhPzXqLShd
	JC7HsT7YUGYYd/5SkK3SZUzUCV4BL45/zuomEJ2D4bDjW4NGTfVbDpwRxAoImRfa3oOe
	kLaAVi2TY0NsPo+WseIT5w7YQuEHKPEyE1JH6kfqiivvp4NeO7nAkH4W8rl8TwuE44QZ
	mY9g==
X-Received: by 10.14.5.133 with SMTP id 5mr5790032eel.56.1381174378045;
	Mon, 07 Oct 2013 12:32:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm66828933eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 12:32:57 -0700 (PDT)
Date: Mon, 7 Oct 2013 21:33:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131007193306.GT6240@jama>
References: <20131007180120.GC18775@denix.org>
	<20131007202956.718ce202@e6520eb>
	<20131007183739.GD18775@denix.org>
	<20131007205710.386447ba@e6520eb>
MIME-Version: 1.0
In-Reply-To: <20131007205710.386447ba@e6520eb>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Laszlo Papp <lpapp@kde.org>
Subject: Re: [meta-qt5] Update to 5.1.1?
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
X-List-Received-Date: Mon, 07 Oct 2013 19:32:58 -0000
X-Groupsio-MsgNum: 46465
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aZ/0/p6gSDXwzas7"
Content-Disposition: inline

--aZ/0/p6gSDXwzas7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 08:57:10PM +0200, Eric B=E9nard wrote:
> Le Mon, 07 Oct 2013 14:37:39 -0400,
> Denys Dmytriyenko <denis@denix.org> a =E9crit :
>=20
> > On Mon, Oct 07, 2013 at 08:29:56PM +0200, Eric B=E9nard wrote:
> > > Hi Denys,
> > >=20
> > > Le Mon, 07 Oct 2013 14:01:20 -0400,
> > > Denys Dmytriyenko <denis@denix.org> a =E9crit :
> > >=20
> > > > Martin, Otavio, et al,
> > > >=20
> > > > Are you planning on updating Qt version in master to 5.1.1 any time=
 soon,=20
> > > > preferably before 1.5 release? :) If nobody looked into that yet, w=
ill you be=20
> > > > open to take patches for the same?
> > > >=20
> > > I have 5.1.1 in test here. I expect to send the patch in the coming
> > > days.
> >=20
> > Thanks! Sounds good. Let me know if you need help in testing!
> >=20
>=20
> as soon as it finish to compile here I'll send the patch serie for
> testing.

+Laszlo

Laszlo also said that he is working on patches for 5.1.1 I don't know
how far he got..

I would be happy to merge patches from whoever finishes it first.

Would be great if you could send update for individual modules in=20
https://github.com/meta-qt5 (especially qtbase where we have most
patches) but if you don't I'll do it myself from meta-qt5 patches.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aZ/0/p6gSDXwzas7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJTDHIACgkQN1Ujt2V2gBxikQCdFdjBH3ZPnkYdCZPgKyBWeYPy
4N4Anj1ozLEY09bKEvzxSpJNvbIKmvCn
=Tlu0
-----END PGP SIGNATURE-----

--aZ/0/p6gSDXwzas7--
