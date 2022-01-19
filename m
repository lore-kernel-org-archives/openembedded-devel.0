Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D418FC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 02:43:19 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.1399.1642560198973209125
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 18:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=orjojO3c;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id f17so1011914qtf.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 18:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qo9fkyw190ewA6FqsQgG7suWzyZPrrCq/a2d3M30Fmk=;
        b=orjojO3c9jdZx5gnoMzT8IzAzx2TQH00IAjHDRWy2Q+mQnCcWa6ZRs18JkfpsjGLWd
         qYucQk6z6yNbcDuKfN+o/in4hP+6UoJf4el10ICB+k22XhwfMX1pLB/WYv9PhDQtU2GO
         XWVNFM2qltzUdFCxGoGtZPvk+ji+ngnY49ktSj/WwTYnbTNU3EcUh3/1aGCEGaEkgNOa
         L7sqGkhxWY35f6fVmzelBsUSBAxv0IwuTm2JF8NjfcoLzs30baKmVTVBUG2xDXpJEMDl
         72sFz7smXh0fqrRqg9Vsm3UenhNpCf1klz/QSDkX7bt+EjVx4zJ0kJslfjFLf/XkFbse
         0EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qo9fkyw190ewA6FqsQgG7suWzyZPrrCq/a2d3M30Fmk=;
        b=qkm/adeXe9qRTeWxYzdY+Sjx8JZL8syKudKKfHZHwfPR7EnrC2z5fivPz4qYumbiMT
         qo0pV6F4g6o0VW/2gMLS7FqKJ+at3rxRJy6Ag7/uNt4SXVmjmHPjbYuzpboDQfPIDAkB
         tGYbK6/jTeZsYQF+kav1dY64mK2p8dDLpjRutpuT79J4skso1jK6XuFdn55yPSveaT0/
         ncUGij1Wc89JzanMoU31CeXTTn1+nrIq/0irgMBTaarkmYLWcQ6rR2b60f5j26oxGDxj
         GsNFDOl71NVT/wEChX1HgnnyDF3YcELRFbj0LBi8EUObt1R3pB4XLwnVqdnUxj7yWdqY
         DO4A==
X-Gm-Message-State: AOAM530I7UQd9HcbTCnNpZIPd7+hEnTv9V3U8J8Wltpm4TxVl7j+TDi/
	u3LSGY4SkfL2VkvRlXij1V1e4epbBxlNMJDm3v4=
X-Google-Smtp-Source: 
 ABdhPJwxdHCNf82pled1rH/2SwQaqWprfDhCMNEZq7haDwKxy9ZbSWVvJQhB4F52a7M6Zu249rhFJqa+M1hxnGkYirE=
X-Received: by 2002:a05:622a:5c9:: with SMTP id
 d9mr5088683qtb.330.1642560197922;
 Tue, 18 Jan 2022 18:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20220118230000.834968-1-wak@google.com>
In-Reply-To: <20220118230000.834968-1-wak@google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2022 18:42:51 -0800
Message-ID: 
 <CAMKF1squ8UE63R6EWWL6Zy8q_AUtV8Hs2GNfbrMXSq6g6ytQaQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] jq: upgrade 1.6 -> 2021-10-24 git
To: "William A. Kennington III" <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 02:43:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94930

this fails license checks. how was this tested?

https://errors.yoctoproject.org/Errors/Details/622753/

On Tue, Jan 18, 2022 at 3:00 PM William A. Kennington III via
lists.openembedded.org <wak=google.com@lists.openembedded.org> wrote:
>
> JQ has gone through more than 3 years of code changes and has had
> significant performance improvements since the last release. The team is
> still figuring out a new release process. Use the latest git commit to
> pull in these changes.
>
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  meta-oe/recipes-devtools/jq/{jq_1.6.bb => jq_git.bb} | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-devtools/jq/{jq_1.6.bb => jq_git.bb} (71%)
>
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.6.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
> similarity index 71%
> rename from meta-oe/recipes-devtools/jq/jq_1.6.bb
> rename to meta-oe/recipes-devtools/jq/jq_git.bb
> index bfaeed5fe..102bb9f15 100644
> --- a/meta-oe/recipes-devtools/jq/jq_1.6.bb
> +++ b/meta-oe/recipes-devtools/jq/jq_git.bb
> @@ -8,13 +8,10 @@ SECTION = "utils"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=15d03e360fa7399f76d5a4359fc72cbf"
>
> -SRC_URI = "https://github.com/stedolan/${BPN}/releases/download/${BP}/${BP}.tar.gz"
> -
> -UPSTREAM_CHECK_URI = "https://github.com/stedolan/${BPN}/releases"
> -UPSTREAM_CHECK_REGEX = "jq\-(?P<pver>(\d+\.\d+))(?!_\d+).tar.gz"
> -
> -SRC_URI[md5sum] = "e68fbd6a992e36f1ac48c99bbf825d6b"
> -SRC_URI[sha256sum] = "5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72"
> +PV = "1.16+git${SRCREV}"
> +SRC_URI = "git://github.com/stedolan/jq;protocol=https"
> +SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
> +S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep
>
> --
> 2.34.1.703.g22d0c6ccf7-goog
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94922): https://lists.openembedded.org/g/openembedded-devel/message/94922
> Mute This Topic: https://lists.openembedded.org/mt/88522693/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

