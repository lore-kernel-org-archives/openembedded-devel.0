Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5CDD373695
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:24:58 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so224743839wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 04:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=tmXpfF9ZI+TQtNGbmEV+UMz0BlryvIT6NOprjIo4j2M=;
	b=jxpZijqAbEy4RoB1c5YgE6z3+CB5QBwrfvqpKDKkcV9SCDEhwYoYfBSsgMzefDwJPy
	eV2j5Wl0h3WFRDP+/Le5+vtZ5vSdUC+ICkLdGKCY+TfVjvbEXxGyELzz9Rnbf42d5+zW
	ipPTYnGZaGA4PEzjuNuujWQNlpMBA7ylbhhRexPiwOE0e3od3/4+a9Np9ikMncYnR0WG
	W2urrpgDOAwnYhLuNTEAjyEoEzUvPK7lHvXX9L6umJwNa3/Zq6ZXFQWXrmW6Jd3WkGco
	c/EqBlR6SiENfcnhZIFRDKyKyMkRuP/oauL+v1Sr33OonvNoDHKcM+yZfSH6YW4BjvYm
	ERug==
X-Received: by 10.194.122.164 with SMTP id lt4mr1526699wjb.16.1446117897831;
	Thu, 29 Oct 2015 04:24:57 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	jt9sm1304848wjc.24.2015.10.29.04.24.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Oct 2015 04:24:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
Date: Thu, 29 Oct 2015 12:24:55 +0100
Message-Id: <9E01DDA7-C832-4E17-B17A-25850D0B27B5@gmail.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
	<A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
	<CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 29 Oct 2015 11:25:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 29.10.2015 um 11:46 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Thu, Oct 29, 2015 at 7:22 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>> Am 29.10.2015 um 08:41 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>>> To cite Otavio:
>>> We could rename the patches directory for openjdk-7 and avoid the
>>> version number on it. This would make easier for upgrades and to see
>>> the diff between the patches.
>>=20
>> So git diff -M doesn't work for you? I don't understand the =
reasoning.
>=20
> It does but reusing the directory easy the upgrade and as the
> openjdk-8 is in maintenance it is expected that it does not change
> much in the patches.

Partial. As I told you, I updated OpenJDK from 8u40 to 8u72 when I first
encountered massive crashes on the target device with zeroshark until
llvm guys told me, that legacy JIT for ARM was utterly broken and they
force people to MCJIT.

Having both directories during the upgrade helped me massively to
avoid breaking patches by fixing against new upstream adoptions.

Surely, this could be handled developer-side by keeping an foo.old
directory - but it smells the same smell ;)

I don't fight against renaming the directory, I just argue, both
way have their own kind of smell.

>>>> create mode 100644 recipes-core/openjdk/openjdk-8-common.inc
>>>> create mode 100644 recipes-core/openjdk/openjdk-8-cross.inc
>>>> create mode 100644 recipes-core/openjdk/openjdk-8-native.inc
>>>> create mode 100644 recipes-core/openjdk/openjdk-8-native_72b00.bb
>>>> create mode 100644 recipes-core/openjdk/openjdk-8-release-72b00.inc
>>>> create mode 100644 recipes-core/openjdk/openjdk-8_72b00.bb
>>>> create mode 100644 recipes-core/openjdk/openjre-8_72b00.bb
>>>=20
>>> Furthermore I had problems building OpenJDK-7 with this patch =
applied.
>>> But I will verify that again and come back to you!
>>=20
>> Yes, please :)
>>=20
>> I'm sorry that I cannot verify on own, because OpenJDK-7 still =
requires X11
>> and I have no X11 available in my distro and not enough resources to =
create
>> a playground for such things :(
>>=20
>> But with sane errors I'm happy to dig and fix.
>=20
> Once we merge this, I would like to try to simplify the recipes a
> little. Maybe avoiding the .inc files as much as possible as it makes
> harder to follow the code and in fact we just support (and this should
> not change) a single version for each openjdk major version.

I tried to reuse as much as possible from existing *.inc files, but

OpenJDK-7 is derived from icedtea-2.1 - which has a complete different
approach to build. OpenJDK-8 is plain, pure OpenJDK with it's own set
of pitfalls, smells and edges. Unfortunately figuring that all out costs
me days to adopt code from common.inc in a way both can use until I
finally gave up because of to many weird assumptions in =
openjdk-common.inc :/

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


