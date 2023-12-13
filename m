Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C5FC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 15:56:13 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.39743.1702482965692418080
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 07:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPO4p8Pn;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1f0f94943d9so2700609fac.2
        for <Openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702482965; x=1703087765; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CD7cr85X2YHWtITfGYc7qfQLP6mGd3WsOT8lR6R76hU=;
        b=nPO4p8PnRmKj+UygFd1Li7dcNbsspcyDXznZJSLtBfwJfUwA6IggaM4Q7anlN6UPiy
         ZkR444jkwGxPX84UuN7CODqr8g4OkLIU0feH/nrFTTcQ2HcVGAPAQJBi+DIMjAiyRKud
         dWPx81UM1s5dNYHaicrG6sIVqN8LMlxN0kbk5LZB7c930RkuYVGZlO4pEJgqc1f6xkbX
         1Wedvlp8SSNc9xr/4tjuxuzwoNRDjpA71R9eBN80hgnX0o2cLvw8jXDKObBD2zrxJfA2
         Qj4VxrGQQW4/XxG57yR6ypp2tiIBEwRnqtBv+HqXKjK6beHWJMhfAU4KudLp43ujhkcS
         4rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482965; x=1703087765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CD7cr85X2YHWtITfGYc7qfQLP6mGd3WsOT8lR6R76hU=;
        b=sdFTC3g5L5znPteXNdzr4/YSz2kX8AKJWIczIg6yxjlK5vajLrjwFlWnyimwiywD4Q
         u3QJdDq5w0/iEIbWpS3XZeEH0Mm4kZivj4qsNaPGZyVudBPy7h+z9ApAif9Frvxwo/cA
         y5rgeuNjGaMuV1W5u7pN3wKOhWkYLWYBVQSei2oK3iFP6tBljkzjD+F14/2yJuwxVs21
         D6hbkB7qibyUcMxjS8KKjITOwA9ECPJ3+WHHPmm0ba966mQhHOsscgcuxQ/PZz/te++S
         +rOi+BLl3Zelo6i0/ZXMi5V5eKjHT3yympPcG7Etjf9prI2wa0nISB7cBZ7Vup88bgqc
         kSdA==
X-Gm-Message-State: AOJu0Yw0rBFHibYluga4FULDlZoallgC8kZqQzngTpVarsg9aBVJEDfz
	/51wc4DI++NBrMzyG57zUhCVLPBcGxv3LYTb3Mm+Tcpu
X-Google-Smtp-Source: AGHT+IFBP1qyXd3yr2/pqqCq7uZqVzA4yt8RRMPEoIZZxjpw7V/mWSs2654baSeqlRoMQVhl+Mx2W1G1SnSPA3MaDac=
X-Received: by 2002:a05:6870:806:b0:1fb:851:bc2b with SMTP id
 fw6-20020a056870080600b001fb0851bc2bmr6391377oab.57.1702482964598; Wed, 13
 Dec 2023 07:56:04 -0800 (PST)
MIME-Version: 1.0
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
 <170245126382.133993.15578168101766633828.b4-ty@gmail.com> <45C353E1-7C45-4BC4-A5A4-1697BA14E6E4@arm.com>
In-Reply-To: <45C353E1-7C45-4BC4-A5A4-1697BA14E6E4@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Dec 2023 07:55:53 -0800
Message-ID: <CAMKF1sr=8nggCC00K7_5KnHLy40zp+Zebr92WRxVDV9S09v95g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder aarch64
To: Ross Burton <ross.burton@arm.com>
Cc: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>, 
	openembedded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005751cc060c6634dd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 15:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107394

--0000000000005751cc060c6634dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 3:31=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 13 Dec 2023, at 07:07, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> >
> > On Tue, 12 Dec 2023 17:38:04 +0800, liezhi.yang@windriver.com wrote:
> >> Fixed do_configure error when build on aarch64 host:
> >> error: cannot guess build type; you must specify one
> >>
> >>
> >
> > Applied, thanks!
> >
> > [1/1] minifi-cpp: Fix do_configure error builder aarch64
> >      commit: adecc463a3c090e5a9c54875a42047a427384f71
>
> I stand by my comment that patching the config.guess is the wrong thing
> when we explicitly have a command whose job is to install updated
> config.guess files.


This is vendored code but I think overwriting config.guess might be better
way still.


>
> Ross

--0000000000005751cc060c6634dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 13, 2023 at 3:31=E2=80=AFAM Ross Burton &lt;<a =
href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex" dir=3D"auto">On 13 Dec 2023, at 07:07, =
Khem Raj via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailt=
o:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.opene=
mbedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, 12 Dec 2023 17:38:04 +0800, <a href=3D"mailto:liezhi.yang@wind=
river.com" target=3D"_blank">liezhi.yang@windriver.com</a> wrote:<br>
&gt;&gt; Fixed do_configure error when build on aarch64 host:<br>
&gt;&gt; error: cannot guess build type; you must specify one<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt; <br>
&gt; Applied, thanks!<br>
&gt; <br>
&gt; [1/1] minifi-cpp: Fix do_configure error builder aarch64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 commit: adecc463a3c090e5a9c54875a42047a427384f71<b=
r>
<br>
I stand by my comment that patching the config.guess is the wrong thing whe=
n we explicitly have a command whose job is to install updated config.guess=
 files.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is v=
endored code but I think overwriting config.guess might be better way still=
.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"a=
uto"><br>
<br>
Ross</blockquote></div></div>

--0000000000005751cc060c6634dd--

