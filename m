Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F36D767E3
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 16:41:48 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.16971.1730392900427984111
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 09:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=hgl/WO8C;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.41, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53a007743e7so1306412e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 09:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730392898; x=1730997698; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQH8kRs0DYMH+nJ3p1u/IXT/sh5lqaIGzFTAUhJE+LM=;
        b=hgl/WO8CoFxzGFvA8r76gV86nrBAZ3VFlqjkhYKndVMsBxLCx7tDn/Co5hetdE5tCx
         NVy3bJnsHrcXt6TZ/ujvpibh+OpNVQlBTMQdB7e0JWEF1sw9904pQQGij3+IBniUrwg8
         bUFIxlxHrMF82+LYo9e+9XRA8GAIlEStgmvU3MfUfdmvEJ9V89h5w1wQhK9QZk2C458R
         8J5y/vJFg9ks3GWxwFgS0snM1ZzCFVTvxqsva8BJkK0QWPlERIov9LEqXFjDVnAXnlAZ
         zwLhnpvBKBZ94+XbdA7VYlZmMb6QBx+v3ibrhT466Qq2R7zGf+Xk4dDb9iUU3hOC4R5w
         h18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730392898; x=1730997698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQH8kRs0DYMH+nJ3p1u/IXT/sh5lqaIGzFTAUhJE+LM=;
        b=ZdydfEntMbPlVHWoS9pKsnYvqvfWmvgsMADcFCbd270pyAIW79fWzN7Rh/tMpayRQ5
         7y5e6ZoKO/3NLfPYbLIJacMx1cctBjzh+apOl4ATlBa9BrBtizJGiLIMJyOaIFqPWt/T
         Kxodolw7TbJmW394KwUE3kqoe4fEwzmvWB/aezyWee6gKCWogR/wsnSb6uDcccFbfrVb
         TdjMOC20/kp2s5JxdLhu48d5bAx5swMdq7TgGdzCwZS6TLE2OZoPuMaQi9TZfrXERq1Q
         +LS0O7sM7c5je80qA8RlmG38CviBNtAeVHczcNYg6NwrCv5pgMEY4wzhwbjryJIvDNnD
         qifg==
X-Forwarded-Encrypted: i=1; AJvYcCUgQ0d08tKmqHXlNi3SdtV9sEo15YuGbIoBIZeQr9WLwWcH+n1fZn7Z62jPrRlzmLiCuT7JXDQa/rhRMZ0+JxA/UFk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXZ8WlJesra8vzZgy3PewWubDsOdQ+yXq9RTDbY0qbmbhXgNH6
	VAYkMW4JYB4e+JQPg5H7mT4wOx1WieyGxoQdSbj8K1UE8AoCkQeoPP3XQeYT1C3+du34im5+/U6
	sp07inRdLlIcX8yFy4id61lFW9SuKDGfvLuO77A==
X-Google-Smtp-Source: AGHT+IFFtI78PFkVlAITobne80hnZzMfZ4v2FwDobjR0rTLIztKprGZPRvpDtPPycwWzsRtF3grwkf3jMJKDtDskkdQ=
X-Received: by 2002:a05:6512:130e:b0:539:fbd4:9c9a with SMTP id
 2adb3069b0e04-53c79e61084mr2313773e87.35.1730392898304; Thu, 31 Oct 2024
 09:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241030205334.10278-1-brgl@bgdev.pl> <CA+chaQcHWBW-Fkzyi6e2hYiJzQx-cXqaLUJ7d6Jvo_aiZG9Hrg@mail.gmail.com>
In-Reply-To: <CA+chaQcHWBW-Fkzyi6e2hYiJzQx-cXqaLUJ7d6Jvo_aiZG9Hrg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 17:41:27 +0100
Message-ID: <CAMRc=Mf7+6KMs3X59r2ZpLV=SynayTsG7RVh8-FmEhM321PE_A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: selectively enable GObject introspection
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Max Krummenacher <max.oss.09@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 16:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113370

On Wed, Oct 30, 2024 at 10:02=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> Please use BPN in:
> FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
>
> I could send another separate fix, but then it would conflict with
> this one, so probably better if you send v2 with it.
>

This patch is already in master-next so just go ahead and add your
change on top.

Bart

