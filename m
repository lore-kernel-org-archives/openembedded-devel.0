Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 469227705E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 19:04:40 +0000 (UTC)
Received: by pasz6 with SMTP id z6so38001659pas.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=O26mE0RUXu8etCgAfHiblM/n0H0lX3J//P5jlW79Ja8=;
	b=lw0ijs1e0aZUs7SeKBQn3+w+3n0ydGwryod+x8WyN0oaj3Hg7MoGrEvCDR7PQMQ8yO
	bzweHX6yk3K5yvQQisvE+FL/+DOf4gxwrHZk+xoGsXy/mhkzjMnbgpcAnDImC2aBIWT1
	BgZ0TGjd9ndavrVoXctTnzSw+v/5Tlip9Ef6lUdPVam+7h1+A/xWDhzOBKl7lpEnWKk5
	ts62333xVmu4l1tkCxQIMs4jpbXXuLe6dEteCVa8h3Ghe7XwyNQ2yCn97gy83nyTGQgh
	MVYqK3tMRjnHgAlk4SpTVLYWDwu7q8RHlu4z+YsESs4OxMpBrZdTUDKC3LmQqisTvtWR
	VVmw==
X-Received: by 10.68.88.130 with SMTP id bg2mr36651725pbb.38.1445281480594;
	Mon, 19 Oct 2015 12:04:40 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:9064:573b:ae09:e7f6?
	([2601:647:4c02:370d:9064:573b:ae09:e7f6])
	by smtp.gmail.com with ESMTPSA id
	xm4sm38019195pab.27.2015.10.19.12.04.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 19 Oct 2015 12:04:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5624E6E5.2000302@pseudoterminal.org>
Date: Mon, 19 Oct 2015 12:04:35 -0700
Message-Id: <B177DF29-0D08-48E4-A293-6A1D95FB9C1E@gmail.com>
References: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
	<1443016567-15788-2-git-send-email-dv@pseudoterminal.org>
	<20151008102504.GJ2385@jama> <5624E6E5.2000302@pseudoterminal.org>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3096.4)
Subject: Re: [meta-multimedia][PATCH 2/5] aalib: add new recipe
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
X-List-Received-Date: Mon, 19 Oct 2015 19:04:41 -0000
X-Groupsio-MsgNum: 57919
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1C91BCE6-B668-4561-AB1B-FDC55C962CC2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1C91BCE6-B668-4561-AB1B-FDC55C962CC2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 19, 2015, at 5:49 AM, Carlos Rafael Giani =
<dv@pseudoterminal.org> wrote:
>=20
> Strange. This built fine for me, with the current master and MACHINE=3D =
qemux86-64 . Nevertheless, I'll add a CFLAGS_append =3D " -fPIC " line.

hmm, do you mean x86_64 or x86 qemu ? I would understand if it worked =
with x86/32bit since x86 dereferences GOT entry directly, whereas x86_64 =
uses PC-relative offset to load global data and since global symbols can =
be overridden PC-relative offset won=E2=80=99t work for .so on x86_64 =
and thats what you are seeing in build break message when its not built =
with PIC. With -fPIC compiler would turn this into  pointer to GOT entry =
which then can be dereferenced.

So I would have expected it to fail in same way for qemux86-64 but might =
succeed on qemux86



>=20
> On 10/08/2015 12:25 PM, Martin Jansa wrote:
>> On Wed, Sep 23, 2015 at 03:56:04PM +0200, Carlos Rafael Giani wrote:
>>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>>> ---
>>>  meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb | 16 =
++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>  create mode 100644 =
meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
>>>=20
>>> diff --git =
a/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb =
b/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
>>> new file mode 100644
>>> index 0000000..06c4e5e
>>> --- /dev/null
>>> +++ b/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
>>> @@ -0,0 +1,16 @@
>>> +DESCRIPTION =3D "AAlib is an portable library for rendering =
graphics as ASCII art."
>>> +HOMEPAGE =3D "http://aa-project.sourceforge.net/aalib/"
>>> +SECTION =3D "libs"
>>> +
>>> +DEPENDS =3D "ncurses"
>>> +
>>> +LICENSE =3D "LGPLv2"
>>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc605"
>>> +
>>> +S =3D "${WORKDIR}/aalib-1.4.0"
>> Fails to build
>> http://errors.yoctoproject.org/Errors/Details/20262/
>>=20
>>> +
>>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/aa-project/aalib-${PV}.tar.gz"
>>> +SRC_URI[md5sum] =3D "d5aa8e9eae07b7441298b5c30490f6a6"
>>> +SRC_URI[sha256sum] =3D =
"0b214b98850f559e0a9ef7282de2ff336b094e1aacedefff3ffa50f07711db58"
>>> +
>>> +inherit autotools
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
>>=20
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_1C91BCE6-B668-4561-AB1B-FDC55C962CC2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYlPscACgkQuwUzVZGdMxQbMQCfVERG/JTO+lQWO1KtcET7wgSH
7DsAnAuqpATZWN38ecYiNvgh/U0M8zlA
=tM/U
-----END PGP SIGNATURE-----

--Apple-Mail=_1C91BCE6-B668-4561-AB1B-FDC55C962CC2--
