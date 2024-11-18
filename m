Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6333FD5E396
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 06:27:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.34551.1731911237555570522
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Nov 2024 22:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z4fqNV7Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53da209492cso3064780e87.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Nov 2024 22:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731911235; x=1732516035; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kngjTtVpY9PnytQofFgI5wAJRWeFYeEKwMGWrQ92mE=;
        b=Z4fqNV7YxU3afpotbsytRdvjTleNRCM39ZfGollEMDwWbBbCXTiIx2rx/5xGp6+As3
         zqTX69TiElbcQDlPJWzDXvtDBfLPhLPf1tqqolf/npD5sGq1Ufxh2FPM8UbvXvg09Bcn
         0z0/C4hQZm9jiEcg8Q2SQTwqfWa3+H57jCh/nHcPiYYYVzYkWkrkLD1mpm6rnS7jSKwe
         xmqFCn8MhHkSk4Hdn45OKjv224YWsMQDLavPmJUcFJ5gpydUIqkGL/lzSMTl4dQoaJ9i
         v+TIIUz9PDRzF8OY08os8wCDBfb2b+1X7M/nXlVSkTmz2U7tlgcEOiAWCJgowd1XgRIy
         6jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731911235; x=1732516035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kngjTtVpY9PnytQofFgI5wAJRWeFYeEKwMGWrQ92mE=;
        b=oAVFl8fZSJY+PqlpklvpfYF/nqXKt5aYJoXFrwsSuTDmQPzky7cBu0d9n5hRMB+x1/
         hQh1Gt9DfmF4eMo6eZYXbvu28C852ngcek+TeojLZKT5O/NKQHQH7l77CTOBXZLFQiog
         Om1bWUPrv7mXmz/HTiDnNlnDxzVXHihuSZoR8IgVdI0mlLi47rFr3/N5UFfKZZBN9STR
         tNJK48OH41ZFCzKanMItMwRHl4pxQ9mkhtOQ7fsiAsXakIDcRdbAaRaerbuTe+2NlWBu
         R8Amvpiy0sxtQOXIY3RJ6F0d77nHDUNij0Tp+nnRrS1R8kOcUC4ZEny2Z1h/Oy5WllEy
         xb5g==
X-Gm-Message-State: AOJu0YzSIizZhslTYKV8iSggqsgm5yZKXiPZNtY47AQW/nJrHLAaSlGR
	JOh7YnKPErYNNxRTMqWRfp0cfsq66tro/mVJ+qTLaCRSvIOeW8u+OLNytOwTzoUkCNq0crWePYE
	rPq7sQs9KSsKt1yy/+qVuyX2LHtQlfQ==
X-Google-Smtp-Source: AGHT+IEPDDOe98UbAgb0r1JQ+uXPpiEUbY1FMk9Ya8+3r/1wNkT/zGn0fXdPyOeAbg94Uwb5zlzywvopCU1X80KOtAU=
X-Received: by 2002:a05:6512:3989:b0:539:ddf1:ac6f with SMTP id
 2adb3069b0e04-53dab3bf70dmr3937730e87.46.1731911235247; Sun, 17 Nov 2024
 22:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20241118062358.283666-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20241118062358.283666-1-jamin_lin@aspeedtech.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Nov 2024 07:27:03 +0100
Message-ID: <CA+chaQcxsswz9iUbaX8rJ8wopwu7ti_DQ+ZLHxS74=spBnwsng@mail.gmail.com>
Subject: Re: [oe] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS generation
To: jamin_lin@aspeedtech.com
Cc: openembedded-devel@lists.openembedded.org, troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 06:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113861

wrong ML, this should be sent to openembedded-core

On Mon, Nov 18, 2024 at 7:24=E2=80=AFAM Jamin Lin via lists.openembedded.or=
g
<jamin_lin=3Daspeedtech.com@lists.openembedded.org> wrote:
>
> v0:
>   1. add variable to set load address and entrypoint.
>   2. Fix to install nonexistent dtb file.
>   3. support to verify signed FIT
>   4. support to load optee-os and TFA images
> v1:
>   Fix patch for code review
> v2:
>   created a series patch
> v3:
>   add cover letter
> v4:
>   Add oe-self testcases for reviewer suggestion
>   Add documentation for reviewer suggestion.
>   Link: https://patchwork.yoctoproject.org/project/docs/patch/20241118062=
113.269253-1-jamin_lin@aspeedtech.com/
>
>   The following patches had been applied from v0 changes.
>   a. Fix to install nonexistent dtb file
>   b. support to verify signed FIT
>   c. add variable to set load address and entrypoint.
>
> Jamin Lin (3):
>   uboot-sign: support to create TEE and ATF image tree source
>   uboot-sign: support to create users specific image tree source
>   oe-selftest: fitimage: add testcases to test ATF and TEE
>
>  meta/classes-recipe/uboot-sign.bbclass   | 100 +++++++-
>  meta/lib/oeqa/selftest/cases/fitimage.py | 288 +++++++++++++++++++++++
>  2 files changed, 387 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113857): https://lists.openembedded.org/g/openembedde=
d-devel/message/113857
> Mute This Topic: https://lists.openembedded.org/mt/109640054/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

