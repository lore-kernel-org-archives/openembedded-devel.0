Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0F3C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 22:44:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.3552.1644273842029558490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 14:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i7MEIxRV;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: festevam@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id u18so33072674edt.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 14:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IuWt0hU3b2VtkfxRCo36ojxeW22dFWbw39WQnwJjFQc=;
        b=i7MEIxRVi75vQC+hg4xjujToXzs3+U9qdZ+6noztj4d6S8ufPImOQ6ng7pULw/6WTV
         VO6FIK8hs8q5QjhACgAhz108Mhl28BDYTlcQ/iLF6d0KIQiTcVxHVIp8yFh7HMIOHCTs
         SeEXrmKK9+S3P976fdAopMuaNhj1VmcpVGAG20fVU4aNFm9ZKLVHa9zvFZ58q4GpiKYy
         zAsuE1C+U3rNhEHPw87InBMxTSQnSzjUKfrIydIf1+/iyTIlzedpHpyA42YlnYOvTS5u
         WmJeL547N+pPbR/+OaQt3ihKgrYQ3vbMCVTaCE52eQBeQ9bUFu6i1NF8HAbyfUcxINWk
         lFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IuWt0hU3b2VtkfxRCo36ojxeW22dFWbw39WQnwJjFQc=;
        b=KStLyQaxioq/xbbdCsVuJ8tTwc6B16qYwS4qx7UZGjxaM/zgw8BNCUOaODvBtWJ6FA
         mHnuAZ2uMcp9tXe4KHWjupdM9ZgnjgXmLpGle7mf1pgSXjq7XPPOgozYbidsVHvLN5el
         M26WYnd62b6xLonlQNfh9wy3Hj8SKLaYAA3Pn+6IXzGRxo1gpV1lFIsBeIkQfRJLoPu3
         rBjt/AFt+pQ0NhHVx5IlUUOMiLTF8zV2Xg4MlyNVWw1fpm2dj/sbR90rj+KQy1tAnAKk
         XA7cbMfwjmVzyLgX8l1jmUD2XXNxXDdgFy60OK6sDQK2MOwfwrtPv9T5Rbyez0CcXpvf
         JbKQ==
X-Gm-Message-State: AOAM533Nvje5e5JVCUMaaYScgqXoLztDVAT3vbnU+M5HJQxaOAx1k+fO
	7m4W3abf3SwHnRr5aPXmgm19Hb/LIiRKbmN2Bj4=
X-Google-Smtp-Source: 
 ABdhPJwgiLm0kP5YflXdeidNHZSACCMBAog7k8Eu+bKhaAC5QWEawxSAs1iun02106Z6JIyZlNAZMkZYcMhjyo3duUg=
X-Received: by 2002:a05:6402:358e:: with SMTP id
 y14mr1700494edc.136.1644273840322;
 Mon, 07 Feb 2022 14:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20220128195459.216370-1-festevam@gmail.com>
 <CAP9ODKo=OPqMvbuP1p6zJSPFObxskdaBPjVW8M2LKLQ3rzwHgg@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKo=OPqMvbuP1p6zJSPFObxskdaBPjVW8M2LKLQ3rzwHgg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Feb 2022 19:43:49 -0300
Message-ID: 
 <CAOMZO5BJfkfo0vecgy6bHBJCfd8vGHb34zpcqTs9WXZUVW2q-Q@mail.gmail.com>
Subject: Re: [PATCH v4 meta-oe] rtc-tools: Add a recipe
To: Khem Raj <raj.khem@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Heiko Schocher <hs@denx.de>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>,
 Fabio Estevam <festevam@denx.de>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 22:44:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95248

Hi Khem and Peter,

On Fri, Jan 28, 2022 at 8:57 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Em sex., 28 de jan. de 2022 =C3=A0s 16:54, Fabio Estevam
> <festevam@gmail.com> escreveu:
> >
> > From: Fabio Estevam <festevam@denx.de>
> >
> > rtc-tools is a useful utility developed by Alexandre Belloni
> > for testing RTC kernel drivers, such as y2038 support.
> >
> > Based on the initial recipe from Heiko Schocher <hs@denx.de>.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Are you happy with this version?

Thanks

