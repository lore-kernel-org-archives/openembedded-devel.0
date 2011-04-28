Received: from smtp-out04.msg.oleane.net ([62.161.7.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QFNSp-0007OT-TR for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 11:24:47 +0200
Received: from smtp06.msg.oleane.net (smtp06.mail.priv [172.17.20.115]) 
	by smtp-out04.msg.oleane.net with ESMTP id p3S91neY026236
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 11:01:49 +0200
Received: from [192.168.1.24] (smt13-6-78-235-41-205.fbx.proxad.net
	[78.235.41.205]) (authenticated)
	by smtp06.msg.oleane.net (MTA) with ESMTP id p3S8fXvd028527
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 10:41:33 +0200
X-Oleane-Rep: REPA
Message-ID: <4DB9283C.1030602@cioinfoindus.fr>
Date: Thu, 28 Apr 2011 10:41:32 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DB82E7C.9080206@cioinfoindus.fr>
	<1303936802.4833.8.camel@mattotaupa>
In-Reply-To: <1303936802.4833.8.camel@mattotaupa>
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.5.5.374460, Antispam-Engine: 2.7.1.369594,
	Antispam-Data: 2011.4.28.82414 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Subject: Re: [PATCH 1/2] mypaint: new recipe for version 0.9.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Apr 2011 09:24:48 -0000
X-Groupsio-MsgNum: 31507
Content-Type: multipart/mixed; boundary="------------090304000003070503040908"

--------------090304000003070503040908
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp-out04.msg.oleane.net id p3S91neY026236

Dear Paul,

sorry for all these mistakes, it is my first patch submission and I'm=20
not quite operational ....

A few questions for some of your comments :

Le 27/04/2011 22:40, Paul Menzel a =C3=A9crit :
> Dear Christian,
>
>
> Am Mittwoch, den 27.04.2011, 16:55 +0200 schrieb Christian Charreyre:
>
>> this new recipe will build the painting soft mypaint.
> thank you for your patches.
>
>> In order to correctly run on the target, it is necessary to add new
>> recipes dependencies in python-numpy recipe.
>>
>> Here are the two patches.
>>
>> Hoping it will be valuable.
> Please send each patch separately using `git send-email` or using your
> mail program and removing the first From line and past the subject into
> the according field of your mailer.
>
When you says "send each patch separetely", do you lean that I must=20
split "recipes/mypaint/files/scons-adapt.patch" and=20
"recipes/mypaint/mypaint_0.9.1.bb" in 2 separate patches, or that I must=20
split those related to mypaint and those related to python-numpy ? The=20
second alternative has been done.

I was thinking that when 2 files changes are correlated, they must be in=20
the same patch, no ?

>>    From 0cc6d007fecb3ad7f5d09a9d4897d506a5c41d39 Mon Sep 17 00:00:00 2=
001
>> From: C. Charreyre<christian.charreyre@cioinfoindus.fr>
> A space is missing. You can set it up correctly using `git config`.
I suppose the missing space is before the 2nd From with my email=20
address. Is is ok ?
>> Date: Thu, 21 Apr 2011 16:40:54 +0200
>> Subject: [PATCH] mypaint: new recipe for version 0.9.1
>>
>> Signed-off-by: C. Charreyre<christian.charreyre@cioinfoindus.fr>
>> ---
>>     recipes/mypaint/files/scons-adapt.patch |   20 +++++++++++++++++
>>     recipes/mypaint/mypaint_0.9.1.bb        |   36
>> +++++++++++++++++++++++++++++++
> Your mail program mangled the patch. Please resend as `[PATCH v2]` and
> remember to turn off line wrapping.
OK, noted.
>>     2 files changed, 56 insertions(+), 0 deletions(-)
>>     create mode 100644 recipes/mypaint/files/scons-adapt.patch
>>     create mode 100644 recipes/mypaint/mypaint_0.9.1.bb
>>
>> diff --git a/recipes/mypaint/files/scons-adapt.patch
>> b/recipes/mypaint/files/scons-adapt.patch
>> new file mode 100644
>> index 0000000..dcad6db
>> --- /dev/null
>> +++ b/recipes/mypaint/files/scons-adapt.patch
>> @@ -0,0 +1,20 @@
>> +Author: Christian Charreyre<christian.charreyre@cioinfoindus.fr>
>> +
>> +Adapt scons to OE
>> +Index: mypaint-0.9.1/lib/SConscript
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- mypaint-0.9.1.orig/lib/SConscript    2011-04-21 11:31:29.00000000=
0
>> +0200
>> ++++ mypaint-0.9.1/lib/SConscript    2011-04-21 11:35:30.000000000 +02=
00
>> +@@ -1,5 +1,11 @@
>> + Import('env')
>> +-import sys
>> ++import sys, os
>> ++env.Replace(SHCXX =3D os.environ['CXX'])
>> ++env.Replace(SHLINK =3D os.environ['CXX'])
>> ++env.Replace(LDMODULEFLAGS =3D os.environ['TARGET_LDFLAGS'])
>> ++env.Append(LDMODULEFLAGS =3D ['-Wl,--hash-style=3Dgnu'])
>> ++env.Append(LDMODULEFLAGS =3D ['-shared'])
>> ++env.Replace(PATH =3D os.environ['PATH'])
> Did you send this upstream so that they can improve the build system fo=
r
> cross compilation?
I think I can't send it upstream, because this is specific to OE=20
(TARGET_LDFLAGS for instance is defined by OE).
In fact I didn't knew scons at all, and there are very few recipes with=20
this compilation system, so I have tried to have mypaint successfully=20
cross-compiled in OE with this patch.
If someone can improve that, it would be fine.
>> +
>> + # For the record: I know that scons supports swig. But it doesn't sc=
an
>> for #include in the generated code.
>> + #
>> diff --git a/recipes/mypaint/mypaint_0.9.1.bb
>> b/recipes/mypaint/mypaint_0.9.1.bb
>> new file mode 100644
>> index 0000000..a7e5077
>> --- /dev/null
>> +++ b/recipes/mypaint/mypaint_0.9.1.bb
>> @@ -0,0 +1,36 @@
>> +DESCRIPTION=3D"fast and easy open-source graphics application for dig=
ital
>> painters"
>> +LICENSE=3D"GPL"
>> +SECTION =3D "x11/applications"
>> +PRIORITY =3D "optional"
>> +HOMEPAGE =3D "http://mypaint.intilinux.com/"
>> +
>> +RDEPENDS_${PN} =3D "python-numpy python-image python-json"
> Can you sort those lexicographically.
OK, noted.
>> +
>> +SRC_URI =3D "http://download.gna.org/mypaint/${PN}-${PV}.tar.bz2 \
>> +    file://scons-adapt.patch \
>> +"
>> +
>> +inherit distutils scons
>> +
>> +do_compile() {
>> +    STAGING_INCDIR=3D${STAGING_INCDIR} \
>> +    STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>> +    BUILD_SYS=3D${BUILD_SYS} \
>> +    HOST_SYS=3D${HOST_SYS} \
>> +    PATH=3D${PATH} scons_do_compile
>> +}
> I do not know Scons, but it looks strange that the above is needed and
> not done automatically.
Same reply as above, there are few recipes with scons, I've found this=20
tip in one recipe and applied it here to get the build completed.
>> +
>> +do_install() {
>> +    BUILD_SYS=3D${BUILD_SYS} \
>> +    HOST_SYS=3D${HOST_SYS} \
>> +    scons_do_install
>> +}
>> +
>> +FILES_${PN} +=3D "${datadir}"
>> +
>> +SRC_URI[md5sum] =3D "6249a16359a438d6dc658f5765b35515"
>> +SRC_URI[sha256sum] =3D
>> "407b599f62fb0d6e711fee57d22e64d3aec88825364fb5f7f73b9f0940aa7aed"
> Please put it right at the top under `SRC_URI`.
I don't understand what is the problem. What part has to be placed under=20
'SRC_URI' ?
>> +
>> +INSANE_SKIP_${PN} =3D True
> Please note in the commit message or in the recipe as a comment what
> error you get/why this is needed.
OK, noted.
>> +
>> +
> Please remove the empty lines at the end.
OK, noted.
>
> Thanks,
>
> Paul
Thanks for your comments that will improve my future submissions.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--------------090304000003070503040908
Content-Type: text/x-vcard; charset=utf-8;
 name="christian_charreyre.vcf"
Content-Disposition: attachment;
 filename="christian_charreyre.vcf"
Content-Transfer-Encoding: base64

YmVnaW46dmNhcmQNCmZuOkNocmlzdGlhbiAgQ2hhcnJleXJlDQpuOkNoYXJyZXlyZTtDaHJpc3Rp
YW4gDQpvcmc6Q0lPIEluZm9ybWF0aXF1ZSBJbmR1c3RyaWVsbGUNCmFkcjtkb206OzsxMSBBdmVu
dWUgTWFyaWdueTtNYXJzZWlsbGU7OzEzMDE0DQplbWFpbDtpbnRlcm5ldDpjaHJpc3RpYW4uY2hh
cnJleXJlQGNpb2luZm9pbmR1cy5mcg0KdGVsO3dvcms6MDQgOTUgMDUgMTkgNDENCnVybDpodHRw
Oi8vd3d3LmNpb2luZm9pbmR1cy5mcg0KdmVyc2lvbjoyLjENCmVuZDp2Y2FyZA0KDQo=

--------------090304000003070503040908--
