Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 630F3782EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 10:19:38 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id e142so54650704ywa.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6cCfuiW1IMBaNsmGkpwacDEQm/BvYkqt0qOGnYQ1LKE=;
	b=svFb8SuflicnnLHksNL/dE7mDSLLnm4Hq/Z0Wnh1BGIjzB4FyA+X4iobiOYdYtJHEt
	CCKnej73+jWDzQBB+I4XNTA4VHL3PwIxPWDMxG8p+fmdla82U+PMOPlWtUum+yrDKmPq
	UgxS/ZnWT+DJAbZpozfeoNytaFbJGSUIyDY5pZon+qMCUi5YpS/T25rh3MNUJdRhBr+p
	GsGPi1ro/6ynsHfMOrqshcd94C7c95qXnA/yXZuHpOO/UlMoMQB8pP48X1agNndBUMQF
	LL1rB7MOqeqr2fuIyAADZeOskQy4cu5qYTa2JkFH60XVkqCN9b5jwTyUupnfvimYfxiJ
	oQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6cCfuiW1IMBaNsmGkpwacDEQm/BvYkqt0qOGnYQ1LKE=;
	b=eprOb3tpWsLT+3nUoZ+/zKn0NLVQuplwv5wQg1kS0SNKWRr8gdAJXIdU7DVar4FAJ9
	tKpNUf/+suWpS9dVYAYKqd/t2KMrhKHsO7bEhpoo6ohPIkVZoAZoUQKRHRZ1orySLcmo
	hOPP8YNNtVI80RRxV0t3UutH77Y0qlzjOCl85IIyPS9cn6ig9aBYaFllHfmbORQgCkYo
	7R2E5NiP+SNUM5ovgEMlp5Wln2RN6T8BiaOvI+cAXw5TSH6nM+F2UGG/adojwbi4HLmx
	nokz5wbVF36wOhS6Vg0BBpahWvjzonUi2fjsOTFx/2DbVR4oQYjpv4fhMZTvgjbX0yq4
	b/0Q==
X-Gm-Message-State: AKS2vOzeYhipjgPJ6G5WHUEueV2++TM1hj6IcH0PDf5PJ1Cov5rB5uRo
	/doyhn3EWMHtPy5SUlRKgQkrrUBdFw==
X-Received: by 10.129.37.11 with SMTP id l11mr6357798ywl.2.1497435580220; Wed,
	14 Jun 2017 03:19:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Wed, 14 Jun 2017 03:19:39 -0700 (PDT)
In-Reply-To: <CAJ86T=WYkkF3A2hKcDEHZwcsmxTscJnc5qw8kbDFQgvMQWJjpQ@mail.gmail.com>
References: <20170326203053.GH15664@denix.org>
	<20170329230613.GS15664@denix.org>
	<20170413004504.2cae0270@t510.zcs.saftware.de>
	<CAJ86T=X2379-ZvEVS-AYku6NENYC48+t11T0GpOic-xyYAPzKQ@mail.gmail.com>
	<20170413021127.47ff6bc7@t510.zcs.saftware.de>
	<CAJ86T=W3YBoLXH+J16XhJ+FO_ZtW17hPX8+djgqrgVNFXkeBkg@mail.gmail.com>
	<20170612190424.GW28053@denix.org> <20170613143411.67399672@t460p>
	<CA+chaQeTEGocMJ5oZNFBKu18Rkh-DNm885JC=5vCY9uy=rkBkQ@mail.gmail.com>
	<CAJ86T=WYkkF3A2hKcDEHZwcsmxTscJnc5qw8kbDFQgvMQWJjpQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Jun 2017 12:19:39 +0200
Message-ID: <CA+chaQcjddNFc0VD7522vaP_asht013scwLKsZbAQy2bQSWNyg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 14 Jun 2017 10:19:39 -0000
Content-Type: text/plain; charset="UTF-8"

> Qtwebkit doesn't support armv5 any more? Was there an announcement
somewhere?

I'm sorry, I was thinking about the qtwebengine restriction:
https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtwebengine_git.bb#L44

which does apply to chromium* recipes as well:
https://github.com/OSSystems/meta-browser/blob/master/recipes-browser/chromium/chromium.inc#L4

and long time ago I had the same restriction in webkit-efl:
https://github.com/openembedded/meta-openembedded/commit/72a0b544bdb129eed2f310fb8a72614d1ee5f080#diff-076865441d3b071cd9c631d45ab24a31R54

From here I was remembering that webkit didn't support armv5 anymore and
thought the same restriction did apply to all webkit based recipes.

I would be very happy to see qemuarmv7 in oe-core and to switch my bitbake
world builds from qemuarm to that, it would mean that < armv7a gets very
limited testing, but that's still better option than limited testing on
"shared" armv7a (which we all can easily reproduce on emulated qemuarmv7
unlike all armv7a real hardware we usually use, but almost everybody has
own boards, so we cannot share something which should just work out of the
box) .

Regards,

On Tue, Jun 13, 2017 at 6:14 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Jun 13, 2017 at 7:36 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Is it happening only for arm?
> >
> > I don't build it for qemuarm (because of armv5 isn't supported anymore),
>
> Qtwebkit doesn't support armv5 any more? Was there an announcement
> somewhere?
>
> We're trying to gather reasons for updating the qemuarm CPU to armv7,
> so if major packages are dropping support for armv5 that's useful to
> know.
>
> > but it builds fine in my world builds for qemux86(-64) where I use
> > ld-is-gold globally.
> >
> > On Tue, Jun 13, 2017 at 2:34 PM, Andreas Oberritter <
> obi@opendreambox.org>
> > wrote:
> >
> >> On Mon, 12 Jun 2017 15:04:24 -0400
> >> Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> > On Wed, Apr 12, 2017 at 05:53:21PM -0700, Andre McCurdy wrote:
> >> > > On Wed, Apr 12, 2017 at 5:11 PM, Andreas Oberritter
> >> > > <obi@opendreambox.org> wrote:
> >> > > > On Wed, 12 Apr 2017 16:38:58 -0700
> >> > > > Andre McCurdy <armccurdy@gmail.com> wrote:
> >> > > >
> >> > > >> On Wed, Apr 12, 2017 at 3:45 PM, Andreas Oberritter
> >> > > >> <obi@opendreambox.org> wrote:
> >> > > >> > On Wed, 29 Mar 2017 19:06:14 -0400
> >> > > >> > Denys Dmytriyenko <denis@denix.org> wrote:
> >> > > >> >
> >> > > >> >> On Sun, Mar 26, 2017 at 04:30:53PM -0400, Denys Dmytriyenko
> >> wrote:
> >> > > >> >> > Hi,
> >> > > >> >> >
> >> > > >> >> > I've been having the following build issues lately with
> >> qtwebkit 5.8 from
> >> > > >> >> > master:
> >> > > >> >> >
> >> > > >> >> > | make[2]: Entering directory '/OE/master/build/tmp/work/
> >> armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/
> >> build/Source'
> >> > > >> >> > | rm -f libQt5WebKit.so.5.8.0 libQt5WebKit.so
> >> libQt5WebKit.so.5 libQt5WebKit.so.5.8
> >> > > >> >> > | linking ../lib/libQt5WebKit.so.5.8.0
> >> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> >> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/
> libQt5Core.so:(*IND*+0x0):
> >> multiple definition of `__bss_start'
> >> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> >> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/
> libQt5Core.so:(*IND*+0x0):
> >> multiple definition of `__bss_start'
> >> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> >> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/
> libQt5Core.so:(*IND*+0x0):
> >> multiple definition of `_edata'
> >> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> >> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/
> libQt5Core.so:(*IND*+0x0):
> >> multiple definition of `_edata'
> >> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> >> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/
> libQt5Core.so:(*IND*+0x0):
> >> multiple definition of `_end'
> >> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> >> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/
> libQt5Core.so:(*IND*+0x0):
> >> multiple definition of `_end'
> >> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> >> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/
> libQt5Gui.so:(*IND*+0x0):
> >> multiple definition of `__bss_start'
> >> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> >> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/
> libQt5Gui.so:(*IND*+0x0):
> >> multiple definition of `_edata'
> >> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> >> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/
> libQt5Gui.so:(*IND*+0x0):
> >> multiple definition of `_end'
> >> > > >> >> > | collect2: error: ld returned 1 exit status
> >> > > >> >> > | Makefile.api:92: recipe for target
> >> '../lib/libQt5WebKit.so.5.8.0' failed
> >> > > >> >> > | make[2]: *** [../lib/libQt5WebKit.so.5.8.0] Error 1
> >> > > >> >> > | make[2]: Leaving directory '/OE/master/build/tmp/work/
> >> armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/
> >> build/Source'
> >> > > >> >> > | Makefile.QtWebKit:44: recipe for target
> >> 'sub-api-pri-make_first-ordered' failed
> >> > > >> >> > | make[1]: *** [sub-api-pri-make_first-ordered] Error 2
> >> > > >> >> >
> >> > > >> >> > I believe I was able to build 5.8/master before, so I'm
> >> suspecting recent
> >> > > >> >> > binutils upgrade... But I can be wrong. Would really
> >> appreciate some help
> >> > > >> >> > here. Thanks.
> >> > > >> >>
> >> > > >> >> Anyone else see this?
> >> > > >> >>
> >> > > >> >
> >> > > >> > I do. Have you been able to solve it in the meantime?
> >> > > >>
> >> > > >> Do you both have gold enabled?
> >> > > >>
> >> > > >>   https://bugs.launchpad.net/ubuntu/+source/qtwebkit-
> >> opensource-src/+bug/1653529
> >> > > >
> >> > > > I don't use the ld-is-gold flag, but gold gets built nevertheless.
> >> It's just not
> >> > > > the default linker. I guess qtwebkit forces its use. So the
> question
> >> becomes whether
> >> > > > I should set ld-is-gold or teach qtwebkit not to use gold, in
> order
> >> not to mix both
> >> > > > linkers.
> >> > >
> >> > > Assuming qtwebkit has a configure option to explicitly
> enable/disable
> >> > > gold, I'd say add a PACKAGECONFIG option.
> >> > >
> >> > > In the short term keep the PACKAGECONFIG option disabled and in the
> >> > > longer term (once qtwebkit builds successfully with gold enabled)
> set
> >> > > the PACKAGECONFIG option based on the testing the distro feature.
> >> >
> >> > Has there been any progress on this? Is anybody looking at adding this
> >> > PACKAGECONFIG flag?
> >> >
> >>
> >> IIRC, setting ld-is-gold globally didn't help. I didn't investigate any
> >> further.
> >>
> >> Regards,
> >> Andreas
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

