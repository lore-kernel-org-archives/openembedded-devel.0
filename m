Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20C4C282D0
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:43:10 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.15833.1741365782159447642
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gHojjVCR;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5498fd0bce9so1503479e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 08:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741365780; x=1741970580; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGoXFhUi3CpuTNWJcuk0iuXKkMI65eb6fH8UOi5+48w=;
        b=gHojjVCRY2WpdLtGQAu3Qff5K8DSedoFMaOqv/oOgfoMaSAC+9G5f8QZvZR+hHjbVU
         5HFatojW+ujvMMnum3ENoKUSonBI95wzXUHXTo0wtjgX8YkiccaCDXuGtcfVh4v6lvfP
         VPj36OSTQl9EfDgs4T6Tv56AuCOn/aEi/3oGt1aAMedgqKx7At+ElQlNftxv7gKuEfDW
         A9mzIOkudTmwbpGFzERZSrQmvjecytnO52aBW050Q1n9T6jN/wzNI1+PGllMHRHQkm7w
         E1Hnd5mzZ5loLQKP2YbLyB/czyOQSsEFD0zihRzczyZpRN7Sf0wbpoMYK0CzlCBtcutj
         2XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741365780; x=1741970580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGoXFhUi3CpuTNWJcuk0iuXKkMI65eb6fH8UOi5+48w=;
        b=FCeHzDqgUZXLzNzC0nInGo4e3L94Z65GMIe+2UhvtS/C7dV1Nq5rGD/us+/Xe4AFXo
         BfxkssitXHks+hI8jDG4Ll1l0OcIAmiZ/jWInvdcFSJaU5CRFIJffgsKF18aJiUpASSW
         6dJ8UDVR3hnv99FN4HC4xw2rDktT0uTNxMkvj/ABeP78UKDcv1+RW4tPg0G4/vpPGRwJ
         QzFjVxDuDsH6IYBdqsLj0Y48AI7K5ZYTvWMZiMRJDGhg8PrjOSl8s5aOWbg4pXMVSr/k
         C4BVmqO7nzQcDdHuBGBxQqn85DH/48m9IjkMz+WhTxYL5Mhz7LLpfm/Jotts/hwKMgHw
         yKGQ==
X-Gm-Message-State: AOJu0YyLmk9cQG4XXLx7hDYIviDrupXwTdmRkrvbnltoDTn2JBoNwdN7
	yrVuZEbyiRi2YiD9tYjVVEo7EjDqTuqHxBrAyok00IVx2X5V3SHYVuEcnC97qyG02wGD4FAPgmP
	YFSUOMHa4QEFBxUjlTQ0I17bevds=
X-Gm-Gg: ASbGnctJSS8MoytrWIdEkmEvcLHPHB2KRcmuSWhmxCJ4F0Q/YGdfKsMbGYRdvgJHcI1
	z5uIXqZR+RsjDBY1bRgxvgxeeQKl+L3b847BympOU+ze9LyLrEkfIGly+0+KwwT3ibGcFFoy+sY
	xwM8thTvGtGKr3C6ntm55254bic9jc
X-Google-Smtp-Source: AGHT+IEKIa2scbRnVWjenPzL00Kaw8jL2MNrPxGSt5YX34V2CfvhGGja00lblYyBaEsGbLMMFzZTL3rw5mc1lIImPAw=
X-Received: by 2002:a05:6512:2203:b0:545:2f97:f6e9 with SMTP id
 2adb3069b0e04-54990ea92f3mr1373259e87.42.1741365779975; Fri, 07 Mar 2025
 08:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20250307162946.2638478-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250307162946.2638478-1-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 7 Mar 2025 17:42:48 +0100
X-Gm-Features: AQ5f1JoEBL8l7DGNYCyOvqmeKeCdQT52KFqc8yjaGQEb7ILiVFwAIUvsjlag3Es
Message-ID: <CA+chaQe5eUicA3=ZD6i1TrUeonKL1bg2zFXBGnGeuxgENPGcpA@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded] [PATCH] recipes: Fix variable assignment whitespace
To: richard.purdie@linuxfoundation.org
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 16:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115794

On Fri, Mar 7, 2025 at 5:29=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> Recipes are much more readable with whitespace around the assignment oper=
ators.
> Fix various assignments in meta-openembedded recipes to show this is defi=
nitely
> the preferred formatting.

Is there a migration script you've used to create this? Please share
it in the commit message so that other layers can use the same once it
gets mandatory.

Thanks

