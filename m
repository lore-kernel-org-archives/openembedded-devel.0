Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EA2AB605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 10:37:44 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id 191so45318004wmq.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 03:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eRtyoPNsXCk9uCuXqKlLiUya16/yBA4XzioNcYIyRVU=;
	b=YEG5Hmj3erUkaEVc1WSCdrqFxA7Gl3eFdlKa6QTcx9pP9FIP4im/Oe/TIUjrVZUn5s
	4r3sfjPksr4Sx6DSrsk8K5T27bFAyEqx2orXAlc8TUKfyQqbtqcDN+iwFMPg4meQwXwF
	FtzzpCNKnQRxSHxvs3BQ4ysbhR/ktYNNo39ucNN7psoJtOjTOjHI4dkbnZZcRaihvgvG
	bt7xTd1YPJe3hkGc8z59fGksjIcBpMKlWsFWE5og2KXAryJ1Yl2KWvNY8I/1XRaNUfJ2
	lPc0NvxeDg3ZIdbfBBrBijUm1j8EKTl/tXriWnUnh4UXlvYsykNUIvQeKjnUrFnBtKi6
	aYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eRtyoPNsXCk9uCuXqKlLiUya16/yBA4XzioNcYIyRVU=;
	b=cWyS4atI1GE/QA1Y2+9Vgh0eU1FG3M6tB9tNaBwdPYI+/a9alD+HL8ZoMbqT5Tn3cE
	ew6sGQhURPVNENyC0WNiIVy255gmBwwJYtv5BgQDmZPozAdxYxJF4CXXh/4b0hkla5Jc
	InPbZ5/nhjiFPHvMFHIZHuuJ8EKcwToDQnCvptfJSkSqnYzrjhqLkKR/VxdarBNXee81
	6NqhrkbIeocTWw9b0zxM171EbgmN2jT9ryjKU61bg8DTT2NfKcFN8EJ+hc618bAvAQvq
	ECF9dTgafBWLQzGu8+ZQ+mfyrN1eylMuWtGxDy0Yb3oSp9/4egdOyDuxNF43ClDVLBX7
	arEw==
X-Gm-Message-State: AD7BkJJUr9GjvMok8ttbFq6t7xgjA77+PI10OfpPW2jOILjEjk32y6TXdoshrgOnt5BylQ==
X-Received: by 10.28.221.9 with SMTP id u9mr14749603wmg.92.1459247864748;
	Tue, 29 Mar 2016 03:37:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m141sm14107831wma.3.2016.03.29.03.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Mar 2016 03:37:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Mar 2016 12:37:37 +0200
To: Javier Viguera <javier.viguera@digi.com>
Message-ID: <20160329103737.GA2555@jama>
References: <1457543217-11211-1-git-send-email-akuster808@gmail.com>
	<20160309191156.GH2542@jama> <56E07715.8060801@gmail.com>
	<CAD1M062aSMPUfMzCKZ2+8uZcV0q77sm3WHwvQexY2x5uO9hV+g@mail.gmail.com>
	<20160317215442.GL2553@jama> <56FA51DF.3070606@digi.com>
MIME-Version: 1.0
In-Reply-To: <56FA51DF.3070606@digi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][jethro][PATCH][V2] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Tue, 29 Mar 2016 10:37:46 -0000
X-Groupsio-MsgNum: 60720
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2016 at 11:58:55AM +0200, Javier Viguera wrote:
> On 17/03/16 22:54, Martin Jansa wrote:
> >
> > I'm still seeing multiple issues caused by last openssl upgrade, e.g.
> > ruby, pywbem, crda
> >
> > Are they all supposed to be fixed by this?
>=20
> Well I just did a basic build tests with the three mentioned above=20
> (ruby, pywbem and crda) and these are the results:
>=20
> RUBY
> ~~~~
> I don't see any difference with or without the patch, it's building fine=
=20
> even without the patch but the patch does not hurt either.
>=20
> PYWBEM_0.8.0
> ~~~~~~~~~~~~
> Without the patch fails with:
>=20
>    File=20
> "/ssd/dey/jethro/x11/ccimx6sbc/tmp/sysroots/x86_64-linux/usr/lib/python2.=
7/site-packages/M2Crypto/_m2crypto.py",=20
> line 24, in swig_import_helper
>      _mod =3D imp.load_module('__m2crypto', fp, pathname, description)
>    ImportError:=20
> /ssd/dey/jethro/x11/ccimx6sbc/tmp/sysroots/x86_64-linux/usr/lib/python2.7=
/site-packages/M2Crypto/__m2crypto.so:=20
> undefined symbol: SSLv2_method
>=20
> With the patch PYWBEM builds fine.
>=20
> CRDA_3.18
> ~~~~~~~~~
> Without the patch fails with:
>=20
> NOTE: make -j 8 MAKEFLAGS=3D=20
> DESTDIR=3D/ssd/dey/jethro/x11/ccimx6sbc/tmp/work/cortexa9hf-vfp-neon-dey-=
linux-gnueabi/crda/3.18-r0/image=20
> LIBDIR=3D/usr/lib/crda LDLIBREG=3D-Wl,-rpath,/usr/lib/crda -lreg all_nove=
rify
>    GEN  keys-gcrypt.c
>    Trusted pubkeys: pubkeys/linville.key.pub.pem=20
> pubkeys/sforshee.key.pub.pem
> ERROR: Failed to import the "M2Crypto" module:=20
> /ssd/dey/jethro/x11/ccimx6sbc/tmp/sysroots/x86_64-linux/usr/lib/python2.7=
/site-packages/M2Crypto/__m2crypto.so:=20
> undefined symbol: SSLv2_method
>=20
> With the patch CRDA builds fine.
>=20
> So I would say that the patch improves the situation. It fixes the build=
=20
> for some packages and does not seem to break anything.
>=20
>=20
> I'm also having build failures for CRDA since almost a month now, so I=20
> would like to have the 'jethro-next' merged to 'jethro' as well.

Thanks for testing.

ruby fix is pending in:
http://lists.openembedded.org/pipermail/openembedded-core/2016-March/119582=
=2Ehtml

I've merged jethro-next in meta-oe repo.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb6WvAACgkQN1Ujt2V2gByflgCdHIAaomAikNSPdvWs2xN03jPi
a3oAnA94ukwWqOajIsH1GGLBQdGQzG5E
=M8Pd
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
