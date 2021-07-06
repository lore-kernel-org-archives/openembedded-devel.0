Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.2583.1625551820335935035
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jul 2021 23:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lsSNgbEt;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id s18so5330019pgg.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jul 2021 23:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jm6KKR9N+4e1suo9ki9OfqoR+kNIf/ZaXSwEgehGsek=;
        b=lsSNgbEtAU2mcx5XsIL/zuS222zrLVIq2IrmDdrMDERtTUNwCwBlRtIlfPobTr2el5
         FAdyGotK23Le0SWE2mW8QhHPWlI7Gvyr/0Ees7J9PyATBhR/t2oKl9b7Ot2scTZ6dYGG
         PVH+TFD74DYYmDN4+qtBX20Gv7Gu3LpvusAB/up2PKJCvmOXJde+AVU2UjqiZfOpFdtD
         6cfE2akUc+XWJA2KBK6rkVmHcZcC0UKqmaUUjos/HPjeI633DAbzIgrB3cuayPG/ztFL
         Xx6CuVBz4/9fgeWxnRrYyz/+LFp7jZVT9546/iNCdHg4Z3jgbyTBe7NbOfvDm18zwmXl
         nsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jm6KKR9N+4e1suo9ki9OfqoR+kNIf/ZaXSwEgehGsek=;
        b=qFlH7zrNdRiTP761rD9o4AF02p98ustvA0ihpdSuSQdFBPQmvwHYKRmwGIWcrnyNDQ
         ifk+Xq3xtxnWndWsKtfGmvYnR8ZH0lAUJafafDtfa0hidM9DH06Fdo7fzoWLmT9l0e3/
         SVYKteFV0hv89xbTYaEBCkT1pCuIH4cQTrBExjt/zejjcX4S2Nuk456EIuJRIgdNkw8b
         vuJQhjM2R39ShenX1Us6oJjRcxrl2GSEoUlR2sLFhkIK3PZ8cR2ySe1UWav/uQsFH8hA
         2RQxuLr7wzCnIvRacayxj8WCltWsYJ/fzwe8OVwnwbwO+EB6eZ3rT7d1ypHlcyAy3lrL
         +3vQ==
X-Gm-Message-State: AOAM533nEfQEY0+tkRT1oAaow1pFe9yzVqdLAFfVEb7F8iu+cibrPBLA
	8aq2SGEa5r8Wvtm41abg3CgPo3yj74NVD+Pcsxg=
X-Google-Smtp-Source: ABdhPJzJI+QjOsdR4AKjkLySv1K/3x+TzogZUUtS3iN6Nnf+UO5P81SZcqgOomvPuVWYk3gXELhDdhl7C+ElqhP+E1E=
X-Received: by 2002:a62:3344:0:b029:28c:6f0f:cb90 with SMTP id
 z65-20020a6233440000b029028c6f0fcb90mr18516318pfz.58.1625551819683; Mon, 05
 Jul 2021 23:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210706055708.22017-1-sakib.sajal@windriver.com>
In-Reply-To: <20210706055708.22017-1-sakib.sajal@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 6 Jul 2021 08:10:07 +0200
Message-ID: <CALbNGRQDp57bA=8-J9_0a1pVJ5VnQWn1T24yzwaJ-Y67abo8kA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V2] lmdb: add recipe
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 7:57 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
Sorry for being late here - and I am aware that this causes you more
effort than you expected (that's why I kept lmdb in meta-qt5-extra :).
>
> lmdb provides a high-performance embedded transactional
> database in the form of a key-value store.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>  meta-oe/recipes-dbs/lmdb/files/run-ptest      | 14 +++++++
>  meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb       | 39 +++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/lmdb/files/run-ptest
>  create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 1b21ec654..c83bd0913 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -211,6 +211,7 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
>      influxdb \
>      leveldb \
>      libdbi \
> +    lmdb \
>      mariadb \
>      postgresql \
>      psqlodbc \
> diff --git a/meta-oe/recipes-dbs/lmdb/files/run-ptest b/meta-oe/recipes-dbs/lmdb/files/run-ptest
> new file mode 100644
> index 000000000..9c9e6e70d
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/lmdb/files/run-ptest
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +
> +cd tests
> +
> +for t in mtest*
> +do
> +       rm -rf testdb && mkdir testdb
> +       ./$t > /dev/null
> +       if [ $? -ne 0 ]; then
> +               echo "FAIL: $t"
> +       else
> +               echo "PASS: $t"
> +       fi
> +done
> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> new file mode 100644
> index 000000000..7f97a0d15
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> @@ -0,0 +1,39 @@
> +# SPDX-FileCopyrightText: 2017-2019 Volker Krause <vkrause@kde.org>
> +# SPDX-FileCopyrightText: 2019 Hannah Kiekens <hannahkiekens@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +
> +SUMMARY = "Lightning Memory-Mapped Database (LMDB)"
> +HOMEPAGE = "https://symas.com/lightning-memory-mapped-database/"
> +LICENSE = "OLDAP-2.8"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
> +
> +SRC_URI = " \
> +    git://github.com/LMDB/lmdb.git;nobranch=1 \
> +    file://run-ptest \
> +"
> +SRCREV = "LMDB_${PV}"
> +
> +inherit base ptest
> +
> +S = "${WORKDIR}/git/libraries/liblmdb"
> +
> +do_compile() {
> +    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="-Wl,-soname,lib${PN}.so.${PV}"
> +}
> +
> +do_install() {
> +    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="-Wl,-soname,lib${PN}.so.${PV}" install
> +    cd ${D}/${libdir}
> +    ln -s liblmdb.so.${PV} liblmdb.so
> +    rm liblmdb.a
> +}
> +
> +INSANE_SKIP += "ldflags"
^ This one should be taken seriosly - what step made it necessary?
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    for test in mtest mtest2 mtest3 mtest4 mtest5 mdb_stat; do
> +        cp ${S}/$test ${D}${PTEST_PATH}/tests
> +    done
> +}
> \ No newline at end of file
> --
> 2.32.0
>
>
> 
>
