Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CEAC47073
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 18:50:03 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.21556.1704653397216379115
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 10:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZsVoro5m;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6dbc4675749so637074a34.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 10:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704653396; x=1705258196; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JdcyJnv4U397xke8fBZsB3JG+ykXHNoB89D1mv3BqQ=;
        b=ZsVoro5mpIygCKUnXZVlRH5Bg+eTT0Q2LLxVIltq3cmBFtcZSHvMBu40bs5kCq5j+m
         Sphz3UKmkNdMu2iSfO6UL4k4iTv0wLz0QfGFrAbN2Xac0Yi7RZGaOeEHZJfTvu8qFAEd
         zxGO0W7hojMnml93lhhJU7ldZfwQwrQN2kbNwG1kBPIoNr+hftwq/Ue57ojRTIACJtcv
         uWqPtg3BV5yOl7mhGFtp6l950VqPAjnKiKUijruluYw7eGlGVD8cUDx/HITQrvs1ehFc
         2QJvFkFCtTeAhnNu2VpTB9/PftIZ7VKhB4kl7CK2tVikHYIlFW1G61ozi/WQSPD9BsNH
         fsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704653396; x=1705258196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JdcyJnv4U397xke8fBZsB3JG+ykXHNoB89D1mv3BqQ=;
        b=DSu15FvTElncHCVY274y5K4uMqh4OXojhVLknGetUbRPBbiMrUZbVf2+KzE3+wL+FI
         AuSMWCVofQA+Qdhf/3H3jrbA1+o/2XT4AJFSvVnRJPinYjXBPB4wwH0gmI/Co3dHzpI+
         W7pM1g0iSy3Wuba5RbDr/OV8j+5PbCSRZIdPU0gIwFUE+2M0/ugDtMzy2sL0KWivUmhE
         zujKr6Jz9NEX4O/8fuwy6NH4LDQyELjcw3rYVYos+V/qPS2m2Uo+STeS/6rXw/x+acYU
         qZvmnQT3M3ZOQZ1RKrrrvvSVEGhuIoBpd9zED0QHiAwwwcpXDRC6LKWejmI1uBJw2fh7
         xeBA==
X-Gm-Message-State: AOJu0YynRFGp+SFsO85+m4XgyyRdq9iBynuLgTwbofCAicVlDX/zCoV5
	gjBuaO5sRreaCPlpzFKeYW616DAV9JbRh7cdBUE=
X-Google-Smtp-Source: AGHT+IH0umU0g8g3CtNqKZyWsT2KoYkrn1MZAoKLWte6Knv4hBnS90gt+banJY3jKdlRBr2WxLAvLamS8xXv6Hv4VPA=
X-Received: by 2002:a05:6830:314a:b0:6db:a0f3:76ef with SMTP id
 c10-20020a056830314a00b006dba0f376efmr1167332ots.61.1704653396331; Sun, 07
 Jan 2024 10:49:56 -0800 (PST)
MIME-Version: 1.0
References: <2ff316e5-1456-4b3f-967b-d4e7f63c9096@gmail.com>
In-Reply-To: <2ff316e5-1456-4b3f-967b-d4e7f63c9096@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Jan 2024 10:49:29 -0800
Message-ID: <CAMKF1sqRezkn+8_PrDeuKdHr=e+WD1k4ZOxMtfGFzYonmr2v2Q@mail.gmail.com>
Subject: Re: mickledore merge request: Jan 7th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108077

merged thanks Armin

On Sun, Jan 7, 2024 at 10:21=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit f29290563cb821fae95340ba959749641c69ed=
7f:
>
>    python3-django: move to version 4.2.7 (2023-12-04 09:47:03 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to 8e1f0fa6bfac0e96fedc666fe9066f92c85afb27:
>
>    nginx: fix CVE-2023-44487 (2024-01-07 13:15:11 -0500)
>
> ----------------------------------------------------------------
> Alexandre Belloni (1):
>        poco: fix branch
>
> Meenali Gupta (1):
>        nginx: fix CVE-2023-44487
>

