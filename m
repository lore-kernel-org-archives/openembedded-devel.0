Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1056F9D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 12:07:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2LC7Zla020941
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 07:07:35 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LC7Yqf001470
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 07:07:35 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 21 Mar 2014 07:07:34 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] pm-qa-utils: Add power management test utils
Thread-Index: AQHPROVFbFD53IzT8kiCJ/XxPOyzM5rrbylg
Date: Fri, 21 Mar 2014 12:07:34 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF48FAA@DLEE11.ent.ti.com>
References: <1395326848-4434-1-git-send-email-Chase.Maupin@ti.com>
	<lggvj4$7g6$1@ger.gmane.org>
In-Reply-To: <lggvj4$7g6$1@ger.gmane.org>
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
X-List-Received-Date: Fri, 21 Mar 2014 12:07:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


>-----Original Message-----
>From: openembedded-devel-bounces@lists.openembedded.org
>[mailto:openembedded-devel-bounces@lists.openembedded.org] On
>Behalf Of Koen Kooi
>Sent: Friday, March 21, 2014 4:10 AM
>To: openembedded-devel@lists.openembedded.org
>Subject: Re: [oe] [PATCH] pm-qa-utils: Add power management test
>utils
>
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Chase Maupin schreef op 20-03-14 15:47:
>> * The power management test utilities from Linaro can be used to
>test
>> multiple PM features such as cpufreq, cpuidle, thermal control
>and
>> suspend operations. * These utilities are not platform specific
>and can
>> be used by a broader base of users.
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>
>Everything refers to this as 'pm-qa', not 'pm-qa-utils'

I assume you are saying you would rather see this recipe as pm-qa instead o=
f pm-qa-utils?

>
>> --- .../pm-qa-utils/pm-qa-utils_git.bb                 |   63
>> ++++++++++++++++++++ 1 file changed, 63 insertions(+) create
>mode 100644
>> meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
>>
>> diff --git a/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-
>utils_git.bb
>> b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb new
>file mode
>> 100644 index 0000000..610f3a7 --- /dev/null +++
>> b/meta-oe/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb @@ -
>0,0 +1,63
>> @@ +DESCRIPTION =3D "Utilities from Linaro for testing Power
>Management"
>> +HOMEPAGE =3D
>>
>"https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/T
>estSuite/PmQa"
>>
>>
>+
>> +LICENSE =3D "GPLv2" +LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263" + +PV =3D
>"0.4.4" +
>> +BRANCH ?=3D "master" +SRCREV =3D
>"fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
>> + +SRC_URI =3D
>> "git://git.linaro.org/tools/pm-
>qa.git;protocol=3Dgit;branch=3D${BRANCH}" + +S
>> =3D "${WORKDIR}/git" + +CFLAGS +=3D "-pthread" + +do_compile () { +
># Find
>> all the .c files in this project and build them. +    for x in
>`find .
>> -name "*.c"` +    do +        util=3D`echo ${x} | sed s/.c$//` +
>> oe_runmake ${util} +    done +} + +do_install () { +    install
>-d
>> ${D}${bindir} +    install -d ${D}${bindir}/linaro-pm-qa-include
>
>Please don't use subdirs in $bindir, that's what $libdir and
>$libexecdir are
>for.

Good point.  I did this because the script going into that directory was na=
med "functions.sh" in the original sources.  I thought this was a bit gener=
ic and could possibly conflict.

What are your thoughts on a subdirectory under $libdir or $libexecdir?  Any=
 preference?

>
>> + +    # Install the compiled binaries the were built in the
>previous
>> step +    for x in `find . -name "*.c"` +    do +
>util=3D`echo ${x}
>> | sed s/.c$//` +        util_basename=3D`basename ${util}` +
>install
>> -m 0755 ${util} ${D}${bindir}/${util_basename} +    done + +
># Install
>> the helper scripts in the include directory +    for script in
>`find .
>> -name "*.sh" | grep include` +    do +        # Remove hardcoded
>relative
>> paths +        sed -i -e 's#..\/utils\/##' ${script} + +
>> script_basename=3D`basename ${script}` +        install -m 0755
>$script
>> ${D}${bindir}/linaro-pm-qa-include/${script_basename} +    done
>+ +    #
>> Install the shell scripts NOT in the include directory since
>those +    #
>> will be installed elsewhere +    for script in `find . -name
>"*.sh" |
>> grep -v include` +    do +        # if the script includes any
>helper
>> scripts from the include +        # directory then change the
>include
>> path to the absolute path +        # to reflect the install
>location of
>> the helper scripts. +        sed -i -e "s#source
>../include#source
>> ${bindir}/linaro-pm-qa-include#g" ${script} +        # Remove
>hardcoded
>> relative paths +        sed -i -e 's#..\/utils\/##' ${script} +
>+
>> script_basename=3D`basename ${script}` +        install -m 0755
>$script
>> ${D}${bindir}/${script_basename} +    done +}
>>
>
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.4.5 (Darwin)
>Comment: GPGTools - http://gpgtools.org
>
>iD8DBQFTLAHbMkyGM64RGpERAp4tAKCqvpUtLAnW+JmNPFue3devsMkfEgCfSBG8
>sTfb/tlOntd8/Hs/1JvXqQ4=3D
>=3D674M
>-----END PGP SIGNATURE-----
>
>--
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-devel

