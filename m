Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 709806FF56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:20:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A8KFaV013074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:20:15 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 10 Mar 2016 00:20:14 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1457509723-25302-1-git-send-email-kai.kang@windriver.com>
	<1457509723-25302-2-git-send-email-kai.kang@windriver.com>
	<20160309190600.GG2542@jama>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56E12E3D.9030604@windriver.com>
Date: Thu, 10 Mar 2016 16:20:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160309190600.GG2542@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] crash: add native package
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
X-List-Received-Date: Thu, 10 Mar 2016 08:20:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2016=E5=B9=B403=E6=9C=8810=E6=97=A5 03:06, Martin Jansa wrote:
> On Wed, Mar 09, 2016 at 03:48:43PM +0800, kai.kang@windriver.com wrote:=

>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add crash-native package.
>>
>> * append EXTRA_OEMAKE option to find ncurses library
>> * pass right install DESTDIR
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-oe/recipes-kernel/crash/crash_7.1.3.bb | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb b/meta-oe/rec=
ipes-kernel/crash/crash_7.1.3.bb
>> index f6934f7..e085094 100644
>> --- a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
>> +++ b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
>> @@ -32,6 +32,8 @@ SRC_URI[gdb.sha256sum] =3D "8070389a5dcc104eb0be483d=
582729f98ed4d761ad19cedd3f17b5
>>  =20
>>   inherit gettext
>>  =20
>> +BBCLASSEXTEND =3D "native"
>> +
>>   # crash 7.1.3 and before don't support mips64
>>   COMPATIBLE_HOST =3D "^(?!mips64).*"
>>  =20
>> @@ -40,6 +42,7 @@ EXTRA_OEMAKE =3D 'RPMPKG=3D"${PV}" \
>>                   GDB_HOST=3D"${BUILD_SYS}" \
>>                   GDB_MAKE_JOBS=3D"${PARALLEL_MAKE}" \
>>                   '
>> +EXTRA_OEMAKE_append_class-native =3D " LDFLAGS=3D'${BUILD_LDFLAGS}'"
>>  =20
>>   do_configure() {
>>       :
>> @@ -65,17 +68,25 @@ do_compile() {
>>       oe_runmake ${EXTRA_OEMAKE}
>>   }
>>  =20
>> -do_install () {
>> +do_install_prepend () {
>>       install -d ${D}${bindir}
>>       install -d ${D}/${mandir}/man8
>>       install -d ${D}${includedir}/crash
>>  =20
>> -    oe_runmake DESTDIR=3D${D} install
>>       install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
>>       install -m 0644 ${S}/defs.h ${D}${includedir}/crash
>> -}
>> +}
>> +
>> +do_install_class-target () {
>> +    oe_runmake DESTDIR=3D${D} install
>> +}
>> +
>> +do_install_class-native () {
>> +    oe_runmake DESTDIR=3D${D}${STAGING_DIR_NATIVE} install
>> +}
>>  =20
>>   RDEPENDS_${PN} +=3D "liblzma"
>> +RDEPENDS_${PN}_class-native +=3D "xz-native"
> Why is this needed? native builds aren't creating any packages.

My fault. It should be empty for native package.

Thanks. V2 will be sent.


--Kai


>
>>   # Causes gcc to get stuck and eat all available memory in qemuarm bu=
ilds
>>   # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /=
home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexe=
c/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I =
=2E -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I =
=2E/../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumb=
er -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysro=
ot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d=
 -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR=3D"/usr/local/share/local=
e" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=3D1 eval.c -quiet -dumpbase eva=
l.c -march=3Darmv5te -mthumb -mthumb-interwork -mtls-dialect=3Dgnu -auxba=
se-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-poi=
nter-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-c=
har-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty=
-body -feliminate-unused-debug-types -o -
>> --=20
>> 2.6.1
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


--=20
Regards,
Neil | Kai Kang


