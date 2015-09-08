Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id BF66A75E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 07:29:05 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so109207840wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 00:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BNlCZ//Yrp6OBtsWxYdd3jbl6fPVAIqJDzP6+FpryaM=;
	b=qP8DOJF0WlWVZtdUJrtgTlPdKRvJonEXRAKJsgLuo54H4GloA0gAPHX02mUBYZwjDM
	NRKOnU8QDNe8IiYev5+NQCxdgQCRRFs3M6/ZRLjV/LsZa6SNj6+0gmSYEIiJuXR9kAGj
	On7gVLs2Tk3PQJP5hfxabQ5UZbo6MdWyGUD+sE6OcIB+WOllJI7idMsZfqgZ5HfX/2n7
	Y4f8gHr1NVZpRuee40eoAR4RU2mVA+SCPUH4OpYJMjK1F+ktxsxiE/9MOeGu0m1h0xaS
	7oFAloVQTF71j9Q9P1O99BiGwj5EjY84dyzT8E3sIBCEts77BQPEeUcOPxVbWC8AE4qg
	IOwQ==
X-Received: by 10.180.85.103 with SMTP id g7mr29170413wiz.93.1441697345703;
	Tue, 08 Sep 2015 00:29:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bg4sm3173419wjc.46.2015.09.08.00.29.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 00:29:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Sep 2015 09:29:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150908072947.GC2457@jama>
References: <20150908064901.GA2368@lws-christ>
MIME-Version: 1.0
In-Reply-To: <20150908064901.GA2368@lws-christ>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5] Backport fix for qt5-opengles2-test to fido?
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
X-List-Received-Date: Tue, 08 Sep 2015 07:29:07 -0000
X-Groupsio-MsgNum: 57240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 08:49:01AM +0200, Stefan Christ wrote:
> Hi,
>=20
> I'm currently using the fido branch of meta-qt5 and having troubles with =
the
> qt5-opengles2-test program. It segfaults on start.
>=20
> The problem is fixed by the following commit in the master branch.
>=20
>     commit 6d9e2a6dfc21f7d9a3a11b4bcb426b5dfe6feaeb
>     Author: Andreas M=FCller <schnitzeltony@googlemail.com>
>     Date:   Sat Jun 13 09:02:55 2015 +0200
>    =20
>         qt5-opengles2-test: update to last commit
>        =20
>         * don't segfault in case qtsensors does not find accelerometer va=
lues
>        =20
>         Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>         Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Is it possible to backport this patch to fido?

Yes, will do in next few days. Thanks for bringing this up.

> Mit freundlichen Gr=FC=DFen / Kind regards,
> 	Stefan Christ
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXujmoACgkQN1Ujt2V2gBwfgwCeNMEfnITL3Ehuudv/s9gBtU6R
SJ8AnRwVL6v/ahN9bcwpQTJKU2xTpixT
=n68D
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
