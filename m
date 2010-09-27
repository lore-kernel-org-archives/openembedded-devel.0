Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1P0F6R-0006AS-0w
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 16:54:57 +0200
Received: by qyk30 with SMTP id 30so951982qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=W39jBquj7hm3e8Rya16K2z1UU3umpknBmP87wPKqEIk=;
	b=WOoU18JC+OwnLrv2iUM0/o5MhjKo4kkIy4dpJZIhOjQ8e7snPG6i/gFhrOxZrUWEpp
	MBWrD+gP1cC1gqTmqr0MY56FG1/+HBf1Capewn/l27ZPVlRphcvE6WJc3/w8ri5+GZjE
	wDA8ZOBiVR93RSrgCO8hUJxYkAgaIdJXCbLNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=H8bCu2cbGLA89o/qDY6xdrzrAYrFqwwppxqgYXtyvfgmTLPYXALPdn2wxywzZ8rS3K
	G8JOCtttTSrZq3YHG4DU8PxoPsKB4ez1+Ur4aaqB98Vu0EMg3GknAmggPcZ4ezGpycRI
	LHwpECk+gkZGB5SbMW446JGeChxst4x9pZ6xo=
MIME-Version: 1.0
Received: by 10.224.73.134 with SMTP id q6mr5593650qaj.30.1285599269129; Mon,
	27 Sep 2010 07:54:29 -0700 (PDT)
Received: by 10.229.36.65 with HTTP; Mon, 27 Sep 2010 07:54:29 -0700 (PDT)
In-Reply-To: <AANLkTik0gS3dcnz++jr9pF-fh1ATt-f46hzGNHfbV+VU@mail.gmail.com>
References: <AANLkTik0gS3dcnz++jr9pF-fh1ATt-f46hzGNHfbV+VU@mail.gmail.com>
Date: Mon, 27 Sep 2010 16:54:29 +0200
Message-ID: <AANLkTikUGQuWVwNoDwEjM_CKG_dte5qQ-Zipu8DbGYxL@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: multiple kernels and images
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Sep 2010 14:55:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 27, 2010 at 4:15 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Hi all,
>
> I'm faced with the following problem:
> I need two kernels for my machine. One kernel will be a lightweight
> kernel (to reduce loading time) which boots then flashes the real
> kernel to NAND.

It sounds like a perfect initramfs task: 1st kernel + initramfs (flash
tools and some scripts/binaries) will flash 2nd kernel

Give a look at the initramfs* images we have in OE.

>
> To create two images I tricked a little bit and created two recipes
> (using require of course).
> As these have different names (linux-A_2.6.34.bb and
> linux-B_2.6.34.bb) I can give them different dirs and different
> defconfigs
> (linux-A/defconfig resp linux-B/defconfig).
>
> So far so good, but how do I now get the right kernel in my sd card image.
> Basically both recipes create a package kernel, so adding kernel to
> the image does not work.
> Anyone an idea on how to fix this?

To do this I would add a third recipe 'xy-installer' depending on the
linux-bootflasher kernel and linux-flashme kernel. Booting from e.g.
SD card would just need the two files (both packaged together).

Regards

Andrea

>
> Additional remarks:
>
> I'm aware of multi-kernel.inc but that still seems to leave me with
> the problem how to add the kernel to my image
>
> I can also create a 2nd machine in which case maybe things can be made
> to work, but that seems a fairly ugly hack (and still might give me a
> selection problem).
> Hence looking for a better solution.
>
> BTW wouldn't it be better to have the linux recipes package things
> (also?) in linux-A_2.6.34-r1_${MACHINE}.ipk or something like that
> instead of kernel_2.6.34-r1_${MACHINE}.ipk.
> Then an image could explicitly state the kernel recipe it wants to use
> (and virtual/kernel could be used to specify the default kernel).
>
> Your ideas/feedback is appreciated.
>
> Thanks alot!
> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


