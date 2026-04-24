Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B287FE5209
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 10:49:44 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18523.1777027783205277928
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2026 03:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MZzC2Xp5;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40ea36b56b7so5749517fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 03:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777027782; cv=none;
        d=google.com; s=arc-20240605;
        b=SY9r5LX9vHXZWHunv1WiqtEB3mCAYg3iJv3N2GYonW9Ex/G9JnDgH3/T7MXtV0tgYQ
         KJqa2//wL6iCP1DdgjghvGmay7OFrllNB/CszP3q0wUCXhJR8LvEMKwQdOl68lIz1/nx
         JeW8hCNC+/s+ql4tfXgYDSNZncY/MDvrpAYvgDPSR+EExJHQO2EllYp+QAKCtHzvcMaC
         Syi0Q/lySgCMPRR1+cFQIP/Y0g9ZW05285xaSx+pRwQRB+o9Ea1HrZVtHpkbTgb/SVb5
         os/N+t7yTRANRzIg8j2JtRCiN9S0KMx8IrUJhI551O3YfIWr9DBgswqBUEd2GAgrzjXv
         XOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0JdaWUTllsoMJzLaEiQpIL/ZyR5Jj1iC+nOFap5yQKU=;
        fh=RnZMXDUlwXY8UgMJsCy3860tY0uphmLPDqFPKV9t5MY=;
        b=aWhk+zvC8JxQ083z7xPbI99JlqMsENb0ZCXkhb1kDWwrb/Bigc1tUUXDH/4pfk2gKP
         Jhc0rAjglSrf3w0dZJZPVJyVVPh+VMnBc6QeWx+MwK0wB4XS8DAaq7N8pbCnaHi94inD
         9606l6+wdK3cxtbVUKeYjWECsIIPwLwtLDKlNrix5LVopDby7SkZzFQmlYR//LcHHSxO
         GKFvW0xSpSEyfFwdGJuge+oLik7DHIIgxSj7WZaBbIn2gHCY/zUe2U7bxDVNutmgNEPj
         nSqiQUPKaoanOMqJ3BnzQ4X1xlJNOLaC9mUece+ItN351DmgxDnRujw/AJWXe3hpFCsE
         5Gzw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777027782; x=1777632582; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JdaWUTllsoMJzLaEiQpIL/ZyR5Jj1iC+nOFap5yQKU=;
        b=MZzC2Xp5CDadTkM3eadvc5EODnwM0Cxm5WVxAvV45K/JS/3LLH8vui3VV+pa1OFvky
         EXkB4ZXOexp0HPvVu/Fzt4HkEZ6tTQSezNH1q0OzcjzrivIYNRUokzO/NtkExlUx/qKL
         kPJrgRmcXQ/p1/IGBQd1ErYn7GeUamPuK1OopycrpDFyyeXrTnXTZ//Zlb/NjOlBy7hv
         RGl4njn+cHqzc839UgBhMgBU5981X9cLeWcJji8uFg9hG+2vgVkYYPEURA5C0qLT98PK
         VsU6MRB26vB2RMK2ze8wCeYheT8ZyuB6AXsnuscPM6UEbKHIB1iewsacO6gluxi5ewOG
         XWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777027782; x=1777632582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JdaWUTllsoMJzLaEiQpIL/ZyR5Jj1iC+nOFap5yQKU=;
        b=OkGXHtXfSnevINAOtuwUQTH2ePN+GXnDpRMRwa+BOa26EzUIFoU6r4A1caYyKiUdGW
         IMUc6ijggmWTXpoKBuJWUSJ24ICrRCCH1HHnfZ9LzgqmEdrXQwsDW2bEiD3GLyfklpY+
         ElXdtfX/oOdBMxEGGsG8uIltsNWk8VHAukZ4QBOwA5EZLbH3gSaL39keMRUiJz/Ji+FE
         dn3pHBtLmMgkNtqbpNixfQc1JhiauiK1NoUVYaB3PffnJRuIuOatgw+pWA+Lzl2moLfL
         NKmg6R1KeUeawJxaESEAf5iHhIlEbV9kH7j/zhUphLrHHa6sDlv9cAIkx0YKztQ1n5Iu
         ztHQ==
X-Gm-Message-State: AOJu0Yw0nBH8OsHO74WlCgLDnti6wewCwpUrIc6djuT2nMvxpsuYoXh+
	Pdof9MynL+/hpX8HifhwrZo2RPcnh+h5kXhxyQV8LPFISfcqccxCTtsESbjYc+X/LrsVLPg144D
	j0Xl7pUbNaJRLhWztWi6WMIYMJsez+ic=
X-Gm-Gg: AeBDieuvtEyVf+T00+P9qepDdSEH1NfFcKkxfx2cIC+xl9pzWb3oH5ePajqYlthrdfT
	0KFuSaDAAkE7cr+c0E+gZKDUQ0ekRsVDlZEo1Rbei77O8/46doUMsKjgh6k+JltLvwFsFXUyrPw
	zHQbnpAjSY2nRgjzBKzHZi2KWGw3BnGeTCD7pBJkjjEaP8lUx8LkQNhamIvRJmV3bu4Edvcd4em
	GpSHSSNsXhzzThCULHJ8eDTqIqhETM00dehHXjGCrA6R7jaKJ2ImHmVd9Nmi2lm0a/rIKX3Vc8y
	xi+d9IfS7yyWp0p2PGcH
X-Received: by 2002:a05:6870:9a21:b0:3e8:970e:d4f7 with SMTP id
 586e51a60fabf-42abf2e02a7mr18090919fac.11.1777027782318; Fri, 24 Apr 2026
 03:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260424100214.2986513-3-frederikbraendstrup@gmail.com>
In-Reply-To: <20260424100214.2986513-3-frederikbraendstrup@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 24 Apr 2026 22:49:31 +1200
X-Gm-Features: AQROBzCGrFy2hlnL6Vpwe6Gf00T9kncR-xYF8bk3FP8or5yaUGoiEWnktY46AMc
Message-ID: <CADySD0ENcKyvpbvYB9QMyDyu3zzVOm6eBuZqUe9fJ7LnGzwCFg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sqlpp23: add package
To: frederikbraendstrup@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 10:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126604

On Fri, Apr 24, 2026 at 10:03=E2=80=AFPM Frederik Br=C3=A6ndstrup via
lists.openembedded.org
<frederikbraendstrup=3Dgmail.com@lists.openembedded.org> wrote:
>
> ---
>  meta-oe/recipes-dbs/sqlpp23/sqlpp23_0.69.bb | 38 +++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/sqlpp23/sqlpp23_0.69.bb
>
> diff --git a/meta-oe/recipes-dbs/sqlpp23/sqlpp23_0.69.bb b/meta-oe/recipe=
s-dbs/sqlpp23/sqlpp23_0.69.bb
> new file mode 100644
> index 0000000000..ad0d4c4e5b
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/sqlpp23/sqlpp23_0.69.bb
> @@ -0,0 +1,38 @@
> +HOMEPAGE =3D "https://github.com/rbock/sqlpp23"
> +SUMMARY =3D "A type safe SQL library for C++"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfe3abf7ac4f19dc926a8ab383003a=
aa7"
> +
> +SRC_URI =3D "git://github.com/rbock/sqlpp23;protocol=3Dhttps;branch=3Dma=
in;tag=3D${PV}"
> +
> +SRCREV =3D "1c47ff3c7c3542aa6091266be77122c7ced031e8"
> +
> +inherit cmake ptest

How was ptest support validated?
Reason I ask is because the run-ptest script is missing.

Please also update ptest-packagelists-meta-oe.inc to include this package.

cheers
Ankur

> +
> +do_install:append() {
> +    install -m 0755 ${S}/scripts/sqlpp23-ddl2cpp ${D}${bindir}
> +}
> +
> +PACKAGECONFIG ??=3D " \
> +    sqlite3 \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)} \
> +"
> +
> +PACKAGECONFIG[sqlite3] =3D "-DBUILD_SQLITE3_CONNECTOR=3DON,-DBUILD_SQLIT=
E3_CONNECTOR=3DOFF,sqlite3,"
> +PACKAGECONFIG[mysql] =3D "-DBUILD_MYSQL_CONNECTOR=3DON,-DBUILD_MYSQL_CON=
NECTOR=3DOFF,mariadb,"
> +PACKAGECONFIG[mariadb] =3D "-DBUILD_MARIADB_CONNECTOR=3DON,-DBUILD_MARIA=
DB_CONNECTOR=3DOFF,mariadb,"
> +PACKAGECONFIG[postgresql] =3D "-DBUILD_POSTGRESQL_CONNECTOR=3DON,-DBUILD=
_POSTGRESQL_CONNECTOR=3DOFF,postgresql,"
> +PACKAGECONFIG[sqlchiper] =3D "-DBUILD_SQLCIPHER_CONNECTOR=3DON,-DBUILD_S=
QLCIPHER_CONNECTOR=3DOFF,,"
> +PACKAGECONFIG[ptest] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOFF,,=
"
> +
> +# sqlpp23-ddl2cpp is staged in bindir, and is needed for code generation=
 in downstream programs.
> +# Shipped only in the -tools package
> +PACKAGES =3D+ "${PN}-tools"
> +RDEPENDS:${PN}-tools =3D "python3"
> +FILES:${PN}-tools =3D "${bindir}/sqlpp23-ddl2cpp"
> +SYSROOT_DIRS:append =3D " ${bindir}"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +# sqlpp23 is a header-only C++ library, so the main package will be empt=
y.
> +ALLOW_EMPTY:${PN} =3D "1"
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126603): https://lists.openembedded.org/g/openembedde=
d-devel/message/126603
> Mute This Topic: https://lists.openembedded.org/mt/118985133/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

