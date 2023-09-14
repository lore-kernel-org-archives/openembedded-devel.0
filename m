Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ACCEEAA5E
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 17:33:11 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.795.1694712790142465011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 10:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=I7y/LgFJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so668922fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 10:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694712789; x=1695317589; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ephzONwFiHA3ELbGI5rtsaF8UnWtEas3FYeycK+DMUQ=;
        b=I7y/LgFJgS55PkcHv5+vwSD+jZEvMUtS0V+43cit2VR3h/iqgObBbNEV0qgkSjjDbS
         yaunyi5ZDN5XdgmLctHgig/hOdhSSwGra0cAGjDbBkjjQyJFCXlJRD4g8rQtwiLHysH8
         lZ5yg+ezo7rBVYAi4lU+NYQBlBWwTVFpyTZLpUt8iGh5JRgekno6i13jUFl6LIe6Eq+h
         7j0yo6O+Gsp8XrSFXynDj+gKgvxg+BACNJP2YYeHNqlgDFalCWXs/5XRI8rFg2FHURG8
         l4Ylr+0r6eP+2H7D6M8tzVPj1gG8CNyWP7pVnAy30WvjLPBVpCSMU9AK7zp28SQwteCd
         Q3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694712789; x=1695317589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ephzONwFiHA3ELbGI5rtsaF8UnWtEas3FYeycK+DMUQ=;
        b=mAB4FEqAUOm7mJwtFn3K8KkU/QPyLt7ToNWr7Y7qhmKqoGsf2c+mDx37ZSObnHJY9G
         hs5zvZTv7jylI3KdBOwguZ4yi8Fp5pfJhOvY9HmgUPJH47rL7Joqqlo2hTE1S2qlyQpn
         jigw/I9mckDvwT+Y72v44GW7TF8DccNm43C+nQoJY92Ry/m3rWbqi5cZxBjiwJA++Akv
         /c5Gn7q042hZaHjZXsIlmKDk38nKReOfM7JJs608W2PnbgSX4u5jNdw5r27GauNIFp6b
         dZhgUPHoMk05BKVZ976FnD1b+O0tzcbrM8FIF3KvWaeXZokYRNO+d4w/Lzn3zlCoHhgz
         2O+A==
X-Gm-Message-State: AOJu0YzbYUxMe9PqqLhF4fW289kGOxWXkhtRFG8TwtYj7pKBtk2iYc09
	ZFYbSbKuLFTsaYYqI538E4yBAcO+wB9xPduGPceKfFIxTlg=
X-Google-Smtp-Source: AGHT+IHX+uwYeSPhNQxGHKOSY74ZNOTEoYnW4G9+jD0je7+kwIprbtcOsTLJd10riFtZGn4wiqcyhrK3oouuXwGJSjs=
X-Received: by 2002:a05:6870:35d3:b0:1be:d49b:a3c5 with SMTP id
 c19-20020a05687035d300b001bed49ba3c5mr6592420oak.29.1694712789278; Thu, 14
 Sep 2023 10:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230914034222.3307772-1-chi.xu@windriver.com> <CAMKF1sqFStADDHGXMU55Go6gU3saZLAWKpUNn4h-CRG3wcT52w@mail.gmail.com>
In-Reply-To: <CAMKF1sqFStADDHGXMU55Go6gU3saZLAWKpUNn4h-CRG3wcT52w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2023 10:32:43 -0700
Message-ID: <CAMKF1srQidfWpdxdapLvFLO++bV1Waxfv0uY8+tKaNO8RRqfTg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] mariadb: Add ptest support
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 17:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104878

When running manually, I see this

root@qemux86-64:/usr/lib/mariadb/ptest# ./run-ptest
sed: unrecognized option: u
BusyBox v1.36.1 () multi-call binary.

Usage: sed [-i[SFX]] [-nrE] [-f FILE]... [-e CMD]... [FILE]...
or: sed [-i[SFX]] [-nrE] CMD [FILE]...

So I guess it needs a full sed command. Add

RDEPENDS:${PN}-ptest +=3D "cmake sed"

On Thu, Sep 14, 2023 at 8:17=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> while running
>
> bitbake meta-oe-ptest-image-mariadb -ctestimage
>
> I am seeing
>
> WARNING: meta-oe-ptest-image-mariadb-1.0-r0 do_testimage: There were
> failing ptests.
> Traceback (most recent call last):
>   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/core/decorator/__ini=
t__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/core/decorator/__ini=
t__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/core/decorator/__ini=
t__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/runtime/cases/ptest.=
py",
> line 27, in test_ptestrunner_expectfail
>     self.do_ptestrunner()
>   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/runtime/cases/ptest.=
py",
> line 120, in do_ptestrunner
>     self.fail(failmsg)
> AssertionError:
> ptests which had no test results:
> ['mariadb']
>
> Cannot run ptests without @expectedFailure as ptests are expected to fail
> WARNING: meta-oe-ptest-image-mariadb-1.0-r0 do_testimage: Can not
> retrieve /var/log from test target
>
> On Wed, Sep 13, 2023 at 8:42=E2=80=AFPM Chi Xu <chi.xu@eng.windriver.com>=
 wrote:
> >
> > 70 test cases in all, and all of them are PASS.
> > There are some specific steps before doing test,
> > please refer to the comments in run-ptest.
> >
> > Test results:
> > root@intel-x86-64:~# ptest-runner mariadb
> > START: ptest-runner
> > 2023-09-14T15:17
> > BEGIN: /usr/lib64/mariadb/ptest
> > PASS: strings
> > PASS: json
> > PASS: simple
> > PASS: skip
> > PASS: todo
> > PASS: skip_all
> > PASS: no_plan
> > PASS: bitmap
> > PASS: base64
> > PASS: my_atomic
> > PASS: my_rdtsc
> > PASS: lf
> > PASS: my_malloc
> > PASS: my_getopt
> > PASS: dynstring
> > PASS: byte_order
> > PASS: queues
> > PASS: stacktrace
> > PASS: crc32
> > PASS: my_vsnprintf
> > PASS: aes
> > PASS: ma_dyncol
> > PASS: my_decimal
> > PASS: json_lib
> > PASS: json_normalize
> > PASS: my_apc
> > PASS: explain_filename
> > PASS: mf_iocache
> > PASS: my_json_writer
> > PASS: innodb_fts
> > PASS: innodb_sync
> > PASS: ma_control_file
> > PASS: trnman
> > PASS: ma_test_loghandler
> > PASS: ma_test_loghandler_multigroup
> > PASS: ma_test_loghandler_multithread
> > PASS: ma_test_loghandler_pagecache
> > PASS: ma_test_loghandler_long
> > PASS: ma_test_loghandler_noflush
> > PASS: ma_test_loghandler_first_lsn
> > PASS: ma_test_loghandler_max_lsn
> > PASS: ma_test_loghandler_purge
> > PASS: ma_test_loghandler_readonly
> > PASS: ma_test_loghandler_nologs
> > PASS: ma_pagecache_single_1k
> > PASS: ma_pagecache_single_8k
> > PASS: ma_pagecache_single_64k
> > PASS: ma_pagecache_consist_1k
> > PASS: ma_pagecache_consist_64k
> > PASS: ma_pagecache_consist_1kHC
> > PASS: ma_pagecache_consist_64kHC
> > PASS: ma_pagecache_consist_1kRD
> > PASS: ma_pagecache_consist_64kRD
> > PASS: ma_pagecache_consist_1kWR
> > PASS: ma_pagecache_consist_64kWR
> > PASS: ma_pagecache_rwconsist_1k
> > PASS: ma_pagecache_rwconsist2_1k
> > PASS: pfs_instr_class
> > PASS: pfs_instr_class-oom
> > PASS: pfs_instr
> > PASS: pfs_instr-oom
> > PASS: pfs_account-oom
> > PASS: pfs_host-oom
> > PASS: pfs_timer
> > PASS: pfs_user-oom
> > PASS: pfs_noop
> > PASS: pfs
> > PASS: pfs_misc
> > PASS: dbug
> > PASS: test-connect
> > DURATION: 60
> > END: /usr/lib64/mariadb/ptest
> > 2023-09-14T15:18
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > Signed-off-by: Chi Xu <chi.xu@windriver.com>
> > ---
> >  .../include/ptest-packagelists-meta-oe.inc    |  1 +
> >  meta-oe/recipes-dbs/mysql/mariadb/run-ptest   | 19 ++++++++++++
> >  meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb  | 31 +++++++++++++++++++
> >  3 files changed, 51 insertions(+)
> >  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/run-ptest
> >
> > diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta=
-oe/conf/include/ptest-packagelists-meta-oe.inc
> > index 06f3e16054..cafc43e011 100644
> > --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > @@ -49,6 +49,7 @@ PTESTS_SLOW_META_OE =3D "\
> >      fftw \
> >      libusb-compat \
> >      rsyslog \
> > +    mariadb \
> >  "
> >
> >  PTESTS_PROBLEMS_META_OE =3D"\
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb/run-ptest b/meta-oe/reci=
pes-dbs/mysql/mariadb/run-ptest
> > new file mode 100644
> > index 0000000000..57201035d4
> > --- /dev/null
> > +++ b/meta-oe/recipes-dbs/mysql/mariadb/run-ptest
> > @@ -0,0 +1,19 @@
> > +#!/bin/sh
> > +
> > +# Becasue test case test-connect, please do following steps before tes=
ting.
> > +# Without these steps, test case test-connect will fail.
> > +# 1. Disable 'skip-networking' in /etc/my.cnf
> > +#    $ sed -i '/skip-networking/s/^/#/g' /etc/my.cnf
> > +# 2. Restart mysqld.service
> > +#    $ systemctl restart mysqld
> > +# 3. Set password for MySQL user "root"
> > +#    $ mysql -u root
> > +#    MariaDB [(none)]> SET PASSWORD FOR 'root'@localhost =3D PASSWORD(=
"myReallyStrongPwd");
> > +#    MariaDB [(none)]> FLUSH PRIVILEGES;
> > +
> > +export MASTER_MYPORT=3D3306
> > +export MYSQL_TEST_HOST=3D127.0.0.1
> > +export MYSQL_TEST_USER=3Droot
> > +export MYSQL_TEST_PASSWD=3DmyReallyStrongPwd
> > +
> > +ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test=
 +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); =
print $6": "$4; fflush();}'
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb b/meta-oe/rec=
ipes-dbs/mysql/mariadb_10.11.5.bb
> > index 87faabfa27..2ef4e89064 100644
> > --- a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
> > +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
> > @@ -1,5 +1,36 @@
> >  require mariadb.inc
> >
> > +inherit ptest
> > +SRC_URI +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-p=
test', '', d)}"
> > +DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'rsync-native=
', '', d)}"
> > +RDEPENDS:${PN}-ptest +=3D "cmake"
> > +
> > +do_install_ptest () {
> > +    rsync -a ${B}/unittest ${B}/dbug ${D}${PTEST_PATH} \
> > +          --exclude CMakeFiles \
> > +          --exclude cmake_install.cmake \
> > +          --exclude Makefile \
> > +          --exclude=3D*.a \
> > +          --exclude=3D*.h \
> > +          --exclude=3D*.o \
> > +          --exclude=3D*.so \
> > +          --exclude=3D*.d \
> > +          --exclude=3D*.txt
> > +    install -m 0755 -d ${D}${PTEST_PATH}/storage
> > +    rsync -a ${B}/storage/maria ${B}/storage/perfschema ${B}/storage/i=
nnobase ${D}${PTEST_PATH}/storage \
> > +          --exclude CMakeFiles \
> > +          --exclude cmake_install.cmake \
> > +          --exclude Makefile \
> > +          --exclude=3D*.a \
> > +          --exclude=3D*.h \
> > +          --exclude=3D*.o \
> > +          --exclude=3D*.so \
> > +          --exclude=3D*.d \
> > +          --exclude=3D*.txt
> > +    cp -r ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
> > +    sed -i -e 's#${WORKDIR}##g' `find ${D}${PTEST_PATH} -name CTestTes=
tfile.cmake`
> > +}
> > +
> >  DEPENDS +=3D "mariadb-native bison-native boost libpcre2 curl ncurses =
\
> >              zlib libaio libedit libevent libxml2 gnutls fmt lzo zstd"
> >
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#104863): https://lists.openembedded.org/g/openembed=
ded-devel/message/104863
> > Mute This Topic: https://lists.openembedded.org/mt/101352157/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

