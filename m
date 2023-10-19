Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF96FCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 07:44:38 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.22188.1697701473906701922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 00:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HPbf5ndr;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso77601731fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 00:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697701472; x=1698306272; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uh7EXUgrTDLzAdFz3s3XyrjefOUceJ4s29yx6QDUeqc=;
        b=HPbf5ndr/MjtkxB/GfepC6tkvLMwr3rE/J0azZXJiVMuqUtTYaDrE8sRLEFr1zx17E
         yjzsDSeDAW7N6/GVgN1Lc/fSBhYsj67BtKLyLD0oOL4AmsOFYAYjHWnzxDokaGEtL33n
         tUhW+8Js1qWaCGKDSc1YES9axrnRDpBAObFExsdB+UXl7lCOpljBjwf026Jy6oRXJvnZ
         F2O7tkZCbOLsTJZmssbNF0xgJUO8TTef8HuNmQEAPWFhtqSmDw7An38D1IZEhBVqQheI
         v8vZlSfWHiw4yHf7XlR3bumW4IBhPzOs1pezJ3IGwtusGZ1r+GwrgDr65bOQ0pr4Q/46
         JuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701472; x=1698306272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uh7EXUgrTDLzAdFz3s3XyrjefOUceJ4s29yx6QDUeqc=;
        b=BjswpStjpTpla3R36idQbpcUFJ2IVuh9/g17wlj35Z/xPiZvKoXScSOaRU9YL0Fze+
         TGt/8P7bCiIzIn4/ZCQ7Mnf4+Wyrc8Bf4AqeBYExqOjk0GkGgTV3AZkFDBMiwa6aQoKM
         qDscZ7houK6RQ4KsSuyHCLjI8ZBWEwS/BjEVVIMdxzRn6vOqhwHisf7aIfwvgSMxyRr+
         NkEAdLTOvBDfHh9hh64oIwTmbTvHKU9dQbQfgxKhYF1mZrM8sLFdRmwPb2aYBzVIVIr+
         3/uWs+Nf27U2/Gv+QbI/YPi89jJtUh64DW/sBuqgYfh3nIFueV5xsYQiv94MKtUwjmqU
         X+qQ==
X-Gm-Message-State: AOJu0Yy7LbcyIctshZ8EUQOz7V39oP0r4rkr0aMH4hKXPdklMZCLIqJd
	DNtRnW+FRzDBjuHszOCFNdVzdHHh0swRLzP5SWc=
X-Google-Smtp-Source: AGHT+IG2sSt5O+Fdl+ehkv2zo49dFB6zHNx3WC08nlneXegp0lF/st3nCBBHUdBUIrxhHgUiF1SDJqmvKqz56zkhgPw=
X-Received: by 2002:a2e:b947:0:b0:2bc:b224:98ac with SMTP id
 7-20020a2eb947000000b002bcb22498acmr766331ljs.31.1697701471793; Thu, 19 Oct
 2023 00:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231018102821.595049-1-martin.jansa@gmail.com>
In-Reply-To: <20231018102821.595049-1-martin.jansa@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 19 Oct 2023 09:44:19 +0200
Message-ID: <CAApg2=SO6MdrSGBGUT09-Dq4W6Ljx1ZF-msGvmbUWuePcR3AfA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: update to latest v20 version 20.8.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 07:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105592

On Wed, Oct 18, 2023 at 12:28=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> * updates to latest v20 version
>

This version brings a fix to CVE-2023-44487 and a number of other
ones, so from the security
standpoint it is something to bring in.

Cheers,
Marta

