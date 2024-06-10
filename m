Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7D4C27C53
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 01:18:08 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.9846.1717982282780951714
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jun 2024 18:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gsPpFovy;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d220039bc6so682609b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 18:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717982282; x=1718587082; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DedDVzAxzzn9J/uhXlLwaSYP5KPykpoQ6IPxOwnQRtw=;
        b=gsPpFovyFRIfUA/QEhgD84+6N5m5oggShvoOTsEAv514i2NYHiravV0V8Siap4PANv
         iRTBpiI7ytHHmmIBKr4JAjB4DOUP/nJ0uvWZAPGj5J2mwqM8K0xXejj3WypZ9+eOr9Xb
         5Pkd8b3POjog9zqYQADPlLe6uc9PMzKMhb100CdmSK4hSg7O63InUswEWkpjei6sf9DP
         LlWp92jnt4OKN6MJomh4qO/Nki+lrOySMitG7NuDK0+uyBBV/w6eCedhdBSOJ0g/G50L
         tht+5aShh7MES8F3K7s0CG8m+an9aUTGiWWn7z8GSFrvJtySn055O7Qu8Z8NDVUHLRD3
         VyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717982282; x=1718587082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DedDVzAxzzn9J/uhXlLwaSYP5KPykpoQ6IPxOwnQRtw=;
        b=swfzig92Zyau2Aa6BQVjjBNQf0tN+8LAlNBisAzWV4NMkC8HdviVIS4B80imWsv4he
         pSPSCggMl91FbXuzFGLeFR61/cgB4RdEzdOgypIlrjt4vqlUL8TPRZ8RTsmOA2B6lWnw
         1djEWqCt4T//9yjDhAtOYxwzLrWGddeXwq21I9c9hSUCgK5XqyeJ6t8EDqEwxAyKOICb
         olbUlwoPvAjha3/qflp5GL+F1z/UxThRS9tEYu0NsCkDYv8HCJ1SHDcfhT2e9N6mtjDQ
         mlHZku9EYNMPzt4cDJ7+BDnB/GC1ZOooH3wtrFZzlJTACSMzAsEMPbUY2FBaDShCka6Y
         OP4A==
X-Gm-Message-State: AOJu0YwCRCn8Nzo7q/wiRiKwoWJXHms9jefKHVnXb32mDEaqi0LW23JZ
	DpT2h8oJRLO+FPadigYg7xXSg+FqLz4uD2hHpI4mEoNMVQWaGolPtDy4bOrB+dBnXrM92GLTF+T
	1j1efX7eUdlmaE4huO7nsnQn+1E0=
X-Google-Smtp-Source: AGHT+IEm3cFANYpDtxGyxbBcAqWQypjWE35XFhkJL/1HvwpbT2XgHfmCrpfxtmIfjuWIhKLxe4n23Yu4MLlsg1wDYCs=
X-Received: by 2002:a05:6870:230b:b0:254:a588:ba9b with SMTP id
 586e51a60fabf-254a588dd9bmr4681038fac.36.1717982281762; Sun, 09 Jun 2024
 18:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240610010818.1647526-1-f_l_k@t-online.de>
In-Reply-To: <20240610010818.1647526-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Jun 2024 18:17:35 -0700
Message-ID: <CAMKF1sprdMH6-xzR9GYet_8pPBd_N8o9Sq-yRf+2MLO=rdhBYg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] replace libdbd-mysql-perl with dbd-mariadb
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 01:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110790

Please rebase it on master or master-next and resend plz.

On Sun, Jun 9, 2024 at 6:08=E2=80=AFPM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> libdbd-mysql-perl is broken with mariadb/gcc14 and upstream does not supp=
ort mariadb.
> [https://github.com/perl5-dbi/DBD-mysql/issues/430]
>
> Use the perl database driver that is provided by the mariadb project inst=
ead.
> [https://mariadb.com/kb/en/perl-dbi]
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  2 +-
>  .../recipes-devtools/perl/dbd-mariadb_1.23.bb | 20 +++++++++++++++++
>  .../perl/libdbd-mysql-perl_4.050.bb           | 22 -------------------
>  3 files changed, 21 insertions(+), 23 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/perl/dbd-mariadb_1.23.bb
>  delete mode 100644 meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050=
.bb
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 695965f7d..4bfa1c9ca 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -215,7 +215,7 @@ RDEPENDS:${PN}-client =3D "perl perl-module-getopt-lo=
ng perl-module-file-temp \
>  RDEPENDS:${PN}-server =3D "perl perl-module-getopt-long perl-module-data=
-dumper \
>      perl-module-file-basename perl-module-file-path perl-module-sys-host=
name \
>      perl-module-file-copy perl-module-file-temp perl-module-posix \
> -    ${PN}-client ${PN}-setupdb libdbi-perl libdbd-mysql-perl lzo"
> +    ${PN}-client ${PN}-setupdb libdbi-perl dbd-mariadb lzo"
>  RDEPENDS:${PN}-leftovers =3D "perl perl-module-cwd perl-module-benchmark=
 perl-module-getopt-long \
>      perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-m=
odule-threads \
>      perl-module-threads-shared perl-module-io-socket perl-module-sys-hos=
tname perl-module-file-copy \
> diff --git a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.23.bb b/meta-oe/=
recipes-devtools/perl/dbd-mariadb_1.23.bb
> new file mode 100644
> index 000000000..0eaf2137b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/perl/dbd-mariadb_1.23.bb
> @@ -0,0 +1,20 @@
> +DESPCRIPTION =3D "DBD::MariaDB is the Perl5 Database Interface driver fo=
r MariaDB and MySQL databases."
> +HOMEPAGE =3D "https://metacpan.org/dist/DBD-MariaDB"
> +LICENSE =3D "GPL-1.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd0a06964340e5c0cde88b7af611f7=
55c"
> +
> +DEPENDS =3D "libdbi-perl-native libdev-checklib-perl-native libmysqlclie=
nt"
> +
> +SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PA/PALI/DBD-MariaDB-${PV}.tar.g=
z"
> +SRC_URI[sha256sum] =3D "0d0c76c660ddd55570e48f3e2fdea8f621a69ac0ed48190e=
8cfcafcb5e9b859d"
> +
> +RDEPENDS:${PN} =3D "libdbi-perl"
> +
> +S =3D "${WORKDIR}/DBD-MariaDB-${PV}"
> +
> +inherit cpan
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +       libtest-warnings-perl \
> +       perl-module-test-more \
> +"
> diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb b/m=
eta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
> deleted file mode 100644
> index fc505fe1e..000000000
> --- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY =3D "A Perl DBI driver for MySQL"
> -DESCRIPTION =3D "DBD::mysql is the Perl5 Database Interface driver for \
> -the MySQL database. In other words: DBD::mysql is an interface between \
> -the Perl programming language and the MySQL programming API that comes \
> -with the MySQL relational database management system. Most functions \
> -provided by this programming API are supported. Some rarely used \
> -functions are missing, mainly because no-one ever requested them. \
> -"
> -HOMEPAGE =3D "https://github.com/perl5-dbi/DBD-mysql"
> -
> -SECTION =3D "libs"
> -LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> -DEPENDS +=3D "libdev-checklib-perl-native libdbi-perl-native libmysqlcli=
ent"
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd0a06964340e5c0cde88b7af611f7=
55c"
> -
> -SRCREV =3D "9b5b70ea372f49fe9bc9e592dae3870596d1e3d6"
> -SRC_URI =3D "git://github.com/perl5-dbi/DBD-mysql.git;protocol=3Dhttps;b=
ranch=3Dmaster"
> -
> -S =3D "${WORKDIR}/git"
> -
> -inherit cpan
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110789): https://lists.openembedded.org/g/openembedde=
d-devel/message/110789
> Mute This Topic: https://lists.openembedded.org/mt/106585185/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

