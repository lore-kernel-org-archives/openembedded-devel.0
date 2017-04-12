Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 436 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Apr 2017 22:52:26 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id A66B077BFF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 22:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 032CF31E5650
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 00:45:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id SI8HzDjt6eej
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 00:45:05 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A6179E.dip0.t-ipconnect.de
	[87.166.23.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 82D3F31E52A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 00:45:05 +0200 (CEST)
Date: Thu, 13 Apr 2017 00:45:04 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170413004504.2cae0270@t510.zcs.saftware.de>
In-Reply-To: <20170329230613.GS15664@denix.org>
References: <20170326203053.GH15664@denix.org>
	<20170329230613.GS15664@denix.org>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 12 Apr 2017 22:52:27 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Mar 2017 19:06:14 -0400
Denys Dmytriyenko <denis@denix.org> wrote:

> On Sun, Mar 26, 2017 at 04:30:53PM -0400, Denys Dmytriyenko wrote:
> > Hi,
> > 
> > I've been having the following build issues lately with qtwebkit 5.8 from 
> > master:
> > 
> > | make[2]: Entering directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
> > | rm -f libQt5WebKit.so.5.8.0 libQt5WebKit.so libQt5WebKit.so.5 libQt5WebKit.so.5.8
> > | linking ../lib/libQt5WebKit.so.5.8.0
> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `__bss_start'
> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_edata'
> > | /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_end'
> > | collect2: error: ld returned 1 exit status
> > | Makefile.api:92: recipe for target '../lib/libQt5WebKit.so.5.8.0' failed
> > | make[2]: *** [../lib/libQt5WebKit.so.5.8.0] Error 1
> > | make[2]: Leaving directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
> > | Makefile.QtWebKit:44: recipe for target 'sub-api-pri-make_first-ordered' failed
> > | make[1]: *** [sub-api-pri-make_first-ordered] Error 2
> > 
> > I believe I was able to build 5.8/master before, so I'm suspecting recent 
> > binutils upgrade... But I can be wrong. Would really appreciate some help 
> > here. Thanks.  
> 
> Anyone else see this?
> 

I do. Have you been able to solve it in the meantime?

Regards,
Andreas

