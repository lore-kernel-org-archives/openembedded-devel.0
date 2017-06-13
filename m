Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7547830F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:36:38 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id 4so36189833ybl.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5tzL/X2H1U9WTTmob69I0KGxKJ7yh2nleyXRRnm9Zks=;
	b=b1mjtGLGC7xH3fRzrvj/Yaja1cuXeQ5GjmQ2LdObrYB8rpj5yRFSCaNRFp4/X89Evt
	gNRJyz3GL54GAyDmRMJZPOQdbgDpSsTWKbogDw4MWnSWtSTAttvfWexKT1ghpjfLDhRN
	af9HiCpaEr+kWXAz8D/vGMe8XCMNCG0uQpNrmXvh7LjbHWkhjZICDaqi7mKDZvqvMYsg
	z8fZKF4VTVFK9tWSLdqjMtdd5+gPYtMqy4oQvU5/UKQNacmSHxQ8S0J7yGkikH3Q4wJO
	lxnPsSXcFgTNcSNqYVCDWJThZNL71R1kCgZ+Sn4/QfULGgSnTa1Ic2eBrTyR+Sr+8VB7
	JDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5tzL/X2H1U9WTTmob69I0KGxKJ7yh2nleyXRRnm9Zks=;
	b=qH3ldtknuLqy6Hg6YLm49IvS8rHiJe9ID87RSd3qo4jEYQ1/W9FXvrLrfXr/U6t/F5
	+PaSY1H8klGd+oypJrgPYT4QYtcEVoglv5LJBdT5tnZSie874dLMTD6Xmroi0Y8czfCs
	aNCKwNcGfyFRmaKhEg/pddoCfnJq316F3ndJ1Z4nLwviHfWumGyCPtik+UA/1eZaXbZ1
	wG+MqmcXAXJkGr34A1WZyrE3i3N7+vAADJLjbZzWtgk34HobQPiR+h6Bkwi+M6LJSznY
	8k9J5TVNxGdTxd6fTLzelESbU4355w06zUcWwY/8Kmv1X4WmCWbruM2OhwqtVQXxZWqW
	1jpQ==
X-Gm-Message-State: AKS2vOw83GMhxIZT1oq8qeCIzGnYAiUNL4ETFY7c9i3CyM1s3de4zCfB
	qmC7WTtwtH/VtxgNHXhkYwZ50mo3bA==
X-Received: by 10.37.228.69 with SMTP id b66mr3393276ybh.28.1497364599292;
	Tue, 13 Jun 2017 07:36:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Tue, 13 Jun 2017 07:36:38 -0700 (PDT)
In-Reply-To: <20170613143411.67399672@t460p>
References: <20170326203053.GH15664@denix.org>
	<20170329230613.GS15664@denix.org>
	<20170413004504.2cae0270@t510.zcs.saftware.de>
	<CAJ86T=X2379-ZvEVS-AYku6NENYC48+t11T0GpOic-xyYAPzKQ@mail.gmail.com>
	<20170413021127.47ff6bc7@t510.zcs.saftware.de>
	<CAJ86T=W3YBoLXH+J16XhJ+FO_ZtW17hPX8+djgqrgVNFXkeBkg@mail.gmail.com>
	<20170612190424.GW28053@denix.org> <20170613143411.67399672@t460p>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 13 Jun 2017 16:36:38 +0200
Message-ID: <CA+chaQeTEGocMJ5oZNFBKu18Rkh-DNm885JC=5vCY9uy=rkBkQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
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
X-List-Received-Date: Tue, 13 Jun 2017 14:36:38 -0000
Content-Type: text/plain; charset="UTF-8"

Is it happening only for arm?

I don't build it for qemuarm (because of armv5 isn't supported anymore),
but it builds fine in my world builds for qemux86(-64) where I use
ld-is-gold globally.

On Tue, Jun 13, 2017 at 2:34 PM, Andreas Oberritter <obi@opendreambox.org>
wrote:

> On Mon, 12 Jun 2017 15:04:24 -0400
> Denys Dmytriyenko <denis@denix.org> wrote:
>
> > On Wed, Apr 12, 2017 at 05:53:21PM -0700, Andre McCurdy wrote:
> > > On Wed, Apr 12, 2017 at 5:11 PM, Andreas Oberritter
> > > <obi@opendreambox.org> wrote:
> > > > On Wed, 12 Apr 2017 16:38:58 -0700
> > > > Andre McCurdy <armccurdy@gmail.com> wrote:
> > > >
> > > >> On Wed, Apr 12, 2017 at 3:45 PM, Andreas Oberritter
> > > >> <obi@opendreambox.org> wrote:
> > > >> > On Wed, 29 Mar 2017 19:06:14 -0400
> > > >> > Denys Dmytriyenko <denis@denix.org> wrote:
> > > >> >
> > > >> >> On Sun, Mar 26, 2017 at 04:30:53PM -0400, Denys Dmytriyenko
> wrote:
> > > >> >> > Hi,
> > > >> >> >
> > > >> >> > I've been having the following build issues lately with
> qtwebkit 5.8 from
> > > >> >> > master:
> > > >> >> >
> > > >> >> > | make[2]: Entering directory '/OE/master/build/tmp/work/
> armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/
> build/Source'
> > > >> >> > | rm -f libQt5WebKit.so.5.8.0 libQt5WebKit.so
> libQt5WebKit.so.5 libQt5WebKit.so.5.8
> > > >> >> > | linking ../lib/libQt5WebKit.so.5.8.0
> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> multiple definition of `__bss_start'
> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> multiple definition of `__bss_start'
> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> multiple definition of `_edata'
> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> multiple definition of `_edata'
> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> multiple definition of `_end'
> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> multiple definition of `_end'
> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0):
> multiple definition of `__bss_start'
> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0):
> multiple definition of `_edata'
> > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-
> gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0):
> multiple definition of `_end'
> > > >> >> > | collect2: error: ld returned 1 exit status
> > > >> >> > | Makefile.api:92: recipe for target
> '../lib/libQt5WebKit.so.5.8.0' failed
> > > >> >> > | make[2]: *** [../lib/libQt5WebKit.so.5.8.0] Error 1
> > > >> >> > | make[2]: Leaving directory '/OE/master/build/tmp/work/
> armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/
> build/Source'
> > > >> >> > | Makefile.QtWebKit:44: recipe for target
> 'sub-api-pri-make_first-ordered' failed
> > > >> >> > | make[1]: *** [sub-api-pri-make_first-ordered] Error 2
> > > >> >> >
> > > >> >> > I believe I was able to build 5.8/master before, so I'm
> suspecting recent
> > > >> >> > binutils upgrade... But I can be wrong. Would really
> appreciate some help
> > > >> >> > here. Thanks.
> > > >> >>
> > > >> >> Anyone else see this?
> > > >> >>
> > > >> >
> > > >> > I do. Have you been able to solve it in the meantime?
> > > >>
> > > >> Do you both have gold enabled?
> > > >>
> > > >>   https://bugs.launchpad.net/ubuntu/+source/qtwebkit-
> opensource-src/+bug/1653529
> > > >
> > > > I don't use the ld-is-gold flag, but gold gets built nevertheless.
> It's just not
> > > > the default linker. I guess qtwebkit forces its use. So the question
> becomes whether
> > > > I should set ld-is-gold or teach qtwebkit not to use gold, in order
> not to mix both
> > > > linkers.
> > >
> > > Assuming qtwebkit has a configure option to explicitly enable/disable
> > > gold, I'd say add a PACKAGECONFIG option.
> > >
> > > In the short term keep the PACKAGECONFIG option disabled and in the
> > > longer term (once qtwebkit builds successfully with gold enabled) set
> > > the PACKAGECONFIG option based on the testing the distro feature.
> >
> > Has there been any progress on this? Is anybody looking at adding this
> > PACKAGECONFIG flag?
> >
>
> IIRC, setting ld-is-gold globally didn't help. I didn't investigate any
> further.
>
> Regards,
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

