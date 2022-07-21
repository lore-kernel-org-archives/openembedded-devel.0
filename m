Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6020EC43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 15:57:36 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.8131.1658419052939086927
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 08:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mhvBIHqa;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id r21so1554853qtn.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=60UnemE6HtSFth8LV81CBmFi0q8oJrBaghK1vt3qJTs=;
        b=mhvBIHqalP8Whu124/ZGpaIzSeEoZst6UQSxxcty2O1edV7ChzLffldFjdpMiwORpA
         w0x6vE2ckk4Y0Q9XmZ2yl9qrzuvQDe6HS2aqWl5QiMxBOwaSLiyWqoW3p0e9ZYtjiTew
         hBRoVyVpSjyeQ8Gyg35pTsfBaN4T0VoEe+cgYK+bzk4JfHSiYGJhejpsPMY/vspMoOTb
         Qs/SQMg6F4b1C9GvFcIQfZkotTIxc1w8UzrXvtCWwq7zio822uaiVSKuGq0G+C9Q48rD
         O25QSv9gBFUK+l2LcbCR7RwCtRj4Trd85q/EwEPMCjIYyIpsUwtrzSLCl/cVom7ver03
         tfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60UnemE6HtSFth8LV81CBmFi0q8oJrBaghK1vt3qJTs=;
        b=oPA6Xwbu9zp1E94vUODM6tI+jsZQDUmcUPr+bODQ7l5IleL7mhptl3/+1bmo1jkgrH
         Gg8ZepAz7uy4J9taD4ig4D+Rg9H5m3yRedIppfiuv9WKZ8hEx9MuyJS85Flq8J5NHwPN
         fLlcSc7T24MvqmMAK/l2idmgA2qZjio+gp9tMnygCtb+oPcppHn7xkr+c3YW6IhwGMoP
         Et6Z1Pdo8MzDdcWCXXPkgjoSl+gEujF8NQwyVfYojK8V5fGNTJULVD204aAjXbMyRAyM
         A1ynjPme95xGeaCOLlB4VDH44onma6K3o3VR/2OZP02vVdgfPRT3ydjDvDgiP5Nj/RqW
         aqSA==
X-Gm-Message-State: AJIora9K8n2/QVuinjBbI3ZmQnC71Bo2FVy0XYGVTgxcFRj4gu72dZ9R
	P1D1L7TDpLVxBmSjfnvTsmgx9v8CUQ7ES4hlCss=
X-Google-Smtp-Source: 
 AGRyM1slmj4L0XrcVnVKgk+Pmhj/KGA4WEBFCC8GaaBse3KCvUgbQovmRAOmGqSkFtqRYvHRxi1SX4IrvJn8ZdzcO5w=
X-Received: by 2002:ac8:5e4f:0:b0:31e:d96f:a4e7 with SMTP id
 i15-20020ac85e4f000000b0031ed96fa4e7mr25115671qtx.634.1658419051915; Thu, 21
 Jul 2022 08:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <4d2167bf-79bb-0237-2527-78d4fa3fc5c9@gmail.com>
In-Reply-To: <4d2167bf-79bb-0237-2527-78d4fa3fc5c9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2022 11:57:05 -0400
Message-ID: 
 <CAMKF1srv=AAtf0=zQzw6vwUBXQULhYd-euT26HCKw-2mUeZY-w@mail.gmail.com>
Subject: Re: [kisrkstone] merge request: July 21
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Jul 2022 15:57:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97920

merged thanks Armin.

On Thu, Jul 21, 2022 at 10:08 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit b9bbc38bfba702194a71c5a9dcb747ddacc9d66b:
>
>    protobuf-c: update to 1.4.1 fix CVE-2022-33070 (2022-07-14 09:06:29
> -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to a47ef046619d639dfbd3be2a13ef6d5b40fd40a1:
>
>    openflow: ignore unrelated CVEs (2022-07-18 07:02:41 -0700)
>
> ----------------------------------------------------------------
> Changqing Li (4):
>        redis: upgrade 6.2.6 -> 6.2.7
>        redis: upgrade 7.0-rc3 -> 7.0.2
>        apache2: upgrade 2.4.53 -> 2.4.54
>        zabbix: upgrade 5.2.6 -> 5.4.12
>
> Davide Gardenal (9):
>        usrsctp: add CVE_VERSION to correctly check for CVEs
>        openflow: ignore CVE-2018-1078
>        ntp: ignore many CVEs
>        wireshark: upgrade 3.4.11 -> 3.4.12
>        thrift: add CVE_PRODUCT to fix CVE reporting
>        spice: ignore patched CVEs
>        quagga: ignore CVE-2016-4049
>        freeradius: ignore patched CVEs
>        openflow: ignore unrelated CVEs
>
>   .../recipes-connectivity/freeradius/freeradius_3.0.21.bb |  5 +++++
>   meta-networking/recipes-protocols/openflow/openflow.inc |  9 +++++++++
>   meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb |  4 ++++
>   meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb |  2 ++
>   meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 26
> +++++++++++++++++++++++++-
>   meta-networking/recipes-support/spice/spice_git.bb |  6 ++++++
>   .../wireshark/{wireshark_3.4.11.bb => wireshark_3.4.12.bb}         |  2 +-
>   meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb |  2 ++
>   .../zabbix/{zabbix_5.2.6.bb => zabbix_5.4.12.bb}                   |
> 6 +++---
>   meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch | 14 ++++++++------
>   meta-oe/recipes-extended/redis/{redis_6.2.6.bb => redis_6.2.7.bb}  |  2 +-
>   .../recipes-extended/redis/{redis_7.0-rc3.bb => redis_7.0.2.bb}    |  2 +-
>   .../apache2/0004-apache2-log-the-SELinux-context-at-startup.patch |  8
> ++++----
>   .../recipes-httpd/apache2/{apache2_2.4.53.bb => apache2_2.4.54.bb} |  2 +-
>   14 files changed, 72 insertions(+), 18 deletions(-)
>   rename meta-networking/recipes-support/wireshark/{wireshark_3.4.11.bb
> => wireshark_3.4.12.bb} (97%)
>   rename meta-oe/recipes-connectivity/zabbix/{zabbix_5.2.6.bb =>
> zabbix_5.4.12.bb} (92%)
>   rename meta-oe/recipes-extended/redis/{redis_6.2.6.bb =>
> redis_6.2.7.bb} (96%)
>   rename meta-oe/recipes-extended/redis/{redis_7.0-rc3.bb =>
> redis_7.0.2.bb} (96%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.53.bb =>
> apache2_2.4.54.bb} (99%)
>

