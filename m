Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184E0C001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 14:22:04 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.20521.1689344523536951806
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jul 2023 07:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Rf048Rpn;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6b9aadde448so1618898a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689344523; x=1691936523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3y/PME52qwED25enRwvBRU/nUODm4480FFDHClysJc=;
        b=Rf048RpnVEIKHawOcD6x62GqoKrYwaH2xeM29rNeQKcqGeF+tENG3nsnv0NahSRdn7
         CIjj1Fk7qpN3jPGZ5iMaU1PevJaXFt3gSPOoJyc+DeghB9VkpbSYXQduhiDpF0tTwp4K
         +1i2rN9OZhezWvDRIlDYhumtZoqSMfykAOPjNJG2RoY+O2+PNY48T19dLknBv/yGtNk+
         rF0MQv5fH7m5iNP8Q3X3/DS9an3o6DkxFISmEbIVIrFwhFvSX8GXlflAHHCkx4FYtp7h
         /XZfC3OMPvnAbzfRg+nDxz5BedHqqpmsToVY7gSSviwCQFIsw+m8/K8eIJbVeDOvn/f9
         CADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689344523; x=1691936523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3y/PME52qwED25enRwvBRU/nUODm4480FFDHClysJc=;
        b=fX/Ohv6bQX079/SRcG/x6ulWciDKDgdGelkxrboRipo9h6v9mLkb40h7WrcTyYQNXV
         u8wp+oMpkMQMMUaPwXXqPqpIFSKFfm4VHNXdNkCPc2Pti1aQpx6wM86xyxE0Zp6Etug1
         UEJU8dTkCNRr4zMSNRmC+Zn0gvWovPxXX+569+qTDkX1+jfk5X250bpr2ZI0jMAEggw/
         5oyYRHb4t38K2Kd+JmDUwnCcfgB4+nVBW7uysZ/xT35LGpqT/QpApfz5PCr3lUn0gWDA
         f12jkJBK2hb4mvPl1gUNxGGi+QBBb0MFkU27clS/YG4gXgNQ6aFnEMyU3wkzdjBpUVkb
         lZ+A==
X-Gm-Message-State: ABy/qLZfLuBkJKjOuJfX+rIjXBoAPj1DToG7VbJr459QKneDKhCFIXdj
	jtIiKRqsrn+Etcaymw6/uPX4WrCK/rrzcIAyV+I=
X-Google-Smtp-Source: APBJJlF9qOjeDkxV92olRSHpKqgmxodsas/i1+u1j8oWhYiDk2L3PxclyiioUll0lWOlgdeoSG7b+jsUigm2N1y38IE=
X-Received: by 2002:a05:6870:e616:b0:1b7:3364:6269 with SMTP id
 q22-20020a056870e61600b001b733646269mr6288713oag.32.1689344522563; Fri, 14
 Jul 2023 07:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <68215175-21a2-bd4e-fd1d-af4711dc4ad6@gmail.com>
In-Reply-To: <68215175-21a2-bd4e-fd1d-af4711dc4ad6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jul 2023 07:21:36 -0700
Message-ID: <CAMKF1sohReSkghN6bCagu7Su01QbXSR_-abshUCANE5RPLOm8Q@mail.gmail.com>
Subject: Re: dunfell merge request: July 14th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 14:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103867

merged thanks Armin

On Fri, Jul 14, 2023 at 4:16=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 6334241447e461f849035c47f071fa4a2125fe=
e1:
>
>    c-ares: CVE-2023-31147 Insufficient randomness in generation of DNS
> query IDs (2023-06-23 06:58:18 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to b5282ece919f016d91a1043769676efb02b4f0fb:
>
>    openldap: fix CVE-2021-27212 Assertion failure in slapd (2023-07-14
> 07:08:54 -0400)
>
> ----------------------------------------------------------------
> Hitendra Prajapati (7):
>        wireshark: Fix Multiple CVEs
>        wireshark: Fix CVE-2023-0667 & CVE-2023-0668
>        yajl: CVE-2023-33460 memory leak in yajl_tree_parse function
>        ntp: backport patch for 5 CVEs CVE-2023-26551/2/3/4/5
>        multipath-tools: fix CVE-2022-41974
>        quagga: CVE-2021-44038 unsafe chown/chmod operations may lead to
> privileges escalation
>        openldap: fix CVE-2021-27212 Assertion failure in slapd
>
> Vijay Anusuri (1):
>        libssh: CVE-2020-16135 NULL pointer dereference in sftpserver.c
> if ssh_buffer_new returns NULL
>
> virendra thakur (1):
>        c-ares: whitelist CVE-2023-31124
>
> vkumbhar (1):
>        postgresql: fix CVE-2023-2454 & CVE-2023-2455
>
>   .../recipes-protocols/quagga/files/CVE-2021-44038.patch         | 117
> ++++++++++
>   meta-networking/recipes-protocols/quagga/quagga.inc             | 2 +-
>   meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch    | 340
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb             | 10 +-
>   .../recipes-support/wireshark/files/CVE-2023-0667-pre1.patch    | 153
> +++++++++++++
>   .../recipes-support/wireshark/files/CVE-2023-0667.patch         | 66
> ++++++
>   .../recipes-support/wireshark/files/CVE-2023-0668.patch         | 33 ++=
+
>   .../recipes-support/wireshark/files/CVE-2023-2855.patch         | 117
> ++++++++++
>   .../recipes-support/wireshark/files/CVE-2023-2856.patch         | 68
> ++++++
>   .../recipes-support/wireshark/files/CVE-2023-2858.patch         | 94
> ++++++++
>   .../recipes-support/wireshark/files/CVE-2023-2952.patch         | 97
> ++++++++
>   meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb   | 11 +-
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch        | 235
> +++++++++++++++++++
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch        | 118
> ++++++++++
>   meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 2 +
>   meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch         | 29 ++=
+
>   meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                     | 4 +-
>   meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 4 +
>   meta-oe/recipes-support/libssh/files/CVE-2020-16135-1.patch     | 40 ++=
++
>   meta-oe/recipes-support/libssh/files/CVE-2020-16135-2.patch     | 42 ++=
++
>   meta-oe/recipes-support/libssh/files/CVE-2020-16135-3.patch     | 70
> ++++++
>   meta-oe/recipes-support/libssh/files/CVE-2020-16135-4.patch     | 34 ++=
+
>   meta-oe/recipes-support/libssh/libssh_0.8.9.bb                  | 8 +-
>   .../recipes-support/multipath-tools/files/CVE-2022-41974.patch  | 162
> +++++++++++++
>   .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 1 +
>   meta-oe/recipes-support/openldap/openldap/CVE-2021-27212.patch  | 31 ++=
+
>   meta-oe/recipes-support/openldap/openldap_2.4.57.bb             | 1 +
>   27 files changed, 1883 insertions(+), 6 deletions(-)
>   create mode 100644
> meta-networking/recipes-protocols/quagga/files/CVE-2021-44038.patch
>   create mode 100644
> meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-0667-pre1.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
>   create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.pa=
tch
>   create mode 100644
> meta-oe/recipes-support/libssh/files/CVE-2020-16135-1.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/files/CVE-2020-16135-2.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/files/CVE-2020-16135-3.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/files/CVE-2020-16135-4.patch
>   create mode 100644
> meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch
>   create mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2021-27212.patch
>

