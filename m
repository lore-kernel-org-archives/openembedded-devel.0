Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4263EC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 15:55:58 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.21080.1707407751928916155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 07:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QTwzK7cU;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-218642337c9so1140995fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 07:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707407751; x=1708012551; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQjupBUJetlRVCfx94eiP8hrYKxGabD0P+rbhcdtl5k=;
        b=QTwzK7cU0PTclOJ4LepwgZDBLWkxajXw0plHKAVGVN7gFu4kEV7bI5ninj6OVSkLqN
         54FWVaVh1LQjx/pxThszW87XzG/722aF8coubjgn7okboK4SksCeV5+vkp5jgukYKDFE
         TMIrLQWznssYl3L9empxzO0aGKbFlWm2piSzfl1V1ttXkK0LGWH1LZhCwZFqhdBS43BQ
         4lBGx0JI96A8dXlyjWVg1/ExGSmMrs1VfvDYu/svIWllEYFzWblPRN5tmoFkW7WTkAHA
         C9VmUpYBD4AOhOXkAsMmjRGvvFgpVZvOG67Cou0FkPXI5Rcei9UXEPBl70294LfusT2q
         gYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407751; x=1708012551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQjupBUJetlRVCfx94eiP8hrYKxGabD0P+rbhcdtl5k=;
        b=rqqNrVetc49IhoV3oxRjEaquYaevRpKfQdzksuQuy8YkxvWo4iW8o3Uz6HMfB7dgkb
         ScPtF4mK5sdgONhUUHbcd3J8yhNa2eo1ekfUDtGrML0rdwBLAYR+3XHR4ZH4NNev3v/n
         KTJ506MeLTdd+bnaJesYpF0GxbRF7xIKjDWB+v5vlI/eJLFTuvEQdOPLMqgqbSPWURe/
         mtv1C43Ja0JvP3RZl+cTjKnSjBcO6W6luhEmIvNNmiDrZCpN14F7NpcfIKCB6CzdnD3t
         TsyLRXM1Yu3TBO9Gq9T7efzx2yGh4aOiUAvzVm1qRc/PryS0MIQ+UJf2SyKKmvwT4Zug
         cPyA==
X-Gm-Message-State: AOJu0YyfHxmaqgHTp/KnD/GaOH+nMUK3xnzTwSF6CBPS2M/BJ6/QXBdW
	SA8G7979ZToARCCLzGMAVrxK2zCtes7S5coQwKOSPr6g5C81EiAn06mrmsZypA9VBVAfh1oyAhI
	cm65VYiRkJh3Sl/AcUvOgYfzAU2g=
X-Google-Smtp-Source: AGHT+IHc1+K/okJ8jOXTlMrpt3e1FyhpO0ySHUMhoegYJCdqsDBHRkfSoG8HHWW+GqGCctE8JMdAWK7viqoXnFO1vNA=
X-Received: by 2002:a05:6870:c1d3:b0:219:3054:3ea2 with SMTP id
 i19-20020a056870c1d300b0021930543ea2mr11215327oad.0.1707407751078; Thu, 08
 Feb 2024 07:55:51 -0800 (PST)
MIME-Version: 1.0
References: <b22274d1-47d1-483f-8c4b-76dd9e5354ad@gmail.com>
In-Reply-To: <b22274d1-47d1-483f-8c4b-76dd9e5354ad@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Feb 2024 07:55:24 -0800
Message-ID: <CAMKF1sos7OQPKU1LuS=wcOW4JiRy+NHvr-8kFone_JYoLmZL+w@mail.gmail.com>
Subject: Re: kirkstone merge request: Feb 8th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 15:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108671

Merged.

thanks Armin.

On Thu, Feb 8, 2024 at 5:15=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> Changes missed on mailing list.
>
> The following changes since commit ce9c0d76171ce9d07e4bcb702b750416b26556=
2a:
>
>    strongswan: upgrade 5.9.12 -> 5.9.13 (2024-02-05 07:37:06 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 8609de00952d65bb813a48c535c937324efeb18a:
>
>    Revert "libcroco: Add fix for CVE-2020-12825" (2024-02-07 18:41:41 -05=
00)
>
> ----------------------------------------------------------------
> Archana Polampalli (2):
>        samba: fix CVE-2018-14628
>        samba: fix CVE-2023-0922
>
> Ashish Sharma (1):
>        postfix: Backport fix for CVE-2023-51764
>
> Changqing Li (1):
>        linuxptp: fix do_compile error
>
> Hitendra Prajapati (1):
>        wireshark: fix CVE-2024-0208 GVCP dissector crash
>
> Joao Marcos Costa (1):
>        xscreensaver: Add osuosl backup MIRROR
>
> Jose Quaresma (1):
>        layer.conf: Add libdevmapper-native PREFERRED_RPROVIDER
>
> Li Wang (1):
>        radvd: add '--shell /sbin/nologin' to /etc/passwd
>
> Martin Jansa (1):
>        Revert "libcroco: Add fix for CVE-2020-12825"
>
> Narpat Mali (1):
>        python3-aiohttp: upgrade 3.8.5 -> 3.8.6
>
> Vijay Anusuri (3):
>        libssh: Backport fix for CVE-2023-48795
>        wireshark: Fix for CVE-2023-4511
>        squid: backport Debian patch for CVE-2023-46728 and CVE-2023-46846
>
> Vivek Kumbhar (1):
>        squid: Backport fix for CVE-2023-49285
>
> Yogita Urade (1):
>        zabbix: fix CVE-2023-32726 and CVE-2023-32727
>
> Zahir Hussain (1):
>        p7zip: fix CVE-2018-5996 & CVE-2016-9296
>
> virendra thakur (2):
>        opensc: Fix CVE-2023-40660
>        opensc: Fix CVE-2023-40661
>
>   .../recipes-connectivity/samba/samba/CVE-2018-14628-0001.patch  | 147 +=
+++
>   .../recipes-connectivity/samba/samba/CVE-2018-14628-0002.patch  | 72 ++
>   .../recipes-connectivity/samba/samba/CVE-2018-14628-0003.patch  | 106 +=
++
>   .../recipes-connectivity/samba/samba/CVE-2018-14628-0004.patch  | 64 ++
>   .../recipes-connectivity/samba/samba/CVE-2018-14628-0005.patch  | 98 ++=
+
>   .../recipes-connectivity/samba/samba/CVE-2018-14628-0006.patch  | 51 ++
>   .../recipes-connectivity/samba/samba/CVE-2023-0922.patch        | 111 +=
++
>   meta-networking/recipes-connectivity/samba/samba_4.14.14.bb |    7 +
>   .../recipes-daemons/postfix/files/CVE-2023-51764-1.patch        | 377
> +++++++++
>   .../recipes-daemons/postfix/files/CVE-2023-51764-2.patch        | 978
> +++++++++++++++++++++++
>   meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb |    2 +
>   meta-networking/recipes-daemons/radvd/radvd.inc |    2 +-
>   .../recipes-daemons/squid/files/CVE-2023-46728.patch            | 608
> ++++++++++++++
>   .../recipes-daemons/squid/files/CVE-2023-46846-pre1.patch       | 1154
> +++++++++++++++++++++++++++
>   .../recipes-daemons/squid/files/CVE-2023-46846.patch            | 169 +=
+++
>   .../recipes-daemons/squid/files/CVE-2023-49285.patch            | 37 +
>   meta-networking/recipes-daemons/squid/squid_4.15.bb |    4 +
>   .../recipes-support/wireshark/files/CVE-2023-4511.patch         | 81 ++
>   .../recipes-support/wireshark/files/CVE-2024-0208.patch         | 42 +
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb |    2 +
>   meta-oe/conf/layer.conf |    1 +
>   ...1-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch | 42 +
>   meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb |    1 +
>   meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32726.patch | 160 +=
+++
>   .../zabbix/zabbix/CVE-2023-32727_0001.patch                     | 193
> +++++
>   .../zabbix/zabbix/CVE-2023-32727_0002.patch                     | 49 ++
>   meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb |    3 +
>   meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch        | 30 +
>   meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch        | 228
> ++++++
>   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |    2 +
>   meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb |    2 +
>   meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch    | 385
> +++++++++
>   meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch    | 126 +=
++
>   meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch    | 47 ++
>   meta-oe/recipes-support/libssh/libssh_0.8.9.bb |    3 +
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch      | 55 ++
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch    | 47 ++
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch    | 32 +
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch    | 31 +
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch    | 28 +
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch    | 30 +
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch    | 30 +
>   meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch    | 40 +
>   meta-oe/recipes-support/opensc/opensc_0.22.0.bb |    8 +
>   .../{python3-aiohttp_3.8.5.bb =3D> python3-aiohttp_3.8.6.bb} |    2 +-
>   meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch     | 190
> -----
>   meta/recipes-support/libcroco/libcroco_0.6.13.bb                | 22 -
>   47 files changed, 5685 insertions(+), 214 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0001.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0002.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0003.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0004.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0005.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0006.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-0922.patch
>   create mode 100644
> meta-networking/recipes-daemons/postfix/files/CVE-2023-51764-1.patch
>   create mode 100644
> meta-networking/recipes-daemons/postfix/files/CVE-2023-51764-2.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch
>   create mode 100644
> meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditio=
nal-assignment-for-KBUILD_OUTPU.patch
>   create mode 100644
> meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32726.patch
>   create mode 100644
> meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0001.patch
>   create mode 100644
> meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0002.patch
>   create mode 100644
> meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
>   create mode 100644
> meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch
>   rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.5.bb
> =3D> python3-aiohttp_3.8.6.bb} (89%)
>   delete mode 100644
> meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
>   delete mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb
>

