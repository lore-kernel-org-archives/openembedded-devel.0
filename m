Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MBIrT-0006Qs-Pd
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 03:32:20 +0200
Received: by an-out-0708.google.com with SMTP id c3so3842577ana.30
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 18:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=s4u1S5g4ahLwaScoXJzKHVdlEzq52fEquu6ebdY4UbM=;
	b=T7F6gXT7IAXu6XT1kdpRk6H1IxrXvA737tRv0P92/I6TmOiC0duzxU4WIu/cdB/MYI
	6aQdJ3zaoQdEKfHA7fYX2Twbn3anyZxFEVDVKBwa3IP2MaGgHveFXtAsWOZt2i2qLt6N
	3XyQ/6HB+O7u5quldDFqhJOjWN3qkGv3uBWKg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=oprrI0RijeljMEpgX6+s9/HGM/tVP70AyXLYDueu0czFJzmqlgjLp9w11ZtBEhv3T5
	VI3CLClacGuuevl/R+HmEONifvY8JBv7BKLeQA1DJc269a27bSc825XGxku5u5/qKaYb
	/Yo3MOHIfkanr3G0d0OG18ySPmZ9qpreHXHbc=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.213.13 with SMTP id l13mr8132637ang.110.1243905812104; 
	Mon, 01 Jun 2009 18:23:32 -0700 (PDT)
In-Reply-To: <20090601214030.GF26065@smtp.west.cox.net>
References: <20090505164137.GJ7973@smtp.west.cox.net>
	<20090601214030.GF26065@smtp.west.cox.net>
Date: Mon, 1 Jun 2009 22:23:32 -0300
X-Google-Sender-Auth: 5a4de4bf4133380b
Message-ID: <be7a9f3d0906011823v41fe94dfqc398bfb110ccf67e@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH] Fix staging of binutils static libraries
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
X-List-Received-Date: Tue, 02 Jun 2009 01:32:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Tom,

An INC_PR adjustment fits quite well in this case, doesn't it ;-)

On Mon, Jun 1, 2009 at 6:40 PM, Tom Rini <trini@embeddedalley.com> wrote:
> On Tue, May 05, 2009 at 09:41:37AM -0700, Tom Rini wrote:
>
>> binutils-cross: Stage libbfd/opcodes/iberty correctly, bump PR
>>
>> Changes the staging path for libbfd and libopcodes to ${CROSS_DIR}/lib.
>> Disables staging native libiberty.a to ${STAGING_DIR_TARGET} as this doe=
sn't
>> make sense to do. =A0Cleans up empty directories.
>>
>> Signed-off-by: Nikita Shulga <nshulga@embeddedalley.com>
>> Signed-off-by: Tom Rini <trini@embeddedalley.com>
>
> I got a 'great patch' from Mickey and no Acked-bys. =A0Ping.
>
>> ---
>> =A0recipes/binutils/binutils-cross.inc =A0 =A0 =A0 =A0 =A0 | =A0 28 ++++=
+++++++++++++++-----
>> =A0recipes/binutils/binutils_2.14.90.0.6.bb =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.14.90.0.7.bb =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.15.94.0.1.bb =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.16.1.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.16.91.0.6.bb =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.16.91.0.7.bb =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.16.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
>> =A0recipes/binutils/binutils_2.17.50.0.1.bb =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.17.50.0.12.bb =A0 =A0 | =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.17.50.0.5.bb =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.17.50.0.8.bb =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.17.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
>> =A0recipes/binutils/binutils_2.18.50.0.7.bb =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.18.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
>> =A0recipes/binutils/binutils_2.19.1.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
>> =A0recipes/binutils/binutils_2.19.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
>> =A0recipes/binutils/binutils_csl-arm-20050416.bb | =A0 =A02 +-
>> =A0recipes/binutils/binutils_csl-arm-20050603.bb | =A0 =A02 +-
>> =A0recipes/binutils/binutils_cvs.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-
>> =A020 files changed, 41 insertions(+), 25 deletions(-)
>>
>> diff --git a/recipes/binutils/binutils-cross.inc b/recipes/binutils/binu=
tils-cross.inc
>> index 384d18c..872b04a 100644
>> --- a/recipes/binutils/binutils-cross.inc
>> +++ b/recipes/binutils/binutils-cross.inc
>> @@ -23,12 +23,28 @@ do_stage () {
>> =A0 =A0 =A0 rmdir ${CROSS_DIR}/${libdir}64 || :
>> =A0 =A0 =A0 rmdir ${CROSS_DIR}/${prefix} || :
>>
>> - =A0 =A0 # We want to move this into the target specific location
>> - =A0 =A0 mkdir -p ${STAGING_DIR_TARGET}/lib
>> - =A0 =A0 mv -f ${CROSS_DIR}/lib/libiberty.a ${STAGING_DIR_TARGET}/lib |=
| \
>> - =A0 =A0 =A0 =A0 =A0 =A0 mv -f ${CROSS_DIR}/lib64/libiberty.a ${STAGING=
_DIR_TARGET}/lib
>> - =A0 =A0 rmdir ${CROSS_DIR}/lib || :
>> - =A0 =A0 rmdir ${CROSS_DIR}/lib64 || :
>> + =A0 =A0 LIBBFD_DIR_BASE=3D${CROSS_DIR}/${BUILD_SYS}/${TARGET_SYS}
>> + =A0 =A0 # We want to move libbfd and libopcodes to =A0${CROSS_DIR}/lib
>> + =A0 =A0 mkdir -p ${CROSS_DIR}/lib
>> + =A0 =A0 mv -f ${LIBBFD_DIR_BASE}/lib/* ${CROSS_DIR}/lib || \
>> + =A0 =A0 =A0 =A0 =A0 =A0 mv -f ${LIBBFD_DIR_BASE}/lib64/* ${CROSS_DIR}/=
lib
>> + =A0 =A0 rmdir ${LIBBFD_DIR_BASE}/lib || :
>> + =A0 =A0 rmdir ${LIBBFD_DIR_BASE}/lib64 || :
>> +
>> + =A0 =A0 # Adjust libbfd.la and libopcodes.la
>> + =A0 =A0 for i in libbfd.la libopcodes.la; do
>> + =A0 =A0 sed -i -e "s@${LIBBFD_DIR_BASE}/lib64@${CROSS_DIR}/lib@" ${CRO=
SS_DIR}/lib/$i
>> + =A0 =A0 sed -i -e "s@${LIBBFD_DIR_BASE}/lib@${CROSS_DIR}/lib@" ${CROSS=
_DIR}/lib/$i
>> + =A0 =A0 done
>> +
>> + =A0 =A0 # libbfd headers should be moved as well
>> + =A0 =A0 mkdir -p ${CROSS_DIR}/include
>> + =A0 =A0 mv -f ${LIBBFD_DIR_BASE}/include/* ${CROSS_DIR}/include
>> + =A0 =A0 rmdir ${LIBBFD_DIR_BASE}/include
>> +
>> + =A0 =A0 # Remove empty directories
>> + =A0 =A0 rmdir ${CROSS_DIR}/${BUILD_SYS}/${TARGET_SYS} || :
>> + =A0 =A0 rmdir ${CROSS_DIR}/${BUILD_SYS} || :
>> =A0}
>>
>> =A0do_install () {
>> diff --git a/recipes/binutils/binutils_2.14.90.0.6.bb b/recipes/binutils=
/binutils_2.14.90.0.6.bb
>> index eb72082..bdbbcff 100644
>> --- a/recipes/binutils/binutils_2.14.90.0.6.bb
>> +++ b/recipes/binutils/binutils_2.14.90.0.6.bb
>> @@ -1,7 +1,7 @@
>> =A0SECTION =3D "devel"
>> =A0inherit autotools gettext
>>
>> -PR =3D "r5"
>> +PR =3D "r6"
>>
>> =A0DESCRIPTION =3D "A GNU collection of binary utilities"
>> =A0HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>> diff --git a/recipes/binutils/binutils_2.14.90.0.7.bb b/recipes/binutils=
/binutils_2.14.90.0.7.bb
>> index f940c87..e58d0cc 100644
>> --- a/recipes/binutils/binutils_2.14.90.0.7.bb
>> +++ b/recipes/binutils/binutils_2.14.90.0.7.bb
>> @@ -4,7 +4,7 @@ inherit autotools gettext
>> =A0DESCRIPTION =3D "A GNU collection of binary utilities"
>> =A0HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>> =A0LICENSE =3D "GPL"
>> -PR =3D "r6"
>> +PR =3D "r7"
>>
>> =A0PACKAGES =3D "${PN} ${PN}-dev ${PN}-doc ${PN}-symlinks"
>>
>> diff --git a/recipes/binutils/binutils_2.15.94.0.1.bb b/recipes/binutils=
/binutils_2.15.94.0.1.bb
>> index 74a902b..b73e862 100644
>> --- a/recipes/binutils/binutils_2.15.94.0.1.bb
>> +++ b/recipes/binutils/binutils_2.15.94.0.1.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "A GNU collection of binary utilities"
>> =A0HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>> =A0SECTION =3D "devel"
>> =A0LICENSE =3D "GPL"
>> -PR =3D "r5"
>> +PR =3D "r6"
>>
>> =A0inherit autotools gettext
>>
>> diff --git a/recipes/binutils/binutils_2.16.1.bb b/recipes/binutils/binu=
tils_2.16.1.bb
>> index 8235300..64ae34d 100644
>> --- a/recipes/binutils/binutils_2.16.1.bb
>> +++ b/recipes/binutils/binutils_2.16.1.bb
>> @@ -1,4 +1,4 @@
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> =A0CROSSTOOL_PATCH_URL =3D "http://www.kegel.com/crosstool/crosstool-0.4=
3/patches/binutils-2.16.1/"
>> =A0SRC_URI =3D \
>> diff --git a/recipes/binutils/binutils_2.16.91.0.6.bb b/recipes/binutils=
/binutils_2.16.91.0.6.bb
>> index b251149..d2701c2 100644
>> --- a/recipes/binutils/binutils_2.16.91.0.6.bb
>> +++ b/recipes/binutils/binutils_2.16.91.0.6.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "A GNU collection of binary utilities"
>> =A0HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>> =A0SECTION =3D "devel"
>> =A0LICENSE =3D "GPL"
>> -PR =3D "r3"
>> +PR =3D "r4"
>>
>> =A0# glibc 2.3 has issues with this version
>> =A0# of binutils.
>> diff --git a/recipes/binutils/binutils_2.16.91.0.7.bb b/recipes/binutils=
/binutils_2.16.91.0.7.bb
>> index 76c1285..7a53dd0 100644
>> --- a/recipes/binutils/binutils_2.16.91.0.7.bb
>> +++ b/recipes/binutils/binutils_2.16.91.0.7.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>> =A0SECTION =3D "devel"
>> =A0LICENSE =3D "GPL"
>> =A0DEFAULT_PREFERENCE =3D "-1"
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>> =A0inherit autotools gettext
>>
>> diff --git a/recipes/binutils/binutils_2.16.bb b/recipes/binutils/binuti=
ls_2.16.bb
>> index 9035b44..c3dd6df 100644
>> --- a/recipes/binutils/binutils_2.16.bb
>> +++ b/recipes/binutils/binutils_2.16.bb
>> @@ -1,4 +1,4 @@
>> -PR =3D "r10"
>> +PR =3D "r11"
>>
>> =A0SRC_URI =3D \
>> =A0 =A0 =A0"${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
>> diff --git a/recipes/binutils/binutils_2.17.50.0.1.bb b/recipes/binutils=
/binutils_2.17.50.0.1.bb
>> index 76c1285..7a53dd0 100644
>> --- a/recipes/binutils/binutils_2.17.50.0.1.bb
>> +++ b/recipes/binutils/binutils_2.17.50.0.1.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>> =A0SECTION =3D "devel"
>> =A0LICENSE =3D "GPL"
>> =A0DEFAULT_PREFERENCE =3D "-1"
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>> =A0inherit autotools gettext
>>
>> diff --git a/recipes/binutils/binutils_2.17.50.0.12.bb b/recipes/binutil=
s/binutils_2.17.50.0.12.bb
>> index d24d24e..84f608b 100644
>> --- a/recipes/binutils/binutils_2.17.50.0.12.bb
>> +++ b/recipes/binutils/binutils_2.17.50.0.12.bb
>> @@ -1,5 +1,5 @@
>> =A0require binutils.inc
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>> =A0SRC_URI =3D \
>> =A0 =A0 =A0"${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.=
tar.bz2 \
>> diff --git a/recipes/binutils/binutils_2.17.50.0.5.bb b/recipes/binutils=
/binutils_2.17.50.0.5.bb
>> index 1d1c3fb..041c5d7 100644
>> --- a/recipes/binutils/binutils_2.17.50.0.5.bb
>> +++ b/recipes/binutils/binutils_2.17.50.0.5.bb
>> @@ -1,6 +1,6 @@
>> =A0require binutils.inc
>>
>> -PR =3D "r3"
>> +PR =3D "r4"
>>
>> =A0SRC_URI =3D \
>> =A0 =A0 =A0"${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.=
tar.bz2 \
>> diff --git a/recipes/binutils/binutils_2.17.50.0.8.bb b/recipes/binutils=
/binutils_2.17.50.0.8.bb
>> index f659b3b..1d1c3fb 100644
>> --- a/recipes/binutils/binutils_2.17.50.0.8.bb
>> +++ b/recipes/binutils/binutils_2.17.50.0.8.bb
>> @@ -1,6 +1,6 @@
>> =A0require binutils.inc
>>
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>> =A0SRC_URI =3D \
>> =A0 =A0 =A0"${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.=
tar.bz2 \
>> diff --git a/recipes/binutils/binutils_2.17.bb b/recipes/binutils/binuti=
ls_2.17.bb
>> index 0f0b5d6..fdee8a5 100644
>> --- a/recipes/binutils/binutils_2.17.bb
>> +++ b/recipes/binutils/binutils_2.17.bb
>> @@ -1,7 +1,7 @@
>> =A0require binutils.inc
>> =A0require binutils-avr32.inc
>>
>> -PR =3D "r6"
>> +PR =3D "r7"
>>
>> =A0SRC_URI =3D \
>> =A0 =A0 =A0"http://ftp.gnu.org/gnu/binutils/binutils-${PV}.tar.bz2 \
>> diff --git a/recipes/binutils/binutils_2.18.50.0.7.bb b/recipes/binutils=
/binutils_2.18.50.0.7.bb
>> index a89431e..d9a9cec 100644
>> --- a/recipes/binutils/binutils_2.18.50.0.7.bb
>> +++ b/recipes/binutils/binutils_2.18.50.0.7.bb
>> @@ -1,4 +1,4 @@
>> -PR =3D "r6"
>> +PR =3D "r7"
>>
>> =A0require binutils.inc
>>
>> diff --git a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binuti=
ls_2.18.bb
>> index 9367196..b746f9b 100644
>> --- a/recipes/binutils/binutils_2.18.bb
>> +++ b/recipes/binutils/binutils_2.18.bb
>> @@ -1,4 +1,4 @@
>> -PR =3D "r4"
>> +PR =3D "r5"
>>
>> =A0require binutils.inc
>>
>> diff --git a/recipes/binutils/binutils_2.19.1.bb b/recipes/binutils/binu=
tils_2.19.1.bb
>> index c399ab8..aee5840 100644
>> --- a/recipes/binutils/binutils_2.19.1.bb
>> +++ b/recipes/binutils/binutils_2.19.1.bb
>> @@ -1,4 +1,4 @@
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =A0require binutils.inc
>>
>> diff --git a/recipes/binutils/binutils_2.19.bb b/recipes/binutils/binuti=
ls_2.19.bb
>> index aee5840..ef07600 100644
>> --- a/recipes/binutils/binutils_2.19.bb
>> +++ b/recipes/binutils/binutils_2.19.bb
>> @@ -1,4 +1,4 @@
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> =A0require binutils.inc
>>
>> diff --git a/recipes/binutils/binutils_csl-arm-20050416.bb b/recipes/bin=
utils/binutils_csl-arm-20050416.bb
>> index 2c7c207..342572d 100644
>> --- a/recipes/binutils/binutils_csl-arm-20050416.bb
>> +++ b/recipes/binutils/binutils_csl-arm-20050416.bb
>> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>> =A0LICENSE =3D "GPL"
>> =A0FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutil=
s-cvs"
>> =A0PV =3D "2.15.99+csl-arm+cvs20050416"
>> -PR =3D "r3"
>> +PR =3D "r4"
>> =A0OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
>> =A0DEFAULT_PREFERENCE =3D "-1"
>> =A0DEFAULT_PREFERENCE_arm-linux =3D "-1"
>> diff --git a/recipes/binutils/binutils_csl-arm-20050603.bb b/recipes/bin=
utils/binutils_csl-arm-20050603.bb
>> index 13759b4..8a9c0ce 100644
>> --- a/recipes/binutils/binutils_csl-arm-20050603.bb
>> +++ b/recipes/binutils/binutils_csl-arm-20050603.bb
>> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>> =A0LICENSE =3D "GPL"
>> =A0FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutil=
s-cvs"
>> =A0PV =3D "2.15.99+csl-arm+cvs20050603"
>> -PR =3D "r3"
>> +PR =3D "r4"
>> =A0OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
>> =A0DEFAULT_PREFERENCE =3D "-1"
>> =A0#DEFAULT_PREFERENCE_arm-linux =3D "1"
>> diff --git a/recipes/binutils/binutils_cvs.bb b/recipes/binutils/binutil=
s_cvs.bb
>> index 75c8886..0c2064b 100644
>> --- a/recipes/binutils/binutils_cvs.bb
>> +++ b/recipes/binutils/binutils_cvs.bb
>> @@ -1,6 +1,6 @@
>> =A0FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutil=
s-cvs"
>> =A0PV =3D "0.0+cvs${SRCDATE}"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =A0require binutils.inc
>>
>> --
>> 1.6.0.4
>>
>> --
>> Tom Rini
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


