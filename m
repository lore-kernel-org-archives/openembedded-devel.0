Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id B1B106FA29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 13:46:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2LDkDgM012570
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 08:46:13 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LDkCqu006911
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 08:46:13 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 21 Mar 2014 08:46:12 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] pm-qa-utils: Add power management test utils
Thread-Index: AQHPROVFbFD53IzT8kiCJ/XxPOyzM5rrbylggABYFwD//8ZfMA==
Date: Fri, 21 Mar 2014 13:46:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF493A8@DLEE11.ent.ti.com>
References: <1395326848-4434-1-git-send-email-Chase.Maupin@ti.com>
	<lggvj4$7g6$1@ger.gmane.org>
	<7D46E86EC0A8354091174257B2FED1015CF48FAA@DLEE11.ent.ti.com>
	<lgha81$67v$1@ger.gmane.org>
In-Reply-To: <lgha81$67v$1@ger.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Fri, 21 Mar 2014 13:46:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: openembedded-devel-bounces@lists.openembedded.org
>[mailto:openembedded-devel-bounces@lists.openembedded.org] On
>Behalf Of Koen Kooi
>Sent: Friday, March 21, 2014 7:11 AM
>To: openembedded-devel@lists.openembedded.org
>Subject: Re: [oe] [PATCH] pm-qa-utils: Add power management test
>utils
>
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Maupin, Chase schreef op 21-03-14 13:07:
>
>>> -----Original Message----- From:
>>> openembedded-devel-bounces@lists.openembedded.org
>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
>Behalf Of
>>> Koen Kooi Sent: Friday, March 21, 2014 4:10 AM To:
>>> openembedded-devel@lists.openembedded.org Subject: Re: [oe]
>[PATCH]
>>> pm-qa-utils: Add power management test utils
>>>
>> Chase Maupin schreef op 20-03-14 15:47:
>>>>> * The power management test utilities from Linaro can be used
>to
>> test
>>>>> multiple PM features such as cpufreq, cpuidle, thermal
>control
>> and
>>>>> suspend operations. * These utilities are not platform
>specific
>> and can
>>>>> be used by a broader base of users.
>>>>>
>>>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>
>> Everything refers to this as 'pm-qa', not 'pm-qa-utils'
>>
>>> I assume you are saying you would rather see this recipe as pm-
>qa
>>> instead of pm-qa-utils?
>
>Exactly!
>
>>
>>
>>>>> --- .../pm-qa-utils/pm-qa-utils_git.bb                 |   63
>>>>> ++++++++++++++++++++ 1 file changed, 63 insertions(+) create
>> mode 100644
>>>>> meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
>>>>>
>>>>> diff --git a/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-
>> utils_git.bb
>>>>> b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb new
>> file mode
>>>>> 100644 index 0000000..610f3a7 --- /dev/null +++
>>>>> b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb @@
>-
>> 0,0 +1,63
>>>>> @@ +DESCRIPTION =3D "Utilities from Linaro for testing Power
>> Management"
>>>>> +HOMEPAGE =3D
>>>>>
>>
>"https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/T
>> estSuite/PmQa"
>>>>>
>>>>>
>> +
>>>>> +LICENSE =3D "GPLv2" +LIC_FILES_CHKSUM =3D
>>>>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263" + +PV =3D
>> "0.4.4" +
>>>>> +BRANCH ?=3D "master" +SRCREV =3D
>> "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
>>>>> + +SRC_URI =3D "git://git.linaro.org/tools/pm-
>> qa.git;protocol=3Dgit;branch=3D${BRANCH}" + +S
>>>>> =3D "${WORKDIR}/git" + +CFLAGS +=3D "-pthread" + +do_compile () {
>+
>> # Find
>>>>> all the .c files in this project and build them. +    for x
>in
>> `find .
>>>>> -name "*.c"` +    do +        util=3D`echo ${x} | sed s/.c$//`
>+
>>>>> oe_runmake ${util} +    done +} + +do_install () { +
>install
>> -d
>>>>> ${D}${bindir} +    install -d ${D}${bindir}/linaro-pm-qa-
>include
>>
>> Please don't use subdirs in $bindir, that's what $libdir and
>$libexecdir
>> are for.
>>
>>> Good point.  I did this because the script going into that
>directory
>>> was named "functions.sh" in the original sources.  I thought
>this was a
>>> bit generic and could possibly conflict.
>>
>>> What are your thoughts on a subdirectory under $libdir or
>$libexecdir?
>>> Any preference?
>
>Right it will amount to the basically the same due to the
>misguided
>libexecdir change oe-core did last year. If it's only used
>'internally'
>$libdir/PN would be OK, otherwise use libexecdir (which currently
>is
>libdir/PN, but might change again)

One last dense question.  What do you mean by 'internally'?

Internally to just this package as in you don't expect any sharing between =
this and another package?

>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.4.5 (Darwin)
>Comment: GPGTools - http://gpgtools.org
>
>iD8DBQFTLCxQMkyGM64RGpERAi53AJ9bjuFeJfliwQV9hzHnqd+28zkH0ACeLS9r
>VXYU8eXR2dQcBS74EnzVBd4=3D
>=3DDHAP
>-----END PGP SIGNATURE-----
>
>--
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-devel

