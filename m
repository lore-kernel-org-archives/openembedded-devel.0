Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6CBC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 17:20:41 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.19096.1676913638390167027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 09:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TCm0uul+;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id e21so1986413oie.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 09:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1bHAISG3MkaEUfnu8teb8KjNewiX/zEQZmcAGlcI/M=;
        b=TCm0uul+VEpNcOhytp4oCnfGd3hJvZnNG1XBkvTLZyiku3NfsY6j1sD1wxSWmPrtAu
         Wkwta6C6ecLidJky03o7go/03F+p3fa89YBiwkU9XuVak01g6IOEPRvDdziwhJ/OCmBp
         S69MTbNWeFWVLPWFYACyxw3lBTyzBqaI7ra8AoyK38LuyGoPaXeRAKIkmQ5BrDdbkLa+
         B6ZQh8zRTsXVCUD5gAw/1a4JLu2OgbP3eXAP2zsDRlcZty8lo6y4lZfX1iCfIY89WzuW
         +B9q0mrVhIo4jMTX9317Lb41sZPqNhKFIez+eg8HwMYZqasQOpaKIwXBI/eUgH+8Wdhi
         uc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1bHAISG3MkaEUfnu8teb8KjNewiX/zEQZmcAGlcI/M=;
        b=cxu1R1c8wh9nv944L3+SJu69HslxynoeW7zn1/VrM5Y4sVwvX25BSJQOE88MYCBVfD
         yfOB85cFu652w37iXAuYEJRZSM44aWvCArEGH9eECoea+HldRUWKYK+61A7YF191Hi75
         7oW/AQXZ7G50LRZS4/csLTRnNYTSrUYqrzoNeH0+h0BUWuwHHu8yhP44r5flOJ1Xweq8
         6P7iuEkX5qC9jHQYvPtfhxf6FYFES60GkWu16aAkiL280OUAxHhSqoSbjZn8v4mnqBB9
         zN9rR0d7QjuyON73GW79F+ZrdKMfWLKOhcpJmXk93s5rryag6MQy55hsU+LVE10yMR4J
         c79A==
X-Gm-Message-State: AO0yUKUintysRvg9Y7vqzXKKfUz8gKY099rKLPUQwqSkcRaiAsWHQe+C
	JuNgtoY1VF4VFKjztnwNeRFm4xlS364qEyMXk8Q=
X-Google-Smtp-Source: AK7set/0K8vXVuPh3h1tJoaC6kNh/qdDfh1GH3ay1PSa9aI+uSjEEOq+WiQeQYaGpV318lN+cjVSUgfLOZRUVAlT4tM=
X-Received: by 2002:a05:6808:1a0f:b0:374:3688:36f7 with SMTP id
 bk15-20020a0568081a0f00b00374368836f7mr960919oib.277.1676913637453; Mon, 20
 Feb 2023 09:20:37 -0800 (PST)
MIME-Version: 1.0
References: <d3b8c584-e930-e648-b390-3c08c9af59fe@gmail.com>
In-Reply-To: <d3b8c584-e930-e648-b390-3c08c9af59fe@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Feb 2023 09:20:11 -0800
Message-ID: <CAMKF1srmWMPp7HMZWCtgqTxnghfNx_+bQa9H5p=FeCPL8MRubQ@mail.gmail.com>
Subject: Re: kirkstone merge request: Feb 20th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 17:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101181

merged thanks Armin

On Mon, Feb 20, 2023 at 7:55 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 278ec081a64e6a7679d6def550101158126cd935:
>
>    nodejs: upgrade 16.18.1 -> 16.19.0 (2023-02-04 12:16:38 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 82c75b466e55d7dca7a2364986ecb704cf63d141:
>
>    phoronix-test-suite: Fix CVE-2022-40704 (2023-02-16 07:30:46 -0500)
>
> ----------------------------------------------------------------
> Gary Huband (1):
>        chrony: add pkgconfig class as pkg-config is explicitly searched for
>
> Joe Slater (1):
>        phoronix-test-suite: Fix CVE-2022-40704
>
> Randy MacLeod (2):
>        python3-pillow: add ptest support
>        python3-pillow: Add distutils, unixadmin for ptest
>
> Wang Mingyu (3):
>        python3-pillow: upgrade 9.2.0 -> 9.3.0
>        python3-pillow: upgrade 9.3.0 -> 9.4.0
>        apache2: upgrade 2.4.54 -> 2.4.55
>
> Xu Huan (1):
>        python3-pillow: upgrade 9.0.1 -> 9.1.1
>
> Yi Zhao (2):
>        freeradius: Security fixes for CVE-2022-41860 CVE-2022-41861
>        frr: Security fix for CVE-2022-42917
>
> zhengruoqin (1):
>        python3-pillow: upgrade 9.1.1 -> 9.2.0
>
>   .../recipes-connectivity/freeradius/files/CVE-2022-41860.patch  | 118
> ++++++++++++++++++++++++++++
>   .../recipes-connectivity/freeradius/files/CVE-2022-41861.patch  | 53
> +++++++++++++
>   .../recipes-connectivity/freeradius/freeradius_3.0.21.bb        | 2 +
>   meta-networking/recipes-protocols/frr/frr/CVE-2022-42917.patch  | 36
> +++++++++
>   meta-networking/recipes-protocols/frr/frr/frr.pam               | 3 +-
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
>   meta-networking/recipes-support/chrony/chrony_4.2.bb            | 2 +-
>   .../phoronix-test-suite/files/CVE-2022-40704.patch              | 46
> +++++++++++
>   .../phoronix-test-suite/phoronix-test-suite_10.8.2.bb           | 6 +-
>   meta-python/recipes-devtools/python/python3-pillow/run-ptest    | 3 +
>   .../python/{python3-pillow_9.0.1.bb => python3-pillow_9.4.0.bb} |  32
> ++++++--
>   .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} |   2 +-
>   12 files changed, 295 insertions(+), 9 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
>   create mode 100644
> meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2022-42917.patch
>   create mode 100644
> meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/run-ptest
>   rename meta-python/recipes-devtools/python/{python3-pillow_9.0.1.bb =>
> python3-pillow_9.4.0.bb} (52%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb =>
> apache2_2.4.55.bb} (99%)
>

