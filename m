Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE81F532EA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 07:36:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14819.1774337764075429396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 00:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H+fWvPOG;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b45bb7548so3550765f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 00:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774337762; x=1774942562; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1UAaHGuJDjn/N+N1Cxnpx/yes70oQbJnAMbRovSqvlU=;
        b=H+fWvPOGO5zJsKxloroAA+qwb3lre2l9smSNxYOOzcHyIVnZiIormaOx9C3Q0Ig+2w
         5C4g/fWI007RlBk86DZzUp8N8upEWkg+a8gAMh5M/fcTyJsh+fv8T1OfPN8ZhrdIcGBv
         +YUb2sd1Oz9krc1/XSejZ3+M0SqWbiCA2i0wWF2LBRAyVt5OOGv23fCP4150DQ5EEguh
         4iPeqE/4rwI7NFPpQfgycuTav50J1Cf3lvGRVP8hxm4lh/n0kP14gowPTJgyjDg/EGKN
         PeR4O8Mzg66rexSZlc6Ljw0T5gpSZ0QGKiNSgGjETraLFgEzIvNHpiyuDWB+ByAVjsce
         gMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774337762; x=1774942562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UAaHGuJDjn/N+N1Cxnpx/yes70oQbJnAMbRovSqvlU=;
        b=MEDmml8hwcUZXEU0zu/f60w5hMWJdfGhWqRMjI6F1sSLCz6r/qf9VcxWwjDzcAlnad
         89ua9MynlkQKEhyeLp2SqGWwIpnXlu500rMZNrC4A9BtxdyhrHN9jCEDjQgC5gEc6O8E
         ThFPFEAnboCOr8WLZz3wIGsha/V74h/58b/q9H4EwuFnI04AXMh0cWHmQlODSbtpwLRd
         /rVCgsjtKR4AQOAuJwK/R5yRGo5JLOp2bCZO3sdhwnbbIHcBOPBMPdGumV5FxMhtz+ow
         U4AGOtiaPOcEQeNbS1e9V7BYDSGT3ImqTU666KNNUXlzXjmJXYAAjZereAqJ0VTl94iE
         aJxg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4+rS0SaE03gRbUJdRuLPuFRJdmhEPfPmyG6ip5qi71eRUgWOcoogArL3QHqqWQcUcD3iamBV0/0t0M1F9RzCaZM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6tFUqe1FwLl80gf0FLN3udrETnoABTKGjtbU0VWRNXN8D3bkr
	sorJyPzTcMV9NdtI6X3ANipzelJk1M2DRC6Ge2yzGr15L0F9jctYK1NZ
X-Gm-Gg: ATEYQzwU+s/trG20Sr83MsREMzGLwxw1Z0JBEyrdSMnBgnhMZqfb2DwjFbbbHhsqvm1
	qbVRWmEfU8LhS4alL29lfTYiDECT0JVL9G/liA0t9ocpsrBnD5QOMc5ixFFjD2cLy/hUDW6FFuN
	ZNJorjlNQI9TcQ+7peWS4npDcAzw5hdqR6ksKf2KywjXC3wwP89jzEf0MbpEl02TKFhybXpmN24
	j0CD1o+tfL6g6/oRkmV5gFREs6obuVs4kSyMxU4OGmAgDAmkcBDtLaygTzOHBJzd9A8AE0DT1N9
	NCuxIv38z2Ojcd9E+YbTCf+kIPmfUw/DMb4cMpK5OmcIc/WA84LmD8NwIN1Myzlv/Kz4y3NMw04
	f/cll2gtL8VesowWrkUGoZegv035fi3pZjqlGXr598XDpYBZWvsCJ/EEko6H0ZanhOfv/BDw+3A
	PyL+eiYF12vCTz8LebtN96ZJiBiS3Nx3c=
X-Received: by 2002:a05:6000:240c:b0:43b:3d83:f04f with SMTP id ffacd0b85a97d-43b64240688mr21886757f8f.9.1774337761832;
        Tue, 24 Mar 2026 00:36:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm35096675f8f.37.2026.03.24.00.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 00:36:01 -0700 (PDT)
Message-ID: <b5a48fa9-8a5e-4530-89d9-4c7d939c4b45@gmail.com>
Date: Tue, 24 Mar 2026 08:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] postgresql: add ptest support
To: guocai.he.cn@windriver.com, openembedded-devel@lists.openembedded.org
References: <20260324071621.3104812-1-guocai.he.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260324071621.3104812-1-guocai.he.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 07:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125543


On 3/24/26 08:16, guocai he via lists.openembedded.org wrote:
> From: Guocai He <guocai.he.cn@windriver.com>
> 
> Add ptest infrastructure to run the PostgreSQL standard regression test
> suite (pg_regress) on the target system.
> 
> Test logs:
> root@qemux86-64:~# ptest-runner postgresql
> START: ptest-runner
> 2026-03-24T02:42
> BEGIN: /usr/lib64/postgresql/ptest
> ......
> ......


I'd like to ask just one confirmation question about this "....." here

Is the output machine parseable, i.e. do the results have PASS:/FAIL:
prefix, at least as a final summary?
The run-ptest script doesn't seem to do such conversion, so I'm just
curious if the output is usable out of the box.


> All 224 tests passed.
> waiting for server to shut down.... done
> server stopped
> DURATION: 853
> END: /usr/lib64/postgresql/ptest
> 2026-03-24T02:56
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
> 
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>  .../recipes-dbs/postgresql/files/run-ptest    | 53 +++++++++++++++++++
>  meta-oe/recipes-dbs/postgresql/postgresql.inc | 42 ++++++++++++++-
>  3 files changed, 95 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-dbs/postgresql/files/run-ptest
> 
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index 4de602ac1c..0e395db48a 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -76,6 +76,7 @@ PTESTS_SLOW_META_OE = "\
>      fftw \
>      libusb-compat \
>      mariadb \
> +    postgresql \
>      re2 \
>      rocksdb \
>  "
> diff --git a/meta-oe/recipes-dbs/postgresql/files/run-ptest b/meta-oe/recipes-dbs/postgresql/files/run-ptest
> new file mode 100644
> index 0000000000..004cf2ba87
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/postgresql/files/run-ptest
> @@ -0,0 +1,53 @@
> +#!/bin/sh
> +#
> +# PostgreSQL regression test runner for ptest
> +#
> +# This script initializes a temporary PostgreSQL database cluster,
> +# starts a server instance, and executes the standard regression test
> +# suite via pg_regress against the installed PostgreSQL binaries.
> +#
> +
> +set -e
> +
> +PGDATA=/tmp/ptest_pgdata
> +PTEST_PATH=$(dirname "$(readlink -f "$0")")
> +TESTDIR="${PTEST_PATH}/test"
> +PGBIN=$(pg_config --bindir)
> +PKGLIBDIR=$(pg_config --pkglibdir)
> +
> +cleanup() {
> +    su - postgres -c "pg_ctl -D ${PGDATA} stop -m immediate" 2>/dev/null || true
> +    rm -rf "${PGDATA}"
> +}
> +trap cleanup EXIT
> +
> +# Initialize the database cluster
> +rm -rf "${PGDATA}"
> +su - postgres -c "${PGBIN}/initdb -D ${PGDATA} --no-locale" || exit 1
> +
> +# Start the server
> +su - postgres -c "pg_ctl -D ${PGDATA} -l ${PGDATA}/logfile start -w -t 120" || exit 1
> +
> +# Ensure the test directory is writable by the postgres user for
> +# regression output files (regression.out, regression.diffs, results/).
> +chown -R postgres:postgres "${TESTDIR}"
> +
> +# Prepare the tablespace test directory
> +mkdir -p "${TESTDIR}/testtablespace"
> +chmod 0700 "${TESTDIR}/testtablespace"
> +chown postgres:postgres "${TESTDIR}/testtablespace"
> +
> +# Run the regression tests.
> +# --dlpath points to the standard PostgreSQL package library directory
> +# where regress.so and contrib modules (autoinc.so, refint.so, etc.)
> +# are installed, so that CREATE FUNCTION ... AS tests can locate them.
> +su - postgres -c "cd ${TESTDIR} && \
> +    ${TESTDIR}/pg_regress \
> +        --inputdir=. \
> +        --bindir=${PGBIN} \
> +        --dlpath=${PKGLIBDIR} \
> +        --max-concurrent-tests=20 \
> +        --schedule=parallel_schedule"
> +RESULT=$?
> +
> +exit ${RESULT}
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> index 040b3d5e34..dfc624f07e 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> @@ -29,6 +29,7 @@ SRC_URI = "https://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
>      file://postgresql.pam \
>      file://postgresql-setup \
>      file://postgresql.service \
> +    file://run-ptest \
>  "
>  
>  LEAD_SONAME = "libpq.so"
> @@ -37,7 +38,7 @@ LEAD_SONAME = "libpq.so"
>  export LDFLAGS_SL = "${LDFLAGS}"
>  export LDFLAGS_EX_BE = "-Wl,--export-dynamic"
>  
> -inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header
> +inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header ptest
>  
>  CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
>  
> @@ -184,6 +185,45 @@ do_compile:append() {
>      done
>  }
>  
> +do_compile_ptest() {
> +    oe_runmake -C src/test/regress all
> +}
> +
> +do_install_ptest() {
> +    mkdir -p ${D}${PTEST_PATH}/test
> +
> +    # Install pg_regress binary
> +    install -m 0755 ${B}/src/test/regress/pg_regress ${D}${PTEST_PATH}/test/
> +
> +    # Install test schedules and resultmap
> +    for f in parallel_schedule serial_schedule resultmap; do
> +        [ -f ${S}/src/test/regress/$f ] && install -m 0644 ${S}/src/test/regress/$f ${D}${PTEST_PATH}/test/
> +    done
> +
> +    # Install SQL, expected, input, output, and data files
> +    for d in sql expected input output data; do
> +        if [ -d ${S}/src/test/regress/$d ]; then
> +            cp -r ${S}/src/test/regress/$d ${D}${PTEST_PATH}/test/
> +        fi
> +    done
> +
> +    # Install the regress test shared library into the standard PostgreSQL
> +    # package library directory (PKGLIBDIR) alongside contrib modules such
> +    # as autoinc.so and refint.so. This allows pg_regress --dlpath to
> +    # resolve all required shared libraries from a single location.
> +    install -d ${D}${libdir}/${BPN}
> +    install -m 0755 ${B}/src/test/regress/regress.so ${D}${libdir}/${BPN}/
> +
> +    # Install run-ptest
> +    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
> +
> +    # Set ownership to postgres user for running tests
> +    chown -R postgres:postgres ${D}${PTEST_PATH}
> +}
> +
> +RDEPENDS:${PN}-ptest += "${PN} ${PN}-client ${PN}-contrib perl"


${PN} is part of this RDEPENDS implicitly, no need to add it separately
(granted, it also does no harm by being here)


> +FILES:${PN}-ptest += "${libdir}/${BPN}/regress.so"
> +
>  # server needs to configure user and group
>  usernum = "28"
>  groupnum = "28"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125542): https://lists.openembedded.org/g/openembedded-devel/message/125542
> Mute This Topic: https://lists.openembedded.org/mt/118479820/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


