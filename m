Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A3327744DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 06:08:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v16-v6so15586865wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 23:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xwekxAjhghlRO4LWhdWUJ8JjUAgogYoYGbYfNZn14Dc=;
	b=Sif9TjfbpujYu9eeA/8o/zELnD6gh00OlNMfg2xkOHgybB3N1fVyoU+aaAWbf8hCNd
	bhQIYuFv6b4jPDNzgykCZYEEF1PWHQPmmFX2L5I4yl5UaOcOGqSwJo3EOqS1QEdeD/K4
	UHEgZ1B6X+3uBRoweUAFHv6oeVRnE39xxoXMjpqjMV2GguxeLZNlNYWbZIvdV3fkDhiW
	qlkYoMc/5Ebt0T9ccL70mxAY5ZbGfM36JhCN2CCxmpDozp14AkWqW/sVgLBggXRXnvEm
	IiEQ08QH7Q6W5aBZs2aaPo1Yef2epPIDtQ0fF/OQYUf+s/Y8CYurY4TaXEEsAl+Qn9O/
	n4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xwekxAjhghlRO4LWhdWUJ8JjUAgogYoYGbYfNZn14Dc=;
	b=IcpU0BwlSKTd5BBvK9kR8e8CBM9QcofLBF2xIV/r7tiTGa+rzbL9rwzipHTAt1gyP3
	PpRbQnegaBn2Pz37MUwqcxN2m22quF3GNjkRfZC5RsG7BNKqyW+M1wLfIITsejV0FT73
	WoEvAKLsFtgtrfo/RFlLXMiCVbY1GX02+Ot3NZcncZAXmWJRIOH4khka9CdJMhBx3Gc+
	ArNL4sSMP5xD56e+ul2dRVUDxWWpN+RsvJXkypEwK6zWkUrmsg1EXadlN5em8TuhI5ob
	chAeB8aSSRG/FHIN+4t6+EbZzytt5YGvgZZ2uWKCzQLWLpLbhuhXnPNgGv3m6Nm3ODhI
	QZyg==
X-Gm-Message-State: APt69E04OfE5FK85NrufBmZUn927QqxOxFgi/82ztcZMiMehA6XKV27e
	7XpmBOTcUrD2vaGJPTir+EA=
X-Google-Smtp-Source: ADUXVKKxT4zglvCdK0RcrgxJXuTK6KI/jzs9rOobTU0v1nnAMMBtdanv5mLhHq3zsqogGGTV6aW2UA==
X-Received: by 2002:a1c:8410:: with SMTP id g16-v6mr573636wmd.26.1528351685272;
	Wed, 06 Jun 2018 23:08:05 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u89-v6sm979693wma.4.2018.06.06.23.08.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Jun 2018 23:08:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jun 2018 08:08:08 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Message-ID: <20180607060808.GB1353@jama>
References: <20180604223911.14561-1-schnitzeltony@gmail.com>
	<CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
	<CA+chaQcz=Ckh2=zSUBi969N-v7dJG-K2F1OXLxtnG8JLUahXYQ@mail.gmail.com>
	<CAMKF1so+ux5C6v3x_uBqiF1PjrjuYBtT7ViayqMez-oS6SbwLA@mail.gmail.com>
	<CALbNGRRt+-YK_T60D-Cz-NfEbDZTRLy7bUCVgkqCyftGkshM9w@mail.gmail.com>
	<CA+chaQdCMFngAwgV2+5XY6RWf1qUTHzDpdJgFAjpyFe0RL62Eg@mail.gmail.com>
	<CALbNGRQxWvxbwc0UMwe7D1W9XhmWh3vHgb2exC2y6xNd3SE57Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQxWvxbwc0UMwe7D1W9XhmWh3vHgb2exC2y6xNd3SE57Q@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Thu, 07 Jun 2018 06:08:04 -0000
X-Groupsio-MsgNum: 72668
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline

--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 11:29:06PM +0200, Andreas M=FCller wrote:
> On Wed, Jun 6, 2018 at 8:18 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > It's not in oe-core master yet, there is branch from Khem I was using to
> > start the testing with gcc8.
> >
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc=
-8
> >
> OK - gcc8 - off to new challenges
>=20
> Andreas

I've added commit to meta-qt5 master-next with -fpermissive and verified
that it builds for me again.

Now when qtwebkit built ok, I see failure in qtwebkit-examples:
http://errors.yoctoproject.org/Errors/Build/60754/

This might be a bit more complicated to resolve, are you interested in
qtwebkit-examples as well or should we remove it as you did with
qtquick1?

And for qtquick1 removal, one more change is needed:
ERROR: Nothing PROVIDES 'qtquick1' (but
/OE/build/oe-core/meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb DEPENDS
on or otherwise requires it)

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWxjLxwAKCRA3VSO3ZXaA
HDcQAJ4p4g8v22B3yLsCMo6we2nWsujwDwCfXrPxZcqxrMON4NxLhF9hTbiEPJE=
=lrb0
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
