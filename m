Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DEBECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 05:49:33 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web12.736.1662443367194680934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 22:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S/1oVGqs;
 spf=pass (domain: gmail.com, ip: 209.85.128.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-333a4a5d495so85766797b3.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 22:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YlyakKEy74S5M5wyk+fUcmwa7TX58XCcuvrsA5bWBSQ=;
        b=S/1oVGqsB9GQQc9bJSntG93J/dz9i6WCXyGV5fPu8YMfYROA4Qx9mh0wpm7uSYD4Xg
         xoG+5gMs8OXFDMI4pbxdw9xt3P9vm97YsyWO2OrVNGeCAyfAWlZeIrKh3Oao9ZXwtv2P
         Rqb5jl1hmRCPWUVZ7PquB2w8eoYnMk8bnFQxVwN5wFVr+doEKaXdzwQ66YHKcC8oXKZn
         HqZsPqTwsOzJfk7P1KiiVfy9RDQmKT66uEDRRCPTDEkmHIEqHJKEioaZDIm7K5fnFtdh
         E9zN4uEEVhyZ/X3sZJdjjX/jTM+G84c62SC6FJ+450DS1jszOy7+gLuYo0M+k1D7c0Ua
         39cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YlyakKEy74S5M5wyk+fUcmwa7TX58XCcuvrsA5bWBSQ=;
        b=sOVjo1Try4aE8CA9OdcRbQsi2hj1r1oaHdE32xOS2BiorkWchLqbti9SMGZxQiDxwJ
         9QF0pj3xEgfSikrLGPGeaWNXEX95SUaVq/zloZ7k7q6LrGqLU2Mg2sQaiZeglG0NyuYe
         2ILi/CGQtAEUrhVVNJG6Kupk+iJmSQesZQbDhvRQLelUfpt8yn6ziAQWMpuywuE1xiqC
         mPlpRNf4YecBmWvDKKZuoDvDyvr2CuW9vs7dM7QHMntaqoKboRglLuItjQBO/7CXwvBS
         QWBVq43rQESYb9RMfz3hy19cSJsKTPCFDwiFxJGJwpN6C1gsi+g6JSSJiaU4xPXaUXwG
         jWlg==
X-Gm-Message-State: ACgBeo2MyvDPN2pxJo255b47PGxKfp69COcwyjth9A9eGC8blI+SOZHo
	22mxTn2PwmrjX4FVi88LJ6/CiUguzzJJtCxZwmo=
X-Google-Smtp-Source: 
 AA6agR59hcpHmotJO/fynVt0DRzDeoEZL6Tvk5gvSDS5mt4Tc4eixG+MdQZKNBANWnheY2HrkIHqzAX3qtp1/dam1I0=
X-Received: by 2002:a0d:f204:0:b0:333:c23f:d793 with SMTP id
 b4-20020a0df204000000b00333c23fd793mr42615157ywf.71.1662443366143; Mon, 05
 Sep 2022 22:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
 <1662368529-32226-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1662368529-32226-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Sep 2022 22:49:00 -0700
Message-ID: 
 <CAMKF1soXFjc3j_89fjkKHvSMKnyDEGFWH7EAx-N_1m=GEmTMQw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] cli11: upgrade 1.9.1 -> 2.2.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Sep 2022 05:49:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98677

it seems this version is trying to download the catch framework during
configure. This not ideal. Perhaps look into downloading everything
build needs during do_fetch via multiple SRC_URI entries. Then
substitute the cmake such that it does not download these files
anymore.

See

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1989/steps/14/logs/stdio

On Mon, Sep 5, 2022 at 2:02 AM wangmy <wangmy@fujitsu.com> wrote:
>
> License-Update: Copyright year updated to 2022.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../cli11/{cli11_1.9.1.bb => cli11_2.2.0.bb}                | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/cli11/{cli11_1.9.1.bb => cli11_2.2.0.bb} (67%)
>
> diff --git a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb b/meta-oe/recipes-support/cli11/cli11_2.2.0.bb
> similarity index 67%
> rename from meta-oe/recipes-support/cli11/cli11_1.9.1.bb
> rename to meta-oe/recipes-support/cli11/cli11_2.2.0.bb
> index 7de3335abd..a035c27a3d 100644
> --- a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
> +++ b/meta-oe/recipes-support/cli11/cli11_2.2.0.bb
> @@ -2,11 +2,11 @@ SUMMARY = "C++11 command line parser"
>  DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
>  HOMEPAGE = "https://github.com/CLIUtils/CLI11"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
> -SRCREV = "5cb3efabce007c3a0230e4cc2e27da491c646b6c"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9ad746b5f49c0fd53c08ca1faff1922c"
> +SRCREV = "b9be5b9444772324459989177108a6a65b8b2769"
>  PV .= "+git${SRCPV}"
>
> -SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=v1;protocol=https"
> +SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98661): https://lists.openembedded.org/g/openembedded-devel/message/98661
> Mute This Topic: https://lists.openembedded.org/mt/93474748/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

