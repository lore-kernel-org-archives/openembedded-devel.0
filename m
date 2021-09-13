Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.1414.1631569819141263796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Sep 2021 14:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p43w/E9r;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id t4so1175250plo.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Sep 2021 14:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=MgZcgh1zasoGKmH0kJ+0iElx3hRybQzntMmXEOnTDFc=;
        b=p43w/E9r4kWqFJKQbVkkqTsvdRBBEzL59gaBhB+xvVgGxF8z7hjcBeys7onG2buo0x
         FhFm2n5GL0HPVR8lJxZ5aLw8ZCBv/9SjmSoYNdPpGSva8UL4ezIpfiC0IxUQn9CKLr25
         x79FYr/1kDQ/u7H5emAbC+tVmAdxIh9uysUDxuB7Gl5ia1ZJ1r+ONgnzNvI5ZdgR8bRt
         ivMo0h/yrj8ECjsokh5kMGLIjqZ0eHQiI65xNut8v64wfUD/NJQ3ZoMZPssqXt3O+u99
         M02OopIIsfdBgW/VOdAoS98Xcjwmmp+UpAVD8Iwlp50wHKAsznyu8eEEUY2rG5X/dvWy
         iFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MgZcgh1zasoGKmH0kJ+0iElx3hRybQzntMmXEOnTDFc=;
        b=LqAH2EtQHXzm6jdiFhIW3m9UpXDQ447YObIPJ0iKqEW6TX6sdp8Fi3siXSHOwh5ptY
         R+LWWPqlS1TtLblkCcd4d2rIqnRLP4DWTuIMHE3ytLLCy5sb3pjKrMxOqHmMKQDSeq4B
         Jr03X25VyTj2hMtX8Ybkfq32Hgys2yKCc4Mq+EXUIdY6jUTgUtb0tw43SgjVbQQQM0rE
         Lngjm+7HZgIJksG8Pyv2mHDCwN/mpyrM9azSldDllkxJdnz+2gb3jO2QAxszyEDyE878
         c18YmmG9J4as72kb8tZHNj+eKC85WblvzPsV8lnb7CUTgDeMUjWEhhPSnogszsJUa1La
         xwNw==
X-Gm-Message-State: AOAM530Bq1IVejxSrIcuk3+o7wQgGTmxgUbKbzhBkkIkQl2GQHcbwitr
	uk91UYmg2gnn5UmEm0MuOtHs3yTwCiY=
X-Google-Smtp-Source: ABdhPJzZPUI4NAQiaSCKM8SJzc9Dr/c3QkWMasQLsrYUpIhjAMjfvbnfmYKK59x1tjSD0ds6URG8qg==
X-Received: by 2002:a17:90a:1d8:: with SMTP id 24mr1812594pjd.69.1631569818291;
        Mon, 13 Sep 2021 14:50:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:51e8:68a0:3bd2:beb7? ([2601:202:4180:a5c0:51e8:68a0:3bd2:beb7])
        by smtp.gmail.com with ESMTPSA id l14sm7860567pjq.13.2021.09.13.14.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 14:50:17 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/2] lmdb: add recipe
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210913212141.353383-1-sakib.sajal@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <7883cdd3-28f7-d3e8-146d-4b2d612af1b5@gmail.com>
Date: Mon, 13 Sep 2021 14:50:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913212141.353383-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/13/21 2:21 PM, Sakib Sajal wrote:
> lmdb provides a high-performance embedded transactional
> database in the form of a key-value store.
Thanks for the patch but  adding a new packages is outside the scope of
stable branch maintenance.

- armin


>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit f658a3b40ba0491aab2da3bd9b0d2ae7123a6f90)
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta-oe/recipes-dbs/lmdb/files/run-ptest | 25 +++++++++++++++
>  meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb  | 39 ++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/lmdb/files/run-ptest
>  create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>
> diff --git a/meta-oe/recipes-dbs/lmdb/files/run-ptest b/meta-oe/recipes-dbs/lmdb/files/run-ptest
> new file mode 100644
> index 000000000..a6a7549b9
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/lmdb/files/run-ptest
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +
> +cd tests
> +
> +retval=0
> +for t in mtest*
> +do
> +    mkdir testdb
> +    ./$t > /dev/null && ./mdb_stat testdb > /dev/null
> +    if [ $? -ne 0 ]; then
> +            echo "FAIL: $t"
> +            retval=$(( ${retval} + 1))
> +    else
> +            echo "PASS: $t"
> +    fi
> +    rm -rf testdb
> +done
> +
> +if [ $retval -eq 0 ] ; then
> +    echo "PASS: lmdb"
> +else
> +    echo "FAIL: lmdb"
> +fi
> +
> +exit $retval
> \ No newline at end of file
> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> new file mode 100644
> index 000000000..0746da141
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
> +SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1 \
> +           file://run-ptest \
> +"
> +
> +SRCREV = "LMDB_${PV}"
> +
> +inherit base ptest
> +
> +S = "${WORKDIR}/git/libraries/liblmdb"
> +
> +LDFLAGS += "-Wl,-soname,lib${PN}.so.${PV}"
> +
> +do_compile() {
> +    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}"
> +}
> +
> +do_install() {
> +    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" install
> +    cd ${D}/${libdir}
> +    ln -s liblmdb.so.${PV} liblmdb.so
> +    rm liblmdb.a
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    for test in mtest mtest2 mtest3 mtest4 mtest5 mdb_stat; do
> +        install -m 755 ${S}/$test ${D}${PTEST_PATH}/tests
> +    done
> +}
>
> 
>

