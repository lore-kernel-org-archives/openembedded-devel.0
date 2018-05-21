Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2296874E88
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 18:10:58 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id d4-v6so10495565ual.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 11:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I8t3AA9HkYj3cELW9zlfSjicFlk7OCbwsY1GuqVK3Rg=;
	b=kzbAjXI6WqkO2aY/HJKlpyVw8bWIyPOg/EoPU1cEBvmziyO0T0k25aLYS1uuxEcBT7
	rYu2q4XwplFKyi2b1ZpKwvqCLqMhu9L5bZ2UJTq9vHL4cwue2EJwL2JvjYilKzVTWBUp
	HJh3nuCP8zPie5ufKXEjbhgixV/dkPbNOhUsWLP+IdZfShHTiITmX54IuUOht3bPvx8/
	zxuKTQ1QUXNwXXjOJ9CbxRa3s0yuMqEnT/t7ZwCkeYX1PgcroxvTfDDTLv70b0ju90IG
	N9751zCOdt+mztBcyH7UYxEy/vWBLD4458T3lpU0uL7FEgkij4HY6KFw3/yYu5ZHwc39
	ctlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I8t3AA9HkYj3cELW9zlfSjicFlk7OCbwsY1GuqVK3Rg=;
	b=L+ET7crWtXsZJde6TVhEd9Rkj9+XgoRQiNh9QprzCLpkcVaWFPLiO7ym6LAzuMtXMQ
	kL8KjPOnoemNHHrIkRa1kPfpFiv6wgceZmEjSu61+jE4ZBje4n2leLHSEuuycbbfJMKx
	v2lKxw3TIUMcZBjmtExSrHPtRc++hrMDxITNCIDXwfhofDflbsev1b/F7ZupOhZwgHRb
	Z6YTgVLhDy75Mk/V5h/YLYDqkhIBVbX/gPHJpeAWvs+5V3Zt1lKrDU1Cg9LH79JtREZY
	Q5KJeLVDhgeLQc4sCEzVViajr7IWsxbVPIMsh/SP5mEc1K53H6rvoqVEKyRCgimcjTkt
	tE0w==
X-Gm-Message-State: ALKqPwdoTOROuI7hXq3H6lLOMoMCTvknKqd3go6bIiZxd1P0ISWbXCri
	0GOk1qMfMHhrZnN7eBgBR/LOmrCUWc9RgTgc8oo=
X-Google-Smtp-Source: AB8JxZpP3HBfwov1xQjulYH1s/WVSkaMs98AVwAHZ3OJLpfLa9Qql6O6RYvusYGAEPNH1ENmnjirxuL54NV083c0iOc=
X-Received: by 2002:ab0:1567:: with SMTP id
	p36-v6mr15503458uae.81.1526926259738; 
	Mon, 21 May 2018 11:10:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Mon, 21 May 2018 11:10:59
	-0700 (PDT)
In-Reply-To: <CAHUNapR44Bg55=N60PC1-qKKMjag4eVD7a_YoO3b-CDrJm5XOg@mail.gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
	<CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
	<CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
	<CAJ86T=Xxw__E-+8Zf0PZnOAe1SeMB2ayMZZu-Gb=19ckh8=TtQ@mail.gmail.com>
	<CAHUNapQ0Ywt2-xtp0==FozFhsPSnbBTEDReckkE1TVaxdtCn3g@mail.gmail.com>
	<3f41b911-4fde-1ed1-76f7-650dab5dbb20@gmail.com>
	<c7fbbf37e1ff4631a0aa3b45c07544a9@XBOX02.axis.com>
	<CAHUNapR44Bg55=N60PC1-qKKMjag4eVD7a_YoO3b-CDrJm5XOg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 21 May 2018 11:10:59 -0700
Message-ID: <CAJ86T=U5THX1tOFnTzBwr1sMoRvLqFiwqNbn0HT==fv5o9Mo-A@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2018 18:10:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 19, 2018 at 12:35 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Sat, May 19, 2018 at 7:59 AM, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>>
>> If you do, I think you should spin the patches for the clean ups as well.
>> At least I agree with (most) of them, and on a whole they definitely
>> improve the recipes.
>>
>> And I also agree with Andre, that in general it is too much trouble to
>> generate clean up patches in their own, which is why it might be better
>> to allow some clean ups together with actual changes. Otherwise they will
>> not happen, which in the long run deteriorate the overall state of the
>> recipes.
>
> I'm happy to slowly go through the recipes and make formatting changes. What
> is the accepted canonical order of variables and segments in a recipe file?

The OE style guide states that it should be considered the canonical
reference (rather than for example contrib/oe-stylize.py):

  http://www.openembedded.org/wiki/Styleguide

If you stick to non-controversial changes such as ordering of
variables then I think it's a pretty good set of guidelines.

It hasn't been updated to give ordering for PACKAGECONFIG or
BBCLASSEXTEND but the conventions for those (based on recipes in
oe-core) seem to be:

 - PACKAGECONFIG lines go between "inherit ..." and EXTRA_OECONF
 - BBCLASSEXTEND goes at the end of the recipe

> Oh, and did we agree on tabs, or spaces?

No, probably never will :-)

Best approach would be to not mess with indent - unless you find a
line indented with spaces between two lines indented with tabs (or
vice versa).

