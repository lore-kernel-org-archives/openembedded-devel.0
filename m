Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id F3117782DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8A03032033A0;
	Wed, 14 Jun 2017 10:55:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 0M-_IpXRYrUn; Wed, 14 Jun 2017 10:55:12 +0200 (CEST)
Received: from t460p (p57A610EC.dip0.t-ipconnect.de [87.166.16.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BAA5D320326A;
	Wed, 14 Jun 2017 10:55:10 +0200 (CEST)
Date: Wed, 14 Jun 2017 10:55:09 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170614105509.4c53d25d@t460p>
In-Reply-To: <CA+chaQeTEGocMJ5oZNFBKu18Rkh-DNm885JC=5vCY9uy=rkBkQ@mail.gmail.com>
References: <20170326203053.GH15664@denix.org>
	<20170329230613.GS15664@denix.org>
	<20170413004504.2cae0270@t510.zcs.saftware.de>
	<CAJ86T=X2379-ZvEVS-AYku6NENYC48+t11T0GpOic-xyYAPzKQ@mail.gmail.com>
	<20170413021127.47ff6bc7@t510.zcs.saftware.de>
	<CAJ86T=W3YBoLXH+J16XhJ+FO_ZtW17hPX8+djgqrgVNFXkeBkg@mail.gmail.com>
	<20170612190424.GW28053@denix.org> <20170613143411.67399672@t460p>
	<CA+chaQeTEGocMJ5oZNFBKu18Rkh-DNm885JC=5vCY9uy=rkBkQ@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 14 Jun 2017 08:55:18 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Jun 2017 16:36:38 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

> Is it happening only for arm?

It happened trying to build for mips32el.

> I don't build it for qemuarm (because of armv5 isn't supported anymore),
> but it builds fine in my world builds for qemux86(-64) where I use
> ld-is-gold globally.
> 
> On Tue, Jun 13, 2017 at 2:34 PM, Andreas Oberritter <obi@opendreambox.org>
> wrote:
> 
> > On Mon, 12 Jun 2017 15:04:24 -0400
> > Denys Dmytriyenko <denis@denix.org> wrote:
> >  
> > > On Wed, Apr 12, 2017 at 05:53:21PM -0700, Andre McCurdy wrote:  
> > > > On Wed, Apr 12, 2017 at 5:11 PM, Andreas Oberritter
> > > > <obi@opendreambox.org> wrote:  
> > > > > On Wed, 12 Apr 2017 16:38:58 -0700
> > > > > Andre McCurdy <armccurdy@gmail.com> wrote:
> > > > >  
> > > > >> On Wed, Apr 12, 2017 at 3:45 PM, Andreas Oberritter
> > > > >> <obi@opendreambox.org> wrote:  
> > > > >> > On Wed, 29 Mar 2017 19:06:14 -0400
> > > > >> > Denys Dmytriyenko <denis@denix.org> wrote:
> > > > >> >  
> > > > >> >> On Sun, Mar 26, 2017 at 04:30:53PM -0400, Denys Dmytriyenko  
> > wrote:  
> > > > >> >> > Hi,
> > > > >> >> >
> > > > >> >> > I've been having the following build issues lately with  
> > qtwebkit 5.8 from  
> > > > >> >> > master:
> > > > >> >> >
> > > > >> >> > | make[2]: Entering directory '/OE/master/build/tmp/work/  
> > armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/
> > build/Source'  
> > > > >> >> > | rm -f libQt5WebKit.so.5.8.0 libQt5WebKit.so  
> > libQt5WebKit.so.5 libQt5WebKit.so.5.8  
> > > > >> >> > | linking ../lib/libQt5WebKit.so.5.8.0
> > > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-  
> > gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> > multiple definition of `__bss_start'  
> > > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-  
> > gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> > multiple definition of `__bss_start'  
> > > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-  
> > gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> > multiple definition of `_edata'  
> > > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-  
> > gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> > multiple definition of `_edata'  
> > > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-  
> > gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> > multiple definition of `_end'  
> > > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-  
> > gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0):
> > multiple definition of `_end'  
> > > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-  
> > gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0):
> > multiple definition of `__bss_start'  
> > > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-  
> > gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0):
> > multiple definition of `_edata'  
> > > > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-  
> > gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0):
> > multiple definition of `_end'  
> > > > >> >> > | collect2: error: ld returned 1 exit status
> > > > >> >> > | Makefile.api:92: recipe for target  
> > '../lib/libQt5WebKit.so.5.8.0' failed  
> > > > >> >> > | make[2]: *** [../lib/libQt5WebKit.so.5.8.0] Error 1
> > > > >> >> > | make[2]: Leaving directory '/OE/master/build/tmp/work/  
> > armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/
> > build/Source'  
> > > > >> >> > | Makefile.QtWebKit:44: recipe for target  
> > 'sub-api-pri-make_first-ordered' failed  
> > > > >> >> > | make[1]: *** [sub-api-pri-make_first-ordered] Error 2
> > > > >> >> >
> > > > >> >> > I believe I was able to build 5.8/master before, so I'm  
> > suspecting recent  
> > > > >> >> > binutils upgrade... But I can be wrong. Would really  
> > appreciate some help  
> > > > >> >> > here. Thanks.  
> > > > >> >>
> > > > >> >> Anyone else see this?
> > > > >> >>  
> > > > >> >
> > > > >> > I do. Have you been able to solve it in the meantime?  
> > > > >>
> > > > >> Do you both have gold enabled?
> > > > >>
> > > > >>   https://bugs.launchpad.net/ubuntu/+source/qtwebkit-  
> > opensource-src/+bug/1653529  
> > > > >
> > > > > I don't use the ld-is-gold flag, but gold gets built nevertheless.  
> > It's just not  
> > > > > the default linker. I guess qtwebkit forces its use. So the question  
> > becomes whether  
> > > > > I should set ld-is-gold or teach qtwebkit not to use gold, in order  
> > not to mix both  
> > > > > linkers.  
> > > >
> > > > Assuming qtwebkit has a configure option to explicitly enable/disable
> > > > gold, I'd say add a PACKAGECONFIG option.
> > > >
> > > > In the short term keep the PACKAGECONFIG option disabled and in the
> > > > longer term (once qtwebkit builds successfully with gold enabled) set
> > > > the PACKAGECONFIG option based on the testing the distro feature.  
> > >
> > > Has there been any progress on this? Is anybody looking at adding this
> > > PACKAGECONFIG flag?
> > >  
> >
> > IIRC, setting ld-is-gold globally didn't help. I didn't investigate any
> > further.
> >
> > Regards,
> > Andreas
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >  


