Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BEBC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 21:18:57 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.1441.1645046336168750435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 13:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZGtG5x6i;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: festevam@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id z22so6156835edd.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 13:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aZSPCOCQY/YFgwOjbz0qKnY226OcT5MWuudh9bqRnfo=;
        b=ZGtG5x6ihCi3StT3K99pOyAk0UyDpQxOtC39wMSr/1gohXb/JSBsVa/lVxg5mXPiHp
         BZuU1ISOnFV1ie1N9rrmZaPTr4CgHZ21xTUKn5JLp8gn7B5RgHgwc9zi2J7vy/O55zw4
         6wyyRh0XVU1g5qY68I/ITxwf+bVGd/SDblyInEFxBLd679HE+mOQRMD52TjhYwQSofwO
         bLyhiZx3Q2opvqmz39TL9QUvLhmmyIB3UkhbeGvkskQMZV6bHYVD5TD3+fYRQ7miplkM
         nfVCA7pAGOU997jYFvCFWZSIzxyH8N1nidcEuWnkZhVp3JwAs4NwfQixJViUbTAsl0SQ
         Mf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aZSPCOCQY/YFgwOjbz0qKnY226OcT5MWuudh9bqRnfo=;
        b=azoaXC/1ir21t/YcG7WyMcMfw9OyByvcEDKFpdmpU1iXyNY3et2vPGOyoSBZvF1Lef
         EbAQ5Lg67IFY23a5Pj7WEZf582d3PDh2ueegmFmotUa7jYVW1NdGPXNwPC6sEDdroWg7
         hyPTo02PnKP7F6jNyw2UaK3Ob91OhmlcbdRE8lJ93eyCbRFCxjmaS6mPBXWbVsaxsVR7
         XvGUxs3A/65+fyqKJna1lFaWDJxR4LyVfhJfh0VQwhMGpKuaFZpMfqcrQDG32E9YWer/
         ns+WLqmrgnTQrIZhNyKon4lC0QhP2GDrj5veFiuSsRW+xDqtVmvvsDDoJlE157eVGhMc
         U96Q==
X-Gm-Message-State: AOAM532Mr2pzUC+f0oC5Ekje2so3gC8cxUd8E31RO5KTkMTP73d06Flq
	vAZxAAFF7B0SBqKw/6wmr//f/LdcJqx571g4n1hoJEBe8H4=
X-Google-Smtp-Source: 
 ABdhPJxI8QaGjNm/1rojPvqjkFzNyv4lq8ekBPc2e3CQtksZ4mJ4ZK2Sy43/OCNPbhiUqNsnNZeePLVZv67O/tYo4xQ=
X-Received: by 2002:a05:6402:1cae:b0:410:d3ae:3c8a with SMTP id
 cz14-20020a0564021cae00b00410d3ae3c8amr4963949edb.215.1645046334264; Wed, 16
 Feb 2022 13:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20220216171002.2338962-1-festevam@gmail.com>
In-Reply-To: <20220216171002.2338962-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Feb 2022 18:18:42 -0300
Message-ID: 
 <CAOMZO5A4P5_bS+-mspJHYtCqRY9EzVnDKqDq_FEREA2U7XP-Wg@mail.gmail.com>
Subject: Re: [PATCH v2] rtc-tools: Update to 2022.02
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 21:18:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95350

Hi Khem,

On Wed, Feb 16, 2022 at 2:10 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> The patch that adds the rtc-tools Makefile has been accepted
> upstream, so update to the latest 2022.02 version and remove the
> local Makefile patch.
>
> Also, rename the recipe to reflect the new version.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Use the 2022.02 tag (Peter)
>
>  .../0001-rtc-tools-Add-a-Makefile.patch       | 39 -------------------
>  ...tc-tools_1.0.0.bb => rtc-tools_2022.02.bb} |  6 +--
>  2 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
>  rename meta-oe/recipes-support/rtc-tools/{rtc-tools_1.0.0.bb => rtc-tools_2022.02.bb} (64%)

I see that the version applied in master-next is more similar to the
previous version of this patch, ie, without the recipe rename:

https://github.com/openembedded/meta-openembedded/commit/2cbb945d69104ffa51cba655626e66b46ee42380#diff-902da3ea68cbf9d19e75fd71125e1c0d61ee5d611640a7d1e7df36d277312600

Would you like me to send an incremental patch doing the rename?

Please advise.

