Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB2BC77B7F
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 02:27:19 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.5301.1683599234104177602
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 19:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=i7h4+2AQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-38eda4ef362so2915831b6e.2
        for <Openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 19:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683599233; x=1686191233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XX/bFTTOP8NnO51wKyxt4UtjpQXvP677zfqXD6+NnQ4=;
        b=i7h4+2AQyWQeeSD68X7TaaGmZDAgR1VDRMKje98FhPsR5l8wKfKrNX5GngV9P+6xkh
         NO7kMA5rg8vNMPTYMB8BECotF7yPkHwbSF3v4nc+h0f9ZOZdAfSIMOK0h+A4zFqwRzkr
         e4GOjCY6emb19SOMp9Uw0pIeHPeUr1WzP1C+GUSSdZCpP55GEBxuJ/IvjLKxygYB2USr
         iIvZUzqR/m492Fysy2ga89Yfg3+YGMJCVLZYA2KkKnP77QkRBw53Iu1dDkIlBIuPJcWb
         4dpGn8b/E8+m/NsDREpDAXd3xsVHHPYiUCvQR8EIvJ6+0AdN8DFUz8JIm+OhTokNmqqI
         G2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683599233; x=1686191233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XX/bFTTOP8NnO51wKyxt4UtjpQXvP677zfqXD6+NnQ4=;
        b=Z5vecegdP+h7olf2+L8faQz6WMjMis+KDD1/JgZDTVeequOuWs7+B0FLhWiUDRFwoF
         rxrlflqB3npcD+FwG+OABDz38Gv52ReMZVRozsLxWcZzkSnHC6jVoFt+3eTI26MUnV7k
         2KbFJuyPEE6+jkJ5r7YIfDyfCzcEXz0Wan0j0XVEqjJmmCVgK7ua9YAspZ5DBkJix+Sm
         FucvGtjChbAkps31jY2qceCuABOSE1IJij6NND7WdWk48bCYrrVjpdoUOmfa2uaJUj4a
         b1WMJ/dODdxzIApLYVU0GHMIRQGBCfWavmdIr5Ky4M8rVxu0M1b6oMBm43sZvSJI4A4o
         /NSg==
X-Gm-Message-State: AC+VfDzB4hs18meWM0SAORrUjD1bs/x39aQK6CbZzKSQY+eXaeH4AsFE
	wPv9N5PGo7VG5Ri+8MI02WDumgDqcab3hknSR5A=
X-Google-Smtp-Source: ACHHUZ4idzGKbcaB3WUZqKL/1AZ5zZUweXCbhD2eLSyl+dJZKdrH7v5QPxIWwmEcn0tTvYndWmOKDedNDOKZfTwCXyg=
X-Received: by 2002:a05:6808:278e:b0:38e:7168:697f with SMTP id
 es14-20020a056808278e00b0038e7168697fmr478535oib.20.1683599233221; Mon, 08
 May 2023 19:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230509015915.77182-1-marex@denx.de> <20230509015915.77182-2-marex@denx.de>
 <CAMKF1srpymiiO36nnfAPgd-6J7ukysSfhqmBfgzd+wVTX9yQLQ@mail.gmail.com> <24de8e79-dae8-f0c1-3a18-26d85a12a904@denx.de>
In-Reply-To: <24de8e79-dae8-f0c1-3a18-26d85a12a904@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 May 2023 19:27:02 -0700
Message-ID: <CAMKF1soENH_ZY5L-FJqUyg=TvGUdpsiwqurC3f7fVhHaigiY_g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 2/3] lvgl: Reinstate git submodules in lvgl-demo-fb
To: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@denx.de>, Martin Jansa <Martin.Jansa@gmail.com>, 
	Openembedded-devel@lists.openembedded.org, 
	Philippe Coval <philippe.coval@huawei.com>, Philippe Coval <philippe.coval.ext@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000003d887a05fb397e7c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 02:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102452

--0000000000003d887a05fb397e7c
Content-Type: text/plain; charset="UTF-8"

Yes, please!

On Mon, May 8, 2023 at 7:14 PM Marek Vasut <marex@denx.de> wrote:

> On 5/9/23 04:13, Khem Raj wrote:
> > Are these patches on top of previous ones ?
> > Or replacement ?
>
> On top of previous ones.
>
> Do you want a squashed V2 instead ?
>

--0000000000003d887a05fb397e7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Yes, please!</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, May 8, 2023 at 7:14 PM Marek Vasut &lt;<a hre=
f=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On 5/9/23 04:13, Khem Raj wrote:<br>
&gt; Are these patches on top of previous ones ?<br>
&gt; Or replacement ?<br>
<br>
On top of previous ones.<br>
<br>
Do you want a squashed V2 instead ?<br>
</blockquote></div></div>

--0000000000003d887a05fb397e7c--

