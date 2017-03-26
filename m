Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 473ED71CB3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Mar 2017 20:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D800B208E3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Mar 2017 20:30:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id nYJoBv2S8RFC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Mar 2017 20:30:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BF572208CB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Mar 2017 20:30:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 51A7816242A; Sun, 26 Mar 2017 16:30:53 -0400 (EDT)
Date: Sun, 26 Mar 2017 16:30:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170326203053.GH15664@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [meta-qt5] qtwebkit 5.8 build issues?
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
X-List-Received-Date: Sun, 26 Mar 2017 20:31:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've been having the following build issues lately with qtwebkit 5.8 from 
master:

| make[2]: Entering directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
| rm -f libQt5WebKit.so.5.8.0 libQt5WebKit.so libQt5WebKit.so.5 libQt5WebKit.so.5.8
| linking ../lib/libQt5WebKit.so.5.8.0
| /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
| /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `__bss_start'
| /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
| /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_edata'
| /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
| /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Core.so:(*IND*+0x0): multiple definition of `_end'
| /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `__bss_start'
| /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_edata'
| /OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/recipe-sysroot/usr/lib/libQt5Gui.so:(*IND*+0x0): multiple definition of `_end'
| collect2: error: ld returned 1 exit status
| Makefile.api:92: recipe for target '../lib/libQt5WebKit.so.5.8.0' failed
| make[2]: *** [../lib/libQt5WebKit.so.5.8.0] Error 1
| make[2]: Leaving directory '/OE/master/build/tmp/work/armv7ahf-neon-oe-linux-gnueabi/qtwebkit/5.8.0+gitAUTOINC+74ac5b0f34-r0/build/Source'
| Makefile.QtWebKit:44: recipe for target 'sub-api-pri-make_first-ordered' failed
| make[1]: *** [sub-api-pri-make_first-ordered] Error 2

I believe I was able to build 5.8/master before, so I'm suspecting recent 
binutils upgrade... But I can be wrong. Would really appreciate some help 
here. Thanks.

-- 
Denys

