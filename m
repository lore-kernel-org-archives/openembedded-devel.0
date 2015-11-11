Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id ED18D77087
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:18:01 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so68542273wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=2aynmVEdinWOspSmnskvYgFoBbIoan2LFkdRQog4nz4=;
	b=SOzeXlHCNOoJLrMj7aj7ar3iSI8LVngPga+1yeUF38xXIhOQunvB0GZc+8b+XF0DXd
	N38p+0/+m6L0g6yfTRwcbgBW6dw4mCtzMlxHlBF63pTUxlmjf/77cZWWYycIp6fMjPuf
	BfnDpGdlD1SORPeTC342lf1sB5EdArsukm/NBL3fImv5pHKPEI41dULCTvgcWzN+gPT4
	dv5V6w9VHIGn4IKGUvnQi7D4pVKNnkGCb5TFmd/uBMr4UqGLxT4hSFBPiHLCONZv90wA
	GVe+FeLfDtRtvI/Q/Mn13ojJAiiHhRRMZZDIoRsZAX7BsDsX5Aa152itT7Nv/nH6x3H2
	H8zg==
X-Received: by 10.194.200.5 with SMTP id jo5mr13151700wjc.79.1447265881285;
	Wed, 11 Nov 2015 10:18:01 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	it4sm10243622wjb.0.2015.11.11.10.17.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Nov 2015 10:18:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAMKF1sq_z9k6okHK24oFmExqP7F2eJ_nvX70nDsb+-rAH+gQZg@mail.gmail.com>
Date: Wed, 11 Nov 2015 19:17:58 +0100
Message-Id: <B3CC41C2-7DBD-4C63-8A6B-81A8367392AF@gmail.com>
References: <33A5922B-6B36-4862-8261-4F59E0AF12AD@gmail.com>
	<892C1CD0-EAD9-4692-A296-B5635FE35385@gmail.com>
	<FE25E51D-6F1B-4DB0-8391-9B8B152ECF3F@gmail.com>
	<CAMKF1sqbxs3SDGdKMzrWsYv887M=EUe200owKo=7ZZ3gWivmKA@mail.gmail.com>
	<DDE21F3D-050E-449A-8ED0-72BACAA59D43@gmail.com>
	<CAMKF1sq_z9k6okHK24oFmExqP7F2eJ_nvX70nDsb+-rAH+gQZg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: =?utf-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 3/3] libldb: make openldap optional, but default
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
X-List-Received-Date: Wed, 11 Nov 2015 18:18:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 11.11.2015 um 19:10 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> On Wed, Nov 11, 2015 at 9:47 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>>> Am 11.11.2015 um 18:34 schrieb Khem Raj <raj.khem@gmail.com>:
>>>=20
>>> On Wed, Nov 11, 2015 at 1:11 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>=20
>>>>> Am 11.11.2015 um 04:26 schrieb Khem Raj <raj.khem@gmail.com>:
>>>>>=20
>>>>>>=20
>>>>>> On Nov 10, 2015, at 1:26 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>>>=20
>>>>>>=20
>>>>>> Since openldap isn't required, but used when found, allow =
qualified
>>>>>> users to disable the requirement to save some space.
>>>>>>=20
>>>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>>>>> ---
>>>>>> meta-oe/recipes-support/libldb/libldb_1.1.17.bb | 5 ++++-
>>>>>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>>=20
>>>>>> diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb =
b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>>>>>> index 44f061a..07a839d 100644
>>>>>> --- a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>>>>>> +++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>>>>>> @@ -4,9 +4,12 @@ SECTION =3D "libs"
>>>>>> LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
>>>>>>=20
>>>>>> DEPENDS +=3D "libtdb talloc libtevent popt"
>>>>>> -RDEPENDS_${PN} +=3D "libtevent popt libtalloc openldap"
>>>>>> +RDEPENDS_${PN} +=3D "libtevent popt libtalloc"
>>>>>> RDEPENDS_pyldb +=3D "python libtdb libtalloc"
>>>>>>=20
>>>>>> +PACKAGECONFIG ??=3D "ldap"
>>>>>> +PACKAGECONFIG[ldap] =3D ",,openldap"
>>>>>> +
>>>>>> SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>>>>>>         =
file://do-not-import-target-module-while-cross-compile.patch \
>>>>>>        "
>>>>>> --
>>>>>> 1.9.1
>>>>>>=20
>>>>>> This results from analysing why there's still an openldap ...
>>>>>>=20
>>>>>> I know, having no knob to disable ldap is dirty, but there is no =
such switch.
>>>>>> Even more dirty, the switch in samba_4% is for embedded samba3 =
source-base only,
>>>>>> the ldb bundled with samba4 just uses ldap when found.
>>>>>>=20
>>>>>> The patch relies on the idea of qualified users - those who know =
that they
>>>>>> don't want ldap, disable it everywhere and whistle.
>>>>>=20
>>>>> it seems to not fix the problem completely, for exact reasons that =
some other package may bring in openldap and stage it before this recipe =
is built so you
>>>>> have exact same problem again. I think if this package is patched =
to add a knob to disable/enable openldap support explicitly then the fix =
will be complete and I am sure upstream will also accept such a patch.
>>>>=20
>>>> NO! Please read carefully what "qualified user expected" means!
>>>>=20
>>>=20
>>> I understand it well. no we don't want any user tiers here. We =
should
>>> tend towards becoming user friendly
>>> A qualified user is well equipped to maintain a patch with a
>>> RDEPENDS_${PN}_remove in his layer.
>>=20
>> Both aspects have their pros and cons, but ...
>>=20
>>>> Forcing a dependency because someone else might introduce it either
>>>> is insane - and adding RDEPENDS is just hiding the symptom, not
>>>=20
>>> its bringing determinism to build thats an important aspect.
>>=20
>> ... this argument beats them all. Nothing to add ;)
>>=20
>> Anyway - for determinism, openldap should be in depends then, not
>> RDEPENDS, shouldn't it?
>=20
> it would translate into a build time dependency

Which is reasonable:

<bluelightning> sno: RDEPENDS just means that it's going to be the =
packaging tasks of the recipe depending on those of the recipes =
producing the named packages, as opposed to DEPENDS where do_configure =
depends on do_populate_sysroot of the mentioned items

Otherwise, build_1 (which has no other recipe requiring openldap) would =
build
without openldap support but sucking in the package, build_2 would be =
build
with ldap support.

>>>> fixing the root cause. The root cause is, that waf is broken
>>>> by design.
>>>=20
>>> such sweeping statements have to backed by reasoning otherwise no =
one
>>> will take them seriously. IMO if you atleast report
>>> this to waf community someone else might be able to help fixing
>>> whatever the problem is.
>>=20
>> But shouldn't the samba maintainer do that?
>=20
> May be/maybe not I dont know, I even dont know whats broken in waf,
> you did not explain that

Having an option or not, in autoconf you can set

ac_cv_HAVE_LDAP_H=3Dno

and the test results in "checking for ldap.h: no" - regardless the
existence of ldap.h. waf doesn't have such an option, has it?

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


