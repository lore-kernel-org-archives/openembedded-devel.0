Return-Path: <rcagley@gmail.com>
Received: from mail-ig0-f178.google.com (unknown [209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 62E82605B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 20:05:41 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hl10so2602126igb.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cpOPMj3Cezo6Uncp+xU/D6eTPxaHfIfTkEy9SH1hJxs=;
	b=ogYJTPSi/2VKIrotxN+NpVfPLz9X2Mf6xv0m0Fx+J7mCFOYB0kk82nkswcu+cq6RWc
	+ORQMGMrouWSAHOMc0ihfyGJjNsxF8XVA8Dhdgr3gB6wiV6B+pYf+igrQuXy40YC70Ti
	k+vbqcklSOCLDzi6tOSCCowkm6h3iJ/Qn6syehGUBqAR0RqmarzwsvsqzWxQPVGEiTSF
	3TSO58AmJqrUJTO7s+WIKcAZT7bIpodkdq/HnHlaMyLoOAMjUrOjiqX/u+34BFVBxPqn
	NEqyYT3PYKeAizRTBTo9UG18jqoENFc3/wNPssOir9dplV47mB12UQMwwQSQHHq7lJk2
	Bmkg==
MIME-Version: 1.0
X-Received: by 10.43.138.65 with SMTP id ir1mr12073659icc.19.1400702741615;
	Wed, 21 May 2014 13:05:41 -0700 (PDT)
Received: by 10.64.34.236 with HTTP; Wed, 21 May 2014 13:05:41 -0700 (PDT)
In-Reply-To: <CFA27259.284985%rcalhoun@shotspotter.com>
References: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>
	<CFA27259.284985%rcalhoun@shotspotter.com>
Date: Wed, 21 May 2014 13:05:41 -0700
Message-ID: <CAN-NoH3B+3+9QuWOLaMpcjxD0FhkETFqyDr1CKRPO7kXU0UFXg@mail.gmail.com>
From: Richard Cagley <rcagley@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: how to create a new layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 May 2014 20:05:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 21, 2014 at 12:26 PM, Robert Calhoun
<rcalhoun@shotspotter.com> wrote:
>
>
> On 5/21/14 2:26 PM, "Richard Cagley" <rcagley@gmail.com> wrote:
>
>>I'd like to create a new machine that inherits from an existing
>>machine. What's the easiest way to do this?
>>
>>Looking through the yocto documentation I see "yocot-bsp create" but I
>>don't seem to have that executable. Do I need to use this or is there
>>an alternate method?
>
> The script is in: poky/scripts/yocto-bsp
>
> You don't really need it. The script creates a directory structure for you
> and generates some files, but there is nothing magical about it; you can
> create those manually using the meta-yocto-bsp layer as an example.
> Machine configs are in poky/meta-yocto-bsp/conf/machine.
>
> To make bitbake use your new layer:
> a) add your layer to poky/build/conf/bblayers.conf so that that bitbake
> knows what directories to search
> b) set your machine name in poky/build/conf/local.conf
>
> I would recommend putting your own layer into git (or scm of choice).
> Switching branches on poky will make the build fail if your .bbappends no
> longer match up with recipes in oe-core, so it's helpful to be able to
> switch between e.g. "a version of my layer that works with branch daisy"
> and "a version of my layer that works with branch master".
>
> Rob Calhoun
>
oh, I don't think I'm using poky so I guess that's the reason I didn't
find yocto-bsp

I'm using oe-core/meta-xilinx and for testing I've created a new test
layer "meta-me" so my bblayers looks like this

BBLAYERS ?= " \
  /home/rcagley/oe-zed-gcc-min/openembedded-core/meta \
  /home/rcagley/oe-zed-gcc-min/meta-xilinx \
  /home/rcagley/oe-zed-gcc-min/meta-oe/meta-oe \
  /home/rcagley/oe-zed-gcc-min/meta-me \
  "

In my local.conf I have
MACHINE ??= "zedboard-zynq7"

My current main goal is to make my build consume a .bbappend file I
have in meta-me/recipes-kernel/linux.

1.) What is the minimum set of files I need to do this? I'd guess at
least meta-me/conf/local.conf. Anything else?
2.) Do I need to change the machine name? If so, how to I inherit
zedboard-zynq7?

The yocto manuals talk to creating a new layer, but I'm less clear on
how to basically inherit everything.

BTW, thanks for the tip about git/matching branches. That's a good idea.

