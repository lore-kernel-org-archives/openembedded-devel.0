Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B873EEEAA5F
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 17:46:41 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.1093.1694713591534834640
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 10:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=laboxqwI;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3a9a6a7a824so1225769b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 10:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694713591; x=1695318391; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5S+NP/oCE1qP1Zj+NhuvsTUO10Q0O/kuBAN+y9L4y8=;
        b=laboxqwIysF3OWPpErxwcPIremQmsO81jZNlFegkAPCvVkWK/vJZuVh5Qbxyud5GmZ
         P09p68cT93sYujaK2VgYeMfpTUZTbcn/0c2SQuKrFdtezAbjo8BX+w4WIVMDQhFv4vv9
         RKRVLMyxDnsTDcvoyBkuVtz0Udmx21IqJACEqVtu5Mk6cb2X5zztKdu7meTuSo2mQQGc
         oUoOBCHkSFw66G++ZPlOnWYWk9WfvHxecJy67rAPBAc90uOrEevamHWaWUA1n1Unj8Ns
         DPtTQy8Q2g+zLhNGMvUrVgnCUN+EjkT6ldR5Xfb8juqe9fVAWL5apXT0Rkcgw+IuQ8oG
         qvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694713591; x=1695318391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5S+NP/oCE1qP1Zj+NhuvsTUO10Q0O/kuBAN+y9L4y8=;
        b=UOmMgAvWRfDLmiUzKliajmo2HW8BH5Lcuml0iVj9nCeSd7ND3lRAkshFdBx+eeN5DZ
         sH6A3NrOwKzl4pBVDS7Ktzj8fLljBoDtFUtRo/Oa9UH+UjIQgmyMwuIDp5z3MmyWveF6
         PIEhklhq5yV7uIafpg0STBc13VrXLZ6bEXcrlu+sh1AUtPyfjcQ1oVJH34rAQTMcR+fg
         +z7aKs2Ge3/3wgnS5KaqANJrp0uNUT//egm9J+hWo24dedM37vzu1gDKUZCc1CEnaWIY
         rI+Bqi20WqxH9bhRCiWenhfn1jCMruYbK437J0/juroMraVeVaDXTcS3Kr86fTqlt58S
         iF7g==
X-Gm-Message-State: AOJu0YxcfkaenjmHLwT84DjRCO6Re3SC4rzGa3E9j8rET2KAU7c7NEmN
	DPNSTb1W2h8yTRyGyrW6Tg2y9VA5uhOLiD0kbSxp3rStb48=
X-Google-Smtp-Source: AGHT+IGn6viLGIQMYuC6uQHOKjkE38iyxlWh7oIeXG716aDDOej9/q0f/jHTT7+gqmE4U5eV4W1fnq/cngQ7glrJUqA=
X-Received: by 2002:a05:6870:b493:b0:1bb:50ae:f3d9 with SMTP id
 y19-20020a056870b49300b001bb50aef3d9mr1715225oap.27.1694713590674; Thu, 14
 Sep 2023 10:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230914034222.3307772-1-chi.xu@windriver.com>
 <CAMKF1sqFStADDHGXMU55Go6gU3saZLAWKpUNn4h-CRG3wcT52w@mail.gmail.com> <CAMKF1srQidfWpdxdapLvFLO++bV1Waxfv0uY8+tKaNO8RRqfTg@mail.gmail.com>
In-Reply-To: <CAMKF1srQidfWpdxdapLvFLO++bV1Waxfv0uY8+tKaNO8RRqfTg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2023 10:46:04 -0700
Message-ID: <CAMKF1soJrD=Ld7Wi_0aN476WwbfEwvnk4vdjPm=Ay1522k2txA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] mariadb: Add ptest support
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 17:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104879

it also needs perl-module-test-more rdep for

FAIL: dbug

tests to pass.

There still remains one failure on musl

70/70 Testing: test-connect
70/70 Test: test-connect
Command: "/usr/lib/mariadb/ptest/unittest/embedded/test-connect-t"
Directory: /usr/lib/mariadb/ptest/unittest/embedded
"test-connect" start time: Sep 14 17:44 UTC
Output:
----------------------------------------------------------
mysql_real_connect failed: Can't connect to server on '127.0.0.1' (111
"Connection refused")
<end of output>
Test time =3D   0.03 sec
----------------------------------------------------------
Test Failed.
"test-connect" end time: Sep 14 17:44 UTC
"test-connect" time elapsed: 00:00:00
----------------------------------------------------------

On Thu, Sep 14, 2023 at 10:32=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> When running manually, I see this
>
> root@qemux86-64:/usr/lib/mariadb/ptest# ./run-ptest
> sed: unrecognized option: u
> BusyBox v1.36.1 () multi-call binary.
>
> Usage: sed [-i[SFX]] [-nrE] [-f FILE]... [-e CMD]... [FILE]...
> or: sed [-i[SFX]] [-nrE] CMD [FILE]...
>
> So I guess it needs a full sed command. Add
>
> RDEPENDS:${PN}-ptest +=3D "cmake sed"
>
> On Thu, Sep 14, 2023 at 8:17=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > while running
> >
> > bitbake meta-oe-ptest-image-mariadb -ctestimage
> >
> > I am seeing
> >
> > WARNING: meta-oe-ptest-image-mariadb-1.0-r0 do_testimage: There were
> > failing ptests.
> > Traceback (most recent call last):
> >   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/core/decorator/__i=
nit__.py",
> > line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/core/decorator/__i=
nit__.py",
> > line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/core/decorator/__i=
nit__.py",
> > line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >            ^^^^^^^^^^^^^^^^^^^^^
> >   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/runtime/cases/ptes=
t.py",
> > line 27, in test_ptestrunner_expectfail
> >     self.do_ptestrunner()
> >   File "/mnt/b/yoe/master/sources/poky/meta/lib/oeqa/runtime/cases/ptes=
t.py",
> > line 120, in do_ptestrunner
> >     self.fail(failmsg)
> > AssertionError:
> > ptests which had no test results:
> > ['mariadb']
> >
> > Cannot run ptests without @expectedFailure as ptests are expected to fa=
il
> > WARNING: meta-oe-ptest-image-mariadb-1.0-r0 do_testimage: Can not
> > retrieve /var/log from test target
> >
> > On Wed, Sep 13, 2023 at 8:42=E2=80=AFPM Chi Xu <chi.xu@eng.windriver.co=
m> wrote:
> > >
> > > 70 test cases in all, and all of them are PASS.
> > > There are some specific steps before doing test,
> > > please refer to the comments in run-ptest.
> > >
> > > Test results:
> > > root@intel-x86-64:~# ptest-runner mariadb
> > > START: ptest-runner
> > > 2023-09-14T15:17
> > > BEGIN: /usr/lib64/mariadb/ptest
> > > PASS: strings
> > > PASS: json
> > > PASS: simple
> > > PASS: skip
> > > PASS: todo
> > > PASS: skip_all
> > > PASS: no_plan
> > > PASS: bitmap
> > > PASS: base64
> > > PASS: my_atomic
> > > PASS: my_rdtsc
> > > PASS: lf
> > > PASS: my_malloc
> > > PASS: my_getopt
> > > PASS: dynstring
> > > PASS: byte_order
> > > PASS: queues
> > > PASS: stacktrace
> > > PASS: crc32
> > > PASS: my_vsnprintf
> > > PASS: aes
> > > PASS: ma_dyncol
> > > PASS: my_decimal
> > > PASS: json_lib
> > > PASS: json_normalize
> > > PASS: my_apc
> > > PASS: explain_filename
> > > PASS: mf_iocache
> > > PASS: my_json_writer
> > > PASS: innodb_fts
> > > PASS: innodb_sync
> > > PASS: ma_control_file
> > > PASS: trnman
> > > PASS: ma_test_loghandler
> > > PASS: ma_test_loghandler_multigroup
> > > PASS: ma_test_loghandler_multithread
> > > PASS: ma_test_loghandler_pagecache
> > > PASS: ma_test_loghandler_long
> > > PASS: ma_test_loghandler_noflush
> > > PASS: ma_test_loghandler_first_lsn
> > > PASS: ma_test_loghandler_max_lsn
> > > PASS: ma_test_loghandler_purge
> > > PASS: ma_test_loghandler_readonly
> > > PASS: ma_test_loghandler_nologs
> > > PASS: ma_pagecache_single_1k
> > > PASS: ma_pagecache_single_8k
> > > PASS: ma_pagecache_single_64k
> > > PASS: ma_pagecache_consist_1k
> > > PASS: ma_pagecache_consist_64k
> > > PASS: ma_pagecache_consist_1kHC
> > > PASS: ma_pagecache_consist_64kHC
> > > PASS: ma_pagecache_consist_1kRD
> > > PASS: ma_pagecache_consist_64kRD
> > > PASS: ma_pagecache_consist_1kWR
> > > PASS: ma_pagecache_consist_64kWR
> > > PASS: ma_pagecache_rwconsist_1k
> > > PASS: ma_pagecache_rwconsist2_1k
> > > PASS: pfs_instr_class
> > > PASS: pfs_instr_class-oom
> > > PASS: pfs_instr
> > > PASS: pfs_instr-oom
> > > PASS: pfs_account-oom
> > > PASS: pfs_host-oom
> > > PASS: pfs_timer
> > > PASS: pfs_user-oom
> > > PASS: pfs_noop
> > > PASS: pfs
> > > PASS: pfs_misc
> > > PASS: dbug
> > > PASS: test-connect
> > > DURATION: 60
> > > END: /usr/lib64/mariadb/ptest
> > > 2023-09-14T15:18
> > > STOP: ptest-runner
> > > TOTAL: 1 FAIL: 0
> > >
> > > Signed-off-by: Chi Xu <chi.xu@windriver.com>
> > > ---
> > >  .../include/ptest-packagelists-meta-oe.inc    |  1 +
> > >  meta-oe/recipes-dbs/mysql/mariadb/run-ptest   | 19 ++++++++++++
> > >  meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb  | 31 +++++++++++++++++=
++
> > >  3 files changed, 51 insertions(+)
> > >  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/run-ptest
> > >
> > > diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/me=
ta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > > index 06f3e16054..cafc43e011 100644
> > > --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > > +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > > @@ -49,6 +49,7 @@ PTESTS_SLOW_META_OE =3D "\
> > >      fftw \
> > >      libusb-compat \
> > >      rsyslog \
> > > +    mariadb \
> > >  "
> > >
> > >  PTESTS_PROBLEMS_META_OE =3D"\
> > > diff --git a/meta-oe/recipes-dbs/mysql/mariadb/run-ptest b/meta-oe/re=
cipes-dbs/mysql/mariadb/run-ptest
> > > new file mode 100644
> > > index 0000000000..57201035d4
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-dbs/mysql/mariadb/run-ptest
> > > @@ -0,0 +1,19 @@
> > > +#!/bin/sh
> > > +
> > > +# Becasue test case test-connect, please do following steps before t=
esting.
> > > +# Without these steps, test case test-connect will fail.
> > > +# 1. Disable 'skip-networking' in /etc/my.cnf
> > > +#    $ sed -i '/skip-networking/s/^/#/g' /etc/my.cnf
> > > +# 2. Restart mysqld.service
> > > +#    $ systemctl restart mysqld
> > > +# 3. Set password for MySQL user "root"
> > > +#    $ mysql -u root
> > > +#    MariaDB [(none)]> SET PASSWORD FOR 'root'@localhost =3D PASSWOR=
D("myReallyStrongPwd");
> > > +#    MariaDB [(none)]> FLUSH PRIVILEGES;
> > > +
> > > +export MASTER_MYPORT=3D3306
> > > +export MYSQL_TEST_HOST=3D127.0.0.1
> > > +export MYSQL_TEST_USER=3Droot
> > > +export MYSQL_TEST_PASSWD=3DmyReallyStrongPwd
> > > +
> > > +ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Te=
st +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP")=
; print $6": "$4; fflush();}'
> > > diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb b/meta-oe/r=
ecipes-dbs/mysql/mariadb_10.11.5.bb
> > > index 87faabfa27..2ef4e89064 100644
> > > --- a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
> > > +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
> > > @@ -1,5 +1,36 @@
> > >  require mariadb.inc
> > >
> > > +inherit ptest
> > > +SRC_URI +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run=
-ptest', '', d)}"
> > > +DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'rsync-nati=
ve', '', d)}"
> > > +RDEPENDS:${PN}-ptest +=3D "cmake"
> > > +
> > > +do_install_ptest () {
> > > +    rsync -a ${B}/unittest ${B}/dbug ${D}${PTEST_PATH} \
> > > +          --exclude CMakeFiles \
> > > +          --exclude cmake_install.cmake \
> > > +          --exclude Makefile \
> > > +          --exclude=3D*.a \
> > > +          --exclude=3D*.h \
> > > +          --exclude=3D*.o \
> > > +          --exclude=3D*.so \
> > > +          --exclude=3D*.d \
> > > +          --exclude=3D*.txt
> > > +    install -m 0755 -d ${D}${PTEST_PATH}/storage
> > > +    rsync -a ${B}/storage/maria ${B}/storage/perfschema ${B}/storage=
/innobase ${D}${PTEST_PATH}/storage \
> > > +          --exclude CMakeFiles \
> > > +          --exclude cmake_install.cmake \
> > > +          --exclude Makefile \
> > > +          --exclude=3D*.a \
> > > +          --exclude=3D*.h \
> > > +          --exclude=3D*.o \
> > > +          --exclude=3D*.so \
> > > +          --exclude=3D*.d \
> > > +          --exclude=3D*.txt
> > > +    cp -r ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
> > > +    sed -i -e 's#${WORKDIR}##g' `find ${D}${PTEST_PATH} -name CTestT=
estfile.cmake`
> > > +}
> > > +
> > >  DEPENDS +=3D "mariadb-native bison-native boost libpcre2 curl ncurse=
s \
> > >              zlib libaio libedit libevent libxml2 gnutls fmt lzo zstd=
"
> > >
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#104863): https://lists.openembedded.org/g/openemb=
edded-devel/message/104863
> > > Mute This Topic: https://lists.openembedded.org/mt/101352157/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

