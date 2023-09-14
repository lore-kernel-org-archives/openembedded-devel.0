Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA8AEE021C
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 03:18:58 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.4142.1694661527575363529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Sep 2023 20:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GJeQH8Ge;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5734b893a11so326272eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 20:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694661527; x=1695266327; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61N4r+Z92isnalQ7gJIGzLELEmmICIjunyTNhqDM6Is=;
        b=GJeQH8GeOX+jT4xEvkuPJAdNziFSnkob0QENroFMfKcX7rVrv5EoJaw2BSsdVlPPMH
         blaipoORLhdI2UPKTo/3NsATI+D0hDkNEpl5AnosQ4ouiGqijnslUCe94X5Zh2ufRxMv
         J4Wb5rH8D2i7Kd5I2Mr606po+3eMGXvuBTxRp+qZojGJaboxt151C4YDy77ECDHhOAk8
         A5d0AOyJHDP3Od8jqKnyyLgxiocKFHOBXC1QkXwfeWzVP/3DLkddNwFApXgBszaB/wE/
         GzQLxo/bM6FAIZhhDSuvvT4BdbxDEakMMLzBIW9hXl/DAsDF3FV4nMgv76Jiby0KIyDH
         0lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694661527; x=1695266327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61N4r+Z92isnalQ7gJIGzLELEmmICIjunyTNhqDM6Is=;
        b=q2GZsMqMaY1IYNDrWawFqGS4EPuspFdG35IdlOG9HaQTs/j17k3sCPbKoGd7jhdaFr
         PqzL0Ll+oWyWdd42/HjyAed8QSQo+tVUoMe7AR6JXddhrYHu5sLIklImJX1aQ5OgCblK
         c0WtUji/+WXNRdhDwNqgy0fMeg/9rgsT1u6n+laoT5cM+ScOApZ0kT5tddNSIEcn9iU6
         PtfUBqHa68VXvrGrVfmD58tUQLZwK4vBNlEXdZnBeNayvkWnTxUQ7dmsjdGwwFeyEYpe
         Ha+Ic2/M1Z8eCJhwhfNyyBPLQY0CHP83jSGGx9rZujh46wV8vDf3tP7RdOqzdcpjI7nG
         +CPw==
X-Gm-Message-State: AOJu0YyrsAwrut2xEptjhQhb1zMa8GVpEic+soPw4K1ekoYjLFkAccGN
	ccQXLkpkNB8XhXESe7oww4SKxyMiG5FqOJdcHh9veBQ+qRk=
X-Google-Smtp-Source: AGHT+IH66Ow5B+7gfleLlBSL7+GnJizrL4IYfeRagYjw9bC964FeRAm5bb+q1G7dHMBVGfIh+csLhqmqGWO0pUx1vZQ=
X-Received: by 2002:a05:6870:2d1:b0:1b7:4521:14b6 with SMTP id
 r17-20020a05687002d100b001b7452114b6mr4860943oaf.5.1694661526685; Wed, 13 Sep
 2023 20:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230914022151.3298392-1-chi.xu@windriver.com>
In-Reply-To: <20230914022151.3298392-1-chi.xu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Sep 2023 20:18:20 -0700
Message-ID: <CAMKF1sqrLLMn2qCbAQq=XyGkGKRYPWb2z4cbDYJN4UH7tdUOfg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Add ptest support
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 03:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104861

This is good. Can you also add it to ptest multconfig via PTESTS_SLOW_META_=
OE
in meta-oe/conf/include/ptest-packagelists-meta-oe.inc

On Wed, Sep 13, 2023 at 7:21=E2=80=AFPM Chi Xu <chi.xu@eng.windriver.com> w=
rote:
>
> 70 test cases in all, and all of them are PASS.
> There are some specific steps before doing test,
> please refer to the comments in run-ptest.
>
> Test results:
> root@intel-x86-64:~# ptest-runner mariadb
> START: ptest-runner
> 2023-09-14T15:17
> BEGIN: /usr/lib64/mariadb/ptest
> PASS: strings
> PASS: json
> PASS: simple
> PASS: skip
> PASS: todo
> PASS: skip_all
> PASS: no_plan
> PASS: bitmap
> PASS: base64
> PASS: my_atomic
> PASS: my_rdtsc
> PASS: lf
> PASS: my_malloc
> PASS: my_getopt
> PASS: dynstring
> PASS: byte_order
> PASS: queues
> PASS: stacktrace
> PASS: crc32
> PASS: my_vsnprintf
> PASS: aes
> PASS: ma_dyncol
> PASS: my_decimal
> PASS: json_lib
> PASS: json_normalize
> PASS: my_apc
> PASS: explain_filename
> PASS: mf_iocache
> PASS: my_json_writer
> PASS: innodb_fts
> PASS: innodb_sync
> PASS: ma_control_file
> PASS: trnman
> PASS: ma_test_loghandler
> PASS: ma_test_loghandler_multigroup
> PASS: ma_test_loghandler_multithread
> PASS: ma_test_loghandler_pagecache
> PASS: ma_test_loghandler_long
> PASS: ma_test_loghandler_noflush
> PASS: ma_test_loghandler_first_lsn
> PASS: ma_test_loghandler_max_lsn
> PASS: ma_test_loghandler_purge
> PASS: ma_test_loghandler_readonly
> PASS: ma_test_loghandler_nologs
> PASS: ma_pagecache_single_1k
> PASS: ma_pagecache_single_8k
> PASS: ma_pagecache_single_64k
> PASS: ma_pagecache_consist_1k
> PASS: ma_pagecache_consist_64k
> PASS: ma_pagecache_consist_1kHC
> PASS: ma_pagecache_consist_64kHC
> PASS: ma_pagecache_consist_1kRD
> PASS: ma_pagecache_consist_64kRD
> PASS: ma_pagecache_consist_1kWR
> PASS: ma_pagecache_consist_64kWR
> PASS: ma_pagecache_rwconsist_1k
> PASS: ma_pagecache_rwconsist2_1k
> PASS: pfs_instr_class
> PASS: pfs_instr_class-oom
> PASS: pfs_instr
> PASS: pfs_instr-oom
> PASS: pfs_account-oom
> PASS: pfs_host-oom
> PASS: pfs_timer
> PASS: pfs_user-oom
> PASS: pfs_noop
> PASS: pfs
> PASS: pfs_misc
> PASS: dbug
> PASS: test-connect
> DURATION: 60
> END: /usr/lib64/mariadb/ptest
> 2023-09-14T15:18
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Chi Xu <chi.xu@windriver.com>
> ---
>  meta-oe/recipes-dbs/mysql/mariadb/run-ptest  | 19 ++++++++++++
>  meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb | 31 ++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/run-ptest
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/run-ptest b/meta-oe/recipe=
s-dbs/mysql/mariadb/run-ptest
> new file mode 100644
> index 0000000000..57201035d4
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/run-ptest
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +
> +# Becasue test case test-connect, please do following steps before testi=
ng.
> +# Without these steps, test case test-connect will fail.
> +# 1. Disable 'skip-networking' in /etc/my.cnf
> +#    $ sed -i '/skip-networking/s/^/#/g' /etc/my.cnf
> +# 2. Restart mysqld.service
> +#    $ systemctl restart mysqld
> +# 3. Set password for MySQL user "root"
> +#    $ mysql -u root
> +#    MariaDB [(none)]> SET PASSWORD FOR 'root'@localhost =3D PASSWORD("m=
yReallyStrongPwd");
> +#    MariaDB [(none)]> FLUSH PRIVILEGES;
> +
> +export MASTER_MYPORT=3D3306
> +export MYSQL_TEST_HOST=3D127.0.0.1
> +export MYSQL_TEST_USER=3Droot
> +export MYSQL_TEST_PASSWD=3DmyReallyStrongPwd
> +
> +ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test +=
#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); pr=
int $6": "$4; fflush();}'
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb b/meta-oe/recip=
es-dbs/mysql/mariadb_10.11.5.bb
> index 87faabfa27..2ef4e89064 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
> @@ -1,5 +1,36 @@
>  require mariadb.inc
>
> +inherit ptest
> +SRC_URI +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-pte=
st', '', d)}"
> +DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'rsync-native',=
 '', d)}"
> +RDEPENDS:${PN}-ptest +=3D "cmake"
> +
> +do_install_ptest () {
> +    rsync -a ${B}/unittest ${B}/dbug ${D}${PTEST_PATH} \
> +          --exclude CMakeFiles \
> +          --exclude cmake_install.cmake \
> +          --exclude Makefile \
> +          --exclude=3D*.a \
> +          --exclude=3D*.h \
> +          --exclude=3D*.o \
> +          --exclude=3D*.so \
> +          --exclude=3D*.d \
> +          --exclude=3D*.txt
> +    install -m 0755 -d ${D}${PTEST_PATH}/storage
> +    rsync -a ${B}/storage/maria ${B}/storage/perfschema ${B}/storage/inn=
obase ${D}${PTEST_PATH}/storage \
> +          --exclude CMakeFiles \
> +          --exclude cmake_install.cmake \
> +          --exclude Makefile \
> +          --exclude=3D*.a \
> +          --exclude=3D*.h \
> +          --exclude=3D*.o \
> +          --exclude=3D*.so \
> +          --exclude=3D*.d \
> +          --exclude=3D*.txt
> +    cp -r ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
> +    sed -i -e 's#${WORKDIR}##g' `find ${D}${PTEST_PATH} -name CTestTestf=
ile.cmake`
> +}
> +
>  DEPENDS +=3D "mariadb-native bison-native boost libpcre2 curl ncurses \
>              zlib libaio libedit libevent libxml2 gnutls fmt lzo zstd"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104860): https://lists.openembedded.org/g/openembedde=
d-devel/message/104860
> Mute This Topic: https://lists.openembedded.org/mt/101351338/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

