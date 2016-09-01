Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 24F5D75C51
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 21:36:57 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id f76so7436407vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2016 14:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=dapeZWkxMCvwNZPz81I0Nck9plKGkQTwqM6MtJQlCvk=;
	b=jLtSRFpErimxN/ORgE8qgsTIVkK88q4kXD+cHgRNId3RUA08mgOtej6U/NF9yoHuJ4
	UxvxJ5Gpe4OssWbReeAFC/aLtWkft4Q5ruN5ciym1ahw/BwTYsLoXSQfmt+rLXx3BNhZ
	107Sd4fnqxi1rWHlgRh6Wy81Nqe8sbY8OtpFsW3SrG+PlCsTaZvahx6AaRNqNOrGW1zE
	YpTzlLcvhc7EDkSRQBqRwlfB4jOgdVBwdRVB1mBAxzDm6lyOj7jzFrf3NBJ3jn/P60xN
	av7C7cdlc0kB62aDGNNtyWwf5BjlKrlHBWGXmOuSCEY1GMdLq+NBClbQMjj6b5E2/iTP
	yO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=dapeZWkxMCvwNZPz81I0Nck9plKGkQTwqM6MtJQlCvk=;
	b=fPDUwWXBilfqAzukh3FMsdYfGr8HhiC61rvZicFh+VV5t5i5acYiuNH0nWgfzdAbf9
	36Fs76JTxBi4St4Y0/ZVlPcogjLY+dJsonfxVb80JSicP9omBOX1NwHege3V09CUMHR0
	Caaz8GO1bwY4ejg7TMxBWLBUy/U5OcKSfrGbpXHvJeOyzIlcnIbk0VmuTbBsbbAsVuw/
	69o0NBDFBTnmI5weUfvpanqo2NNGynorfr3vaecfE5VOc9gf0/s7qMrNn7ctj006Cb36
	szzP8P1x9gAyZ5TFMzXIGGRwW6lxbnEYU6QD8s/gbU04tFmlYtrwdVs0ZiRLg/ynjZCp
	UY8Q==
X-Gm-Message-State: AE9vXwO0AIDOhPACZNjq2DyjqmN7MSdYDaQbwUxgY3xrbjQVScslZiZsD+vjZTIFxD5jCnPgrauGUaO/aQbPGA==
X-Received: by 10.31.133.11 with SMTP id h11mr10709169vkd.64.1472765817799;
	Thu, 01 Sep 2016 14:36:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.141 with HTTP; Thu, 1 Sep 2016 14:36:57 -0700 (PDT)
In-Reply-To: <6dc69872-3f81-6078-48fb-b2a744133ca2@siemens.com>
References: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
	<6dc69872-3f81-6078-48fb-b2a744133ca2@siemens.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 1 Sep 2016 14:36:57 -0700
Message-ID: <CANx9H-AXcoS=z=rFcFJKKrfea-KUfSkFgPz_WGrEe88JagScKw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java] Unify virtual java providers
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
X-List-Received-Date: Thu, 01 Sep 2016 21:37:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 1, 2016 at 5:03 AM, Pascal Bach <pascal.bach@siemens.com> wrote:

> Hi guys
> > It should be properly documented in the readme and the virtual packages
> should be the preferred way for users to depend on java/jre resp javac/jdk
> >
> > An alternative to the above would be:
> >
> > - virtual/jre
> > - virtual/jre-native
> > - virtual/jdk
> > - virtual/jdk-native
> >
> > But this would deviate more from the current naming.
> >
> While testing the proposal above i ran into an issue.
> When I add PROVIDES = "virtual/jre" to the java recipes and i want to
> install multiple java versions via update-alternative I can't do that
> because bitbake tells me:
>
> "Multiple .bb files are due to be built which each provide virtual/jre:"
>
> Now the question for me is if this two mechanism are not intended to work
> together or if I'm doing something wrong.
>
>
This is a hint that you need to set PREFERRED_PROVIDER_foo in your
local.conf (or machine.conf or distro.conf or...)

http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html#var-PREFERRED_PROVIDER

You might also need to set PREFERRED_VERSION, depending on the situation.

My idea would be to allow the user to select a default provider for
> "virtual/jre" but still allow to install an additional specific java
> provider if necessary.
> Is this even possible?
>
> Pascal
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

