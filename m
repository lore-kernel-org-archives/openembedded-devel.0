Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA087833B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:14:03 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v104so31392049wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=osdW1ioZYSsuWv69lNVnDXSyjgI/Nu+fdi+IZM3lGpg=;
	b=Cux5oU8/UTFR3RuFJu65XIROLXI5n+Qr8TVaJOCs4P3FG7Z/QyEUnyEnpmcIyr4Q13
	pcshtzqgPrJlW0yrAadgLr/nsLV5Vj1VMYE3NgQi7RpTJJuY8g2sdNVx5dhXKJ+yel8F
	z6+kAc0nQyEzfUlFF0uqxPS4DPGHikiQN4e5ahGED8vf6bTxOAND5LwM9/SCfuCTyG7e
	RASKssGzWVukCQAIUfNd6+61LR7dqEqEDdLSo0IjJj+R8y56FCo11jcjWulOZ2t/k0L8
	xe2JrGPPhrTUejrH9fqKiUX5sV7qFgXBdelAU/gcGJu4HbraHS7hZd4YJbpy1i7ABzxU
	QLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=osdW1ioZYSsuWv69lNVnDXSyjgI/Nu+fdi+IZM3lGpg=;
	b=iYN5eDfyW3y2wd8dV/oImTQvVxaBK7SZIUKbQBTxuHsbSBz+o1Kamwe1MIcuO1vWxg
	agXG6u2Zk6Ce3polc6O7zYfVlry+iogsOyiNz3VJuzC4cT8RRkfYjjJ+wLqV9kd5dLAM
	UZBK1ardJi29wmw24pGgXk8OLCXOX0ytFUfx6qMHP4RaFzQzEMW3Y7xSNRCawtahzogB
	HcVoysFIxsfEQDq6taS44KxWECste1FUp6805h5/lGsNpfN9TVlzflp/hBUXlqRYTvXW
	HwdVseTK+t4cXAXcA1oJC7b7EqRCwzv5ftE/7ryZoDxW8Hy34NNl05vwJUinC+tSgb+t
	rP0g==
X-Gm-Message-State: AKS2vOzM/H5+HLBENDKOafXDIOJmQooXKf9P1MBBR0ecR3bVhD0NxfEy
	f2d+WX9J5afApq6pimWAb9zmw1nY3A==
X-Received: by 10.223.139.210 with SMTP id w18mr3855489wra.19.1497370444247;
	Tue, 13 Jun 2017 09:14:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.170 with HTTP; Tue, 13 Jun 2017 09:14:03 -0700 (PDT)
In-Reply-To: <CA+chaQeTEGocMJ5oZNFBKu18Rkh-DNm885JC=5vCY9uy=rkBkQ@mail.gmail.com>
References: <20170326203053.GH15664@denix.org>
	<20170329230613.GS15664@denix.org>
	<20170413004504.2cae0270@t510.zcs.saftware.de>
	<CAJ86T=X2379-ZvEVS-AYku6NENYC48+t11T0GpOic-xyYAPzKQ@mail.gmail.com>
	<20170413021127.47ff6bc7@t510.zcs.saftware.de>
	<CAJ86T=W3YBoLXH+J16XhJ+FO_ZtW17hPX8+djgqrgVNFXkeBkg@mail.gmail.com>
	<20170612190424.GW28053@denix.org> <20170613143411.67399672@t460p>
	<CA+chaQeTEGocMJ5oZNFBKu18Rkh-DNm885JC=5vCY9uy=rkBkQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 13 Jun 2017 09:14:03 -0700
Message-ID: <CAJ86T=WYkkF3A2hKcDEHZwcsmxTscJnc5qw8kbDFQgvMQWJjpQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qtwebkit 5.8 build issues?
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
X-List-Received-Date: Tue, 13 Jun 2017 16:14:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 13, 2017 at 7:36 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Is it happening only for arm?
>
> I don't build it for qemuarm (because of armv5 isn't supported anymore),

Qtwebkit doesn't support armv5 any more? Was there an announcement somewhere?

We're trying to gather reasons for updating the qemuarm CPU to armv7,
so if major packages are dropping support for armv5 that's useful to
know.

> but it builds fine in my world builds for qemux86(-64) where I use
> ld-is-gold globally.
>
> On Tue, Jun 13, 2017 at 2:34 PM, Andreas Oberritter <obi@opendreambox.org>
> wrote:
>
>> On Mon, 12 Jun 2017 15:04:24 -0400
>> Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> > On Wed, Apr 12, 2017 at 05:53:21PM -0700, Andre McCurdy wrote:
>> > > On Wed, Apr 12, 2017 at 5:11 PM, Andreas Oberritter
>> > > <obi@opendreambox.org> wrote:
>> > > > On Wed, 12 Apr 2017 16:38:58 -0700
>> > > > Andre McCurdy <armccurdy@gmail.com> wrote:
>> > > >
>> > > >> On Wed, Apr 12, 2017 at 3:45 PM, Andreas Oberritter
>> > > >> <obi@opendreambox.org> wrote:
>> > > >> > On Wed, 29 Mar 2017 19:06:14 -0400
>> > > >> > Denys Dmytriyenko <denis@denix.org> wrote:
>> > > >> >
>> > > >> >> On Sun, Mar 26, 2017 at 04:30:53PM -0400, Denys Dmytriyenko
>> wrote:
>> > > >> >> > Hi,
>> > > >> >> >
>> > > >> >> > I've been having the following build issues lately with
>> qtwebkit 5.8 from
>> > > >> >> > master:
>> > > >> >> >
>> > > >> >> > | make[2]: Entering directory '/OE/master/build/tmp/work/
>> armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/
>> build/Source'
>> > > >> >> > | rm -f libQt5WebKit.so.5.8.0 libQt5WebKit.so
>> libQt5WebKit.so.5 libQt5WebKit.so.5.8
>> > > >> >> > | linking ../lib/libQt5WebKit.so.5.8.0
>> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
>> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
>> multiple definition of `__bss_start'
>> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
>> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
>> multiple definition of `__bss_start'
>> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
>> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
>> multiple definition of `_edata'
>> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
>> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
>> multiple definition of `_edata'
>> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
>> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
>> multiple definition of `_end'
>> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
>> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
>> multiple definition of `_end'
>> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
>> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0):
>> multiple definition of `__bss_start'
>> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
>> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0):
>> multiple definition of `_edata'
>> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
>> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0):
>> multiple definition of `_end'
>> > > >> >> > | collect2: error: ld returned 1 exit status
>> > > >> >> > | Makefile.api:92: recipe for target
>> '../lib/libQt5WebKit.so.5.8.0' failed
>> > > >> >> > | make[2]: *** [../lib/libQt5WebKit.so.5.8.0] Error 1
>> > > >> >> > | make[2]: Leaving directory '/OE/master/build/tmp/work/
>> armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/
>> build/Source'
>> > > >> >> > | Makefile.QtWebKit:44: recipe for target
>> 'sub-api-pri-make_first-ordered' failed
>> > > >> >> > | make[1]: *** [sub-api-pri-make_first-ordered] Error 2
>> > > >> >> >
>> > > >> >> > I believe I was able to build 5.8/master before, so I'm
>> suspecting recent
>> > > >> >> > binutils upgrade... But I can be wrong. Would really
>> appreciate some help
>> > > >> >> > here. Thanks.
>> > > >> >>
>> > > >> >> Anyone else see this?
>> > > >> >>
>> > > >> >
>> > > >> > I do. Have you been able to solve it in the meantime?
>> > > >>
>> > > >> Do you both have gold enabled?
>> > > >>
>> > > >>   https://bugs.launchpad.net/ubuntu/+source/qtwebkit-
>> opensource-src/+bug/1653529
>> > > >
>> > > > I don't use the ld-is-gold flag, but gold gets built nevertheless.
>> It's just not
>> > > > the default linker. I guess qtwebkit forces its use. So the question
>> becomes whether
>> > > > I should set ld-is-gold or teach qtwebkit not to use gold, in order
>> not to mix both
>> > > > linkers.
>> > >
>> > > Assuming qtwebkit has a configure option to explicitly enable/disable
>> > > gold, I'd say add a PACKAGECONFIG option.
>> > >
>> > > In the short term keep the PACKAGECONFIG option disabled and in the
>> > > longer term (once qtwebkit builds successfully with gold enabled) set
>> > > the PACKAGECONFIG option based on the testing the distro feature.
>> >
>> > Has there been any progress on this? Is anybody looking at adding this
>> > PACKAGECONFIG flag?
>> >
>>
>> IIRC, setting ld-is-gold globally didn't help. I didn't investigate any
>> further.
>>
>> Regards,
>> Andreas
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

