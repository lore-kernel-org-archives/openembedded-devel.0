Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 514A76B302
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 09:19:41 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so175211eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EjV/MDStkJIP9yuFGg8gEX4bPVzlAjrjaikZlLzroXw=;
	b=lLgxfC09Rn//DA+UcftF4osbMnzC4Xr2+onztsvKQmpD6phGcA57shMMqX2cgXV4U4
	2pyWbBZtAMoX74kUfuNR3/4MIyxPSNYvRwszbr6E1BA7MCBJlSP8GSaPrLCbBUNLE6wc
	PZg7lcCVoKgHjjLRmKMjiuBZN68S55hmNftYyirwv+TDdhjXuxo7rFijvIohbOQMyLxB
	wSXf1h37vfz1H60RWVsRbwWFk10ASY/FqUlf7xGJHZwDb2k1mBsaxSd5zpBx+jVGe+nc
	RZlsJzRbAFZEyYlLQV+38zLciFWiCbhRcC1A7YzHrcNNERSqWjFB6fprSWH/g0M8GHFw
	smCQ==
X-Received: by 10.14.122.132 with SMTP id t4mr25230810eeh.20.1377249581273;
	Fri, 23 Aug 2013 02:19:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm23421889eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 02:19:40 -0700 (PDT)
Date: Fri, 23 Aug 2013 11:20:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130823092047.GC3544@jama>
References: <1376647801-30792-1-git-send-email-cazfi74@gmail.com>
	<20130823072636.GA3544@jama>
	<CAF6bG8ctQ7ywRbi1cNbsjUsQXVPzMPeZwqZQP0XDh46mOqO+4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF6bG8ctQ7ywRbi1cNbsjUsQXVPzMPeZwqZQP0XDh46mOqO+4g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] ImageMagick: update to upstream version 6.8.6-8
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
X-List-Received-Date: Fri, 23 Aug 2013 09:19:42 -0000
X-Groupsio-MsgNum: 45810
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline

--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 10:53:01AM +0300, Marko Lindqvist wrote:
> On 23 August 2013 10:26, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Fri, Aug 16, 2013 at 01:10:01PM +0300, Marko Lindqvist wrote:
> >> - License changed by additional copyright year only.
> >> - Patch PerlMagic_MakePatch.patch part of upstream now
> >
> > Same issue as with 6.8.5
> > http://lists.openembedded.org/pipermail/openembedded-devel/2013-June/09=
1027.html
> >
> > imagemagick-6.8.6: imagemagick: Files/directories were installed but not
> > shipped
> >   /usr/lib/ImageMagick-6.8.6
> >   /usr/lib/ImageMagick-6.8.6/config-Q16
> >   /usr/lib/ImageMagick-6.8.6/config-Q16/configure.xml
> >   /usr/share/ImageMagick-6
> >   /usr/share/ImageMagick-6/english.xml
> >   /usr/share/ImageMagick-6/francais.xml
> >   /usr/share/ImageMagick-6/locale.xml
>=20
>  I'll add note to myself to check that when I next time work with that
> recipe (updating it to then latest imageMagick). I'm currently giving
> that general line of development a break and ended explicitly
> disabling freeciv mapimg feature instead (of making it to work).

If you just update FILES_* variables to package it somewhere I'll take
this imagemagick upgrade and the freetype delegate one.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIXKW8ACgkQN1Ujt2V2gBxh8wCgisEMHogPukUXLy7rePx3RNvd
bggAnRZifDpwryXzRmolIOlNPHd4vbFM
=ckJE
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
