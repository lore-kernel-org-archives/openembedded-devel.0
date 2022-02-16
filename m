Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBFDC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 21:24:29 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.1468.1645046668523510320
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 13:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PTNFEsgd;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id n185so2899710qke.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 13:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fYp8SACIHZuTacmk02cF+yPRKuv8TC3c4dBkvJsEQhY=;
        b=PTNFEsgdjHC6So3fKA4yKJ8iToEnhUw/3GlxsYSkw9JwJs7312dbv45DVDY1qaMpno
         gn9Ru7lWKK3XOuRoOTFKqXkj7irPgVDNURgombFf/O68Xk1Ru3IycX8rxPT2EM2PQGs3
         cchscm9VszbPKfHw0xr2bwrDhMRtv1aid1zEnF/BjKeZPHCMWx3NrD2dmT1F5dGqw+bV
         s5fRUMa21eGyawPDWd3M9bsVyhPGdIwuM8HRIH8A0cZJA25GKWaaGazDs8riudXhtx4+
         t1kuW77iLgUJzjnXHpdyZG8ZHmsyMUxstU8J0X73A21x1hS/iO7NDJT0noFFan/rGh71
         PIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fYp8SACIHZuTacmk02cF+yPRKuv8TC3c4dBkvJsEQhY=;
        b=mkvbR7u2Wvt3zGWwYzr+Fi2TgYSyocsB/HTBL2oG2H2SjcrpRyesM9nfbuZyKeCIJL
         /cXFFiEHnVAZeJgmu+CraRIw4t/7ouId0vHR/GvS/JBIO4gxBFURd9h0xgD6EXdB10i6
         6iNOxDdabox9pbH0etZygqKu13c4/BKIfcEBQZUKaXpAwZFBhVnijFYGrFcWp9PPb5Sd
         0VTtiuK/b00hoHXNQhFBfmP3+RocOYXjFyssk1OJizOgPJjWRIY5uTWKVWmvcX6rcPcY
         M2qzGd6QS3llmXAD0CuW8C8FVVFypi7Rew5DGcEI74PS6y4q1NgFclsUy7KcWTZVgiwZ
         n3WQ==
X-Gm-Message-State: AOAM533FbezJw/Nl9GVKzsEylo4XDYCi/096d47CK3+usaupX+I//U7T
	mKHaLfA06kChBzucyr+lJIQ1O32EHtwnlm/P7wM=
X-Google-Smtp-Source: 
 ABdhPJwpVHnF8eh3u0HjGjC6wIgRuHVuZympvKFz/aeObQY/cZ+1juFCiliMAtJ4YbfnJOxnm1ncWqGDAZyV9XUq3XY=
X-Received: by 2002:a05:620a:16d5:b0:60d:d3a7:af9e with SMTP id
 a21-20020a05620a16d500b0060dd3a7af9emr690219qkn.463.1645046667545; Wed, 16
 Feb 2022 13:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20220216171002.2338962-1-festevam@gmail.com>
 <CAOMZO5A4P5_bS+-mspJHYtCqRY9EzVnDKqDq_FEREA2U7XP-Wg@mail.gmail.com>
In-Reply-To: 
 <CAOMZO5A4P5_bS+-mspJHYtCqRY9EzVnDKqDq_FEREA2U7XP-Wg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Feb 2022 13:24:01 -0800
Message-ID: 
 <CAMKF1srt=LanLhizY_3D+VyFACq0xJJ6v_K5T77iojUOnEEu-A@mail.gmail.com>
Subject: Re: [PATCH v2] rtc-tools: Update to 2022.02
To: Fabio Estevam <festevam@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 21:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95351

On Wed, Feb 16, 2022 at 1:18 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Khem,
>
> On Wed, Feb 16, 2022 at 2:10 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > From: Fabio Estevam <festevam@denx.de>
> >
> > The patch that adds the rtc-tools Makefile has been accepted
> > upstream, so update to the latest 2022.02 version and remove the
> > local Makefile patch.
> >
> > Also, rename the recipe to reflect the new version.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> > Changes since v1:
> > - Use the 2022.02 tag (Peter)
> >
> >  .../0001-rtc-tools-Add-a-Makefile.patch       | 39 -------------------
> >  ...tc-tools_1.0.0.bb => rtc-tools_2022.02.bb} |  6 +--
> >  2 files changed, 2 insertions(+), 43 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
> >  rename meta-oe/recipes-support/rtc-tools/{rtc-tools_1.0.0.bb => rtc-tools_2022.02.bb} (64%)
>
> I see that the version applied in master-next is more similar to the
> previous version of this patch, ie, without the recipe rename:
>
> https://github.com/openembedded/meta-openembedded/commit/2cbb945d69104ffa51cba655626e66b46ee42380#diff-902da3ea68cbf9d19e75fd71125e1c0d61ee5d611640a7d1e7df36d277312600
>
> Would you like me to send an incremental patch doing the rename?
>
> Please advise.

I have taken v2 as whole.

