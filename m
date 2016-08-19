Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90C2A76EBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:45:16 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cf3so3646713pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=keO8ZSDdfI9NSg0swlNzZ2ZDI0UBlYdilnjJoZFJg2Q=;
	b=vZFfhWt+QTCyrjK5rj0INTue3xmSDf6Pvtbs1pMeyJdJ3hJAavDH7MP33qSz6INMLU
	6h+wwemEeMShyxri6IP3aONWQ+OzKuL+i9WSGoPRXexvfPgXeR0d7FPRtHQGh9BqLXXF
	6zFnD+fpvWBJ6BOAqobnsT0RG1uOFVLRMIjus+3LdHiiqA4AlUrKYISWyluBlkCVH6NE
	/PQOksdjGV0zCBj6EVBRSjxTHrlO3ZCA9Ue8WcHhCESH3Tl4ZndCNt8VjGAbABih6csX
	evnDb9toL9adUmFDjShyKMiFAkZk25W8IMaTS6TDWSGg8IXL4mlzZDgyjy7L5Oq0hNr3
	7Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=keO8ZSDdfI9NSg0swlNzZ2ZDI0UBlYdilnjJoZFJg2Q=;
	b=UNzPrYzENmsPIkcHjezDohQaebxpVe/FWSP1pamT4ZHAC9NPYgo9gQVNG9SY7aW/fz
	CW7DOoKRrOLKaJzpJSfqqH+e4srzBMV0UrjsEc8hu4HCV6ezn4tgIvDh7OtKvqtUyOKH
	iJ08jHO8tBJwyNQRjmEtF8Vbt6gYFW4WKscFW7xhwksAhpFbXhLeE9Iivy66oMvBz62d
	1Vqwzd5J+gcQ7g5cgBgbHTM4Kk9dDEixvkFn04ME7ezGf1VHlYNJjKyZ7JtRGPr51FeD
	tZVrCST3psK+/y6pPyLRQOgfqAceNdn5DIa4TeaLq9GHk7v0eKPgsOuE96hmKsbllwJP
	3NNQ==
X-Gm-Message-State: AEkooutrS7Xbu8OcLSBC0AAGn8lRHIhvhuOQoftTS37E+wMJYEQdzCGY+A/2e6+L3omUcA==
X-Received: by 10.66.81.200 with SMTP id c8mr15543669pay.70.1471625116722;
	Fri, 19 Aug 2016 09:45:16 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4?
	([2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4])
	by smtp.gmail.com with ESMTPSA id
	r10sm7787741pfk.84.2016.08.19.09.45.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 09:45:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471601356.24738.2.camel@andred.net>
Date: Fri, 19 Aug 2016 09:45:13 -0700
Message-Id: <6D158A0E-2985-4E77-884E-6DE51CA554D0@gmail.com>
References: <cover.1471600808.git.yi.zhao@windriver.com>
	<0159b82ac947ad69460adcec9d79ee83b76d2a7b.1471600808.git.yi.zhao@windriver.com>
	<1471601356.24738.2.camel@andred.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-networking][PATCH 1/3] ifenslave: fix QA warning for GNU_HASH
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
X-List-Received-Date: Fri, 19 Aug 2016 16:45:16 -0000
X-Groupsio-MsgNum: 62757
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DA6B7709-CB73-4FDA-8204-580706059209";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DA6B7709-CB73-4FDA-8204-580706059209
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 19, 2016, at 3:09 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>=20
> On Fr, 2016-08-19 at 18:04 +0800, Yi Zhao wrote:
>> Set LDFLAGS explicitly for do_compile
>>=20
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>  meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git =
a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
>> b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
>> index acc0864..385bc80 100644
>> --- a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
>> +++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
>> @@ -10,7 +10,7 @@ SRC_URI[md5sum] =3D =
"56126cd1013cefe0ce6f81613e677bdd"
>>  SRC_URI[sha256sum] =3D
>> "7917bf34de80a2492eb225adf9168c83a4854ac8a008ed0fd5b3fd147ccd3041"
>>=20
>>  do_compile() {
>> -    ${CC} ifenslave.c -o ifenslave
>> +    ${CC} ${LDFLAGS} ifenslave.c -o ifenslave
>=20
> While you're fixing the gcc invocation here, wouldn't it make sense to =
add
> CFLAGS as well? (Maybe in a separate patch).
>=20

yeah or into two distinct steps of compile and link.

>=20
> Cheers,
> Andre'
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_DA6B7709-CB73-4FDA-8204-580706059209
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle3N50ACgkQuwUzVZGdMxQmJQCfUXCoS9Dh67wcGoM/jTm3xd24
OkwAn2iV61+F/GnR1uBdeOkyFjVCiAkL
=Icce
-----END PGP SIGNATURE-----

--Apple-Mail=_DA6B7709-CB73-4FDA-8204-580706059209--
