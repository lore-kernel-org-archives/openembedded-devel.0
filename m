Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C64C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 04:37:41 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.5202.1635827860504892095
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 21:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O0vAY1af;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id 8so387095qty.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 21:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P6OTm5gvWHjlLLtrHgWVH5xStbqtdp5X8CoVd8pInGQ=;
        b=O0vAY1afb0kAnWy7rjRFv/5UJPNyfm/03YT6P8lc8xIn7fQI2h+oshA6pIW3CL01zt
         Dm1LNYFxFs5Om4TObWuOt70SNCLaPu+vPWup7diCV1p3AD/0JImyHK1a3No3QmQtmJZL
         4bUwo1GHz6Wdu9D+2hywlxTxKWTEVITTycoHIWUzWIsD36NAWzP52Nku7z92zeAZBTeM
         PIZRd7C5L3OE8nLynSH1bg6jysVLyAXgBv5s1dBLYrBn3NiCCccj/B+5Z2u891VgkmU5
         6p9kyI8JziMX+T55wAS4Rddi/AdlJZLsVF9n86nAdloXUYjzTmlUhXUGItCIvhWfAllB
         xqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P6OTm5gvWHjlLLtrHgWVH5xStbqtdp5X8CoVd8pInGQ=;
        b=NELGruvaHYiOLiBKm5zL6kNoR471luorPGchlyKbIoym0NR3e1uJoFzdI1PyXUCCOj
         D1ZEjvASJap6Bz8IZzSyNgw5rVdmg2VemPrQe/ycurEbeCc62PbfnHhIGTEG9qAIlXsD
         VCvWXe8KQVQ52AxaDDu7MyjpzYWzu6XpccmvAUCoJagRUzRg6Fqf62sGCn24lmr0wlGt
         43fXOx7RJG+kBfgyli9lW3ZvONKCYlww7Ldc+6JGD7rgkZpJsHaS8Cpe7uQAzXv4W/3u
         hU4jaBjcpA4YWTRnGOdyS7Y2iv+0A/jiEio5/5tHnJQgYK8pH2LnLIeLOPck3syI0i9C
         PipQ==
X-Gm-Message-State: AOAM532YLMeCnUoHEdOvOI2HhtItKGMLHcSkdHB/Y3IRermF+tnqbUiQ
	iYIJH0wW3BC5L2f6Ftgwu7lTeG4N5DKCXaEVb5baDdDm
X-Google-Smtp-Source: 
 ABdhPJxqi2qbL3g65c8WECeP+kn3AQRLDbPZU+3Up6QnVZSVAb74koyYdH8wyMZjurIMgrtzNTEziZPy+5pCsTaQ2RE=
X-Received: by 2002:a05:622a:58e:: with SMTP id
 c14mr31501716qtb.225.1635827859495;
 Mon, 01 Nov 2021 21:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <b277d902-4f3b-9309-d9fb-da3414e1b351@gmail.com>
In-Reply-To: <b277d902-4f3b-9309-d9fb-da3414e1b351@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2021 21:37:13 -0700
Message-ID: 
 <CAMKF1spqgq8V_=m3iSQ0Xfa2z92VHfGcQXyWO4DOR=f_0Uq07A@mail.gmail.com>
Subject: Re: honister-next merge request Nov1
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 04:37:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93768

merged thanks

On Mon, Nov 1, 2021 at 8:22 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 33c00e34fc2b085ea538445bbd1ba339024d4d8a:
>
>   pahole: use MACHINE_ARCH (2021-10-12 09:45:25 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded honister-next
>
> for you to fetch changes up to e886fc0cbac89998f675b70679d0cce6bcebfb7f:
>
>   Apache: Several CVE fixes (2021-10-26 12:47:10 -0700)
>
> ----------------------------------------------------------------
> Alexander Thoma (1):
>       keyutils: fix install path
>
> Armin Kuster (1):
>       Apache: Several CVE fixes
>
> Khem Raj (1):
>       python3-behave: Switch to using github src_uri
>
> Matthias Schiffer (1):
>       byacc: switch to official HTTPS mirror
>
> Yi Zhao (1):
>       strongswan: upgrade 5.9.3 -> 5.9.4
>
> wangmy (3):
>       openvpn: upgrade 2.5.3 -> 2.5.4
>       redis: upgrade 6.2.5 -> 6.2.6
>       span-lite: upgrade 0.10.1 -> 0.10.3
>
> zangrc (6):
>       python3-ipython: upgrade 7.27.0 -> 7.28.0
>       python3-jdatetime: upgrade 3.6.2 -> 3.6.4
>       python3-openpyxl: upgrade 3.0.8 -> 3.0.9
>       python3-transitions: upgrade 0.8.9 -> 0.8.10
>       networkmanager-openvpn: upgrade 1.8.14 -> 1.8.16
>       ser2net: upgrade 4.3.3 -> 4.3.4
>
>  .../{networkmanager-openvpn_1.8.14.bb =>
> networkmanager-openvpn_1.8.16.bb}    |  3 +--
>  .../recipes-support/openvpn/{openvpn_2.5.3.bb =>
> openvpn_2.5.4.bb}            |  3 +--
>  .../recipes-support/strongswan/{strongswan_5.9.3.bb =>
> strongswan_5.9.4.bb}   |  2 +-
>  meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.3.bb =>
> ser2net_4.3.4.bb}   |  2 +-
>  meta-oe/recipes-extended/byacc/byacc.inc
> |  2 +-
>  meta-oe/recipes-extended/redis/{redis_6.2.5.bb =>
> redis_6.2.6.bb}             |  2 +-
>  meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
> | 15 +++------------
>  .../recipes-support/span-lite/{span-lite_0.10.1.bb =>
> span-lite_0.10.3.bb}    |  2 +-
>  meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
> |  9 ++++++---
>  .../python/{python3-ipython_7.27.0.bb =>
> python3-ipython_7.28.0.bb}           |  2 +-
>  .../python/{python3-jdatetime_3.6.2.bb =>
> python3-jdatetime_3.6.4.bb}         |  5 ++---
>  .../python/{python3-openpyxl_3.0.8.bb =>
> python3-openpyxl_3.0.9.bb}           |  2 +-
>  .../python/{python3-transitions_0.8.9.bb =>
> python3-transitions_0.8.10.bb}    |  2 +-
>  meta-webserver/recipes-httpd/apache2/{apache2_2.4.49.bb =>
> apache2_2.4.51.bb} |  2 +-
>  14 files changed, 22 insertions(+), 31 deletions(-)
>  rename
> meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.14.bb
> => networkmanager-openvpn_1.8.16.bb} (91%)
>  rename meta-networking/recipes-support/openvpn/{openvpn_2.5.3.bb =>
> openvpn_2.5.4.bb} (95%)
>  rename meta-networking/recipes-support/strongswan/{strongswan_5.9.3.bb
> => strongswan_5.9.4.bb} (98%)
>  rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.3.bb =>
> ser2net_4.3.4.bb} (84%)
>  rename meta-oe/recipes-extended/redis/{redis_6.2.5.bb =>
> redis_6.2.6.bb} (96%)
>  rename meta-oe/recipes-support/span-lite/{span-lite_0.10.1.bb =>
> span-lite_0.10.3.bb} (86%)
>  rename meta-python/recipes-devtools/python/{python3-ipython_7.27.0.bb
> => python3-ipython_7.28.0.bb} (89%)
>  rename meta-python/recipes-devtools/python/{python3-jdatetime_3.6.2.bb
> => python3-jdatetime_3.6.4.bb} (56%)
>  rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.8.bb
> => python3-openpyxl_3.0.9.bb} (88%)
>  rename
> meta-python/recipes-devtools/python/{python3-transitions_0.8.9.bb =>
> python3-transitions_0.8.10.bb} (75%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.49.bb =>
> apache2_2.4.51.bb} (99%)
>

