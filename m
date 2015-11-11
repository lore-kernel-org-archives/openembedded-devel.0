Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B5C72762B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:45:12 +0000 (UTC)
Received: by iouu10 with SMTP id u10so34145666iou.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=qsmG8U1zDVqS5vz/Ocuk9vENyDrQVAOYe1Pj0oM4ERw=;
	b=wBmbyOQS9u2hw5Rz151RSjiNwNfLHZhusz58rfelih59K9ShwdNW4gWjGLTbXzdq4n
	YQfw7BZfi8Y/yfosXqKyXvVXKR0/+OTPjqlc8k3VgVzQRB8T8H1VK2zfANFjRT34Ws2Y
	szIYn0arfa3DPh7fn/iMSjU8GtieFVtJD6FvET4DHlN1AT1D3W8FfTC2U0BA9cPrT6JE
	c9UuszeIOrHZRvUe4M4RlF5V8If5DNdjH9LU/7zzi+l5hvwKOf+INIDxIFvPB5EaPazl
	+FK3IlHWksYD26vWxVdvevDe4Oj859ea83aCJt/Gczgi5gxkWQmRiM4DsIwxptazAwl0
	7FOg==
X-Received: by 10.107.4.3 with SMTP id 3mr12207398ioe.195.1447267513124; Wed,
	11 Nov 2015 10:45:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 10:44:43 -0800 (PST)
In-Reply-To: <B3CC41C2-7DBD-4C63-8A6B-81A8367392AF@gmail.com>
References: <33A5922B-6B36-4862-8261-4F59E0AF12AD@gmail.com>
	<892C1CD0-EAD9-4692-A296-B5635FE35385@gmail.com>
	<FE25E51D-6F1B-4DB0-8391-9B8B152ECF3F@gmail.com>
	<CAMKF1sqbxs3SDGdKMzrWsYv887M=EUe200owKo=7ZZ3gWivmKA@mail.gmail.com>
	<DDE21F3D-050E-449A-8ED0-72BACAA59D43@gmail.com>
	<CAMKF1sq_z9k6okHK24oFmExqP7F2eJ_nvX70nDsb+-rAH+gQZg@mail.gmail.com>
	<B3CC41C2-7DBD-4C63-8A6B-81A8367392AF@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 10:44:43 -0800
Message-ID: <CAMKF1srMYPDWpmGFJuMo=1qZ02wJbsj1Mo8sAWkt_QHuFaXh9g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
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
X-List-Received-Date: Wed, 11 Nov 2015 18:45:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 10:17 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 11.11.2015 um 19:10 schrieb Khem Raj <raj.khem@gmail.com>:
>>
>> On Wed, Nov 11, 2015 at 9:47 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>
>>>> Am 11.11.2015 um 18:34 schrieb Khem Raj <raj.khem@gmail.com>:
>>>>
>>>> On Wed, Nov 11, 2015 at 1:11 AM, Jens Rehsack <rehsack@gmail.com> wrot=
e:
>>>>>
>>>>>> Am 11.11.2015 um 04:26 schrieb Khem Raj <raj.khem@gmail.com>:
>>>>>>
>>>>>>>
>>>>>>> On Nov 10, 2015, at 1:26 PM, Jens Rehsack <rehsack@gmail.com> wrote=
:
>>>>>>>
>>>>>>>
>>>>>>> Since openldap isn't required, but used when found, allow qualified
>>>>>>> users to disable the requirement to save some space.
>>>>>>>
>>>>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>>>>>> ---
>>>>>>> meta-oe/recipes-support/libldb/libldb_1.1.17.bb | 5 ++++-
>>>>>>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb b/meta=
-oe/recipes-support/libldb/libldb_1.1.17.bb
>>>>>>> index 44f061a..07a839d 100644
>>>>>>> --- a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>>>>>>> +++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>>>>>>> @@ -4,9 +4,12 @@ SECTION =3D "libs"
>>>>>>> LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
>>>>>>>
>>>>>>> DEPENDS +=3D "libtdb talloc libtevent popt"
>>>>>>> -RDEPENDS_${PN} +=3D "libtevent popt libtalloc openldap"
>>>>>>> +RDEPENDS_${PN} +=3D "libtevent popt libtalloc"
>>>>>>> RDEPENDS_pyldb +=3D "python libtdb libtalloc"
>>>>>>>
>>>>>>> +PACKAGECONFIG ??=3D "ldap"
>>>>>>> +PACKAGECONFIG[ldap] =3D ",,openldap"
>>>>>>> +
>>>>>>> SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>>>>>>>         file://do-not-import-target-module-while-cross-compile.patc=
h \
>>>>>>>        "
>>>>>>> --
>>>>>>> 1.9.1
>>>>>>>
>>>>>>> This results from analysing why there's still an openldap ...
>>>>>>>
>>>>>>> I know, having no knob to disable ldap is dirty, but there is no su=
ch switch.
>>>>>>> Even more dirty, the switch in samba_4% is for embedded samba3 sour=
ce-base only,
>>>>>>> the ldb bundled with samba4 just uses ldap when found.
>>>>>>>
>>>>>>> The patch relies on the idea of qualified users - those who know th=
at they
>>>>>>> don't want ldap, disable it everywhere and whistle.
>>>>>>
>>>>>> it seems to not fix the problem completely, for exact reasons that s=
ome other package may bring in openldap and stage it before this recipe is =
built so you
>>>>>> have exact same problem again. I think if this package is patched to=
 add a knob to disable/enable openldap support explicitly then the fix will=
 be complete and I am sure upstream will also accept such a patch.
>>>>>
>>>>> NO! Please read carefully what "qualified user expected" means!
>>>>>
>>>>
>>>> I understand it well. no we don't want any user tiers here. We should
>>>> tend towards becoming user friendly
>>>> A qualified user is well equipped to maintain a patch with a
>>>> RDEPENDS_${PN}_remove in his layer.
>>>
>>> Both aspects have their pros and cons, but ...
>>>
>>>>> Forcing a dependency because someone else might introduce it either
>>>>> is insane - and adding RDEPENDS is just hiding the symptom, not
>>>>
>>>> its bringing determinism to build thats an important aspect.
>>>
>>> ... this argument beats them all. Nothing to add ;)
>>>
>>> Anyway - for determinism, openldap should be in depends then, not
>>> RDEPENDS, shouldn't it?
>>
>> it would translate into a build time dependency
>
> Which is reasonable:
>
> <bluelightning> sno: RDEPENDS just means that it's going to be the packag=
ing tasks of the recipe depending on those of the recipes producing the nam=
ed packages, as opposed to DEPENDS where do_configure depends on do_populat=
e_sysroot of the mentioned items
>
> Otherwise, build_1 (which has no other recipe requiring openldap) would b=
uild
> without openldap support but sucking in the package, build_2 would be bui=
ld
> with ldap support.

rare but that seems possible case, so adding a DEPEND along with
RDEPEND is a good idea to cover it up.

>
>>>>> fixing the root cause. The root cause is, that waf is broken
>>>>> by design.
>>>>
>>>> such sweeping statements have to backed by reasoning otherwise no one
>>>> will take them seriously. IMO if you atleast report
>>>> this to waf community someone else might be able to help fixing
>>>> whatever the problem is.
>>>
>>> But shouldn't the samba maintainer do that?
>>
>> May be/maybe not I dont know, I even dont know whats broken in waf,
>> you did not explain that
>
> Having an option or not, in autoconf you can set
>
> ac_cv_HAVE_LDAP_H=3Dno
>
> and the test results in "checking for ldap.h: no" - regardless the
> existence of ldap.h. waf doesn't have such an option, has it?
>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

