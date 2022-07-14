Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D72FC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 07:02:30 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.4769.1657782140589991632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 00:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JdRfi7Ar;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id o21so609102qkm.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 00:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yKejpE+3v2PxwnnDlvnimninJbksEMd6qSaK59XcXmw=;
        b=JdRfi7Aroc45g0KNYsb3on+8vjgoS9fzW0U8KkCenWjxuGTU14r2y2NxRVPhrJr3Az
         ZZn+X6TLFyv11JEoFLp/ycLX3w8rcMCB6t6252MRRwZgESgWLMNx0d3ozOCcpJcF44Cg
         Q8m/19lXm0vsjLbSIc6PE6RW2yZBaOrfcwb5pUSL5W8+rUzPPSR9FTcGpXSmug/7MA2H
         N12Zbw6OFxRVOV50tgECwzmOHEtqx86WcyMG/v7LMwXFTohINBsvX5eEgwSRqnjMONYV
         bwTWQKOKXVsJso/B1IX0t70dv6f+PPVD7r6BA8ia0wrFR3qsVWGvdG4KkdlU7jdysZVn
         zU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKejpE+3v2PxwnnDlvnimninJbksEMd6qSaK59XcXmw=;
        b=JssfLRrPqim79brpgcX3C4hc6Q/LhnvdcfDrARPo5B19Kz6WU9LgKrQuOWz2IQRivQ
         1eaoaUsgwlIdhkvw5KI+Rvi4CUY6rDUEBzCZ9Hz2vPlGjGTDf1Jt5kPhJfjWjCgXfzE/
         1YqWrAB9WH1lp8R7M8Av4LMBExMJqzLt1neoaI0TkGbqN/Mr99xgnt1toaoOk4/qWNuS
         iNp0BN6Krhtpd64hwm39zLQaVdWSKFrMSeb6OOC3A8g14UZqvQkflprMX0JD1Q9MIsrf
         MaYwi9Kw4o9e6PA9tIAJE6xOB+GWyqE8+fX55kDcrHdgPka8GynmqAJvVMl0nr8njeW1
         fumg==
X-Gm-Message-State: AJIora9PgP/DDald4k1I0uNLf8hUD1X0TQridM1qrY9JHRkROwfobx8N
	PV6+Qx0tP0whO71jMpw47Cz31iapzGFUg6M30is=
X-Google-Smtp-Source: 
 AGRyM1vUA1A5RPGWDRHALOaBxGH/bdlTF8/+O8TSRQr8/qDTMKZfcA3JUp4LHILR3r5BV1Irh3+6M00De1SxFCEYrJA=
X-Received: by 2002:a05:620a:112c:b0:6b5:c01b:41e1 with SMTP id
 p12-20020a05620a112c00b006b5c01b41e1mr2117966qkk.463.1657782139366; Thu, 14
 Jul 2022 00:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220713123014.1080802-1-andrej.valek@siemens.com>
 <e4a0511cee7e463c624d91f66aca3e3f02c34657.camel@siemens.com>
In-Reply-To: <e4a0511cee7e463c624d91f66aca3e3f02c34657.camel@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Jul 2022 08:02:08 +0100
Message-ID: 
 <CAMKF1sqyt1SFgMtGU=vUe2wJuXYKO23=XVyXJkJxdtdwJfiC1w@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] poco: upgrade 1.11.3 -> 1.12.0
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008832cd05e3be7b53"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Jul 2022 07:02:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97822

--0000000000008832cd05e3be7b53
Content-Type: text/plain; charset="UTF-8"

Major version  upgrades usually are avoided in release backports. Looking
towards What Armin says

On Thu, Jul 14, 2022 at 6:44 AM Valek, Andrej <andrej.valek@siemens.com>
wrote:

> Hello Raj,
>
> Would it be possible to put it into kirkstone as well?
>
> Thanks,
> Andrej
>
> On Wed, 2022-07-13 at 14:30 +0200, Andrej Valek wrote:
> >  - switch from PCRE -> PCRE2
> >  - add Prometheus library
> >  - add option to enable/disable ActiveRecord (disabled by default)
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >  .../0001-fix-unbundled-PCRE2-dependency.patch | 25 +++++++++++++
> >  ...0002-remove-providers-unitialization.patch | 35
> > +++++++++++++++++++
> >  .../poco/{poco_1.11.3.bb => poco_1.12.0.bb}   | 11 ++++--
> >  3 files changed, 68 insertions(+), 3 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-
> > unbundled-PCRE2-dependency.patch
> >  create mode 100644 meta-oe/recipes-support/poco/poco/0002-remove-
> > providers-unitialization.patch
> >  rename meta-oe/recipes-support/poco/{poco_1.11.3.bb =>
> > poco_1.12.0.bb} (89%)
> >
> > diff --git a/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-
> > PCRE2-dependency.patch b/meta-oe/recipes-support/poco/poco/0001-fix-
> > unbundled-PCRE2-dependency.patch
> > new file mode 100644
> > index 000000000..1a9d23cee
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-
> > dependency.patch
> > @@ -0,0 +1,25 @@
> > +From f049898c8bf058ed187de8e5fab20abeaab1f3b6 Mon Sep 17 00:00:00
> > 2001
> > +From: Alex Fabijanic <alex@pocoproject.org>
> > +Date: Sat, 9 Jul 2022 19:13:04 +0200
> > +Subject: [PATCH] fix(cmake): PocoFoundationConfig.cmake should now
> > check for
> > + PCRE2 #3677
> > +
> > +Upstream-Status: Backport
> > [https://github.com/pocoproject/poco/issues/3677]
> > +
> > +---
> > + Foundation/cmake/PocoFoundationConfig.cmake | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Foundation/cmake/PocoFoundationConfig.cmake
> > b/Foundation/cmake/PocoFoundationConfig.cmake
> > +index 46c2d3fc00..82c5788940 100644
> > +--- a/Foundation/cmake/PocoFoundationConfig.cmake
> > ++++ b/Foundation/cmake/PocoFoundationConfig.cmake
> > +@@ -2,7 +2,7 @@ if(@POCO_UNBUNDLED@)
> > +       include(CMakeFindDependencyMacro)
> > +       list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
> > +       find_dependency(ZLIB REQUIRED)
> > +-      find_dependency(PCRE REQUIRED)
> > ++      find_dependency(PCRE2 REQUIRED)
> > + endif()
> > +
> > + include("${CMAKE_CURRENT_LIST_DIR}/PocoFoundationTargets.cmake")
> > diff --git a/meta-oe/recipes-support/poco/poco/0002-remove-providers-
> > unitialization.patch b/meta-oe/recipes-support/poco/poco/0002-remove-
> > providers-unitialization.patch
> > new file mode 100644
> > index 000000000..7d24b79f1
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/poco/poco/0002-remove-providers-
> > unitialization.patch
> > @@ -0,0 +1,35 @@
> > +From c976c32e5249cb8a2433e7abfa095c1fe8dc4f8e Mon Sep 17 00:00:00
> > 2001
> > +From: Alex Fabijanic <alex@pocoproject.org>
> > +Date: Wed, 13 Jul 2022 12:53:52 +0200
> > +Subject: [PATCH] fix(OpenSSLInitializer): remove providers
> > unitialization
> > + #3562 #3567
> > +
> > +Upstream-Status: Backport
> > [https://github.com/pocoproject/poco/issues/3562]
> > +
> > +---
> > + Crypto/src/OpenSSLInitializer.cpp | 12 ------------
> > + 1 file changed, 12 deletions(-)
> > +
> > +diff --git a/Crypto/src/OpenSSLInitializer.cpp
> > b/Crypto/src/OpenSSLInitializer.cpp
> > +index 4678d22299..c537c3f9c2 100644
> > +--- a/Crypto/src/OpenSSLInitializer.cpp
> > ++++ b/Crypto/src/OpenSSLInitializer.cpp
> > +@@ -157,18 +157,6 @@ void OpenSSLInitializer::uninitialize()
> > + #endif
> > +               delete [] _mutexes;
> > + #endif
> > +-
> > +-#if OPENSSL_VERSION_NUMBER >= 0x30000000L
> > +-              OSSL_PROVIDER* provider = nullptr;
> > +-              if ((provider = _defaultProvider.exchange(nullptr)))
> > +-              {
> > +-                      OSSL_PROVIDER_unload(provider);
> > +-              }
> > +-              if ((provider = _legacyProvider.exchange(nullptr)))
> > +-              {
> > +-                      OSSL_PROVIDER_unload(provider);
> > +-              }
> > +-#endif
> > +       }
> > + }
> > +
> > diff --git a/meta-oe/recipes-support/poco/poco_1.11.3.bb b/meta-
> > oe/recipes-support/poco/poco_1.12.0.bb
> > similarity index 89%
> > rename from meta-oe/recipes-support/poco/poco_1.11.3.bb
> > rename to meta-oe/recipes-support/poco/poco_1.12.0.bb
> > index 757fa8983..6fff0707d 100644
> > --- a/meta-oe/recipes-support/poco/poco_1.11.3.bb
> > +++ b/meta-oe/recipes-support/poco/poco_1.12.0.bb
> > @@ -6,13 +6,15 @@ LICENSE = "BSL-1.0"
> >  LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
> >
> >  # These dependencies are required by Foundation
> > -DEPENDS = "libpcre zlib"
> > +DEPENDS = "libpcre2 zlib"
> >
> >  SRC_URI = " \
> >
> > git://github.com/pocoproject/poco.git;branch=master;protocol=https \
> > +    file://0001-fix-unbundled-PCRE2-dependency.patch \
> > +    file://0002-remove-providers-unitialization.patch \
> >      file://run-ptest \
> >     "
> > -SRCREV = "191cbdc97e1d9de023b8a65e0dc844911c06f6a8"
> > +SRCREV = "4ba8595ed83841d1fa240716b5652adc3772c36b"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
> >
> > @@ -23,7 +25,7 @@ inherit cmake ptest
> >  # By default the most commonly used poco components are built
> >  # Foundation is built anyway and doesn't need to be listed
> > explicitly
> >  # these don't have dependencies outside oe-core
> > -PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto JWT
> > Data DataSQLite Zip Encodings Redis"
> > +PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto JWT
> > Data DataSQLite Zip Encodings Redis Prometheus"
> >
> >  PACKAGECONFIG[XML] = "-DENABLE_XML=ON,-DENABLE_XML=OFF,expat"
> >  PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
> > @@ -39,6 +41,7 @@ PACKAGECONFIG[DataSQLite] = "-
> > DENABLE_DATA_SQLITE=ON -DSQLITE3_LIBRARY:STRING=sq
> >  PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
> >  PACKAGECONFIG[Encodings] = "-DENABLE_ENCODINGS=ON,-
> > DENABLE_ENCODINGS=OFF"
> >  PACKAGECONFIG[Redis] = "-DENABLE_REDIS=ON,-DENABLE_REDIS=OFF"
> > +PACKAGECONFIG[Prometheus] = "-DENABLE_PROMETHEUS=ON,-
> > DENABLE_PROMETHEUS=OFF"
> >
> >  # Additional components not build by default,
> >  # they might have dependencies not included in oe-core
> > @@ -47,6 +50,8 @@ PACKAGECONFIG[mod_poco] = "-
> > DENABLE_APACHECONNECTOR=ON,-DENABLE_APACHECONNECTOR=
> >  PACKAGECONFIG[CppParser] = "-DENABLE_CPPPARSER=ON,-
> > DENABLE_CPPPARSER=OFF"
> >  PACKAGECONFIG[DataMySQL] = "-DENABLE_DATA_MYSQL=ON -
> > DMYSQL_LIB:STRING=mysqlclient_r,-DENABLE_DATA_MYSQL=OFF,mariadb"
> >  PACKAGECONFIG[DataODBC] = "-DENABLE_DATA_ODBC=ON,-
> > DENABLE_DATA_ODBC=OFF,libiodbc"
> > +PACKAGECONFIG[ActiveRecord] = "-DENABLE_ACTIVERECORD=ON,-
> > DENABLE_ACTIVERECORD=OFF"
> > +PACKAGECONFIG[ActiveRecordCompiler] = "-
> > DENABLE_ACTIVERECORD_COMPILER=ON,-DENABLE_ACTIVERECORD_COMPILER=OFF"
> >  PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-
> > DENABLE_PAGECOMPILER=OFF"
> >  PACKAGECONFIG[PageCompilerFile2Page] = "-
> > DENABLE_PAGECOMPILER_FILE2PAGE=ON,-
> > DENABLE_PAGECOMPILER_FILE2PAGE=OFF"
> >  PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-
> > DENABLE_SEVENZIP=OFF"
>
>

--0000000000008832cd05e3be7b53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Major version =C2=A0upgrades usually are avoided in relea=
se backports. Looking towards What Armin says=C2=A0</div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 14, 202=
2 at 6:44 AM Valek, Andrej &lt;<a href=3D"mailto:andrej.valek@siemens.com">=
andrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Hello Raj,<br>
<br>
Would it be possible to put it into kirkstone as well?<br>
<br>
Thanks,<br>
Andrej<br>
<br>
On Wed, 2022-07-13 at 14:30 +0200, Andrej Valek wrote:<br>
&gt; =C2=A0- switch from PCRE -&gt; PCRE2<br>
&gt; =C2=A0- add Prometheus library<br>
&gt; =C2=A0- add option to enable/disable ActiveRecord (disabled by default=
)<br>
&gt; <br>
&gt; Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens=
.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../0001-fix-unbundled-PCRE2-dependency.patch | 25 +++++++++++++=
<br>
&gt; =C2=A0...0002-remove-providers-unitialization.patch | 35<br>
&gt; +++++++++++++++++++<br>
&gt; =C2=A0.../poco/{<a href=3D"http://poco_1.11.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">poco_1.11.3.bb</a> =3D&gt; <a href=3D"http://poco_1.12.0.b=
b" rel=3D"noreferrer" target=3D"_blank">poco_1.12.0.bb</a>}=C2=A0=C2=A0 | 1=
1 ++++--<br>
&gt; =C2=A03 files changed, 68 insertions(+), 3 deletions(-)<br>
&gt; =C2=A0create mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-<b=
r>
&gt; unbundled-PCRE2-dependency.patch<br>
&gt; =C2=A0create mode 100644 meta-oe/recipes-support/poco/poco/0002-remove=
-<br>
&gt; providers-unitialization.patch<br>
&gt; =C2=A0rename meta-oe/recipes-support/poco/{<a href=3D"http://poco_1.11=
.3.bb" rel=3D"noreferrer" target=3D"_blank">poco_1.11.3.bb</a> =3D&gt;<br>
&gt; <a href=3D"http://poco_1.12.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>poco_1.12.0.bb</a>} (89%)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-<br>
&gt; PCRE2-dependency.patch b/meta-oe/recipes-support/poco/poco/0001-fix-<b=
r>
&gt; unbundled-PCRE2-dependency.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..1a9d23cee<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-<br>
&gt; dependency.patch<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +From f049898c8bf058ed187de8e5fab20abeaab1f3b6 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Alex Fabijanic &lt;<a href=3D"mailto:alex@pocoproject.org" targ=
et=3D"_blank">alex@pocoproject.org</a>&gt;<br>
&gt; +Date: Sat, 9 Jul 2022 19:13:04 +0200<br>
&gt; +Subject: [PATCH] fix(cmake): PocoFoundationConfig.cmake should now<br=
>
&gt; check for<br>
&gt; + PCRE2 #3677<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D"https://github.com/pocoproject/poco/issues/3677" rel=3D"no=
referrer" target=3D"_blank">https://github.com/pocoproject/poco/issues/3677=
</a>]<br>
&gt; +<br>
&gt; +---<br>
&gt; + Foundation/cmake/PocoFoundationConfig.cmake | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/Foundation/cmake/PocoFoundationConfig.cmake<br>
&gt; b/Foundation/cmake/PocoFoundationConfig.cmake<br>
&gt; +index 46c2d3fc00..82c5788940 100644<br>
&gt; +--- a/Foundation/cmake/PocoFoundationConfig.cmake<br>
&gt; ++++ b/Foundation/cmake/PocoFoundationConfig.cmake<br>
&gt; +@@ -2,7 +2,7 @@ if(@POCO_UNBUNDLED@)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0include(CMakeFindDependency=
Macro)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list(APPEND CMAKE_MODULE_PA=
TH &quot;${CMAKE_CURRENT_LIST_DIR}&quot;)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0find_dependency(ZLIB REQUIR=
ED)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0find_dependency(PCRE REQUIRED)<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0find_dependency(PCRE2 REQUIRED)<=
br>
&gt; + endif()<br>
&gt; + <br>
&gt; + include(&quot;${CMAKE_CURRENT_LIST_DIR}/PocoFoundationTargets.cmake&=
quot;)<br>
&gt; diff --git a/meta-oe/recipes-support/poco/poco/0002-remove-providers-<=
br>
&gt; unitialization.patch b/meta-oe/recipes-support/poco/poco/0002-remove-<=
br>
&gt; providers-unitialization.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..7d24b79f1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/poco/poco/0002-remove-providers-<br>
&gt; unitialization.patch<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +From c976c32e5249cb8a2433e7abfa095c1fe8dc4f8e Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Alex Fabijanic &lt;<a href=3D"mailto:alex@pocoproject.org" targ=
et=3D"_blank">alex@pocoproject.org</a>&gt;<br>
&gt; +Date: Wed, 13 Jul 2022 12:53:52 +0200<br>
&gt; +Subject: [PATCH] fix(OpenSSLInitializer): remove providers<br>
&gt; unitialization<br>
&gt; + #3562 #3567<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D"https://github.com/pocoproject/poco/issues/3562" rel=3D"no=
referrer" target=3D"_blank">https://github.com/pocoproject/poco/issues/3562=
</a>]<br>
&gt; +<br>
&gt; +---<br>
&gt; + Crypto/src/OpenSSLInitializer.cpp | 12 ------------<br>
&gt; + 1 file changed, 12 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Crypto/src/OpenSSLInitializer.cpp<br>
&gt; b/Crypto/src/OpenSSLInitializer.cpp<br>
&gt; +index 4678d22299..c537c3f9c2 100644<br>
&gt; +--- a/Crypto/src/OpenSSLInitializer.cpp<br>
&gt; ++++ b/Crypto/src/OpenSSLInitializer.cpp<br>
&gt; +@@ -157,18 +157,6 @@ void OpenSSLInitializer::uninitialize()<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0delete [] _mutexes;<br>
&gt; + #endif<br>
&gt; +-<br>
&gt; +-#if OPENSSL_VERSION_NUMBER &gt;=3D 0x30000000L<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0OSSL_PROVIDER* provider =3D nullptr;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if ((provider =3D _defaultProvider.exchange(nullptr)))<br=
>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0{<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OSSL_PROV=
IDER_unload(provider);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0}<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if ((provider =3D _legacyProvider.exchange(nullptr)))<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0{<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OSSL_PROV=
IDER_unload(provider);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0}<br>
&gt; +-#endif<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; + }<br>
&gt; + <br>
&gt; diff --git a/meta-oe/recipes-support/poco/<a href=3D"http://poco_1.11.=
3.bb" rel=3D"noreferrer" target=3D"_blank">poco_1.11.3.bb</a> b/meta-<br>
&gt; oe/recipes-support/poco/<a href=3D"http://poco_1.12.0.bb" rel=3D"noref=
errer" target=3D"_blank">poco_1.12.0.bb</a><br>
&gt; similarity index 89%<br>
&gt; rename from meta-oe/recipes-support/poco/<a href=3D"http://poco_1.11.3=
.bb" rel=3D"noreferrer" target=3D"_blank">poco_1.11.3.bb</a><br>
&gt; rename to meta-oe/recipes-support/poco/<a href=3D"http://poco_1.12.0.b=
b" rel=3D"noreferrer" target=3D"_blank">poco_1.12.0.bb</a><br>
&gt; index 757fa8983..6fff0707d 100644<br>
&gt; --- a/meta-oe/recipes-support/poco/<a href=3D"http://poco_1.11.3.bb" r=
el=3D"noreferrer" target=3D"_blank">poco_1.11.3.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/poco/<a href=3D"http://poco_1.12.0.bb" r=
el=3D"noreferrer" target=3D"_blank">poco_1.12.0.bb</a><br>
&gt; @@ -6,13 +6,15 @@ LICENSE =3D &quot;BSL-1.0&quot;<br>
&gt; =C2=A0LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE;md5=3D4267f48fc738f50380cbeeb76f95cebc&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0# These dependencies are required by Foundation<br>
&gt; -DEPENDS =3D &quot;libpcre zlib&quot;<br>
&gt; +DEPENDS =3D &quot;libpcre2 zlib&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0SRC_URI =3D &quot; \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; git://<a href=3D"http://github.com/pocoproject/poco.git;branch=3Dmaste=
r;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/pocopro=
ject/poco.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0 file://0001-fix-unbundled-PCRE2-dependency.patch=
=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0 file://0002-remove-providers-unitialization.patch=
=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 file://run-ptest=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0 &quot;<br>
&gt; -SRCREV =3D &quot;191cbdc97e1d9de023b8a65e0dc844911c06f6a8&quot;<br>
&gt; +SRCREV =3D &quot;4ba8595ed83841d1fa240716b5652adc3772c36b&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;poco-(?P&lt;pver&gt;\d+(\.\=
d+)+)&quot;<br>
&gt; =C2=A0<br>
&gt; @@ -23,7 +25,7 @@ inherit cmake ptest<br>
&gt; =C2=A0# By default the most commonly used poco components are built<br=
>
&gt; =C2=A0# Foundation is built anyway and doesn&#39;t need to be listed<b=
r>
&gt; explicitly<br>
&gt; =C2=A0# these don&#39;t have dependencies outside oe-core<br>
&gt; -PACKAGECONFIG ??=3D &quot;XML JSON MongoDB PDF Util Net NetSSL Crypto=
 JWT<br>
&gt; Data DataSQLite Zip Encodings Redis&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;XML JSON MongoDB PDF Util Net NetSSL Crypto=
 JWT<br>
&gt; Data DataSQLite Zip Encodings Redis Prometheus&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0PACKAGECONFIG[XML] =3D &quot;-DENABLE_XML=3DON,-DENABLE_XML=3DOF=
F,expat&quot;<br>
&gt; =C2=A0PACKAGECONFIG[JSON] =3D &quot;-DENABLE_JSON=3DON,-DENABLE_JSON=
=3DOFF&quot;<br>
&gt; @@ -39,6 +41,7 @@ PACKAGECONFIG[DataSQLite] =3D &quot;-<br>
&gt; DENABLE_DATA_SQLITE=3DON -DSQLITE3_LIBRARY:STRING=3Dsq<br>
&gt; =C2=A0PACKAGECONFIG[Zip] =3D &quot;-DENABLE_ZIP=3DON,-DENABLE_ZIP=3DOF=
F&quot;<br>
&gt; =C2=A0PACKAGECONFIG[Encodings] =3D &quot;-DENABLE_ENCODINGS=3DON,-<br>
&gt; DENABLE_ENCODINGS=3DOFF&quot;<br>
&gt; =C2=A0PACKAGECONFIG[Redis] =3D &quot;-DENABLE_REDIS=3DON,-DENABLE_REDI=
S=3DOFF&quot;<br>
&gt; +PACKAGECONFIG[Prometheus] =3D &quot;-DENABLE_PROMETHEUS=3DON,-<br>
&gt; DENABLE_PROMETHEUS=3DOFF&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0# Additional components not build by default,<br>
&gt; =C2=A0# they might have dependencies not included in oe-core<br>
&gt; @@ -47,6 +50,8 @@ PACKAGECONFIG[mod_poco] =3D &quot;-<br>
&gt; DENABLE_APACHECONNECTOR=3DON,-DENABLE_APACHECONNECTOR=3D<br>
&gt; =C2=A0PACKAGECONFIG[CppParser] =3D &quot;-DENABLE_CPPPARSER=3DON,-<br>
&gt; DENABLE_CPPPARSER=3DOFF&quot;<br>
&gt; =C2=A0PACKAGECONFIG[DataMySQL] =3D &quot;-DENABLE_DATA_MYSQL=3DON -<br=
>
&gt; DMYSQL_LIB:STRING=3Dmysqlclient_r,-DENABLE_DATA_MYSQL=3DOFF,mariadb&qu=
ot;<br>
&gt; =C2=A0PACKAGECONFIG[DataODBC] =3D &quot;-DENABLE_DATA_ODBC=3DON,-<br>
&gt; DENABLE_DATA_ODBC=3DOFF,libiodbc&quot;<br>
&gt; +PACKAGECONFIG[ActiveRecord] =3D &quot;-DENABLE_ACTIVERECORD=3DON,-<br=
>
&gt; DENABLE_ACTIVERECORD=3DOFF&quot;<br>
&gt; +PACKAGECONFIG[ActiveRecordCompiler] =3D &quot;-<br>
&gt; DENABLE_ACTIVERECORD_COMPILER=3DON,-DENABLE_ACTIVERECORD_COMPILER=3DOF=
F&quot;<br>
&gt; =C2=A0PACKAGECONFIG[PageCompiler] =3D &quot;-DENABLE_PAGECOMPILER=3DON=
,-<br>
&gt; DENABLE_PAGECOMPILER=3DOFF&quot;<br>
&gt; =C2=A0PACKAGECONFIG[PageCompilerFile2Page] =3D &quot;-<br>
&gt; DENABLE_PAGECOMPILER_FILE2PAGE=3DON,-<br>
&gt; DENABLE_PAGECOMPILER_FILE2PAGE=3DOFF&quot;<br>
&gt; =C2=A0PACKAGECONFIG[SevenZip] =3D &quot;-DENABLE_SEVENZIP=3DON,-<br>
&gt; DENABLE_SEVENZIP=3DOFF&quot;<br>
<br>
</blockquote></div></div>

--0000000000008832cd05e3be7b53--

