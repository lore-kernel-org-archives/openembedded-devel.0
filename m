Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2152C54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 03:45:42 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.95139.1673322341112855267
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 19:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W0kgqYCl;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id m6-20020a9d7e86000000b0066ec505ae93so6302664otp.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 19:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nv1zBL5Z+NQaXQq97NBrPwSz8qG5jDPShVc+sZZzWPc=;
        b=W0kgqYClQwbXfJr+GOEzeMf3JJ8Mh4Mz3XOQf9Q8bYOicOIQ/lOLku1ycHsrxN4Sl4
         JXuQnAtShlsip2+JErajYb1rNnZkYgeM8ZouEl8aKLJdqGfEt/b9J63ScT8DrKUzyy1h
         vScG64wrWaYq42gBO8hFT1jsAn9O7XI47axtfg6YXd5DAbikdh400FX1jMeZ1unDQtYJ
         qHTOGspk2y9A3+L9x8c/sr0WoMXOblBmTE8BivScLDz3NzbydKBt1bWNJ/iiUAcDZARB
         /AsuToDvEXAOYqOZZfDI1D8z2LKwdKF/uvqa/hR9pDJP5Ks38gY1JM7Qw7Ch1NbDYmNB
         d11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nv1zBL5Z+NQaXQq97NBrPwSz8qG5jDPShVc+sZZzWPc=;
        b=NuKcOJfo9A5W4qaU6mfoxR3yIYo1Ho0RSeg6kV38ftaNRhUJgkt5Y11RSanpdf25x3
         wEEspExooTnHcUpoL+xFTJHMWSlTehzxpQnAD4RzkPT8GUa3+T68CsBUdV8T73KcpxTx
         +wI9FbWghyXv6hJHln3tLI723epA807J8HGAChhNQtZsdY9S7PQoosgbOxBAHvjRGbMt
         C4IoLCH3mnY8OkyFtFBJBK+CU+atUjl0xXUjebkqU5vgpQ0zRKnqczQjOBLPDmAASINu
         UhRRkUmu1v4s3Rw+hhbrSAzRfhhHaEYe+tNbeJLiLvo4CVi+IBQZbMsP8SCyYGJY9qIs
         M4zg==
X-Gm-Message-State: AFqh2krogrPtkoYLrVOWMcf0qvW8sUr/jjTdHg9iVKv/dSrvrD979CFe
	m5GOlRG3VMhL6DrwY/ouyoOZ2b6ad0bYWmI/SFdEL+Zcyhc=
X-Google-Smtp-Source: AMrXdXulGGdBTb9RsCfPQaedsiKtTpVjcK0/MlX6nGx59DbBrC4U/VvXXo0kzL8i44Lex9J8CQC59ikcNHl8KT8xx3w=
X-Received: by 2002:a9d:5cc5:0:b0:676:92ca:f7f4 with SMTP id
 r5-20020a9d5cc5000000b0067692caf7f4mr3630850oti.55.1673322340210; Mon, 09 Jan
 2023 19:45:40 -0800 (PST)
MIME-Version: 1.0
References: <48dfc489-5c28-88bf-f714-a3c4b4cf840f@gmail.com>
 <CAMKF1sp3jzrMqz1n_nTZ=C8Py9sBwWV_e9btzp1FrStJBYNNrg@mail.gmail.com>
 <CAHNuFG+Drd_x2bwtnOMOqkXXnd7QdEA=RoCe6vyKPEvdtstXXw@mail.gmail.com>
 <CAMKF1soKMA93qC-DEyYZsn9pdut4=kSnAPNU+6R873zbb=UKaQ@mail.gmail.com> <CAHNuFGKUVw9nm7pRT0WVhN-4=jzLMr276RyUyOraaSZNfv=Pwg@mail.gmail.com>
In-Reply-To: <CAHNuFGKUVw9nm7pRT0WVhN-4=jzLMr276RyUyOraaSZNfv=Pwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2023 19:45:14 -0800
Message-ID: <CAMKF1srF9aNRxpNN3FSK2Q9sr94h17JyUyWf18ZEncYSGqCMaw@mail.gmail.com>
Subject: Re: [oe] Kirkstone merge request: Jan 8th
To: Geoff Parker <geoffhp@gmail.com>
Cc: yogita.urade@windriver.com, akuster808 <akuster808@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Stephanie Lockwood-Childs <sjl@vctlabs.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 03:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100497

Great, thanks for testing. I am sure Armin will get this sorted soon

On Mon, Jan 9, 2023 at 6:24 PM Geoff Parker <geoffhp@gmail.com> wrote:
>
> Hi Khem,
>
> Stephanie's patch worked for me.
>
> On Mon, Jan 9, 2023 at 5:04 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Can you try https://patchwork.yoctoproject.org/project/oe/patch/20230110002358.GC1773006@codepurple/
> >
> > On Mon, Jan 9, 2023 at 3:31 PM Geoff Parker <geoffhp@gmail.com> wrote:
> > >
> > > Since the merge of
> > > .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb  CVE fix,
> > > I've been getting build failures on my kirkstone builds due to this
> > > do_package_qa Error.
> > >
> > > ERROR: multipath-tools-0.8.4-r0 do_package_qa: QA Issue: non
> > > -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink .so
> > > '/usr/lib/libdmmp.so'
> > > non -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink
> > > .so '/usr/lib/libmpathcmd.so'
> > > non -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink
> > > .so '/usr/lib/libmultipath.so'
> > > non -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink
> > > .so '/usr/lib/libmpathpersist.so' [dev-so]
> > > ERROR: multipath-tools-0.8.4-r0 do_package_qa: Fatal QA errors were
> > > found, failing task.
> > >
> > > The only ways I've been able to resolve the QA Error is to either
> > > revert the multipath-tools CVE fix commit, or add
> > > 'INSANE_SKIP:${PN}-libs = "dev-so" '  to a .bbappend.
> > >
> > > I'm happy to send a patch for the INSSANE_SKIP work-around, but I'm
> > > not sure this is a proper fix to this or not.
> > >
> > > On Sun, Jan 8, 2023 at 7:54 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > merged thanks.
> > > >
> > > > On Sun, Jan 8, 2023 at 7:32 AM akuster808 <akuster808@gmail.com> wrote:
> > > > >
> > > > > The following changes since commit a8055484f2829e8dfd03d5c8520b2c611aa7ebd2:
> > > > >
> > > > >    dool: Add patch to fix rebuild (2022-12-11 16:18:53 -0500)
> > > > >
> > > > > are available in the Git repository at:
> > > > >
> > > > >    https://git.openembedded.org/meta-openembedded kirkstone-next
> > > > >
> > > > > for you to fetch changes up to a9c25bef8882a69fd35ea7dbac3d978ce440fe06:
> > > > >
> > > > >    mariadb: Upgrade to 10.7.7 (2023-01-04 11:46:45 -0500)
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > Archana Polampalli (1):
> > > > >        Nodejs: Fixed python3 DeprecationWarning
> > > > >
> > > > > Mingli Yu (3):
> > > > >        php: Upgrade to 8.1.12
> > > > >        mariadb: not use qemu to run cross-compiled binaries
> > > > >        mariadb: Upgrade to 10.7.7
> > > > >
> > > > > Narpat Mali (1):
> > > > >        Fix collections.abc deprecation warning in downloadutils Warning
> > > > > appears as:
> > > > >
> > > > > Polampalli, Archana (1):
> > > > >        xfce4-settings: 4.16.2 -> 4.16.5
> > > > >
> > > > > Siddharth Doshi (1):
> > > > >        xterm : Fix CVE-2022-45063 code execution via OSC 50 input
> > > > > sequences] CVE-2022-45063
> > > > >
> > > > > Yogita Urade (1):
> > > > >        multipath-tools:fix CVE-2022-41973
> > > > >
> > > > >   .../{mariadb-native_10.7.4.bb => mariadb-native_10.7.7.bb} |   4 +-
> > > > >   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 23 +-
> > > > >   .../0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch    | 69 +++
> > > > >   meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch         | 34 ++
> > > > >   meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch        | 416
> > > > > ---------------
> > > > >   .../recipes-dbs/mysql/{mariadb_10.7.4.bb => mariadb_10.7.7.bb} |   6 +-
> > > > >   .../nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch     | 35 ++
> > > > >   meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb               | 3 +-
> > > > >   meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} |   2 +-
> > > > >   meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch    | 782
> > > > > ++++++++++++++++++++++++++++
> > > > >   meta-oe/recipes-graphics/xorg-app/xterm_372.bb                  | 1 +
> > > > >   .../files/0001-multipath-tools-use-run-instead-of-dev-shm.patch | 159
> > > > > ++++++
> > > > >   .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 4 +
> > > > >   ...1-Fix-collections.abc-deprecation-warning-in-downloadu.patch | 41 ++
> > > > >   .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb  | 5 +-
> > > > >   .../{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb} |   2 +-
> > > > >   16 files changed, 1147 insertions(+), 439 deletions(-)
> > > > >   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.4.bb =>
> > > > > mariadb-native_10.7.7.bb} (93%)
> > > > >   create mode 100644
> > > > > meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
> > > > >   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> > > > >   delete mode 100644
> > > > > meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
> > > > >   rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.4.bb =>
> > > > > mariadb_10.7.7.bb} (81%)
> > > > >   create mode 100644
> > > > > meta-oe/recipes-devtools/nodejs/nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch
> > > > >   rename meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} (99%)
> > > > >   create mode 100644
> > > > > meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
> > > > >   create mode 100644
> > > > > meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch
> > > > >   create mode 100644
> > > > > meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
> > > > >   rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb
> > > > > => xfce4-settings_4.16.5.bb} (93%)
> > > > >
> > > >
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#100476): https://lists.openembedded.org/g/openembedded-devel/message/100476
> > > > Mute This Topic: https://lists.openembedded.org/mt/96132811/141655
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [geoffhp@gmail.com]
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > >

