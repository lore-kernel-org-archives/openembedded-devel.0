Received: from [64.233.184.225] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <tomcooksey@googlemail.com>) id 1HvN8b-0007tw-Pg
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2007 02:43:14 +0200
Received: by wr-out-0506.google.com with SMTP id i20so931797wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2007 17:40:53 -0700 (PDT)
Received: by 10.143.168.16 with SMTP id v16mr251492wfo.1181004047475;
	Mon, 04 Jun 2007 17:40:47 -0700 (PDT)
Received: by 10.143.36.19 with HTTP; Mon, 4 Jun 2007 17:40:47 -0700 (PDT)
Message-ID: <eed7f0160706041740l430a4911p9feed63b7c0c96e0@mail.gmail.com>
Date: Tue, 5 Jun 2007 01:40:47 +0100
From: "Tom Cooksey" <tomcooksey@googlemail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4663DE3E.3050507@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <eed7f0160706040138y6a777b6ay86b8237c3462373c@mail.gmail.com>
	<4663DE3E.3050507@dominion.kabel.utwente.nl>
Subject: Re: Gumstix machine support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2007 00:43:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> > Over the last few months I've been looking for an alternative to
> > buildroot for the gumstix devices (www.gumstix.com). After giving up
> > on Gentoo, I thought I'd have a go with OpenEmbedded. After reading
> > through the documentation I realized what I needed to do was create a
> > gumstix.conf in conf/machine, only to find one already there!
> >
> > So my question is, how far along is gumstix support in OE and is it
> > being supported/maintained?
>
> Till 30 minutes ago it was pretty broken :) It should build if you set DISTRO=angstrom-2007.1

I've had a go with your updated gumstix.conf with angstrom-2007.1. It
fails on the kernel. The kernel it's trying to compile is a 2.6.15
one, which I've found a .bb for (specific to gumstix). Unfortunatly,
gumstix are now on a 2.6.20 kernel so I guess the 2.6.15 recipe in the
org.openembedded.dev tree is a bit out of date (at least a year I
think). I'm trying to translate the current kernel buildroot package
into a .bb, but it looks pretty complicated and includes a lot of
patches, so I suspect as I'm so new to OE, it will take me a while. In
the mean time, is there any way of preventing OE from trying to build
a kernel? I've tried replacing PREFERRED_PROVIDER_virtual/kernel =
"linux-gumstix" with ASSUME_PROVIDED += "virtual/kernel" and removed
the OLDEST_KERNEL line, however that didn't seem to work. It now tries
to build a 2.6.21. :-( What does OLDEST_KERNEL actually control?
Looking at the sources, it seems to be used as the kernel version
glibc should target. Is that right? Or is it the "oldest acceptable
kernel to compile"?


> Someone with more experience with gumstix hardware should have a look at MACHINE_FEATURES
> and decide if we need a seperate configs for the different gumstix boards.

The original series of gumstix boards were all based on PXA255 CPUs,
for which I guess "usbhost" needs to be removed. The next series are
called gumstix-verdex and have a PXA270, which does have a usb (1.1)
host. I guess then two configs are needed, one for say gumstix-400xm
and one for gumstix-verdex. I assume it's not possible to fit even a
cut-down angstrom into 4MB of flash? If so, only the "eXtra Memory" or
"gumstix-400xm" boards could be supported (which have 16MB of flash...
still too little?). Also, some boards don't have bluetooth, some don't
have an MMC slot. The number of different configurations is going to
be quite large (perhaps 5-10), perhaps if there's room in flash,
enabling all the features would be best?

If you don't mind doing a little hand-holding I'm quite keen to get
Angstrom up and running on gumstix. I will try my very best to RTFM as
much as possible, but please be patient with me!

Cheers,

Tom

PS: If your interested, I'm working with the Silicon Valley Homebrew
Mobile Phone Club (SVHMPC) to build a "homebrew" phone. The group has
got quite far and the current "homebrew" phone was shown (and videoed)
at the recent maker faire: http://www.cnettv.com/9710-1_53-27696.html.
Notice the blank LCD and complete lack of GUI. :-) I'm hoping this
work will lead to the SVHMPC being able to get GPE Phone Edition up
and running on the phone shown in the video.


