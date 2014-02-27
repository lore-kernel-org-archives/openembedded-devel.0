Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 849306F273
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:27:29 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so2726427pad.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 08:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=Jtcnco8RHayn8uyy1p1MGcucIFgs2nTCwc6QReZrpUU=;
	b=B01UlvCHbzc7mrIV5A7fF2chYQvob/QJ9mFdY0trP6IdmAPY/47FUEJiS6Y+Vt/a+W
	TeH3qvp+OYRT8VMOHua9G62/HlwGHAJxBchqSYuiI+zIMlycNMqEacj7RcsOFgnmwLg7
	ghzoYNxVg1M7i0cjfLfj+R1c4y8+9zgJY3+Nw7ZbHsaScDxNGq8/8W8+/RkX1Jjya6Xn
	IfZ2Ij6EXlgK32jYUA9w2MBbzR6zh3jQNjLuN86Nc/GINI1ljinTuyMmD+hwDP0m+d9N
	BE2pMxmK2Nt0VKZRAWC1tgVFv9AJc0DfTWT2HYO226n35TlGIs+w1MAglwhmgj6weYac
	xwMg==
X-Received: by 10.68.171.193 with SMTP id aw1mr14033520pbc.117.1393518449964; 
	Thu, 27 Feb 2014 08:27:29 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id yz5sm34471835pac.9.2014.02.27.08.27.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 08:27:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <E5A97060-2D17-4BE7-AF39-4AC7FA044B0F@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Date: Thu, 27 Feb 2014 08:27:27 -0800
References: <1393456501-30516-1-git-send-email-Martin.Jansa@gmail.com>
	<1393456501-30516-2-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1spDft7cojVXq0Q7mtmDNTdXTsr-5A1nGVxAYUJVHN6eKw@mail.gmail.com>
	<20140227094852.GX26981@jama>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <20140227094852.GX26981@jama>
X-Mailer: Apple Mail (2.1827)
Subject: Re: [meta-oe][PATCH 2/2] ode: upgrade to 0.13
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
X-List-Received-Date: Thu, 27 Feb 2014 16:27:31 -0000
X-Groupsio-MsgNum: 48402
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8476534F-B62A-41CF-BE77-2A2D0DA7447C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8476534F-B62A-41CF-BE77-2A2D0DA7447C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Feb 27, 2014, at 1:48 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Wed, Feb 26, 2014 at 04:07:01PM -0800, Khem Raj wrote:
>> On Wed, Feb 26, 2014 at 3:15 PM, Martin Jansa =
<martin.jansa@gmail.com> wrote:
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>> meta-oe/recipes-support/ode/ode_0.13.bb | 27 =
+++++++++++++++++++++++++++
>>> meta-oe/recipes-support/ode/ode_0.9.bb  | 28 =
----------------------------
>>> 2 files changed, 27 insertions(+), 28 deletions(-)
>>> create mode 100644 meta-oe/recipes-support/ode/ode_0.13.bb
>>> delete mode 100644 meta-oe/recipes-support/ode/ode_0.9.bb
>>>=20
>>=20
>> git format-patch -M please
>>=20
>>> diff --git a/meta-oe/recipes-support/ode/ode_0.13.bb =
b/meta-oe/recipes-support/ode/ode_0.13.bb
>>> new file mode 100644
>>> index 0000000..8e9eb15
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/ode/ode_0.13.bb
>>> @@ -0,0 +1,27 @@
>>> +SUMMARY =3D "ODE is an Open Source Physics Engine"
>>> +SECTION =3D "libs"
>>> +HOMEPAGE =3D "http://www.ode.org"
>>> +LICENSE =3D "LGPLv2.1 & BSD"
>>> +LIC_FILES_CHKSUM =3D " \
>>> +    file://COPYING;md5=3D1de906ee96808d9776dd72a5f9a79a22 \
>>> +    file://LICENSE.TXT;md5=3D771782cb6245c7fbbe74bc0ec059beff \
>>> +"
>>> +# LICENSE-BSD.TXT is missing in 0.13 tarball, but COPYING still =
says it's dual licensed
>>> +# and svn repo still contains LICENSE-BSD.TXT so maybe it will =
return in next tarball
>>=20
>> can this be added as a patch ?
>=20
> Yes, but I don't know the real intentions in upstream, so I would =
rather
> keep it as comment and return it in next release (if they return it as
> well).

OK fair.



--Apple-Mail=_8476534F-B62A-41CF-BE77-2A2D0DA7447C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMPZ28ACgkQuwUzVZGdMxQuKACcCCwECeboQ18iimwZ0Ip42bCw
tbIAn3jdk5+4WGZy1aBFQ+F93GUKPgtZ
=yE0t
-----END PGP SIGNATURE-----

--Apple-Mail=_8476534F-B62A-41CF-BE77-2A2D0DA7447C--
