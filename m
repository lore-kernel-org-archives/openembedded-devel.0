Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3E5C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 17:24:23 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.2058.1644254662574942595
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ExZCyuLE;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id s1so12480567qtw.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhfaxHCYQArQworEXg5pj3Vsx8ff+ChoBlqIMJLupJg=;
        b=ExZCyuLECXMf1DD2378g3N9KI6CEDAbAUXOMOjVv8wPJn8l0oBdSzf5uj9usb4wPys
         Tqst5dsO52zzCiosnPdlrXsqvi1xjM+JsgsGtYuME+SlF3yCemY+mXmpgx9UMV/t418o
         rLGEcrz9p8BlgPOfaSOOr5ZYETkTL3JofRjtPOkiDT8RtggNO/q3LjvcvMArae+G00Th
         MYyLf0WtmJPkhY+k+y/F1I2JP1nDxBb418GTV0+5myIOWHffuzC+Q9IHnkz6JAp1S4rG
         JzqYlUuET1Lt+9Z5lWyEallQK3tseVvBP3jNbP3FFPGO6194Mf8Dqpm9XVYNEIf49wTJ
         V6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhfaxHCYQArQworEXg5pj3Vsx8ff+ChoBlqIMJLupJg=;
        b=eIFjezoAl49zbDxZ5DFSsY8SN9IE21/epP1IaBl/o2eoR4V6NLHli7O933Tv5vsFNy
         Hep8+JUI3bBVDc/Eg+p184e/K12LHNvv++jG/fm22LceRJn0u3f3haOjS7wmnHtDxFy9
         vbODPQVdTg3on2GyJu+D5Ul8omYicv7EE9Ut1gkafFCzW2+sRPYmM+VgiLKkocTU9oeu
         Ghf5mp/du+n6U4uu/qbvHzAANG5D3vuHOZEWn6WUL1DHkM7vuzUIASlAIRecElvzqLk6
         1aVU37MEkb2smSx4n96ok1gpbG1Fa1ierJeH2G9VJfYqGzME2vnJrsu+Q2527RFZ20dj
         oUWg==
X-Gm-Message-State: AOAM530D8PrCmpHHHW3gVhtvBWW5WIDK2q8amEHusUKfNn4tMxGqwByp
	sAVByFbmpp9KV+81R9ugzbATzxiNZf1Q9rnCi8c=
X-Google-Smtp-Source: 
 ABdhPJwJa8b5HIUFZ/U0mAipp4rDk4Ei6gjOsyyT0oM+Yods72CrpqVzsH3GNR1jVhZ62wzSQ+ILG1wNOkXRpCet2Yc=
X-Received: by 2002:a05:622a:1111:: with SMTP id
 e17mr370782qty.229.1644254661609;
 Mon, 07 Feb 2022 09:24:21 -0800 (PST)
MIME-Version: 1.0
References: <a230b0c3-7c76-c084-97b5-04fbdb12f66c@gmail.com>
In-Reply-To: <a230b0c3-7c76-c084-97b5-04fbdb12f66c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2022 09:23:55 -0800
Message-ID: 
 <CAMKF1srRR3OUbWDQBC4MdcwhMk5CW+vsxO9B_FKDJPe1-Fhu+Q@mail.gmail.com>
Subject: Re: hardknott merge request: Feb 6th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 17:24:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95246

On Sun, Feb 6, 2022 at 10:50 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit f859d299e655d92e1183ccc24a4f96c122a4ac41:
>
>    postfix: upgrade 3.4.12 -> 3.4.23 (2021-12-31 10:17:53 -0800)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded 23598caeaf
>
> for you to fetch changes up to 23598caeafce0af0dde8d1339cf5edff021f6823:
>
>    python3-pillow: fix CVE-2022-22815, 22816, 22817 (2022-01-30 15:13:01
> -0800)
>
> ----------------------------------------------------------------
> Armin Kuster (2):
>        wireshark: update to latest stable 3.4.11
>        dbus-cxx: fix fetch error.
>
> Chen Qi (1):
>        udisks2: upgrade from 2.9.2 to 2.9.4
>
> Daniel Klauer (1):
>        spidev-test: Update common-licenses reference
>
> He Zhe (1):
>        protobuf: Fix static init fiasco on 3.15.2
>
> Leif Middelschulte (1):
>        dbus-daemon-proxy: add missing `return` statement
>
> Mingli Yu (2):
>        plymouth: switch to KillMode=mixed
>        mariadb: Upgrade to 10.5.13
>
> Robert Joslyn (1):
>        postgresql: Update to 13.5
>
> Trevor Gamblin (1):
>        python3-pillow: fix CVE-2022-22815, 22816, 22817
>
> wangmy (1):
>        apache2: upgrade 2.4.51 -> 2.4.52
>
>   .../recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch |  15 ++---
>   meta-networking/recipes-support/wireshark/{wireshark_3.4.8.bb =>
> wireshark_3.4.11.bb}  |   2 +-
>   meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb |   2 +-
>   .../dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch |   2 +-
>   meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch |  43 ++++++++++++++
>   meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb |   1 +
>   meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.12.bb =>
> mariadb-native_10.5.13.bb}     |   0
>   meta-oe/recipes-dbs/mysql/mariadb.inc |   3 +-
>   meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch |  82
> --------------------------
>   meta-oe/recipes-dbs/mysql/{mariadb_10.5.12.bb =>
> mariadb_10.5.13.bb}                   |   0
>   meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
> |  10 ++--
>   .../postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch |   2 +-
>   meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch | 116
> -------------------------------------
>   meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch | 131
> ------------------------------------------
>   meta-oe/recipes-dbs/postgresql/{postgresql_13.4.bb =>
> postgresql_13.5.bb}              |   4 +-
>   .../protobuf/protobuf/0001-Lower-init-prio-for-extension-attributes.patch |  81 ++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb |   1 +
>   meta-oe/recipes-kernel/spidev-test/spidev-test.bb |   2 +-
>   meta-oe/recipes-support/udisks/{udisks2_2.9.2.bb =>
> udisks2_2.9.4.bb}                  |   4 +-
>   .../python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch |  77 +++++++++++++++++++++++++
>   .../recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch |  45 +++++++++++++++
>   .../python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch |  60 +++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb |   3 +
>   meta-webserver/recipes-httpd/apache2/{apache2_2.4.51.bb =>
> apache2_2.4.52.bb}          |   2 +-
>   24 files changed, 333 insertions(+), 355 deletions(-)
>   rename meta-networking/recipes-support/wireshark/{wireshark_3.4.8.bb
> => wireshark_3.4.11.bb} (97%)
>   create mode 100644
> meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.12.bb =>
> mariadb-native_10.5.13.bb} (100%)
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.12.bb =>
> mariadb_10.5.13.bb} (100%)
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_13.4.bb =>
> postgresql_13.5.bb} (67%)
>   create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-init-prio-for-extension-attributes.patch
>   rename meta-oe/recipes-support/udisks/{udisks2_2.9.2.bb =>
> udisks2_2.9.4.bb} (89%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.51.bb =>
> apache2_2.4.52.bb} (99%)
>

merged thanks.

