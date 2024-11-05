Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4FAD40D0A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.31545.1730841902116956247
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SU76RLKg;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-28862804c9dso127835fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730841901; x=1731446701; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9BiV+pg2MdpOvZpypIV8v4adN8nWqQtKjg6cVpkVZY=;
        b=SU76RLKg6F54T8do/sijWqMFwqk7tyUIHYgT7p49//SfiF+YkohlhUwRAGn6Yq42XQ
         zSgd4A3GQu82vNXW2fiX1B0nPd9/FUgwlj+a0+c2JA2ykwF9JLcSEjUozsoIxK+ctWaY
         SffKmg+fzRNWtkljCagJY2pVwr7W9TgomWsnDfFJ5kSI/E3M8Qr1YUAv0JErcpjC9jjd
         yThzhWEh8V8sF7upmqnHP71aJzVms5DQKgTcLYkPfTPcUq/Biojf/V48UkTSdaRdHCyd
         hG9tSUx1CSD1evsARGPEJC9KSmA72craSba22dTaAHEzQXhn0gRZ1ZeHNC2O8KPGlCRH
         tRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730841901; x=1731446701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9BiV+pg2MdpOvZpypIV8v4adN8nWqQtKjg6cVpkVZY=;
        b=u9daT+4cill+WZk1dIYt4JRl7tyy9V3qLWbutKvf7kT+d+pItMqthyN+PIDBVql2yD
         PftxvdzA5TEFx7GA4pS1NSBkh3zpW8dPymCHEn0xQuqAfnBSgjWIc+tH+7uoiIdpmWOa
         AWbXMcy9rGCbQR5l74HGcckWX4XmwasUvVQ7YY5LKx0TFAeUIUslJXFhn5yweiv0ZJHA
         eZd8Wvh8xwyUXssF5/Wrkfx3k/eQ2hESs7m8cF/W6QOX1P+fHfJsZPhOO6fM2cyH6xwA
         mzDoIYl10iiN+45JhkIff8eCXACEh/st03HtiAp564A690M1j5SZSyGb0UiUR6k0Mc7w
         p89w==
X-Gm-Message-State: AOJu0YzRCPucy9h6GE7aGofzeOXw/toK3Up7MOTiP9k1wklP9Zw5KVel
	KJVrBT80jL9oDvbye+Eyh7sNSq3DmSWhIRS90nC+6FSL/BilLckNlNQUVxGPZUNM7K+8gVBISnG
	nP9sCQWgDT1NL/n6HveaWl61Zp5M=
X-Google-Smtp-Source: AGHT+IHfB3xbR+WXhZeWtQ3u8UJtoUOi9zdzM6yZMa4fAPBb59a64eOR7ndVGFoo2UeHazDS/Ka4kZNLPQMhnS0Fs6o=
X-Received: by 2002:a05:6870:1eca:b0:278:a71:2659 with SMTP id
 586e51a60fabf-2952a6ec770mr70631fac.14.1730841901093; Tue, 05 Nov 2024
 13:25:01 -0800 (PST)
MIME-Version: 1.0
References: <20241105183658.34982-2-schonm@gmail.com> <CAMKF1soPxY9ic1WUBPL4iXFgKA6eV8F0a8ab0nDvVfkyJ4Na8w@mail.gmail.com>
In-Reply-To: <CAMKF1soPxY9ic1WUBPL4iXFgKA6eV8F0a8ab0nDvVfkyJ4Na8w@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Tue, 5 Nov 2024 16:24:50 -0500
Message-ID: <CABTo8gA+4kJDeMOWOWqiAcwZdCa9XFxpVq9cyAQXQUD_dUFz8Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/161] Drop unnecessary SRC_URI md5sum
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113678

I did indeed run into mail throttling.  I will keep my submissions
shorter in the future.

The remaining 100-161 should be on the mailing list at this point.

Please let me know if you encounter any issues.

Thanks,
Jason Schonberg

On Tue, Nov 5, 2024 at 4:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks for this much needed cleanup. I see that it says patch 0/161,
> but then I only see 99 patches on ML.
> so something is amiss here. I wonder if there is some throttling on
> mailer or some such. so perhaps send 100 onwards
> as a new patch series. If nothing works create a pull request
>
> On Tue, Nov 5, 2024 at 10:54=E2=80=AFAM J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Following the note in section 5.5 found here :
> >   https://docs.yoctoproject.org/dev-manual/new-recipe.html?highlight=3D=
md5sum#fetching-code
> > drop the use of the SRC_URI[md5sum] where SRC_URI[sha256sum] is already=
 being used.
> >
> > Thanks,
> > Jason Schonberg
> >
> >
> >=20
> >

