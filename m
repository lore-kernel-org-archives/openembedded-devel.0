Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1ECC54E60
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 18:19:47 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.17929.1710008383228434537
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Mar 2024 10:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KcmJHo91;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-21eea6aab5eso1770527fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 10:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710008382; x=1710613182; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqDGjnsC84YCHSY7E7Qe62rZFSeXSlJ9fpvOS3f2nOA=;
        b=KcmJHo91WOiK3fnZaAz4TkY+TsNLzEd4wQGILLpK2aFOADOIs7xNmLkfKho7CGvVKO
         evwtTzdF1XRvHkLpH56W2ligUZ9x/afNj7QcSHU5k41RmIxstjBlHQNvPA+SHD11LeGF
         2TmTl/y26rXth7r4BtejE9R/V6+65kiMPR5/osWcRuGd+vmqR5JVMx082XWluU9uNU4Q
         UOdFAlqjO1PFk6IF/NwDUSdpoX6ZeXxlZjP/1ZW5wIYkoJ0YN7dC8FJiN+SNSG5v2OgS
         EU2HnYWK+xRGHf25/+XFbSmp3Frx08XZSOZ+Dixdn/tGiaTgu2KDZhbmWVXRIUX+9dzu
         1qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710008382; x=1710613182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqDGjnsC84YCHSY7E7Qe62rZFSeXSlJ9fpvOS3f2nOA=;
        b=iyD1hVz56O+fhsP2kZNq9czNR3iKNd4BZJgngVy4ewJdztoMsjpTjAmTVi3jb6iDJ+
         6FeymD2rkuqIfQBkTEBJSQcpH2q1ReW9f+shnpLrgSVcYwk4CZh6yn3cXt8UhJ0AReDz
         DcT/xOML8SL8XtjEhMZcRl3UqVt+Fv6281qZk2sVbPoKVfFvasbvMn1XGDMZR0ORnPuc
         R19TwaftR02zAZVEPXNDfChExk0K4c7LFkOjst6zIQZceOJRQZRJcNbcBWRhmIE3H7ZU
         c+dNmQWslp2bY+AM8kaBL/3W+he8KTR2VIXzVWhwZ+E3wlfZhTCS40uRTfmQcChnV3+F
         sMJw==
X-Gm-Message-State: AOJu0YxnNfNc3eReCqRqWJGmdwMqoTTdOkY6Rw9/c7fR0Kk167QC4qkq
	blFIdSVS/LhA1P30MLQTzZDvAFC6kHu1aWFhRxmlX/PXwHM1XCl2tQ1oWsaZ41R/8tnBkOAeAn6
	fYD8fp3mpwXRbfa55fmIPPYIDOtT00zmm
X-Google-Smtp-Source: AGHT+IH81cNMCAqm8UxKLboLDiddULPYSzh0zcuvJI3YmCArjSMUhcXkuMwNNkRP89P9S3Q6AazF5YduoYtMpBGMDCA=
X-Received: by 2002:a05:6870:1707:b0:21a:1aff:cceb with SMTP id
 h7-20020a056870170700b0021a1affccebmr2781179oae.18.1710008382293; Sat, 09 Mar
 2024 10:19:42 -0800 (PST)
MIME-Version: 1.0
References: <5e5b1265-8ad5-659a-72d7-15861ce55f50@crashcourse.ca>
In-Reply-To: <5e5b1265-8ad5-659a-72d7-15861ce55f50@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Mar 2024 10:19:15 -0800
Message-ID: <CAMKF1srfEKmni3ESrFJyaJhky=CZNGpw_Fo5qNc4kqzR_87cFw@mail.gmail.com>
Subject: Re: [oe] "fmt" recipe inherits ptest while having no ptest content
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 18:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109245

likely a copy-n-paster error or perhaps work in progress left behind.
Its fine to remove it.

On Sat, Mar 9, 2024 at 3:03=E2=80=AFAM Robert P. J. Day <rpjday@crashcourse=
.ca> wrote:
>
>
>   just noticed here:
>
> https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/rec=
ipes-support/fmt/fmt_10.2.1.bb
>
> that that recipe inherits "ptest" while not even supplying a run-ptest
> utility, or anything else normally required by ptest. yes, that recipe
> does provide a test suite, but without wrapping it in a ptest harness,
> it's not clear what this means.
>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109243): https://lists.openembedded.org/g/openembedde=
d-devel/message/109243
> Mute This Topic: https://lists.openembedded.org/mt/104825821/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

