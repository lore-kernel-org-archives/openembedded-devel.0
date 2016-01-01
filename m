Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 084F26FF72
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 07:07:02 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 77so76186837ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 23:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jlBWIDcXiTrEbYiREs87+7oDV9LH8vivG9uuBFohq9E=;
	b=yxhHs4rq+40oRgQpQ57aViDKFKWFenKBsyoH0wRU6YFwJpuQtlBwsalpDz0fmVfNHB
	1Y5Hjv/UgY+Qt19r8CJnLctpQQzY7ATRPLz0jCJcE3ajTIh2eFZpf3tTs/D5xsPKiM9/
	nKQA2lPNs2/LdgD6G0lqRhzQhIWr4zrbAYFt0oqF9EGQsbcTaVO6wEb4h/lHGEi8SM9S
	6i3kcXxFrko6QkA6zeduJ3YvFFoFs4NB4nKl88hTjRNbngszAq5naJhmBp9bCUNBTiyY
	Drqi+Po+2dESEN3qxmStzTQ0JxF750zvZMNm44wgWstS1A8SboHuB0SIGAyXh7P9xTA9
	kVVA==
MIME-Version: 1.0
X-Received: by 10.107.34.79 with SMTP id i76mr13570608ioi.195.1451632022969;
	Thu, 31 Dec 2015 23:07:02 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Thu, 31 Dec 2015 23:07:02 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Thu, 31 Dec 2015 23:07:02 -0800 (PST)
In-Reply-To: <5685EE2D.3050908@gmail.com>
References: <56837748.6020903@gmail.com>
	<5685EE2D.3050908@gmail.com>
Date: Thu, 31 Dec 2015 23:07:02 -0800
Message-ID: <CAMKF1soCAs4EtaJCYG5M+ErDemEAoHvHmsOOGeABBOknCL9=Sg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: chromium 40.0.2214.91 doesn't like gcc5.3
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
X-List-Received-Date: Fri, 01 Jan 2016 07:07:03 -0000
Content-Type: text/plain; charset=UTF-8

Update is long due so please work on upgrade. X86 and arm are most
interesting platform. Please post it with RFT and lets give interested devs
a chance to try it out
On Dec 31, 2015 7:11 PM, "Trevor Woerner" <twoerner@gmail.com> wrote:

> The version of chromium we're using is a bit old (it's almost a year old
> now) and I thought that maybe a newer version might have the required
> fixes in it already. Along those lines I tried updating the recipe to
> build chromium-49.0.2607.0 which was released December 30, 2015. As it
> turned out 49.0.2607.0 didn't have any fixes for gcc-5.3, I ran into the
> exact same build problems I had seen building 40.0.2214.91 with gcc-5.3.
> But, for fun, I thought it would be worth seeing if I could get
> 49.0.2607.0 to build and, patch after patch, I not only got it building
> but I have also run-time tested it on my turbot. These patches, by the
> way, adjust the code and don't simply turn off compiler warnings/errors.
>
> I haven't tried getting 40 to build, but seeing that I have 49 building
> (and running) I was wondering if I should work on getting 40 to build (I
> assume most of the patches I developed for 49 will probably be the same
> for 40) or should I just concentrate on updating the recipe to 49 and
> getting that to work?
>
> There's a lot of wayland-specific stuff in the recipe and I've never
> built or run a wayland image, so if I'm going to work on making sure my
> recipe for 49 works it'll take a bit of time for me to wrap my head
> around the wayland stuff. Also, from what I can tell, the Linaro people
> use their own branch/version for their ARM builds[1] so I'm wondering
> how much testing people would need to accept such an update?
>
>
>
>
> [1] https://github.com/ndechesne/qcom-oe-manifest/blob/master/default.xml
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

