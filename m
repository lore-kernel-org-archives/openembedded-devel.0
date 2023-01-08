Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C22C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:54:22 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.47532.1673193255378377238
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q44o6qTh;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id j16-20020a056830271000b0067202045ee9so3870372otu.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1CMPEAGZzl6ZoX2D5Skbz1Wdh/rqaRis4RQu2medmps=;
        b=Q44o6qThFjmSN5QAGLZwhP8aOjPbfVbBEV/XqkW8zFBAh+7nLZubO1FMRMSe4WGtMh
         FwbUXmCPqQHeoVBOc+bjZ3KgKp0i2+ZoJI444XrL8kpk/J+iQWp2s1qekAFVk+Vcc2EW
         JmWB5TEFiU2DFAaEqfh3kemqcdVox/M5wgR4IhCKhyyJAcXmlzp9ndma77o/RwCxQyJR
         gDlDU6CcwMthiermWntzcixzJUXz/kTLIeYovQrIZ/pZKRf7Kjs2wwg0g5+Y142KUYtX
         8E6aSFd30s7jJXZq2PzYiDADd2BDTb3ifrJbupux7mmX0BuQXfeVooO5zBRP9pFvY7gd
         Mbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CMPEAGZzl6ZoX2D5Skbz1Wdh/rqaRis4RQu2medmps=;
        b=2vR/DGzkWuZY1RRXBgYczku0qxo61xM6Y7BMtg+i+yQRlM91Br09uL49I7aAZijqxv
         c9ouAMIRe2rB5kNo4rmGHnjWdXfnHZJVVNrK/HJXFCpdlKkHYz3xzRGs8Rw02EVUzBRI
         uTmGhtgcPAdxv5/iQ23PKT+w1UlH5SaUd8CB5kvK+xnjJI0gUJo/q2bZpj+SbGDlJIUB
         1dOsouXTAqVLnPcLBW4xsAZcq7I/2wDui6y69RECn8qB4R/tBoWJPlGCMpvI3WeL5kSV
         4i8o1ZkeCicoZiKQHq4UXuAkBVx+Xg79jam3b73ISXAz82ul09WXl4mmPZiZRRsiUwBW
         qqNg==
X-Gm-Message-State: AFqh2kr65y8S3PB82ljeS5R/1V6a1zhHdmZJVTk3TI+rVE1DlsAVGADW
	/9V1kW92xWC+LZZL9c443m1mxu3lrBH2Pkq48lE=
X-Google-Smtp-Source: AMrXdXtzyI87O1yZtXUs3nEToNIBwT67qIAjmya+bi56bpRXFBA/vabQ7OkNf4Xc9mgehBqWocpFiNjn3hm2+S3cG3s=
X-Received: by 2002:a9d:5cc5:0:b0:676:92ca:f7f4 with SMTP id
 r5-20020a9d5cc5000000b0067692caf7f4mr3273285oti.55.1673193254613; Sun, 08 Jan
 2023 07:54:14 -0800 (PST)
MIME-Version: 1.0
References: <48dfc489-5c28-88bf-f714-a3c4b4cf840f@gmail.com>
In-Reply-To: <48dfc489-5c28-88bf-f714-a3c4b4cf840f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Jan 2023 07:53:48 -0800
Message-ID: <CAMKF1sp3jzrMqz1n_nTZ=C8Py9sBwWV_e9btzp1FrStJBYNNrg@mail.gmail.com>
Subject: Re: Kirkstone merge request: Jan 8th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100476

merged thanks.

On Sun, Jan 8, 2023 at 7:32 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit a8055484f2829e8dfd03d5c8520b2c611aa7ebd2:
>
>    dool: Add patch to fix rebuild (2022-12-11 16:18:53 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to a9c25bef8882a69fd35ea7dbac3d978ce440fe06:
>
>    mariadb: Upgrade to 10.7.7 (2023-01-04 11:46:45 -0500)
>
> ----------------------------------------------------------------
> Archana Polampalli (1):
>        Nodejs: Fixed python3 DeprecationWarning
>
> Mingli Yu (3):
>        php: Upgrade to 8.1.12
>        mariadb: not use qemu to run cross-compiled binaries
>        mariadb: Upgrade to 10.7.7
>
> Narpat Mali (1):
>        Fix collections.abc deprecation warning in downloadutils Warning
> appears as:
>
> Polampalli, Archana (1):
>        xfce4-settings: 4.16.2 -> 4.16.5
>
> Siddharth Doshi (1):
>        xterm : Fix CVE-2022-45063 code execution via OSC 50 input
> sequences] CVE-2022-45063
>
> Yogita Urade (1):
>        multipath-tools:fix CVE-2022-41973
>
>   .../{mariadb-native_10.7.4.bb => mariadb-native_10.7.7.bb} |   4 +-
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 23 +-
>   .../0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch    | 69 +++
>   meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch         | 34 ++
>   meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch        | 416
> ---------------
>   .../recipes-dbs/mysql/{mariadb_10.7.4.bb => mariadb_10.7.7.bb} |   6 +-
>   .../nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch     | 35 ++
>   meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb               | 3 +-
>   meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} |   2 +-
>   meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch    | 782
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-graphics/xorg-app/xterm_372.bb                  | 1 +
>   .../files/0001-multipath-tools-use-run-instead-of-dev-shm.patch | 159
> ++++++
>   .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 4 +
>   ...1-Fix-collections.abc-deprecation-warning-in-downloadu.patch | 41 ++
>   .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb  | 5 +-
>   .../{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb} |   2 +-
>   16 files changed, 1147 insertions(+), 439 deletions(-)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.4.bb =>
> mariadb-native_10.7.7.bb} (93%)
>   create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>   delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.4.bb =>
> mariadb_10.7.7.bb} (81%)
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch
>   rename meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} (99%)
>   create mode 100644
> meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
>   create mode 100644
> meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
>   rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb
> => xfce4-settings_4.16.5.bb} (93%)
>

