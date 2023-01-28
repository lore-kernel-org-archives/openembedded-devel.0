Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B347CC38142
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 23:58:07 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.7149.1674950286144568019
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Jan 2023 15:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kMrH5WlL;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1636eae256cso6734233fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Jan 2023 15:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dSJ33USVoJ6b0bA2NoqK4k9fxOAriUz4B6woravYxTI=;
        b=kMrH5WlL6/9TEUWPlgJpWzdocqFCt24wFja3NuKYgntGidQr2wNLrB+PY308eQEcrk
         KTy4lQjhSpE8s2juIGTXW4nOmXzOUH638ZVLI2c3Gc4oCBdfzt/Bf0A6eU9dPwrmgI7R
         qMJI2U+qf0qdal8PNtiCye/iSItiZ01PUNKPIkSHy30y2sxCOiy3dLqhsMu0HmF9gzql
         wUU+4xq02PqxjizsEFIuKCFd7GKF76DdP76fmD2vDDFM8Q+zEuym+HPIJ3v7ERym8Uph
         pvoX8xU/skuvPxeCQgyMzIprT5myvHpGDGXJ/VxyGtjPTEAhKfwI7n1KljoMGfFYTjAi
         Uu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSJ33USVoJ6b0bA2NoqK4k9fxOAriUz4B6woravYxTI=;
        b=wwd4SvPSiu24GIk/uOaV1Gm9WsN2YJw7kKzfN/xTlB9HQhF6FJMiCK7zVAQa4iUvhM
         B6Xr8saHMkG7uTxVAsH6jLDO9co3oSPRLnO7A5UBI0zjELaj+H+oF7jf8dkZ6ZvSUc+o
         JZR3Ny42DcQKEjI61KdggFn0o76HR9R3uJrNmOnjAHkGKlxEvsDJA4D+UywLLHddk/WB
         T2onrZC55quj66FYsWQdpdGnR2L0AlLfiGVlkZAS7PVLdyklUfwQxjsR2lVie66exGcX
         cFgrhQ8VxaBW4pTJS42N9B7Y+dhu/2InNRn+rE/u0bi8F+HzBUh782hp+C5EXtPkQCTH
         HqFQ==
X-Gm-Message-State: AO0yUKWYpPrAcRUyHeh0EcVzdbHQUgkZWDqx/w/HbNoNd1QxR6GKA/A0
	rDG9vhjzeFCDOrs83CKbB8ndS6dn3C/GtxXkfpc=
X-Google-Smtp-Source: AK7set+OAj7EnJ3jcduWxaWd36WVGEkywamjwDvV5YKpQY8YeQ+YBr9Yo9nj/X839z1zOT/k8wPETjb/H6L9Jtnis9s=
X-Received: by 2002:a05:6870:6488:b0:163:573b:3eca with SMTP id
 cz8-20020a056870648800b00163573b3ecamr865138oab.55.1674950285295; Sat, 28 Jan
 2023 15:58:05 -0800 (PST)
MIME-Version: 1.0
References: <e1cde7e4-9ddf-50b3-80a3-933aebdb3e34@gmail.com>
In-Reply-To: <e1cde7e4-9ddf-50b3-80a3-933aebdb3e34@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jan 2023 15:57:39 -0800
Message-ID: <CAMKF1sqzeiiN3Yhi02T3gQ0WigHNkOh-KXV_f-+SBotpJfpVtw@mail.gmail.com>
Subject: Re: Langdale merge request: Jan 28th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Jan 2023 23:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100828

merged thanks Armin.

On Sat, Jan 28, 2023 at 7:13 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit c354f92778c1d4bcd3680af7e0fb0d1414de2344:
>
>    chrony: Remove the libcap and nss PACKAGECONFIGs (2022-11-18 10:11:45
> -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded langdale-next
>
> for you to fetch changes up to f8cb46d803190bb02085c8a7d20957a71d32f311:
>
>    perfetto: Do not pass TUNE_CCARGS to native/host compiler (2023-01-23
> 10:15:33 -0500)
>
> ----------------------------------------------------------------
> Alexander Stein (1):
>        dool: Add patch to fix rebuild
>
> Archana Polampalli (1):
>        Nodejs - Upgrade to 16.18.1
>
> Armin Kuster (1):
>        Revert "waf-samba.bbclass: point PYTHON_CONFIG to target
> python3-config"
>
> Changqing Li (2):
>        redis: 7.0.5 -> 7.0.7
>        redis: 6.2.7 -> 6.2.8
>
> Chee Yang Lee (4):
>        zsh: Fix CVE-2021-45444
>        fwupd: Fix CVE-2022-3287
>        redis: Upgrade to 7.0.8
>        redis: Upgrade to 6.2.9
>
> Chen Pei (1):
>        botan: upgrade 2.19.2 -> 2.19.3
>
> Chen Qi (4):
>        xfce4-verve-plugin: fix do_configure faiure about missing libpcre
>        networkmanager: fix dhcpcd PACKAGECONFIG
>        networkmanager: install config files into correct place
>        networkmanager: fix /etc/resolv.conf handling
>
> Hermes Zhang (1):
>        kernel_add_regdb: Change the task order
>
> Kai Kang (2):
>        freeradius: fix multilib systemd service start failure
>        postfix: fix multilib conflict of sample-main.cf
>
> Khem Raj (10):
>        gnome-text-editor: Add missing libpcre build time depenedency
>        ettercap: Add missing dependency on libpcre
>        imapfilter: Upgrade to 2.7.6
>        aufs-util: Fix build with large file support enabled systems
>        volume-key: Inherit python3targetconfig
>        audit: Inherit python3targetconfig
>        waf-samba.bbclass: point PYTHON_CONFIG to target python3-config
>        fontforge: Inherit python3targetconfig
>        sshpass: Use SPDX identified string for GPLv2
>        perfetto: Do not pass TUNE_CCARGS to native/host compiler
>
> Markus Volk (2):
>        blueman: add RDEPEND on python3-fcntl
>        perfetto: pass TUNE_CCARGS to use machine tune
>
> Martin Jansa (1):
>        nss: fix SRC_URI
>
> Mathieu Dubois-Briand (2):
>        nss: Add missing CVE product
>        nss: Whitelist CVEs related to libnssdbm
>
> Omkar Patil (1):
>        ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3
>
> Preeti Sachan (1):
>        fluidsynth: update SRC_URI to remove non-existing 2.2.x branch
>
> Samuli Piippo (1):
>        protobuf: stage protoc binary to sysroot
>
> Wang Mingyu (4):
>        audit: upgrade 3.0.8 -> 3.0.9
>        colord: upgrade 1.4.5 -> 1.4.6
>        smcroute: upgrade 2.5.5 -> 2.5.6
>        openwsman: upgrade 2.7.1 -> 2.7.2
>
> Yi Zhao (2):
>        ostree: fix selinux policy rebuild error on first deployment
>        strongswan: upgrade 5.9.8 -> 5.9.9
>
>   ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} |   2 +-
>   .../0001-libau-Do-not-build-LFS-version-of-readdir.patch        | 32 ++++
>   meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb       | 1 +
>   .../recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb   | 1 +
>   meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc    | 2 +-
>   meta-networking/classes/kernel_wireless_regdb.bbclass           | 2 +-
>   meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb   | 1 +
>   .../recipes-connectivity/freeradius/files/radiusd.service       | 3 +-
>   .../recipes-connectivity/freeradius/freeradius_3.0.21.bb        | 30 ++++
>   .../networkmanager/networkmanager_1.40.0.bb                     | 16 +-
>   meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb    | 2 +-
>   meta-networking/recipes-daemons/postfix/postfix.inc             | 2 +-
>   meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb    | 1 +
>   .../smcroute/{smcroute_2.5.5.bb => smcroute_2.5.6.bb} |   2 +-
>   .../strongswan/{strongswan_5.9.8.bb => strongswan_5.9.9.bb} |   2 +-
>   meta-oe/recipes-bsp/fwupd/fwupd/CVE-2022-3287.patch             | 218
> +++++++++++++++++++++++
>   meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb                        | 4 +-
>   .../recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb} |   2 +-
>   .../oe-npm-cache                                                | 0
>   ...oe-cache-native_16.14.bb => nodejs-oe-cache-native_16.18.bb} |   0
>   ...g-native-binaries.patch => 0001-Using-native-binaries.patch} |  40
> +++--
>   .../nodejs/0002-Install-both-binaries-and-use-libdir.patch      | 96
> ----------
>   .../nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch | 151
> ----------------
>   .../nodejs/{nodejs_16.14.2.bb => nodejs_16.18.1.bb} |   8 +-
>   meta-oe/recipes-devtools/perfetto/perfetto.bb                   | 25 +--
>   meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb            | 2 +
>   .../openwsman/{openwsman_2.7.1.bb => openwsman_2.7.2.bb} |   2 +-
>   ...1-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch | 44 +++++
>   meta-oe/recipes-extended/ostree/ostree_2022.5.bb                | 1 +
>   .../redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch   | 20 ++-
>   .../redis/redis/0006-Define-correct-gregs-for-RISCV32.patch     | 15 +-
>   .../recipes-extended/redis/{redis_6.2.7.bb => redis_6.2.9.bb} |   2 +-
>   .../recipes-extended/redis/{redis_7.0.5.bb => redis_7.0.8.bb} |   2 +-
>   meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb        | 2 +-
>   meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb        | 2 +-
>   .../recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb} |   4 +-
>   meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch           | 60
> +++++++
>   meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch           | 140
> +++++++++++++++
>   meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch           | 77
> ++++++++
>   meta-oe/recipes-shells/zsh/zsh_5.8.bb                           | 6 +-
>   meta-oe/recipes-support/colord/colord.inc                       | 4 +-
>   meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch | 261
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-support/dool/dool_1.1.0.bb                      | 1 +
>   .../imapfilter/{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb} |   8 +-
>   meta-oe/recipes-support/nss/nss_3.74.bb                         | 8 +-
>   .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb     | 1 +
>   46 files changed, 973 insertions(+), 332 deletions(-)
>   rename
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb
> => ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)
>   create mode 100644
> meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Do-not-build-LFS-version-of-readdir.patch
>   rename meta-networking/recipes-support/smcroute/{smcroute_2.5.5.bb =>
> smcroute_2.5.6.bb} (90%)
>   rename meta-networking/recipes-support/strongswan/{strongswan_5.9.8.bb
> => strongswan_5.9.9.bb} (99%)
>   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/CVE-2022-3287.patch
>   rename meta-oe/recipes-crypto/botan/{botan_2.19.2.bb =>
> botan_2.19.3.bb} (93%)
>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 =>
> nodejs-oe-cache-16.18}/oe-npm-cache (100%)
>   rename
> meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb =>
> nodejs-oe-cache-native_16.18.bb} (100%)
>   rename
> meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.patch
> => 0001-Using-native-binaries.patch} (70%)
>   delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
>   delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb =>
> nodejs_16.18.1.bb} (94%)
>   rename meta-oe/recipes-extended/openwsman/{openwsman_2.7.1.bb =>
> openwsman_2.7.2.bb} (98%)
>   create mode 100644
> meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
>   rename meta-oe/recipes-extended/redis/{redis_6.2.7.bb =>
> redis_6.2.9.bb} (96%)
>   rename meta-oe/recipes-extended/redis/{redis_7.0.5.bb =>
> redis_7.0.8.bb} (96%)
>   rename meta-oe/recipes-security/audit/{audit_3.0.8.bb =>
> audit_3.0.9.bb} (97%)
>   create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
>   create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
>   create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
>   create mode 100644
> meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
>   rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.5.bb =>
> imapfilter_2.7.6.bb} (60%)
>

