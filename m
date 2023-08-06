Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15491C00528
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 19:12:08 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.17318.1691349127538521117
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Aug 2023 12:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ghsjlkdx;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-565f2567422so2611960eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Aug 2023 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691349127; x=1691953927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58vP9E3zg3l5F/Nw5sCGCCOaes5A39MY1nco/fxp7hM=;
        b=Ghsjlkdx0jia46BCzLuFtXoXAWUQ+yaIio66azdmeJ/nxfSzl8WDDOmtARwrONnmRc
         oJU2ddDgwrLd50hTsKI/C9GOe6suyDQx8c22JXHwO3fwOHPZALM2VaN+KXg/Eg+dS81F
         vV1oqU6XbfIqQKU0xEdqJfqojASEOrWgWp8eIDYeWSJi5Dva4IzYCtq6ojp7Jz4MrDhy
         G/S45k+EQrHJLDMUwca3a/DEiQvmepAYdeSQy/M0Mt3kDuCobQItoRLa2Qn6wyXq15R3
         BZdjY3zJTk5P0M4jTrone1J9CHbPxT6petvvERIELKVlTPhWNGTRgZNtne13Xg6MV9kS
         3ZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691349127; x=1691953927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58vP9E3zg3l5F/Nw5sCGCCOaes5A39MY1nco/fxp7hM=;
        b=RiivuvFltRZsnLbYIHHKTDN/JyHmmJDowhpPxKN1UvEcNjKqq8GDAmULdOZAwmcLBr
         KRbT3Wtq+jYoBGqW7RbbtXjsC9if5f+wA/h9GYLC/m/bPlgT2ZU6nSqsKpjI1lH3o6VQ
         mVGiFGJPeuv70RZ0JVBCPijY2Qo9vJVMvorYTc0z5AL6K53KCTnftchcUIxeXzX1n1jD
         nQhol9+faH9DvzkaQs/vRU63W3HXT3XsnxXveO2pWbwK5QH8uJMXiAULpKNgjHsyZ/3y
         bJ4Xp/p4VXhJOY5kJ427fEaTx0BvCrR4wd1Zgh+rbq9axejd5YmWlQ0ipAgX3K918pp8
         pTmw==
X-Gm-Message-State: AOJu0YxufOxbnzJMF+D41/Co2Td6J93rjet2OTdUhy3jnOKr3hH8oRaS
	7q3+sLjDWXdUryzXpjHFMCYhP8evDXFKel+I1Kw=
X-Google-Smtp-Source: AGHT+IHiz5i2QniqpQ9Hd63gJWhncItNhq0k7a68XjVyRXrieCGe/kTJtRxQoLYAwE/JcmL45R5emMUiRpSo1T+GFHM=
X-Received: by 2002:a4a:9209:0:b0:56c:d9d4:e80d with SMTP id
 f9-20020a4a9209000000b0056cd9d4e80dmr7535844ooh.2.1691349126664; Sun, 06 Aug
 2023 12:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <bda36b56-b77b-d348-8b1b-22a7015aa48a@gmail.com>
In-Reply-To: <bda36b56-b77b-d348-8b1b-22a7015aa48a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Aug 2023 12:11:40 -0700
Message-ID: <CAMKF1sr5JB3yTGOv+ttMvCfL4+yKgTn5Xkc_5_g-N=+9sLBt=A@mail.gmail.com>
Subject: Re: mickledore merge request: Aug 6th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Aug 2023 19:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104297

merged thanks Armin

On Sun, Aug 6, 2023 at 10:31=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 03fd1d368ac19793b3e4c35159ba2ce802247e=
4d:
>
>    yasm: fix CVE-2023-31975 (2023-07-25 07:15:34 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to 75cf318cef3b4ee81fad2782cf063ecd69ba8842:
>
>    lmsensors: do not pull in unneeded perl modules for run-time
> dependencies (2023-08-03 16:46:11 -0400)
>
> ----------------------------------------------------------------
> Beniamin Sandu (1):
>        lmsensors: do not pull in unneeded perl modules for run-time
> dependencies
>
>   meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>

