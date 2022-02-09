Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE06C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 05:38:08 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.22861.1644385086986527448
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 21:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LLN/Cu3d;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id c14so980461qvl.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 21:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TlucbvZSEhlE0gHeiyobtExJiLc8pOCOLGtx3R6gNtg=;
        b=LLN/Cu3dKowcjya7qH+U11ZOc8oxVYNtyP6h2LV7/dd5DZPByHYtN9ikFuZzpZY2lM
         BRNgIIxbRSPZPA0d/KmWWk3z+srWj5w/hnh6zmtuldEolccvg56CrkUgeT+MFgcRtWYr
         J+Jhq0Rm7sgUdr/VUc7M3DD3x2C8sT5ZhKtG3ex9SD+GPI6wTJvE6Da0O9N/Mm4QoOh+
         8VXj9GItavNsygf3EfQzQDajbAD6TWA9tXCIyveQ9+dCQLuMnIk97a91K1LMJNvZRd+H
         YWiJnwvCrlOyxQSsI19vnfj9tOO2HWPXRFBOBaxUA5x5h3weVZAbuvIVzAhTSMKsoLNo
         FtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TlucbvZSEhlE0gHeiyobtExJiLc8pOCOLGtx3R6gNtg=;
        b=oB+HBwQNd5OrOKXNG9J6aNs5s5Osd6VCGxmqupqNViXDZD0mQYx89UrCcMuCZD4g2t
         H7DpNNd+JtvrbkuLJU8UBM1zj/J47ZZtzNq8SnfjbKxxvWVH7FY0Ya0qSWBM2iy2YADj
         TcJDS+2DZIMx5loEx+VMjEY1vJyCSYBb9g/icxVZ/M34eAUxrLc8magT8uqFcAiP4RcQ
         RH4gUZwYgwFws+za12raLbwXm4HitSO3eCoCcvo5hQC7xKc6qaXH8eMpCXYInPu5F3fS
         MiIrvFJ3F5uNn+iUoVQ0AoaQpt6Ogxc9ZyVygdo3syw0bbmTHr+Mlj9myPysqcQTMaI4
         uzKQ==
X-Gm-Message-State: AOAM5332pV4QLWlzQpT/ZNP0rx66+Z7htUxeTsqEo9mNuUgaFjCwyihm
	TvYpn9mEDcWxcRUf2K+UpcHySEVXJbFUbRkEers=
X-Google-Smtp-Source: 
 ABdhPJxWGA+wszAabtsg+CepLdv67n60d1jPOUzsuJxx8fQEctbNevPE8e6VfLLgNKNrhCNxjuWjVDfteCkvM7C0hKU=
X-Received: by 2002:a05:6214:509a:: with SMTP id
 kk26mr473887qvb.24.1644385086048;
 Tue, 08 Feb 2022 21:38:06 -0800 (PST)
MIME-Version: 1.0
References: <aead72ac-76c7-bd82-3245-1096213c7e09@gmail.com>
In-Reply-To: <aead72ac-76c7-bd82-3245-1096213c7e09@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2022 21:37:39 -0800
Message-ID: 
 <CAMKF1soXdOsV0nhyO22RW5c0yUimK3iCkiUnnu2Uzfiv+QhwTQ@mail.gmail.com>
Subject: Re: dunfell merge request: Feb 8th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Feb 2022 05:38:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95273

applied thanks

On Tue, Feb 8, 2022 at 6:29 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit ab9fca485e13f6f2f9761e1d2810f87c2e4f060a:
>
>    postfix: upgrade 3.4.12 -> 3.4.23 (2021-12-31 10:24:49 -0800)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to ec978232732edbdd875ac367b5a9c04b881f2e19:
>
>    nodejs: Fix for CVE-2021-44532 (2022-02-06 11:01:44 -0800)
>
> ----------------------------------------------------------------
> Andre Carvalho (1):
>        netcat: Set CVE_PRODUCT
>
> Armin Kuster (2):
>        wireshark: Update to 3.2.18
>        c-ares: bump PV in recipe to 1.16.1
>
> Jeremy Puhlman (1):
>        CVE-2021-4034: polkit Local privilege escalation in pkexec due to
> incorrect handling of argument vector
>
> Leif Middelschulte (1):
>        dbus-daemon-proxy: add missing `return` statement
>
> Robert Joslyn (1):
>        linuxptp: Update to 2.0.1
>
> Virendra Thakur (4):
>        strongswan: Fix for CVE-2021-41990 and CVE-2021-41991
>        udisks2: Fix for CVE-2021-3802
>        p7zip: fix for CVE-2018-5996
>        nodejs: Fix for CVE-2021-44532
>
> wangmy (1):
>        apache2: upgrade 2.4.51 -> 2.4.52
>
>   meta-networking/recipes-support/netcat/netcat_0.7.1.bb |    2 +
>   meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch
> |   62 +
>   meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch
> |   41 +
>   meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb |    2 +
>   meta-networking/recipes-support/wireshark/files/fix_lemon_path.patch
> |   22 +
>   meta-networking/recipes-support/wireshark/{wireshark_3.2.15.bb =>
> wireshark_3.2.18.bb} |    5 +-
>   meta-oe/recipes-connectivity/linuxptp/{linuxptp_2.0.bb =>
> linuxptp_2.0.1.bb}           |    5 +-
>   .../dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch |    2 +-
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-2021-44532.patch | 3090
> +++++++++++++++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb |    1 +
>   meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch |  226 +++
>   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |    1 +
>   meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch |   74 +
>   meta-oe/recipes-extended/polkit/polkit_0.116.bb |    1 +
>   meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb |    2 +-
>   meta-oe/recipes-support/udisks/udisks2/CVE-2021-3802.patch |   63 +
>   meta-oe/recipes-support/udisks/udisks2_git.bb |    1 +
>   meta-webserver/recipes-httpd/apache2/{apache2_2.4.51.bb =>
> apache2_2.4.52.bb}          |    2 +-
>   18 files changed, 3594 insertions(+), 8 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch
>   create mode 100644
> meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/fix_lemon_path.patch
>   rename meta-networking/recipes-support/wireshark/{wireshark_3.2.15.bb
> => wireshark_3.2.18.bb} (94%)
>   rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_2.0.bb =>
> linuxptp_2.0.1.bb} (75%)
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2021-44532.patch
>   create mode 100644
> meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
>   create mode 100644
> meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch
>   create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2021-3802.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.51.bb =>
> apache2_2.4.52.bb} (99%)

