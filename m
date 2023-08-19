Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0552CEE49A3
	for <webhook@archiver.kernel.org>; Sat, 19 Aug 2023 15:26:52 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.11518.1692458802755539192
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Aug 2023 08:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OJ14Sjcc;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1c52dbc300bso1116026fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692458802; x=1693063602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S7hoSCYhBHngnHErMxOkBB/UFN4Fir7i1e4qkaiFShs=;
        b=OJ14SjccuGOTRJ0X4rE/dNq6bOFl+/+5Fw+xmQL7OngrcJmdLMRE2s8TDhaae4KzIa
         kKLnh88vVPL+5DD0f+2Pnm+WmrmIgYi9zKfjBM5hO24ofwPp2TK1lmoBVp9ZwPxQYuuT
         ZlhoFWWAOANskxnVcwReXe+o9ia9jJm9Y9CSf7SMUvcBT4762FbeU+OaUfWcdz4GDDmX
         WfqFNe3hu+APKf05WdgoATkteKQmG+7MyeDiHiA9O01SSX7rD7mjcIsR4V6N0bsQOr9b
         QC2pzApLIjjI+AxPlL/LhnHf1LTnpduOJpHh7cmpdxXtEUZDCtY2ZtD4FUWi8S8t6OkE
         6vLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692458802; x=1693063602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7hoSCYhBHngnHErMxOkBB/UFN4Fir7i1e4qkaiFShs=;
        b=Rla5U1N3NuiZeOgXlEuKFt0kRXQFHbFxJoN6X9HqaI84gCEVg1NrBMKKPOgdW73PYR
         6DukbZoJRSDQnGKiswtvwZB2LKfZuC6EARqX5soxHSAXZFJJF2wyaY5bvzgyANQzMI3G
         HjkpeXN4Km8oKIXJSjRE0mWPGLCT8YCSooRrCMneo8c6xtf4woBqBaRAQ6qJtq6KNIOM
         9poU2mWite4u2zmM2PgtobMj6yPUhelUidEObd7+dCv0UkAfSHUgcCrxV1k7FusaEOYT
         aVNO26au0MI3okITSNStlK56Pa7N+7iplsAkVnNDvk9hiyOOKfjFv7Gf54KY4xjdBPbu
         LLRA==
X-Gm-Message-State: AOJu0YxguDxm3YZ2D9fQm4Q3xo5PW+BnsbmaTML8XwMPePPBDVLlifoN
	ENkEfCbS63kN4AdNu25GYHGX6S8MG2PI/qM6hPw=
X-Google-Smtp-Source: AGHT+IFUjAtjv5iizaPP2m+jP19XCM3q/kOyXRehJ4vkWcT0VdCL3oAKFt7bS7lSWx8rFGhUnP1WE3VjsG2dudIpdL4=
X-Received: by 2002:a05:6870:e304:b0:1bf:9fa2:bf94 with SMTP id
 z4-20020a056870e30400b001bf9fa2bf94mr3254164oad.5.1692458801870; Sat, 19 Aug
 2023 08:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230816055711.2298616-1-mingli.yu@windriver.com>
 <CAMKF1sqAaWQvspgnfG0Z28dP=8izOa4zu3yL6wO2AYZwd-Fjfw@mail.gmail.com> <CA+chaQeEiL03NSX-A7WwKKQx8umFzGvUgCBSBZXrnWopAS0YcQ@mail.gmail.com>
In-Reply-To: <CA+chaQeEiL03NSX-A7WwKKQx8umFzGvUgCBSBZXrnWopAS0YcQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Aug 2023 08:26:30 -0700
Message-ID: <CAMKF1soFr5p9_WqBSfLnv+grHpTB3cPcuYt9dFDioyotkU5Kzg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.11.5
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aeba070603484568"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 15:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104497

--000000000000aeba070603484568
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is a patch in master-next to address this

On Sat, Aug 19, 2023 at 12:56 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> It also started to fetch fmt in mariadb-native.do_compile (and failing
> because network is disabled)
>
> [  1%] Performing download step (download, verify and extract) for 'libfm=
t'
> cd
> TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build/extra/libfmt/=
src
> &&
> TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/recipe-sysroot-nati=
ve/usr/bin/cmake
> -P
> TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build/extra/libfmt/=
src/libfmt-stamp/download-libfmt.cmake
> -- Downloading...
>
>  dst=3D'TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build/extra=
/libfmt/src/8.0.1.zip'
>    timeout=3D'none'
>    inactivity timeout=3D'none'
> -- Using src=3D'https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip=
'
>
> CMake Error at libfmt-stamp/download-libfmt.cmake:170 (message):
>   Each download failed!
>
>     error: downloading '
> https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
>           status_code: 6
>           status_string: "Couldn't resolve host name"
>           log:
>           --- LOG BEGIN ---
>           getaddrinfo(3) failed for github.com:443
>
>   Could not resolve host: github.com
>
>   Closing connection 0
>
>
>
>           --- LOG END ---
>           error: downloading '
> https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
>           status_code: 6
>           status_string: "Couldn't resolve host name"
>           log:
>           --- LOG BEGIN ---
>           getaddrinfo(3) failed for github.com:443
>
>   Could not resolve host: github.com
>
>   Closing connection 0
>
>
>
>           --- LOG END ---
>           error: downloading '
> https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
>           status_code: 6
>           status_string: "Couldn't resolve host name"
>           log:
>           --- LOG BEGIN ---
>           getaddrinfo(3) failed for github.com:443
>
>   Could not resolve host: github.com
>
>   Closing connection 0
>
>
>
>           --- LOG END ---
>           error: downloading '
> https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
>           status_code: 6
>           status_string: "Couldn't resolve host name"
>           log:
>           --- LOG BEGIN ---
>           getaddrinfo(3) failed for github.com:443
>
>   Could not resolve host: github.com
>
>   Closing connection 0
>
>
>
>           --- LOG END ---
>           error: downloading '
> https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
>           status_code: 6
>           status_string: "Couldn't resolve host name"
>           log:
>           --- LOG BEGIN ---
>           getaddrinfo(3) failed for github.com:443
>
>   Could not resolve host: github.com
>
>   Closing connection 0
>
>
>
>           --- LOG END ---
>           error: downloading '
> https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
>           status_code: 6
>           status_string: "Couldn't resolve host name"
>           log:
>           --- LOG BEGIN ---
>           getaddrinfo(3) failed for github.com:443
>
>   Could not resolve host: github.com
>
>   Closing connection 0
>
>
>
>           --- LOG END ---
>
>
>
>
> make[2]: *** [CMakeFiles/libfmt.dir/build.make:99:
> extra/libfmt/src/libfmt-stamp/libfmt-download] Error 1
> make[2]: Leaving directory
> 'TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build'
> make[1]: *** [CMakeFiles/Makefile2:2828: CMakeFiles/libfmt.dir/all] Error=
 2
> make[1]: *** Waiting for unfinished jobs....
>
> On Wed, Aug 16, 2023 at 6:02=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>
>> mariadb-native ends up with following errors on debian12 hosts
>>
>> |
>> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mariadb-native/10.11.5/mar=
iadb-10.11.5/plugin/auth_pam/testing/pam_mariadb_mtr.c:13:10:
>> fatal error: security/pam_modules.h: No such file or directory
>> |    13 | #include <security/pam_modules.h>
>> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~
>> | compilation terminated.
>> | make[2]: ***
>> [plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/build.make:76:
>>
>> plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/pam_mariadb_mtr.c=
.o]
>> Error 1
>> | make[1]: *** [CMakeFiles/Makefile2:8636:
>> plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/all] Error 2
>> | make[1]: *** Waiting for unfinished jobs....
>> | [  2%] Building C object
>> plugin/auth_ed25519/CMakeFiles/ref10.dir/ref10/fe_1.c.o
>> | [  2%] Linking C static library libma_getopt.a
>> |
>> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mariadb-native/10.11.5/mar=
iadb-10.11.5/plugin/auth_pam/mapper/pam_user_map.c:44:10:
>> fatal error: security/pam_ext.h: No such file or directory
>> |    44 | #include <security/pam_ext.h>
>> |       |          ^~~~~~~~~~~~~~~~~~~~
>> | compilation terminated.
>>
>> On Tue, Aug 15, 2023 at 10:57=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windr=
iver.com>
>> wrote:
>> >
>> > From: Mingli Yu <mingli.yu@windriver.com>
>> >
>> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> > ---
>> >  .../{mariadb-native_10.11.4.bb =3D> mariadb-native_10.11.5.bb}    | 0
>> >  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +=
-
>> >  .../mysql/{mariadb_10.11.4.bb =3D> mariadb_10.11.5.bb}            | 0
>> >  3 files changed, 1 insertion(+), 1 deletion(-)
>> >  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.4.bb =3D>
>> mariadb-native_10.11.5.bb} (100%)
>> >  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.4.bb =3D>
>> mariadb_10.11.5.bb} (100%)
>> >
>> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb
>> b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb
>> > similarity index 100%
>> > rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb
>> > rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb
>> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> > index 2fb0bd7be..f364f47bf 100644
>> > --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> > +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> > @@ -25,7 +25,7 @@ SRC_URI =3D "
>> https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>> >             file://0001-Add-missing-includes-cstdint-and-cstdio.patch =
\
>> >            "
>> >  SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
>> > -SRC_URI[sha256sum] =3D
>> "ce8dac125568cc5f40da74c17212767c92d8faed81066580b526a485a591127d"
>> > +SRC_URI[sha256sum] =3D
>> "4c9484048d4d0c71dd076ab33fc2a9ce8510bdf762886de0d63fe52496f3dbbb"
>> >
>> >  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
>> >
>> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb
>> b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
>> > similarity index 100%
>> > rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb
>> > rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
>> > --
>> > 2.25.1
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>>
> View/Reply Online (#104432):
>> https://lists.openembedded.org/g/openembedded-devel/message/104432
>> Mute This Topic: https://lists.openembedded.org/mt/100774345/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000aeba070603484568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There is a patch in master-next to address this=C2=A0</di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sat, Aug 19, 2023 at 12:56 AM Martin Jansa &lt;<a href=3D"mailto:martin=
.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr">It also started to fetch fmt in=C2=A0=
mariadb-native.do_compile (and failing because network is disabled)<div><br=
></div><div>[ =C2=A01%] Performing download step (download, verify and extr=
act) for &#39;libfmt&#39;<br></div><div>cd TOPDIR/BUILD/work/x86_64-linux/m=
ariadb-native/10.11.4/build/extra/libfmt/src &amp;&amp; TOPDIR/BUILD/work/x=
86_64-linux/mariadb-native/10.11.4/recipe-sysroot-native/usr/bin/cmake -P T=
OPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build/extra/libfmt/src=
/libfmt-stamp/download-libfmt.cmake<br></div><div>-- Downloading...<br>=C2=
=A0 =C2=A0dst=3D&#39;TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/=
build/extra/libfmt/src/8.0.1.zip&#39;<br>=C2=A0 =C2=A0timeout=3D&#39;none&#=
39;<br>=C2=A0 =C2=A0inactivity timeout=3D&#39;none&#39;<br>-- Using src=3D&=
#39;<a href=3D"https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip" t=
arget=3D"_blank">https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip<=
/a>&#39;<br></div><div><br></div><div>CMake Error at libfmt-stamp/download-=
libfmt.cmake:170 (message):<br>=C2=A0 Each download failed!<br><br>=C2=A0 =
=C2=A0 error: downloading &#39;<a href=3D"https://github.com/fmtlib/fmt/arc=
hive/refs/tags/8.0.1.zip" target=3D"_blank">https://github.com/fmtlib/fmt/a=
rchive/refs/tags/8.0.1.zip</a>&#39; failed<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 status_code: 6<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_string: =
&quot;Couldn&#39;t resolve host name&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 log:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG BEGIN ---<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getaddrinfo(3) failed for <a href=3D"http:/=
/github.com:443" target=3D"_blank">github.com:443</a><br><br>=C2=A0 Could n=
ot resolve host: <a href=3D"http://github.com" target=3D"_blank">github.com=
</a><br><br>=C2=A0 Closing connection 0<br><br><br><br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 --- LOG END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error:=
 downloading &#39;<a href=3D"https://github.com/fmtlib/fmt/archive/refs/tag=
s/8.0.1.zip" target=3D"_blank">https://github.com/fmtlib/fmt/archive/refs/t=
ags/8.0.1.zip</a>&#39; failed<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_=
code: 6<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_string: &quot;Couldn&#=
39;t resolve host name&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG BEGIN ---<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 getaddrinfo(3) failed for <a href=3D"http://github.com:44=
3" target=3D"_blank">github.com:443</a><br><br>=C2=A0 Could not resolve hos=
t: <a href=3D"http://github.com" target=3D"_blank">github.com</a><br><br>=
=C2=A0 Closing connection 0<br><br><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --- LOG END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error: downloadin=
g &#39;<a href=3D"https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip=
" target=3D"_blank">https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.z=
ip</a>&#39; failed<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_code: 6<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_string: &quot;Couldn&#39;t resolv=
e host name&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG BEGIN ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 getaddrinfo(3) failed for <a href=3D"http://github.com:443" target=
=3D"_blank">github.com:443</a><br><br>=C2=A0 Could not resolve host: <a hre=
f=3D"http://github.com" target=3D"_blank">github.com</a><br><br>=C2=A0 Clos=
ing connection 0<br><br><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG =
END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error: downloading &#39;<a hr=
ef=3D"https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip" target=3D"=
_blank">https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip</a>&#39; =
failed<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_code: 6<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 status_string: &quot;Couldn&#39;t resolve host nam=
e&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 --- LOG BEGIN ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getad=
drinfo(3) failed for <a href=3D"http://github.com:443" target=3D"_blank">gi=
thub.com:443</a><br><br>=C2=A0 Could not resolve host: <a href=3D"http://gi=
thub.com" target=3D"_blank">github.com</a><br><br>=C2=A0 Closing connection=
 0<br><br><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG END ---<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error: downloading &#39;<a href=3D"https://=
github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip" target=3D"_blank">https:=
//github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip</a>&#39; failed<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_code: 6<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status_string: &quot;Couldn&#39;t resolve host name&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
--- LOG BEGIN ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getaddrinfo(3) fail=
ed for <a href=3D"http://github.com:443" target=3D"_blank">github.com:443</=
a><br><br>=C2=A0 Could not resolve host: <a href=3D"http://github.com" targ=
et=3D"_blank">github.com</a><br><br>=C2=A0 Closing connection 0<br><br><br>=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG END ---<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 error: downloading &#39;<a href=3D"https://github.com/fmt=
lib/fmt/archive/refs/tags/8.0.1.zip" target=3D"_blank">https://github.com/f=
mtlib/fmt/archive/refs/tags/8.0.1.zip</a>&#39; failed<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 status_code: 6<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat=
us_string: &quot;Couldn&#39;t resolve host name&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG BEGIN =
---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getaddrinfo(3) failed for <a href=
=3D"http://github.com:443" target=3D"_blank">github.com:443</a><br><br>=C2=
=A0 Could not resolve host: <a href=3D"http://github.com" target=3D"_blank"=
>github.com</a><br><br>=C2=A0 Closing connection 0<br><br><br><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <br>=C2=A0 =C2=A0 <br><br><br>make[2]: *** [CMakeFiles/libfmt.dir/bu=
ild.make:99: extra/libfmt/src/libfmt-stamp/libfmt-download] Error 1<br>make=
[2]: Leaving directory &#39;TOPDIR/BUILD/work/x86_64-linux/mariadb-native/1=
0.11.4/build&#39;<br>make[1]: *** [CMakeFiles/Makefile2:2828: CMakeFiles/li=
bfmt.dir/all] Error 2<br>make[1]: *** Waiting for unfinished jobs....<br></=
div></div><br><div class=3D"gmail_quote"></div><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 16, 2023 at 6:02=E2=80=AFP=
M Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"></blockquote></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">mariadb=
-native ends up with following errors on debian12 hosts<br>
<br>
| /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mariadb-native/10.11.5/mari=
adb-10.11.5/plugin/auth_pam/testing/pam_mariadb_mtr.c:13:10:<br>
fatal error: security/pam_modules.h: No such file or directory<br>
|=C2=A0 =C2=A0 13 | #include &lt;security/pam_modules.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~~~~~~<br>
| compilation terminated.<br>
| make[2]: *** [plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/buil=
d.make:76:<br>
plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/pam_mariadb_mtr.c.o]=
<br>
Error 1<br>
| make[1]: *** [CMakeFiles/Makefile2:8636:<br>
plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/all] Error 2<br>
| make[1]: *** Waiting for unfinished jobs....<br>
| [=C2=A0 2%] Building C object<br>
plugin/auth_ed25519/CMakeFiles/ref10.dir/ref10/fe_1.c.o<br>
| [=C2=A0 2%] Linking C static library libma_getopt.a<br>
| /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mariadb-native/10.11.5/mari=
adb-10.11.5/plugin/auth_pam/mapper/pam_user_map.c:44:10:<br>
fatal error: security/pam_ext.h: No such file or directory<br>
|=C2=A0 =C2=A0 44 | #include &lt;security/pam_ext.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~~<br>
| compilation terminated.<br>
<br>
On Tue, Aug 15, 2023 at 10:57=E2=80=AFPM Yu, Mingli &lt;<a href=3D"mailto:m=
ingli.yu@eng.windriver.com" target=3D"_blank">mingli.yu@eng.windriver.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=
=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com=
" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{<a href=3D"http://mariadb-native_10.11.4.bb" rel=3D"norefer=
rer" target=3D"_blank">mariadb-native_10.11.4.bb</a> =3D&gt; <a href=3D"htt=
p://mariadb-native_10.11.5.bb" rel=3D"noreferrer" target=3D"_blank">mariadb=
-native_10.11.5.bb</a>}=C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +=
-<br>
&gt;=C2=A0 .../mysql/{<a href=3D"http://mariadb_10.11.4.bb" rel=3D"noreferr=
er" target=3D"_blank">mariadb_10.11.4.bb</a> =3D&gt; <a href=3D"http://mari=
adb_10.11.5.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.5.bb</a>=
}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 3 files changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-nati=
ve_10.11.4.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.4.=
bb</a> =3D&gt; <a href=3D"http://mariadb-native_10.11.5.bb" rel=3D"noreferr=
er" target=3D"_blank">mariadb-native_10.11.5.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_10.1=
1.4.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.4.bb</a> =3D&gt;=
 <a href=3D"http://mariadb_10.11.5.bb" rel=3D"noreferrer" target=3D"_blank"=
>mariadb_10.11.5.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-nativ=
e_10.11.4.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.4.b=
b</a> b/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_10.11.5.=
bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.5.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native=
_10.11.4.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.4.bb=
</a><br>
&gt; rename to meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_1=
0.11.5.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.5.bb</=
a><br>
&gt; diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-d=
bs/mysql/mariadb.inc<br>
&gt; index 2fb0bd7be..f364f47bf 100644<br>
&gt; --- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt; +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt; @@ -25,7 +25,7 @@ SRC_URI =3D &quot;<a href=3D"https://archive.mariadb=
.org/$%7BBP%7D/source/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank=
">https://archive.mariadb.org/${BP}/source/${BP}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-missing=
-includes-cstdint-and-cstdio.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI:append:libc-musl =3D &quot; file://ppc-remove-glibc-dep.=
patch&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;ce8dac125568cc5f40da74c17212767c92d8faed=
81066580b526a485a591127d&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;4c9484048d4d0c71dd076ab33fc2a9ce8510bdf7=
62886de0d63fe52496f3dbbb&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/Maria=
DB/server/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/MariaDB/server/releases</a>&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb_10.11=
.4.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.4.bb</a> b/meta-o=
e/recipes-dbs/mysql/<a href=3D"http://mariadb_10.11.5.bb" rel=3D"noreferrer=
" target=3D"_blank">mariadb_10.11.5.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb_10.11.=
4.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.4.bb</a><br>
&gt; rename to meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb_10.11.5.=
bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.5.bb</a><br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br></blockquote></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
View/Reply Online (#104432): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104432" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104432</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100774345/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100774345/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000aeba070603484568--

