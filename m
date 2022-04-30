Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790ACC433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 02:32:14 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.18429.1651285924045461251
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 19:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bKjahVvj;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id t16so7061724qtr.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 19:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=inSxFCqbmEAb8M7ecw/xOuw3YQSeA4GmzxQp0OZYPAo=;
        b=bKjahVvjsCyslvtBBtYloL/uZ1Xl7IrVJZDu2brFWUd3q5XdVMX1V2Uikoa4fDrZpA
         jVj5L40U0sHyfGI8t4gVI+xMxygp9j8gba6mGaOm1hXQpxqzXPFtLEymmUmmai2+kZbY
         wdK8I6HOg0Gnqd5/bm0xXKEwqqkH55V770j6qMjqj9sM4aT7LUGGeiJcEvDHUpR98fyM
         AHOK23ryJrp9ysXhoRXPTTTkUnTxwELeWQ5FFdOqnByPGj7/4IcrKWW/+NneskZqf0er
         F0EA76BmYm3MDhb0XZdNKEwnk/C9gXz8tNdHqJgt0McE5LJ/VaICyyEpwQYWV0KTegCW
         ilew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=inSxFCqbmEAb8M7ecw/xOuw3YQSeA4GmzxQp0OZYPAo=;
        b=yQDS0qaJEmWzXWDHCGH1rqxZv2xUVmjYTZ09m83OZpIaceshjM8FvfVvOTjg3FqqWd
         Cq4BZ/enw2sMRniui3QWd9J7qcNOCfWgoFn1p12W2V1ujB9zE3kIMPnJXvxahqzv7Hdm
         fAB5GcxZceADFSWLYp5k1t0A4ur4M08y5OTUbmVhUmZgJAgRCkE9M37+LjPS+Yry8Sww
         foDmuNmsYaI+wYRSlyy/PqbOkxY4+7030ivFCxt+QGNnLeX4jkVlGU3MZtOVGnF4zfX3
         FXildkxx+91vC9Xq/zabIVZxFwPXxcmFb7uYLPl71AdGh7deV81Zd4Y3djSCMRTKse5K
         6BTQ==
X-Gm-Message-State: AOAM531OOhu4DRw+MyYB7Ai320KNVljfDCmqkwfJz9adYnjxrzcBA/52
	1iJs31Om7hsKQFJa/eH8rZdmLSXeha8XogkCuvA=
X-Google-Smtp-Source: 
 ABdhPJwD+9OJXVnMbsbl5+57NDQyu3fPmghi+aniAEzcDEOaSIkrwC0rmzBFbTuG1wBrUGNBB78cWqr7pPIhQ6+02PQ=
X-Received: by 2002:ac8:5743:0:b0:2e1:cee6:f15 with SMTP id
 3-20020ac85743000000b002e1cee60f15mr2005743qtx.634.1651285923166; Fri, 29 Apr
 2022 19:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <4a5d671e-9e0b-a7cf-ad7d-96892b991de3@gmail.com>
In-Reply-To: <4a5d671e-9e0b-a7cf-ad7d-96892b991de3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Apr 2022 19:31:37 -0700
Message-ID: 
 <CAMKF1sojWPU+cUyPc=b_1=PG+MfvDZFF3NZ7o3R7yc0+wvda6g@mail.gmail.com>
Subject: Re: hardknott merge request: April 29th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 02:32:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96863

merged thanks.

On Fri, Apr 29, 2022 at 6:46 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit a970ee45c2335c37041ad1658323481874bb4f0e:
>
>    zabbix: Fix sereval CVEs (2022-04-16 09:53:03 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to 786d3aa313e31a718acc9611ba3adb60573ec458:
>
>    fix renamed patch (2022-04-29 18:43:20 -0700)
>
> ----------------------------------------------------------------
> Khem Raj (2):
>        abseil-cpp: Fix build with glibc 2.34
>        postgresql: Fix build on riscv
>
> kueken (1):
>        fix renamed patch
>
>   meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch     | 38
> +++++++++++++
>   meta-oe/recipes-dbs/postgresql/postgresql_13.5.bb               | 1 +
>   .../abseil-cpp/0001-Export-of-internal-Abseil-changes.patch     | 82
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb           | 1 +
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb          | 2 +-
>   5 files changed, 123 insertions(+), 1 deletion(-)
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
>   create mode 100644
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Abseil-changes.patch
>

