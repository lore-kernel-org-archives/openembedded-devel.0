Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Np435-0002OB-G9
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 19:20:59 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KZ10022M1G94PM9@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	09 Mar 2010 12:17:09 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DC67014AF60; Tue,
	09 Mar 2010 13:16:56 -0500 (EST)
Date: Tue, 09 Mar 2010 13:16:56 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100309181656.GA19931@denix.org>
References: <E1NnJzb-0001K2-HM@melo.openembedded.org>
	<141020e31003052236w4afdcc26x1008a539f0491c9a@mail.gmail.com>
	<1267888617.11175.42.camel@rex>
MIME-version: 1.0
In-reply-to: <1267888617.11175.42.camel@rex>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and	package it appropriately
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
X-List-Received-Date: Tue, 09 Mar 2010 18:20:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Mar 06, 2010 at 07:16:57AM -0800, Richard Purdie wrote:
> On Sat, 2010-03-06 at 07:36 +0100, Martin Jansa wrote:
> > So I guess that
> > find ${D}${libdir} -name "libpixbufloader-*.so" -exec rm \{\} \;
> > in gtk+-native could help gdk-pixbuf-csource-native to work
> > 
> > but replacing gdk-pixbuf-csource-native with gtk+-native would be much better
> 
> No, it wouldn't, that recipe is useful to people who don't want to build
> a whole native gtk/X stack ;-).
> 
> Ideally, gtk+-native should just replace all the gdk-pixbuf-csource
> package but I don't think we can do that currently :(
> 
> > There is also bug when you rebuild gdk-pixbuf-csource-native and then
> > don't rebuild gtk+-native to fix pkgconfig gtk.
> > http://bugs.openembedded.org/show_bug.cgi?id=5405
> 
> gdk-pixbuf-csouce should not be installing a .pc file.

So, what would be the proper fix? I'm blocked at the moment with this 
gtk+/apple-red.png issue, where gtk+ is being pulled by gstreamer...
Thanks in advance for any help or suggestions.

-- 
Denys


