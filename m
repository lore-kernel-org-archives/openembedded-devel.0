Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id E5258605FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 21:41:24 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id cy9so281111pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2016 13:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=lVbb/3arhWo078cmIe0vgdW9f7+lAmGZu57KGEYFXsA=;
	b=QJgDb06G5Ac0OmnODgTk32px5/f/P3OG5U8w3qPpDI42IWeYJa58L/AWQXRmK/Ak6/
	cDUD05RIMYr6lcL1GzMQCO9JuHsTlRQxqT1/I3UUs+h66kNKFQ5qqyF1lpk0/E3frr8s
	/pqweqzSEuLG4DcqoRulVs1SkKifhEcRkfPawgVqANmmpTShEjgo8UGX8EgmAiovDCld
	Ipbfe/PjwUddGwibTovYho3Eq0uOSQfK6wsXQAxa6p2ee86odIsIlJzIOTC9XycLb0MQ
	H4dBhL31UB3aP+OQCpNGelcil5KKiKTj+pLXGYT5XwQyC6sAviHBzih4WOair5aRutMF
	TeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=lVbb/3arhWo078cmIe0vgdW9f7+lAmGZu57KGEYFXsA=;
	b=k4EE26iyPo9sIkRzf/L1UEIiBFNaR7lYcyhJQN1qhGtATPRI3NZV6mAssRyhjS0WEC
	yXGXbFJF7kgL0t7maUaeCjak5koCKrS9wY8PO9lrJPqRmsWWoEV0FayI7urmiAIo/C1g
	Cd3jVCoCGwbtiaGXIwUBtrpxzygs3mJoxo0VRf31Wu2t44A4ZXMgOsyEqAnESlUbrI3i
	4Byync+ZPskd4FHUScQQgd/bhoR/HmHhjZJcr8qLIbMuzveS3ZVYq9LebuV5ClVdPXAO
	CLKkLICiypoH0PreY+kp2/IPMh9BqwJb15jOotCe1IEnnVm+Ojj3Qi2DnvBaYzUqym2B
	PvuA==
X-Gm-Message-State: AG10YOS6xj8WLx1WeTYv4a6kq/zGjQp7tg/NI27hx+LBGBLyBquiGKQI9U+U8u6sYyXZjA==
X-Received: by 10.66.255.70 with SMTP id ao6mr53375064pad.64.1455054085508;
	Tue, 09 Feb 2016 13:41:25 -0800 (PST)
Received: from ?IPv6:2601:647:4c01:b37d:e5a8:e0e5:4a2:bc3e?
	([2601:647:4c01:b37d:e5a8:e0e5:4a2:bc3e])
	by smtp.gmail.com with ESMTPSA id o17sm5689pfj.50.2016.02.09.13.41.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 13:41:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56BA4BBC.6030800@gmail.com>
Date: Tue, 9 Feb 2016 13:41:19 -0800
Message-Id: <49B177ED-5022-473E-85FD-2CF254C27499@gmail.com>
References: <cover.1454879225.git.akuster@mvista.com>
	<8239925181787e297b39460fc9d4dd953f9ce946.1454879225.git.akuster@mvista.com>
	<20160209180833.GA2608@jama> <56BA4BBC.6030800@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 7/7] krb5: Fix warning.
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
X-List-Received-Date: Tue, 09 Feb 2016 21:41:25 -0000
X-Groupsio-MsgNum: 59916
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C0379278-CB4A-45F1-9D93-694D47168B78";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C0379278-CB4A-45F1-9D93-694D47168B78
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 9, 2016, at 12:27 PM, akuster808 <akuster808@gmail.com> wrote:
>=20
>=20
>=20
> On 02/09/2016 10:08 AM, Martin Jansa wrote:
>> On Sun, Feb 07, 2016 at 01:11:59PM -0800, Armin Kuster wrote:
>>> From: Armin Kuster <akuster@mvista.com>
>>>=20
>>> WARNING: =
/tmp/work/armv5e-poky-linux-gnueabi/krb5/1.12.2-r0/krb5-1.12.2/src/ =
('S') doesn't exist, please set 'S' to a proper value
>>>=20
>>> remove extra "/"
>>=20
>> This patch isn't in master and master still has trailing /, why is =
this
>> needed for fido only?
>=20
> I only saw it occur in fido.

it doesnt change any functionality if its included in master too =
moreover makes back port easier.
so lets apply it to master as well.

>=20
> - armin
>>=20
>>>=20
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ---
>>> meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb =
b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
>>> index c492496..c19fffb 100644
>>> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
>>> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
>>> @@ -33,7 +33,7 @@ SRC_URI =3D =
"http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
>>> SRC_URI[md5sum] =3D "357f1312b7720a0a591e22db0f7829fe"
>>> SRC_URI[sha256sum] =3D =
"09bd180107b5c2b3b7378c57c023fb02a103d4cac39d6f2dd600275d7a4f3744"
>>>=20
>>> -S =3D "${WORKDIR}/${BP}/src/"
>>> +S =3D "${WORKDIR}/${BP}/src"
>>>=20
>>> PACKAGECONFIG ??=3D "openssl"
>>> PACKAGECONFIG[libedit] =3D =
"--with-libedit,--without-libedit,libedit"
>>> --
>>> 2.3.5
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_C0379278-CB4A-45F1-9D93-694D47168B78
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla6XQMACgkQuwUzVZGdMxTGkACdGhJNLlswAXlwW6XCwf8sEHT8
2ggAn3DCU9wk1gwbjUj5iGhEZ5IAX+4i
=5tid
-----END PGP SIGNATURE-----

--Apple-Mail=_C0379278-CB4A-45F1-9D93-694D47168B78--
