Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id A02CA70BED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:16:31 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so9858535wev.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=khEuej0EZHyYlWysNjA9qo4e1xl4fotKZ51OvfeqXP0=;
	b=z7OobmTUHzLTDPTfyLmQDDxzC8AoYXm8wsdJ1fNsAIxmu5yoEoqOqQSbiE25f1NMwQ
	u7pkxUsASKjvyryxrMS3artma0IH1HbGpHED05XH+oVZxe+rvzCT+L8eww3O7qTUWOaU
	knT/bovkULMomcy+xlg3rhTamHE/Tcym8VXEVy5BlvFLql8Yap85aKhiGB5pcQAUJ2+P
	I/Uw6hYaN1iFc6mfTs+nHJ3mBtIICq4jmH2SstG8sB4IZS9mGk0c1adBA2JL5nXCJpxJ
	KlhpRH0J0u3V85k/74jGUeo0yjYcnyYznmk4TxB3gHZ985k5+2+rhnn19vWG4GaHmxFD
	DBug==
X-Received: by 10.195.13.102 with SMTP id ex6mr4682747wjd.48.1407845792197;
	Tue, 12 Aug 2014 05:16:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb12sm8855592wjc.43.2014.08.12.05.16.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:16:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 14:17:07 +0200
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140812121707.GL14848@jama>
References: <CAP9ODKoPbC6qvtDq938R_1VZ4f27MrJJDMvOxKV88C2My519rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoPbC6qvtDq938R_1VZ4f27MrJJDMvOxKV88C2My519rw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Daisy pending backports
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
X-List-Received-Date: Tue, 12 Aug 2014 12:16:38 -0000
X-Groupsio-MsgNum: 51619
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9YN9ZTPY3QamVFSy"
Content-Disposition: inline

--9YN9ZTPY3QamVFSy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 05:08:21PM -0300, Otavio Salvador wrote:
> Hello,
>=20
> here goes the pending backports I am aware of:

Pushed together with:
[meta-oe][daisy][PATCHv] ltrace: add PV and PACKAGECONFIG for libunwind
acked by you and Armin earlier

I'll send another small batch with daisy fixes.

> commit 9c762b824cbf7ecd9ce7f7859d22ff89c59fa28d
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Mon Aug 4 15:38:34 2014 -0300
>=20
>     evtest: Stop using Cgit based archive
>=20
>     The Cgit based archive may change depending on the order of images,
>     timestamp and like causing checksum to change.
>=20
>     This patch uses the same 1.25 version but fetching it using Git, so no
>     code changes are done.
>=20
>     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>     Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>     Acked-by: Cliff Brake <cbrake@bec-systems.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> This one has been acked by all Daisy maintainers so please merge this.
>=20
>=20
> commit 1fe211750e11420095dd29e08eba4bb615d9ffca
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Tue Jul 1 10:56:02 2014 -0300
>=20
>     opencv: Disable 'gtk' backend if X11 is not available
>=20
>     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> This one is new and Cliff and Armin need to review it.
>=20
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9YN9ZTPY3QamVFSy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPqBcMACgkQN1Ujt2V2gBw+WQCgp1uJLZxbMirmq0ZZ4VOe9Yen
ZK4Anjpia4sAB57ttd6AAa+pCPBEe6zb
=bqBp
-----END PGP SIGNATURE-----

--9YN9ZTPY3QamVFSy--
