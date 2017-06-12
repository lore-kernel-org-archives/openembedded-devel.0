Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 62E8E782E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 23:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CFFBB20B84;
	Mon, 12 Jun 2017 23:10:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1in_iYixQPvX; Mon, 12 Jun 2017 23:10:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A8A3320156;
	Mon, 12 Jun 2017 23:10:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 366D61624FA; Mon, 12 Jun 2017 19:10:27 -0400 (EDT)
Date: Mon, 12 Jun 2017 19:10:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20170612231027.GZ28053@denix.org>
References: <20170326203053.GH15664@denix.org>
	<20170329230613.GS15664@denix.org>
	<20170413004504.2cae0270@t510.zcs.saftware.de>
	<CAJ86T=X2379-ZvEVS-AYku6NENYC48+t11T0GpOic-xyYAPzKQ@mail.gmail.com>
	<20170413021127.47ff6bc7@t510.zcs.saftware.de>
	<CAJ86T=W3YBoLXH+J16XhJ+FO_ZtW17hPX8+djgqrgVNFXkeBkg@mail.gmail.com>
	<20170612190424.GW28053@denix.org>
MIME-Version: 1.0
In-Reply-To: <20170612190424.GW28053@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 12 Jun 2017 23:10:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 12, 2017 at 03:04:24PM -0400, Denys Dmytriyenko wrote:
> On Wed, Apr 12, 2017 at 05:53:21PM -0700, Andre McCurdy wrote:
> > On Wed, Apr 12, 2017 at 5:11 PM, Andreas Oberritter
> > <obi@opendreambox.org> wrote:
> > > On Wed, 12 Apr 2017 16:38:58 -0700
> > > Andre McCurdy <armccurdy@gmail.com> wrote:
> > >
> > >> On Wed, Apr 12, 2017 at 3:45 PM, Andreas Oberritter
> > >> <obi@opendreambox.org> wrote:
> > >> > On Wed, 29 Mar 2017 19:06:14 -0400
> > >> > Denys Dmytriyenko <denis@denix.org> wrote:
> > >> >
> > >> >> On Sun, Mar 26, 2017 at 04:30:53PM -0400, Denys Dmytriyenko wrote:
> > >> >> > Hi,
> > >> >> >
> > >> >> > I've been having the following build issues lately with qtwebkit 5.8 from
> > >> >> > master:
> > >> >> >
> > >> >> > | make[2]: Entering directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
> > >> >> > | rm -f libQt5WebKit.so.5.8.0 libQt5WebKit.so libQt5WebKit.so.5 libQt5WebKit.so.5.8
> > >> >> > | linking ../lib/libQt5WebKit.so.5.8.0
> > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
> > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
> > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
> > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
> > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
> > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
> > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `__bss_start'
> > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_edata'
> > >> >> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_end'
> > >> >> > | collect2: error: ld returned 1 exit status
> > >> >> > | Makefile.api:92: recipe for target '../lib/libQt5WebKit.so.5.8.0' failed
> > >> >> > | make[2]: *** [../lib/libQt5WebKit.so.5.8.0] Error 1
> > >> >> > | make[2]: Leaving directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
> > >> >> > | Makefile.QtWebKit:44: recipe for target 'sub-api-pri-make_first-ordered' failed
> > >> >> > | make[1]: *** [sub-api-pri-make_first-ordered] Error 2
> > >> >> >
> > >> >> > I believe I was able to build 5.8/master before, so I'm suspecting recent
> > >> >> > binutils upgrade... But I can be wrong. Would really appreciate some help
> > >> >> > here. Thanks.
> > >> >>
> > >> >> Anyone else see this?
> > >> >>
> > >> >
> > >> > I do. Have you been able to solve it in the meantime?
> > >>
> > >> Do you both have gold enabled?
> > >>
> > >>   https://bugs.launchpad.net/ubuntu/+source/qtwebkit-opensource-src/+bug/1653529
> > >
> > > I don't use the ld-is-gold flag, but gold gets built nevertheless. It's just not
> > > the default linker. I guess qtwebkit forces its use. So the question becomes whether
> > > I should set ld-is-gold or teach qtwebkit not to use gold, in order not to mix both
> > > linkers.
> > 
> > Assuming qtwebkit has a configure option to explicitly enable/disable
> > gold, I'd say add a PACKAGECONFIG option.
> > 
> > In the short term keep the PACKAGECONFIG option disabled and in the
> > longer term (once qtwebkit builds successfully with gold enabled) set
> > the PACKAGECONFIG option based on the testing the distro feature.
> 
> Has there been any progress on this? Is anybody looking at adding this 
> PACKAGECONFIG flag?

Ok, patch is submitted. I don't believe there's a need for PACKAGECONFIG.

http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/113141.html

Validated with QtWebKit and QtQuick1 when there's no "ld-is-gold" set in 
DISTRO_FEATURES and once it's set.

-- 
Denys

