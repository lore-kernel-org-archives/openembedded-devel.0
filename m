Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6708C43334
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 14:35:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.16226.1658068539053834969
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 07:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LRO1UNRZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id r21so6414423qtn.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0HzXPxTDvNJZbQ4o72dNEpQyq7mMmHBcHi2OS3FBrJs=;
        b=LRO1UNRZISNWLV+8/kgQBTbe8PlKNFbaVbRa538ZWTJ1PopfooBFvCutCOsoFpy54d
         c0cddVEU7shx8LZE25Cij+6EPBODb+d522o0fKCe3zbCDgjXDxCarUL4X52RE2MW/Gf3
         mRDdiU6/ptIXC3s/z4b7ruxQJn1aD9g6GN83Be3ye08iQH1PgYRsbiJQhC4LD8xdfwFq
         7oN7StT86aImZp2rpU9nuJdlRjrHFoP+BH3gKRf6Yict9NcweTgJPY4gPdOl+/MxuWEz
         MSup3QXixDDed69G2uORMSISOLTS61/I2DTbBU7D4gx55cgZA7Wm1p7Kl1rqQq4rfhyt
         JZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0HzXPxTDvNJZbQ4o72dNEpQyq7mMmHBcHi2OS3FBrJs=;
        b=yWQ/JPJLX0EjhY5EwHr2vMjK1N5RTPX2L+wDpt0aLxSaGTvbccx78TrSpDBeD/Y4uC
         Gulq52sg/xlB+gY+v2feZkn3iJ5Zk/gNuN/IvP+Qq4PVhcGtnSRlVuNjNjVetxZdKo7Q
         v6VY1ESHY0UpFEHASOsdYQ7MIjG3yRmrtmnLHULIrg1BxEalofG280WOvZCzIG9fHhKR
         +tBElz8+X30PpKgdogudua5hsE1B2tZsE4dO7QJ+OH6ag8YHuUPb0mX5sKl3aFDGq8vS
         PqfHiSYec/27K7NcC1nDHMn9xe3gcMSavkam0W816FC8CGjh8jjfMoKvvDRDM+EbEbGR
         u8VQ==
X-Gm-Message-State: AJIora/PS+6Psl1kEIdkOhy0BVi7jmgi7Kt04xB2mUbcl2coTbZKyU06
	cGTxaFSzUZ5u1Qoi7BHIWBAfKf8driffC0fZ7ONQEJc7mDM=
X-Google-Smtp-Source: 
 AGRyM1u4rVumXwLeKNBEOlt20zweqx+IYtabIekEUnXobn6XM5RZtxtt/bzvsNdMLTtJDTeOZacaZVsYO4j0RdrQUJE=
X-Received: by 2002:a05:622a:13ce:b0:31a:b4ce:1679 with SMTP id
 p14-20020a05622a13ce00b0031ab4ce1679mr18590356qtk.330.1658068538044; Sun, 17
 Jul 2022 07:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <c4ee7cd7-3c54-a832-ec0d-2603e8f4ba12@gmail.com>
In-Reply-To: <c4ee7cd7-3c54-a832-ec0d-2603e8f4ba12@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Jul 2022 10:35:11 -0400
Message-ID: 
 <CAMKF1spc7TjZBjmWdNW=Li2pujikkhUHSc3=2ycZkBsbsT5KNg@mail.gmail.com>
Subject: Re: [dunfell] merge request: July 16th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Jul 2022 14:35:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97858

thanks Armin. Merged.

On Sat, Jul 16, 2022 at 4:02 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit deee226017877d51188e0a46f9e6b93c10ffbb34:
>
>    tcpdump: Add fix for CVE-2018-16301 (2022-05-25 19:34:39 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 52cee67833d1975a5bd52e4556c4cd312425a017:
>
>    ntfs-3g-ntfsprogs: upgrade to 2021.8.22 (2022-07-16 12:56:17 -0700)
>
> ----------------------------------------------------------------
> Adrian Fiergolski (1):
>        python3-matplotlib: add missing dependency
>
> Akash Hadke (2):
>        iperf: Set CVE_PRODUCT to "iperf_project:iperf"
>        ntfs-3g-ntfsprogs: Set CVE_PRODUCT to "tuxera:ntfs-3g"
>
> Armin Kuster (1):
>        mariadb: update to 10.4.25
>
> Chen Qi (1):
>        ntfs-3g-ntfsprogs: upgrade to 2021.8.22
>
> Hitendra Prajapati (3):
>        openldap: CVE-2022-29155 OpenLDAP SQL injection
>        xterm: CVE-2022-24130 Buffer overflow in set_sixel in
> graphics_sixel.c
>        cyrus-sasl: CVE-2022-24407 failure to properly escape SQL input
> allows an attacker to execute arbitrary SQL commands
>
> Jeroen Hofstee (1):
>        php: move to version v7.4.28
>
> Martin Jansa (3):
>        tesseract-lang: switch from master branch to main
>        leveldb: switch from master branch to main
>        grpc: switch from master branch to main for upb
>
> Mingli Yu (1):
>        bridge-utils: Switch to use the main branch
>
>   ...3g-ntfsprogs_2017.3.23.bb => ntfs-3g-ntfsprogs_2021.8.22.bb} |   6 +-
>   .../recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch  | 83
> +++++++++
>   meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 1 +
>   .../recipes-support/bridge-utils/bridge-utils_1.6.bb            | 2 +-
>   meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb               | 2 +
>   meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb                  | 2 +
>   meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb                     | 2 +-
>   .../{mariadb-native_10.4.24.bb => mariadb-native_10.4.25.bb} |   0
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 4 +-
>   .../mysql/{mariadb_10.4.24.bb => mariadb_10.4.25.bb} |   0
>   meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb                    | 2 +-
>   meta-oe/recipes-devtools/php/{php_7.4.21.bb => php_7.4.28.bb} |   2 +-
>   meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb      | 2 +-
>   meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-24130.patch    | 84
> +++++++++
>   meta-oe/recipes-graphics/xorg-app/xterm_353.bb                  | 2 +-
>   meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch  | 277
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-support/openldap/openldap_2.4.57.bb             | 2 +-
>   meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb | 1 +
>   18 files changed, 463 insertions(+), 11 deletions(-)
>   rename
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2017.3.23.bb
> => ntfs-3g-ntfsprogs_2021.8.22.bb} (91%)
>   create mode 100644
> meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.24.bb =>
> mariadb-native_10.4.25.bb} (100%)
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.24.bb =>
> mariadb_10.4.25.bb} (100%)
>   rename meta-oe/recipes-devtools/php/{php_7.4.21.bb => php_7.4.28.bb} (99%)
>   create mode 100644
> meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-24130.patch
>   create mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
>

