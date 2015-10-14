Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 159F0770B5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 19:21:22 +0000 (UTC)
Received: by wijq8 with SMTP id q8so96556390wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eb/k1q1CJTsRGbgpqBF6rxxFK3bVU/HxnW0/jZWbAoM=;
	b=QcOHh1GeJhTiJmFXZqfadJg7n/538Qncui7Y7yGfHcCNiyHyS0YjdGnGiMM356NNzN
	leVj7ch03F7n4i3iqL+xM0XmX2Df408OOCe5+eP4lo7PwE5O3AJpbpbl4zIMD3ZL4HES
	5oHCg1pcnW9UogWsM97zRghwPj5Q7xNOOE32KgzDRM3Ic8MvF9jnv0a9qvRkX+w/qQeI
	mYZ29sal9oHaOlzzYrbB0N4DGMmfCHFJyW0Lv7Hmm5XMXXHiwJtxPobMTzLlFYXdu4W1
	q48pd5vcmbj8ixiAcyxZ/w5avz2NnaCjWjeBpRdkz65drfX9LbkuImk2Z+8xT6i3pfEM
	vREA==
X-Received: by 10.194.235.39 with SMTP id uj7mr6702302wjc.115.1444850482803;
	Wed, 14 Oct 2015 12:21:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r9sm11779697wjz.35.2015.10.14.12.21.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 12:21:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2015 21:21:38 +0200
To: Paul Knopf <theonlylawislove@gmail.com>
Message-ID: <20151014192138.GG22448@jama>
References: <CAOaDmGXU7LhQmpTJu8oW-Mjyc2pRwNtNpvws2beOFCm7=MXTYg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOaDmGXU7LhQmpTJu8oW-Mjyc2pRwNtNpvws2beOFCm7=MXTYg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
Subject: Re: meta-qt5 daisy qtwebkit-examples bitbake error
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
X-List-Received-Date: Wed, 14 Oct 2015 19:21:24 -0000
X-Groupsio-MsgNum: 57828
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iAL9S67WQOXgEPD9"
Content-Disposition: inline

--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 11:39:46AM -0700, Paul Knopf wrote:
> Hey guys,
>=20
> Are you guys the right person to ask? I am getting a bitbake error when
> compiling the qtwebkit-examples recipe in the daisy branch.

openembedded-devel ML is better place to ask (see README)

> "bitbake qtwebkit-examples"
>=20
> I have attached the error file. Here are the relevant bits.
>=20
> Project ERROR: *Unknown module(s) in QT: webkit*
> ERROR: Error calling
> /home/pknopf/Yocto/evo/build/tmp/sysroots/x86_64-linux/usr/bin/qt5/qmake
> -makefile -o Makefile  -r
> /home/pknopf/Yocto/evo/build/tmp/work/core2-32-poky-linux/qtwebkit-exampl=
es/5.2.1-r0/qtwebkit-examples-opensource-src-5.2.1/
> qtwebkit-examples.pro
>=20
> Any guidance as to why I am getting this error?

Most likely you didn't enable all required PACKAGECONFIGs to build
qtwebkit. See comments in qtbase.inc.

> Many thanks in advance.
>=20
> --=20
> Thanks!
>=20
> ~Paul



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iAL9S67WQOXgEPD9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYeq0EACgkQN1Ujt2V2gBz4YwCeLXDInQyZ2fW3Zjgayb88b7TG
k3IAmgNBjg/N0LRJVJIwGgnknsM46F9k
=85Cj
-----END PGP SIGNATURE-----

--iAL9S67WQOXgEPD9--
