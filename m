Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B34ECE573
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 22:02:20 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.18068.1725746537747253581
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 15:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Us0dfym1;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f66423686bso28430191fa.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 15:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725746536; x=1726351336; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYNK8UCGoTVbzdL3Pu61IUTlY4XxN9DUgCIu366zB8w=;
        b=Us0dfym1MdePrLP9xa81Xre4uUirbikTLBM7iQWJw9kAe5ihtVQdzOeuW7ov/HwsEB
         rq/BqD8gAosVoF08XQIGNOzHUEA9EQPBX/a4nLAgZpw92ugPRlBzovLhKWcgjl14ceiQ
         qRXyuwmwv/07SahEaksrFEaoVd9oJOl+ISAwnBxlW/g/qzG/7pcLV2CfPQ58bfx4QRAP
         Ithtr/02rAgvs09HVqEEbZlqO1Ee5TjY1e560cZWzPw1R8uy97hN2oWnClQ3AUN1F/z5
         S8OER3A48H18XNRmbADC7M+WDWyiCZ5aTPDi/CGJ3LNTWIHrHx7S6/9qfN6yjf6lQ3C8
         ppcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725746536; x=1726351336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYNK8UCGoTVbzdL3Pu61IUTlY4XxN9DUgCIu366zB8w=;
        b=mYBPTgKLFUrQnhC2tu5ZQe0Q1zLGBvBRvsugGBbRbEM+3vjHIFQ4W+M8VPtsG/umUz
         aCrk0ZEiWNBspnZmDQ940Wc36vfTvmW77948Nq+F3FZsdn0fkWhnCCy5sgL58sNGGZaT
         IjjGg8gWDv+4Ew6pi4Apw9yfmhhWFDG+vRysB349xgHTTFPAETaVloBP+vvZcGTozyrL
         H7in7JW6OU+kTWyLTmLuYmmt078GjvclT+sFi5c1AcTHaXg9VWZ0YcwJzzDvPoUF8cy9
         hXw3Wm2k9dt6e4loE2IvU1lq5AwNoUoSqX5hZznWG7FTUGr3iQLDv34rXD4drU4plYr1
         5AMw==
X-Gm-Message-State: AOJu0YzyG33XExDsiS/W0MdQUbGZQhLPa69HQ2OYO9GUJ6zgZwCHg08i
	TNZ7J+a/CrZRq3nd2GV9hxC3Z414InaME7oPQbfKhhy3V9HzFvGYyQAELM5TuuEgiNAQ02w4fzJ
	DCP62Un8m0AyuxD/aokYXDbqBjUo=
X-Google-Smtp-Source: AGHT+IFJGm4YaOwcK0QSJcfF7JjVRHMTHzD6GBktSbVcuyuJQhGbeJgYybkYXo1df8eIZppvIEltwU2U55MzJBR3Tcg=
X-Received: by 2002:a05:6512:1395:b0:52e:764b:b20d with SMTP id
 2adb3069b0e04-536587b4d0emr3731231e87.28.1725746535441; Sat, 07 Sep 2024
 15:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240906184711.3654693-1-festevam@gmail.com> <CAMKF1spUuXBtPQtPyx-3Mh3JXy_-RanRXjpotWB2k3agAi8Rdw@mail.gmail.com>
In-Reply-To: <CAMKF1spUuXBtPQtPyx-3Mh3JXy_-RanRXjpotWB2k3agAi8Rdw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 7 Sep 2024 19:02:04 -0300
Message-ID: <CAOMZO5AezVAT_wv77eFJjYyqpTzffhJ2Dk=0Z5jQFwASFAxp+A@mail.gmail.com>
Subject: Re: [oe] [PATCH] imx-cst: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 22:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112122

Hi Khem,

On Sat, Sep 7, 2024 at 5:48=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> what's the rationale for proposing this to include in meta-oe ? is it
> used for non-imx platforms ?

I should have explained the rationale in the commit log, sorry.

Multiple layers include the imx-cst package and offer their version of
the recipes:

- meta-freescale
- meta-secure-imx
- meta-phytec

and probably others.

The idea of having imx-cst in meta-oe is to centralize and maintain
the efforts in a single location.

The imx-cst package is i.MX specific.

I can improve the commit log and submit a v2, if you agree.

