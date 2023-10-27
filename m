Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB6EC25B67
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 08:47:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.2734.1698396437376598784
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 01:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LozSGnN5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40839652b97so13154835e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698396436; x=1699001236; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSsFPXiKrXnjU0lvpKss45OHltThvYREa1Q6SPnU6eo=;
        b=LozSGnN5u5uG1QzIRU1yrR5wU1TNCWXW0SAI9cYkOBOitlEwoAHUPHVBuXsu8PL5T1
         sD89cyr6GMU+u3/RUZ9p73aNQG0R+NBLazsBQCqiJf+F8W7tP6IOZ/Xm8AlM1DJ9OEAj
         O79ONFl3dBbCkqcQiNtFEpNpWqIyGu8pImZHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396436; x=1699001236;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CSsFPXiKrXnjU0lvpKss45OHltThvYREa1Q6SPnU6eo=;
        b=Yf1G96sDBCvkSewNxKS+CU37talQcIHjcKgYpf790VsBkcEKB/5uwJMxQiGL+VYvPZ
         MfndnRgCI+XGYv6Cz1naEF0Uf/hikrnokEObbLo4Ojb7EkcT5smXPxdHQ333FWSQ11RS
         hcEWNH4s/mXLb4VLGgv4OIGmELbMjP2IuGEG2rWxAUKQixxj8QWXqVTlgWyPpC0ybakQ
         O8oRUPPPxj97mK8Y7OlhZsW9fS1MeevjhKg6ZriEk3YbdX6EFUmgQ1Lpl7ohFip/7g7e
         RLWjgXDAN79pjqQhB1Zq9fs7vcPjjjbpGZzmhMph4AMW+BQ/Lo0EXIoa5C4v+POf4n1L
         G7QA==
X-Gm-Message-State: AOJu0YxORUugkKiIooM7xDfzUXjXCSKdnrBLJiBjEnM/M3d7Ut8BmArI
	5JmVJYsZ/uBCxpXFRXh2co+akg==
X-Google-Smtp-Source: AGHT+IEHSWgHqgPjacgPja6E9gD1BzdAtMotLKu1dEyNV1TKhBhw2JL0Fl/Js6aFP5oRH5w2Vk1WZA==
X-Received: by 2002:a05:600c:3148:b0:405:1c19:b747 with SMTP id h8-20020a05600c314800b004051c19b747mr1776270wmo.15.1698396435649;
        Fri, 27 Oct 2023 01:47:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:35e4:65b9:f46b:317d? ([2001:8b0:aba:5f3c:35e4:65b9:f46b:317d])
        by smtp.gmail.com with ESMTPSA id l25-20020a05600c089900b004081a011c0esm4480573wmp.12.2023.10.27.01.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:47:15 -0700 (PDT)
Message-ID: <dd6e6c3fd32a5dceca5cdbfd2e957a078f8551d5.camel@linuxfoundation.org>
Subject: Re: [oe] [meta-networking][PATCH 2/2] mosquitto: Support building
 for native again
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org"
	 <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Oct 2023 09:47:14 +0100
In-Reply-To: <DB5PR02MB10213D8CAF3145B001F1BC75FEFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231026132203.3840009-1-pkj@axis.com>
	 <20231026132203.3840009-2-pkj@axis.com>
	 <2cbe64d28d7e2655f109b45d0fcf8b4317367c72.camel@linuxfoundation.org>
	 <DB5PR02MB10213D8CAF3145B001F1BC75FEFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 08:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105770

On Fri, 2023-10-27 at 04:51 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 26 oktober 2023 22:13
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH 2/2] mosquitto: Support
> > building
> > for native again
> >=20
> > On Thu, 2023-10-26 at 15:22 +0200, Peter Kjellerstedt wrote:
> > > Support for building from native was removed in commit e1b332f2e
> > > (meta-networking: Drop broken BBCLASSEXTEND variants), most
> > > likely due
> > > to no support for building libwebsockets-native. That support has
> > > now
> > > been added, so it is now possible to build mosquitto-native
> > > again.
> > >=20
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > > =C2=A0.../recipes-connectivity/mosquitto/mosquitto_2.0.18.bb        =
=20
> > > | 2 ++
> > > =C2=A01 file changed, 2 insertions(+)
> >=20
> > I'm a little curious how this was being used given that
> > libwebsockets-
> > native was missing? Local changes?
>=20
> We do not have the "websockets" PACKAGECONFIG enabled.

That explains things, thanks.

In some ways a better fix might have been to change the native
PACKAGECONFIG and reduce dependencies and build time? That assumes you
don't need the native config to enable the target one which I have no
idea about though.

Cheers,

Richard



