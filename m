Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49C8C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 21:12:14 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.4799.1699996329094917414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 13:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RBLy9hco;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1f0f160e293so3859485fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 13:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699996328; x=1700601128; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXDS3xHcUEBHd6j0kibBYQcsR0nRHw8YQQDA3XtBeUU=;
        b=RBLy9hcoayDAN9EC305E3BWe1ivRzzHuJZCK3e/YSQ5Obf2fIKCNUoSfj+IoJvJGhQ
         CJh6RIB6YqCpR0aSIzQJ011dD9Md0MOaLZIe818d33Fl2T2BshXNO0B5HtZDDsrGi7lw
         8Xoqre3Qs2VQgkdi2WXfhiUgAxJPXO05hXJVx8aAXlGIvQri5Cq3/Y7aOm/Pl6ZxQqmS
         br6YJkF3+dAoa2HQmc6Aqrikjok0mvju6xsT/w2ruVWIfpf5JVz+rBgNybxa93LIHpDb
         5d+FKa1ysUgzIo+k20Rl3267LmZCzhiYWfASx1Rpmij8q0eQzSC9X5Cr4j3wwLF9YYQu
         TtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699996328; x=1700601128;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXDS3xHcUEBHd6j0kibBYQcsR0nRHw8YQQDA3XtBeUU=;
        b=Bi5l79fsfyVDAPZjDaNZmCAqs4RYQJQwAPtXfMlTedfAWBkZihxOQWzcSD2VZaUeJW
         5gtJRFM/SkJm/W5/SxSuveeB7hB/pCVu1QdEwqr+3H6xN4hgFi/MlZmYYYa47N28KEkj
         6vA9dljsZayQKtxf/1VuDcB3OBSxh7bfc1OEckd8QzvZQr7I/QNqaw52Tn21XtYTZi2x
         I5OF1LJ873vGkHiq5cs0YGjxKrpEyIZ9HNAWNZDOerDZU3G8ND/2eCInmsF2/UgtXCMc
         Qr4kNpTAKT4AWpCbnsQODGsEGxCZ+JLaHmjKMryFinbsYZAptAqT7qXaaBWMUAw711P3
         +Dww==
X-Gm-Message-State: AOJu0YxQuRC0YPpkl5i+OJDp/lAK3h6qmlxcDd4WswLkRmNv8TyUQ2N0
	iCQbuy0llw/UqAwciI0uCJpd9j8RD2mDKlGqrT/vVk4xAXmQ2w==
X-Google-Smtp-Source: AGHT+IHgHwP7fE96CQxbjc4wgtTN0yg+nbt6QdzpQ3Sz1rIGflkpzJukUZ1rc5SckwdK98O9BVPh2qnWl75RbFfWHmc=
X-Received: by 2002:a05:6870:2247:b0:1f0:8122:554c with SMTP id
 j7-20020a056870224700b001f08122554cmr14595194oaf.45.1699996328017; Tue, 14
 Nov 2023 13:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20231112005941.3689515-1-f_l_k@t-online.de> <169990042605.4418.17328445695395731594.b4-ty@gmail.com>
In-Reply-To: <169990042605.4418.17328445695395731594.b4-ty@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 13:11:42 -0800
Message-ID: <CAMKF1srYX9KmCav5t3fXiyDUwLDGdaLCB17ycbfRQsXPdoEa8g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] cups-filters: Upgrade 1.28.17 -> 2.0.0
To: openembedded-devel@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 21:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106724

Markus,

Although I accepted this, soon after I am seeing this failure

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3341/step=
s/14/logs/stdio

I wonder if its some sort of race condition ?

On Mon, Nov 13, 2023 at 10:33=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>
> On Sun, 12 Nov 2023 01:59:41 +0100, Markus Volk wrote:
> > - `universal`: Enable `application/vnd.cups-postscript` as input
> >   There are filters which produce this MIME type (such as `hpps` of
> >   HPLIP), and if someone uses such driver on a client and the server
> >   has an IPP Everywhere/driverless printer, the job fails (Pull
> >   request #534).
> >
> > - beh backend: Use `execv()` instead of `system()` - CVE-2023-24805
> >   With `execv()` command line arguments are passed as separate strings
> >   and not the full command line in a single string. This prevents
> >   arbitrary command execution by escaping the quoting of the arguments
> >   in a job with forged job title.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] cups-filters: Upgrade 1.28.17 -> 2.0.0
>       commit: 71e6fa9b086cdd8c0c30afbda48c2f40add8cded
>
> Best regards,
> --
> Khem Raj <raj.khem@gmail.com>
>

