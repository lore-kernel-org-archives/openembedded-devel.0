Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43F9EE49A9
	for <webhook@archiver.kernel.org>; Sat, 19 Aug 2023 07:56:59 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.5527.1692431810702186883
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Aug 2023 00:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=neCEthDl;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3196afc7d4bso1473215f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 00:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692431809; x=1693036609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OsLWZgRThajON08pLcbPWyIfE8JadrwZ2n4FYl++Z9Y=;
        b=neCEthDlyPkqHu1hKdhgT8aqo2RiBwYY5U+DsFdeZbEyD2Jo0FAzxa9OqGj611uG9C
         m/uhXaHlFPUyTVfbx5cmZchh0QMOw9vbtEcfoS4lgdKPX+NEI84BCXaRpXF9+HueBWJ2
         4PZe3XuDAW4R1irEXIIkhYuxw+1kQeFiXrcoGQiPcgcVCUpTWw+7rCaLaKsWPW7OAkXt
         Gkz2lZVwmCTYj2HqS5vJrDnkt0FUUR0U1YYULEP1ljoCInN60MTxWP60pThdnc/NH44X
         yhlEzeCqpBr0BQcSk2uutYwMA9nzKQNZNcaabyADUBCHXDgjMH0iMasjstAT+mrzVvXg
         IpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692431809; x=1693036609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsLWZgRThajON08pLcbPWyIfE8JadrwZ2n4FYl++Z9Y=;
        b=QFDE1O973bwYDLkHvFu8fBNf+av33dKYk/K5PAIa4ZcLbNQ3GytQlEk9uVaFa2huUL
         atCcytsMZNWiYcrogh3ySt7xuAjI332IdyAXjJzcE701zwh8GdPeNmeA3VK/YMb7pShT
         OzlQxOYrdvJpzRQHB4LZPki7Fe14eJLFNqmOiaPerZqlka2NrXp/Qw+MBw2eGvPcnJFj
         oh0lcLhVdAymXD0d+NizApIAg7CJAe1azDqvigjd/r6sZrlfcg4N15Z6qarBO1DLga/b
         kYNphfCv4zH2jCZXzF9iEFEX8dXkZBk2rR9OELUUlpjEp5PldIN7u/gWQIqkiKcm8WXi
         ppVg==
X-Gm-Message-State: AOJu0YxOEEAgIvksNX/mLF/rVK62Is0wdPenNe4qIKerO+0dkmTSMrCZ
	XwyWT4OyKyO/okppWiW3xl5rNJvZ0J4yGfY9ghg=
X-Google-Smtp-Source: AGHT+IGRfVZBokh/zmsQKJdNrrn+5f/dKaSr9v36VUEBwfhEZukxoclQ2s5ztrQG8Qp/eprlhzxLZKSjBchbUEzzdOI=
X-Received: by 2002:a05:6000:187:b0:317:43e0:3f33 with SMTP id
 p7-20020a056000018700b0031743e03f33mr1056993wrx.37.1692431808667; Sat, 19 Aug
 2023 00:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230816055711.2298616-1-mingli.yu@windriver.com> <CAMKF1sqAaWQvspgnfG0Z28dP=8izOa4zu3yL6wO2AYZwd-Fjfw@mail.gmail.com>
In-Reply-To: <CAMKF1sqAaWQvspgnfG0Z28dP=8izOa4zu3yL6wO2AYZwd-Fjfw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 19 Aug 2023 09:56:37 +0200
Message-ID: <CA+chaQeEiL03NSX-A7WwKKQx8umFzGvUgCBSBZXrnWopAS0YcQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.11.5
To: Khem Raj <raj.khem@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c32327060341fc35"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 07:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104495

--000000000000c32327060341fc35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It also started to fetch fmt in mariadb-native.do_compile (and failing
because network is disabled)

[  1%] Performing download step (download, verify and extract) for 'libfmt'
cd
TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build/extra/libfmt/sr=
c
&&
TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/recipe-sysroot-native=
/usr/bin/cmake
-P
TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build/extra/libfmt/sr=
c/libfmt-stamp/download-libfmt.cmake
-- Downloading...

 dst=3D'TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build/extra/l=
ibfmt/src/8.0.1.zip'
   timeout=3D'none'
   inactivity timeout=3D'none'
-- Using src=3D'https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip'

CMake Error at libfmt-stamp/download-libfmt.cmake:170 (message):
  Each download failed!

    error: downloading '
https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
          status_code: 6
          status_string: "Couldn't resolve host name"
          log:
          --- LOG BEGIN ---
          getaddrinfo(3) failed for github.com:443

  Could not resolve host: github.com

  Closing connection 0



          --- LOG END ---
          error: downloading '
https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
          status_code: 6
          status_string: "Couldn't resolve host name"
          log:
          --- LOG BEGIN ---
          getaddrinfo(3) failed for github.com:443

  Could not resolve host: github.com

  Closing connection 0



          --- LOG END ---
          error: downloading '
https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
          status_code: 6
          status_string: "Couldn't resolve host name"
          log:
          --- LOG BEGIN ---
          getaddrinfo(3) failed for github.com:443

  Could not resolve host: github.com

  Closing connection 0



          --- LOG END ---
          error: downloading '
https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
          status_code: 6
          status_string: "Couldn't resolve host name"
          log:
          --- LOG BEGIN ---
          getaddrinfo(3) failed for github.com:443

  Could not resolve host: github.com

  Closing connection 0



          --- LOG END ---
          error: downloading '
https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
          status_code: 6
          status_string: "Couldn't resolve host name"
          log:
          --- LOG BEGIN ---
          getaddrinfo(3) failed for github.com:443

  Could not resolve host: github.com

  Closing connection 0



          --- LOG END ---
          error: downloading '
https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
          status_code: 6
          status_string: "Couldn't resolve host name"
          log:
          --- LOG BEGIN ---
          getaddrinfo(3) failed for github.com:443

  Could not resolve host: github.com

  Closing connection 0



          --- LOG END ---




make[2]: *** [CMakeFiles/libfmt.dir/build.make:99:
extra/libfmt/src/libfmt-stamp/libfmt-download] Error 1
make[2]: Leaving directory
'TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build'
make[1]: *** [CMakeFiles/Makefile2:2828: CMakeFiles/libfmt.dir/all] Error 2
make[1]: *** Waiting for unfinished jobs....

On Wed, Aug 16, 2023 at 6:02=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> mariadb-native ends up with following errors on debian12 hosts
>
> |
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mariadb-native/10.11.5/mari=
adb-10.11.5/plugin/auth_pam/testing/pam_mariadb_mtr.c:13:10:
> fatal error: security/pam_modules.h: No such file or directory
> |    13 | #include <security/pam_modules.h>
> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~
> | compilation terminated.
> | make[2]: ***
> [plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/build.make:76:
> plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/pam_mariadb_mtr.c.=
o]
> Error 1
> | make[1]: *** [CMakeFiles/Makefile2:8636:
> plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/all] Error 2
> | make[1]: *** Waiting for unfinished jobs....
> | [  2%] Building C object
> plugin/auth_ed25519/CMakeFiles/ref10.dir/ref10/fe_1.c.o
> | [  2%] Linking C static library libma_getopt.a
> |
> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mariadb-native/10.11.5/mari=
adb-10.11.5/plugin/auth_pam/mapper/pam_user_map.c:44:10:
> fatal error: security/pam_ext.h: No such file or directory
> |    44 | #include <security/pam_ext.h>
> |       |          ^~~~~~~~~~~~~~~~~~~~
> | compilation terminated.
>
> On Tue, Aug 15, 2023 at 10:57=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windri=
ver.com>
> wrote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  .../{mariadb-native_10.11.4.bb =3D> mariadb-native_10.11.5.bb}    | 0
> >  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
> >  .../mysql/{mariadb_10.11.4.bb =3D> mariadb_10.11.5.bb}            | 0
> >  3 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.4.bb =3D>
> mariadb-native_10.11.5.bb} (100%)
> >  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.4.bb =3D>
> mariadb_10.11.5.bb} (100%)
> >
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb
> b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb
> > similarity index 100%
> > rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb
> > rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
> b/meta-oe/recipes-dbs/mysql/mariadb.inc
> > index 2fb0bd7be..f364f47bf 100644
> > --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> > +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> > @@ -25,7 +25,7 @@ SRC_URI =3D "
> https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
> >             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
> >            "
> >  SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
> > -SRC_URI[sha256sum] =3D
> "ce8dac125568cc5f40da74c17212767c92d8faed81066580b526a485a591127d"
> > +SRC_URI[sha256sum] =3D
> "4c9484048d4d0c71dd076ab33fc2a9ce8510bdf762886de0d63fe52496f3dbbb"
> >
> >  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
> >
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb
> b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
> > similarity index 100%
> > rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb
> > rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104432):
> https://lists.openembedded.org/g/openembedded-devel/message/104432
> Mute This Topic: https://lists.openembedded.org/mt/100774345/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c32327060341fc35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It also started to fetch fmt in=C2=A0mariadb-native.do_com=
pile (and failing because network is disabled)<div><br></div><div>[ =C2=A01=
%] Performing download step (download, verify and extract) for &#39;libfmt&=
#39;<br></div><div>cd TOPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4=
/build/extra/libfmt/src &amp;&amp; TOPDIR/BUILD/work/x86_64-linux/mariadb-n=
ative/10.11.4/recipe-sysroot-native/usr/bin/cmake -P TOPDIR/BUILD/work/x86_=
64-linux/mariadb-native/10.11.4/build/extra/libfmt/src/libfmt-stamp/downloa=
d-libfmt.cmake<br></div><div>-- Downloading...<br>=C2=A0 =C2=A0dst=3D&#39;T=
OPDIR/BUILD/work/x86_64-linux/mariadb-native/10.11.4/build/extra/libfmt/src=
/8.0.1.zip&#39;<br>=C2=A0 =C2=A0timeout=3D&#39;none&#39;<br>=C2=A0 =C2=A0in=
activity timeout=3D&#39;none&#39;<br>-- Using src=3D&#39;<a href=3D"https:/=
/github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip">https://github.com/fmtl=
ib/fmt/archive/refs/tags/8.0.1.zip</a>&#39;<br></div><div><br></div><div>CM=
ake Error at libfmt-stamp/download-libfmt.cmake:170 (message):<br>=C2=A0 Ea=
ch download failed!<br><br>=C2=A0 =C2=A0 error: downloading &#39;<a href=3D=
"https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip">https://github.=
com/fmtlib/fmt/archive/refs/tags/8.0.1.zip</a>&#39; failed<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 status_code: 6<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
status_string: &quot;Couldn&#39;t resolve host name&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG BEG=
IN ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getaddrinfo(3) failed for <a h=
ref=3D"http://github.com:443">github.com:443</a><br><br>=C2=A0 Could not re=
solve host: <a href=3D"http://github.com">github.com</a><br><br>=C2=A0 Clos=
ing connection 0<br><br><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG =
END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error: downloading &#39;<a hr=
ef=3D"https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip">https://gi=
thub.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip</a>&#39; failed<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status_code: 6<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 status_string: &quot;Couldn&#39;t resolve host name&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- =
LOG BEGIN ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getaddrinfo(3) failed f=
or <a href=3D"http://github.com:443">github.com:443</a><br><br>=C2=A0 Could=
 not resolve host: <a href=3D"http://github.com">github.com</a><br><br>=C2=
=A0 Closing connection 0<br><br><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
--- LOG END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error: downloading &#=
39;<a href=3D"https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip">ht=
tps://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip</a>&#39; failed<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_code: 6<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 status_string: &quot;Couldn&#39;t resolve host name&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --- LOG BEGIN ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getaddrinfo(3) =
failed for <a href=3D"http://github.com:443">github.com:443</a><br><br>=C2=
=A0 Could not resolve host: <a href=3D"http://github.com">github.com</a><br=
><br>=C2=A0 Closing connection 0<br><br><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 --- LOG END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error: downlo=
ading &#39;<a href=3D"https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1=
.zip">https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip</a>&#39; fa=
iled<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_code: 6<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 status_string: &quot;Couldn&#39;t resolve host name&qu=
ot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --- LOG BEGIN ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getaddri=
nfo(3) failed for <a href=3D"http://github.com:443">github.com:443</a><br><=
br>=C2=A0 Could not resolve host: <a href=3D"http://github.com">github.com<=
/a><br><br>=C2=A0 Closing connection 0<br><br><br><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 --- LOG END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error: =
downloading &#39;<a href=3D"https://github.com/fmtlib/fmt/archive/refs/tags=
/8.0.1.zip">https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip</a>&#=
39; failed<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_code: 6<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status_string: &quot;Couldn&#39;t resolve host =
name&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 --- LOG BEGIN ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
etaddrinfo(3) failed for <a href=3D"http://github.com:443">github.com:443</=
a><br><br>=C2=A0 Could not resolve host: <a href=3D"http://github.com">gith=
ub.com</a><br><br>=C2=A0 Closing connection 0<br><br><br><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 --- LOG END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
error: downloading &#39;<a href=3D"https://github.com/fmtlib/fmt/archive/re=
fs/tags/8.0.1.zip">https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zi=
p</a>&#39; failed<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_code: 6<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_string: &quot;Couldn&#39;t resolv=
e host name&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log:<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG BEGIN ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 getaddrinfo(3) failed for <a href=3D"http://github.com:443">github.c=
om:443</a><br><br>=C2=A0 Could not resolve host: <a href=3D"http://github.c=
om">github.com</a><br><br>=C2=A0 Closing connection 0<br><br><br><br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- LOG END ---<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 <br>=C2=A0 =C2=A0 <br><br><br>make[2]: *** [CMakeFiles/libfmt.dir/b=
uild.make:99: extra/libfmt/src/libfmt-stamp/libfmt-download] Error 1<br>mak=
e[2]: Leaving directory &#39;TOPDIR/BUILD/work/x86_64-linux/mariadb-native/=
10.11.4/build&#39;<br>make[1]: *** [CMakeFiles/Makefile2:2828: CMakeFiles/l=
ibfmt.dir/all] Error 2<br>make[1]: *** Waiting for unfinished jobs....<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Aug 16, 2023 at 6:02=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">mariadb-native ends up with followin=
g errors on debian12 hosts<br>
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
Links: You receive all messages sent to this group.<br>
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

--000000000000c32327060341fc35--

