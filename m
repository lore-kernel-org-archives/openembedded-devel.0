Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.7961.1614784202339699048
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 07:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EH65Fdam;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id q85so24239247qke.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 07:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iPNFJVqPn+Gou3T45zXU/knxQx5Ds3fGd1xqJVd0Q3A=;
        b=EH65Fdam/FS0KKT8CgeRTpLLaiaVPZKfhmHIlkouAV7LsQNkp9qrjDn8u+wmb+rWkQ
         GO3jSbMJ1p4VYQubLG9Cnzpncj28OGMkCMu/M3DsMLAF/8wezvylg7CQeqLy92XQRUel
         3gc2JteEYmoRAUP2ZuJ/aCRt1jvtqqvAyth/Q8AAmyrA+xkZywXfGXEq6t9L38iS7jF9
         SYlVL7PsErAjd76ltinjT+PVMjp0ibnM/X0/OMHlGhlrb8HM/Tz2B3DogzWPsAnu7ded
         Mxn4oBtDxPU4kbGXhYtYwgrS5/ZWaT6BorAGFEwRBYacLlOfHSlHWTeKdgvDT+/EUmjV
         bAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iPNFJVqPn+Gou3T45zXU/knxQx5Ds3fGd1xqJVd0Q3A=;
        b=DQL371gjtQn6R2b17Q6IixlslpGNSP5ujOo8cV12h2pcSTC0NsggWqM7z62BiD99rn
         j+a1+s+ETPXFHCxaAbR1dafx52rcz0gZSiUn+mFWXxt0P/w6aml0MZLi/9aVFftKf+Ce
         y03y9bp8Y8UDmA0rSq0210ac5xjolK/1XiOzxqGMdXx/2s84hi0OsGda/b36BjClzCyv
         bcuI8amB3qVPt8UrV9bUjShO2wq2h1cBtA65yNy8+nEymwIZJ3ZVBkY2Z7hcmfnLVuQ7
         pF9H+49a8bVygcUi2jD2u8rHpwJDE8quloJn5ult1JvIvKTZ6k1lZ8Opg+LGimJ5BRte
         YVOw==
X-Gm-Message-State: AOAM531N22AVobD3c2qDH0YOus1peH+d6qOm1hZhyZ+NXSeRZz44MUOk
	xXjDR7wf/0utm+MeGHgpfKWdz5w/1JbgMrOM9+Y=
X-Google-Smtp-Source: ABdhPJwRP2Mi7YklTFQB+o4ob/28h2sYvJmWtQTO8//WHgRrKj8kH9c2p+KfOQzbpE0ZrBGLZ9qc9tGhD2Xu4UxPRII=
X-Received: by 2002:a37:a350:: with SMTP id m77mr24459952qke.146.1614784199172;
 Wed, 03 Mar 2021 07:09:59 -0800 (PST)
MIME-Version: 1.0
References: <20210302200930.544487-1-raj.khem@gmail.com> <CANPvuRn3v_r0DNGbnVG3uwFACLZR3FARE8uowUCzMD2b2JO2nA@mail.gmail.com>
In-Reply-To: <CANPvuRn3v_r0DNGbnVG3uwFACLZR3FARE8uowUCzMD2b2JO2nA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 3 Mar 2021 07:09:31 -0800
Message-ID: <CAMKF1srLqT-FBW=YGTr8X8X8MwnM1rG4EM=3XA_n+V+SrxdwqA@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH] srt: Backport fix for missing <limits> header
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 3, 2021 at 5:39 AM Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:
>
> Hi Khem,
>
> Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 2/03/2021 =C3=
=A0(s) 20:09:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Jose Quaresma <quaresma.jose@gmail.com>
>> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> ---
>>  ...001-core-Fix-build-with-GCC-11.-1806.patch | 26 +++++++++++
>>  .../recipes-support/srt/srt_1.4.2.bb          |  1 +
>>  meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb | 46 +++++++++++++++++++
>
>
> I thinks that mpich needs to go in another patch.
>

indeed. I have messed a squash. Sent v2

>>  3 files changed, 73 insertions(+)
>>  create mode 100644 meta-multimedia/recipes-support/srt/srt/0001-core-Fi=
x-build-with-GCC-11.-1806.patch
>>  create mode 100644 meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
>>
>> diff --git a/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build=
-with-GCC-11.-1806.patch b/meta-multimedia/recipes-support/srt/srt/0001-cor=
e-Fix-build-with-GCC-11.-1806.patch
>> new file mode 100644
>> index 0000000000..0cb6943ccb
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-G=
CC-11.-1806.patch
>> @@ -0,0 +1,26 @@
>> +From f1b35cbf5b9b42b031e9b119e4c802b5f744468c Mon Sep 17 00:00:00 2001
>> +From: Christophe Giboudeaux <krop@users.noreply.github.com>
>> +Date: Wed, 10 Feb 2021 12:42:45 +0000
>> +Subject: [PATCH] [core] Fix build with GCC 11. (#1806)
>> +
>> +The 'limits' header must be included explicitly.
>> +---
>> +Upstream-Status: Backport [https://github.com/haivision/srt/commit/f1b3=
5cbf5b9b42b031e9b119e4c802b5f744468c]
>> + srtcore/sync.h | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/srtcore/sync.h b/srtcore/sync.h
>> +index 59c125a7..9f01ca91 100644
>> +--- a/srtcore/sync.h
>> ++++ b/srtcore/sync.h
>> +@@ -15,6 +15,7 @@
>> + //#define ENABLE_CXX17
>> +
>> + #include <cstdlib>
>> ++#include <limits>
>> + #ifdef ENABLE_STDCXX_SYNC
>> + #include <chrono>
>> + #include <thread>
>> +--
>> +2.30.1
>> +
>> diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb b/meta-mul=
timedia/recipes-support/srt/srt_1.4.2.bb
>> index 567ea68edf..f7dfda28f1 100644
>> --- a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
>> +++ b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
>> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D815ca599c9df2=
47a0c7f619bab123dad"
>>  SRCREV =3D "50b7af06f3a0a456c172b4cb3aceafa8a5cc0036"
>>  SRC_URI =3D "git://github.com/Haivision/srt;protocol=3Dhttps \
>>             file://0001-don-t-install-srt-ffplay.patch \
>> +           file://0001-core-Fix-build-with-GCC-11.-1806.patch \
>>             "
>>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>>  S =3D "${WORKDIR}/git"
>> diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb b/meta-oe/rec=
ipes-devtools/mpich/mpich_3.4.1.bb
>> new file mode 100644
>> index 0000000000..e5f36a5140
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
>> @@ -0,0 +1,46 @@
>> +SUMMARY =3D "Message Passing Interface (MPI) implementation"
>> +HOMEPAGE =3D "http://www.mpich.org/"
>> +SECTION =3D "devel"
>> +
>> +LICENSE =3D "BSD-2-Clause"
>> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbd4d7ab13df98988b1ca2a4e01=
c8c163"
>> +
>> +SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.ta=
r.gz"
>> +SRC_URI[sha256sum] =3D "8836939804ef6d492bcee7d54abafd6477d2beca247157d=
92688654d13779727"
>> +
>> +RDEPENDS_${PN} +=3D "bash perl libxml2"
>> +
>> +EXTRA_OECONF =3D "--enable-debuginfo \
>> +    --enable-fast \
>> +    --enable-shared  \
>> +    --with-pm=3Dgforker  \
>> +    --disable-rpath \
>> +    --disable-f77 \
>> +    --disable-fc \
>> +    --disable-fortran \
>> +    --disable-cxx \
>> +    --with-device=3Dch4:ucx \
>> +    --disable-numa \
>> +"
>> +
>> +inherit autotools gettext pkgconfig
>> +
>> +do_configure() {
>> +    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
>> +        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/con=
fdb \
>> +        modules/yaksa/m4 modules/json-c modules/ucx test/mpi/dtpools/co=
nfdb \
>> +        src/mpl/confdb src/mpi/romio/confdb;  do
>> +        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.gue=
ss ${S}/$d
>> +        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub=
 ${S}/$d
>> +    done
>> +    cd ${S}
>> +    autoupdate
>> +    autoreconf --verbose --install --force
>> +    cd ${B}
>> +    oe_runconf
>> +}
>> +
>> +do_install_append() {
>> +    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
>> +    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
>> +}
>> --
>> 2.30.1
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
