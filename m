Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E91AC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 17:52:32 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.39.1639677150829601294
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NMCAQRgg;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id t11so1383qtw.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbWjQ08FLGni/LUu6+oXi7zoMejcGdVzznHxpKGzbzE=;
        b=NMCAQRggBQ+OWpKy16zlhb9CUQMi+jxMCDQ8EQLcr/yKnM1tHILakGwZxaQciPKZCs
         s1Z3qDbzQ8G/nwVjkQDhV2y/11EOqxjjTt6pwtgzh0cCedXJXczmkYDrBCb9ZzB+fwxZ
         TcVt57n/0nb79tHHIm9vNc1zsbGklbkOWiF+anPHMqsWNvbZE0jPNZ/jxV8O0pA6t7tD
         IiTkO9XJm/UpgwA8xff3P4D0WiDvOWFuou1mHX8Km58Jv9oTRTP/L6eNCfnjjZEour7O
         k8CTRvP8RzgYc33/p1eoguTECybDiJtzFbke0lTvw42BxBWwP2GUdUxrn7eJWQLI57dJ
         5VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbWjQ08FLGni/LUu6+oXi7zoMejcGdVzznHxpKGzbzE=;
        b=aD8Xtz4rooS8/LLH4xGyihdzdhIJzSJ9qnJzV6soBzicCR8U5R8tD04SConmcOnNqn
         c4qqYzTxi9c/8pl7whiO0EsYJkEh7ZoxAww5HL56FfJxfOlGAI0t1/LzF+g/RX118q2g
         jvLVjgpmidqGpBuIDtXtB7sWm1JOmoI8Z6B+e2JSlBW6NBnYf1qQzPRG40JTbN0/5Ff2
         FC9qeVBWZHa0wD+fxbdI66qM99zTcJbFiZD+qmwu3qXsiY30kzUdTuEcAo/spFf3xjI1
         h6hAf6gzEVr/Y/uLoCiDDiZ+F8nF+3tiTnbnkYOUqR2+RKcSaRhfIE0A1m/VqrUmyQax
         ZWQg==
X-Gm-Message-State: AOAM5311x3by8sUxxtAP+fMx+8QsrtLUcKHLtGSX6bJF5HNknGikjVhy
	Ksa99tZYP/F1v9H/L3Vy4enMqUurY9xeYSIyh3FF61wTkKumSg==
X-Google-Smtp-Source: 
 ABdhPJzCxh1MabThJFW3YnDRUD/F3TdhFq3N8XHChRxljGp83XWqBkK1Q0nkPXKOZ7v8vloj12K8id0ZOTdu1sRQiv4=
X-Received: by 2002:ac8:518e:: with SMTP id
 c14mr18078356qtn.665.1639677149801;
 Thu, 16 Dec 2021 09:52:29 -0800 (PST)
MIME-Version: 1.0
References: <20211216083115.417282-1-jk@codeconstruct.com.au>
 <20211216083115.417282-2-jk@codeconstruct.com.au>
In-Reply-To: <20211216083115.417282-2-jk@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Dec 2021 09:52:03 -0800
Message-ID: 
 <CAMKF1srWwXbEGLwptNaFWChuFiKfeXNbPwqeKh8uk2DP5FoCkw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2] mctp: install dbus service
 configuration
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 17:52:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94405

On Thu, Dec 16, 2021 at 12:32 AM Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> mctpd ships with an example dbus service configuration, so install in
> the dbus system configuration dir.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  meta-networking/recipes-support/mctp/mctp_git.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-networking/recipes-support/mctp/mctp_git.bb
> index 6cc5b1480..9c440b6d4 100644
> --- a/meta-networking/recipes-support/mctp/mctp_git.bb
> +++ b/meta-networking/recipes-support/mctp/mctp_git.bb
> @@ -24,10 +24,18 @@ PACKAGECONFIG ??= " \
>  PACKAGECONFIG[systemd] = ",,systemd,libsystemd"
>  SYSTEMD_SERVICE:${PN} = "mctpd.service"
>
> +FILES:${PN} += " \
> +        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
> +                '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
> +"
> +

this should go below do_install and other functions. You can run
./contrib/oe-stylize.py
also to get some help on formatting

>  do_install:append () {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
>          install -d ${D}${systemd_system_unitdir}
>          install -m 0644 ${S}/conf/mctpd.service \
>                  ${D}${systemd_system_unitdir}/mctpd.service
> +        install -d ${D}${datadir}/dbus-1/system.d
> +        install -m 0644 ${S}/conf/mctpd-dbus.conf \
> +                ${D}${datadir}/dbus-1/system.d/mctpd.conf
>      fi
>  }
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94382): https://lists.openembedded.org/g/openembedded-devel/message/94382
> Mute This Topic: https://lists.openembedded.org/mt/87763264/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

