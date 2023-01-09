Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A099C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 23:31:21 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.89686.1673307075651921134
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 15:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yt/I0zgK;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso14575195pjt.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 15:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GC10BwDlxq1UHe1BFS+AoMpGIyRxRpNb/BaWQUPon38=;
        b=Yt/I0zgKpOOos6Pv1MVk647mVHk0yrs9vgbrMgTuSQO/5wm0WGAuRMoAHXVrKVnPog
         52Xlk/9qyXgE/JQzUG7/BXCzOl4PCawGGxHSLN/5F/4/zWMf9+/lnpB5cc+jybzj7XoA
         sGJ/mPmq5AwHrb6+V2aTvOUA/58j0uLGmzwym86kbkP9zLoMXYcvyk+FAA3Z6tm3CXp/
         YPp+gXJezcL1qdoPKnLK5IEg/o+DZ1DFvbr34bZrFYEy1x/A9hIRP1Vdn1bobFNNRqIr
         7dLWFEC2USTCA06b1ATBDViE1G/IOxsmMI1pnBbcyN6eSY+VD2V/VZBo/aojmiCgeoN6
         2nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC10BwDlxq1UHe1BFS+AoMpGIyRxRpNb/BaWQUPon38=;
        b=Wm0ozpABNat0DcKi7p+DedmmDTDInfLj+iE6SuxntLfqgW8hg+GoktkHvbfPIQzj1Y
         fsM7LNnD0YK2FfDrotPfwqkaaqEX7HfVqAaDnldFc90dvUMlvlbE6fWHg8bCvWyTFLgN
         fqknwA8Ndika2yaQFI5u4gi5bud9/9FF7YcRJH/U88BlCXs6T+ywLxS2lOoRuC1IWSqN
         XOPuCbMvw8jCZjeI0gm37n6rPuKvQJNDHC3a1jKc0bhZVsF9doQifaQoCstSBhje+BeX
         WieOE3MAiIZW2MJM+h1d8d+ZahvALkWIEbGjft9nayv/2OFZI1DiRj+dYyZpQT30LEhD
         rsKg==
X-Gm-Message-State: AFqh2krCKGLE5M5M6SPVL7zs2miXnuIyx+Cu53mQ8ymSL07gmi2r0FM/
	3eP/ys2GiVlIt01o4xNFkK01MDn2PFw0KsXeBH0=
X-Google-Smtp-Source: AMrXdXsuusVaRSH1VPNH7TIiHBVeMya+admmyaTpC8LAaaCLdJZYWj1QUbDLVHZJSA6nGGYmf2jlHzMZq7sQ7sNQCAs=
X-Received: by 2002:a17:902:c40b:b0:190:f66c:13aa with SMTP id
 k11-20020a170902c40b00b00190f66c13aamr4825342plk.121.1673307074663; Mon, 09
 Jan 2023 15:31:14 -0800 (PST)
MIME-Version: 1.0
References: <48dfc489-5c28-88bf-f714-a3c4b4cf840f@gmail.com> <CAMKF1sp3jzrMqz1n_nTZ=C8Py9sBwWV_e9btzp1FrStJBYNNrg@mail.gmail.com>
In-Reply-To: <CAMKF1sp3jzrMqz1n_nTZ=C8Py9sBwWV_e9btzp1FrStJBYNNrg@mail.gmail.com>
From: Geoff Parker <geoffhp@gmail.com>
Date: Mon, 9 Jan 2023 15:31:03 -0800
Message-ID: <CAHNuFG+Drd_x2bwtnOMOqkXXnd7QdEA=RoCe6vyKPEvdtstXXw@mail.gmail.com>
Subject: Re: [oe] Kirkstone merge request: Jan 8th
To: Khem Raj <raj.khem@gmail.com>, yogita.urade@windriver.com
Cc: akuster808 <akuster808@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 23:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100493

Since the merge of
.../recipes-support/multipath-tools/multipath-tools_0.8.4.bb  CVE fix,
I've been getting build failures on my kirkstone builds due to this
do_package_qa Error.

ERROR: multipath-tools-0.8.4-r0 do_package_qa: QA Issue: non
-dev/-dbg/nativesdk- package multipath-tools-libs contains symlink .so
'/usr/lib/libdmmp.so'
non -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink
.so '/usr/lib/libmpathcmd.so'
non -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink
.so '/usr/lib/libmultipath.so'
non -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink
.so '/usr/lib/libmpathpersist.so' [dev-so]
ERROR: multipath-tools-0.8.4-r0 do_package_qa: Fatal QA errors were
found, failing task.

The only ways I've been able to resolve the QA Error is to either
revert the multipath-tools CVE fix commit, or add
'INSANE_SKIP:${PN}-libs = "dev-so" '  to a .bbappend.

I'm happy to send a patch for the INSSANE_SKIP work-around, but I'm
not sure this is a proper fix to this or not.

On Sun, Jan 8, 2023 at 7:54 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> merged thanks.
>
> On Sun, Jan 8, 2023 at 7:32 AM akuster808 <akuster808@gmail.com> wrote:
> >
> > The following changes since commit a8055484f2829e8dfd03d5c8520b2c611aa7ebd2:
> >
> >    dool: Add patch to fix rebuild (2022-12-11 16:18:53 -0500)
> >
> > are available in the Git repository at:
> >
> >    https://git.openembedded.org/meta-openembedded kirkstone-next
> >
> > for you to fetch changes up to a9c25bef8882a69fd35ea7dbac3d978ce440fe06:
> >
> >    mariadb: Upgrade to 10.7.7 (2023-01-04 11:46:45 -0500)
> >
> > ----------------------------------------------------------------
> > Archana Polampalli (1):
> >        Nodejs: Fixed python3 DeprecationWarning
> >
> > Mingli Yu (3):
> >        php: Upgrade to 8.1.12
> >        mariadb: not use qemu to run cross-compiled binaries
> >        mariadb: Upgrade to 10.7.7
> >
> > Narpat Mali (1):
> >        Fix collections.abc deprecation warning in downloadutils Warning
> > appears as:
> >
> > Polampalli, Archana (1):
> >        xfce4-settings: 4.16.2 -> 4.16.5
> >
> > Siddharth Doshi (1):
> >        xterm : Fix CVE-2022-45063 code execution via OSC 50 input
> > sequences] CVE-2022-45063
> >
> > Yogita Urade (1):
> >        multipath-tools:fix CVE-2022-41973
> >
> >   .../{mariadb-native_10.7.4.bb => mariadb-native_10.7.7.bb} |   4 +-
> >   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 23 +-
> >   .../0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch    | 69 +++
> >   meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch         | 34 ++
> >   meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch        | 416
> > ---------------
> >   .../recipes-dbs/mysql/{mariadb_10.7.4.bb => mariadb_10.7.7.bb} |   6 +-
> >   .../nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch     | 35 ++
> >   meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb               | 3 +-
> >   meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} |   2 +-
> >   meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch    | 782
> > ++++++++++++++++++++++++++++
> >   meta-oe/recipes-graphics/xorg-app/xterm_372.bb                  | 1 +
> >   .../files/0001-multipath-tools-use-run-instead-of-dev-shm.patch | 159
> > ++++++
> >   .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 4 +
> >   ...1-Fix-collections.abc-deprecation-warning-in-downloadu.patch | 41 ++
> >   .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb  | 5 +-
> >   .../{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb} |   2 +-
> >   16 files changed, 1147 insertions(+), 439 deletions(-)
> >   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.4.bb =>
> > mariadb-native_10.7.7.bb} (93%)
> >   create mode 100644
> > meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
> >   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> >   delete mode 100644
> > meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
> >   rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.4.bb =>
> > mariadb_10.7.7.bb} (81%)
> >   create mode 100644
> > meta-oe/recipes-devtools/nodejs/nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch
> >   rename meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} (99%)
> >   create mode 100644
> > meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
> >   create mode 100644
> > meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch
> >   create mode 100644
> > meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
> >   rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb
> > => xfce4-settings_4.16.5.bb} (93%)
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100476): https://lists.openembedded.org/g/openembedded-devel/message/100476
> Mute This Topic: https://lists.openembedded.org/mt/96132811/141655
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [geoffhp@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

