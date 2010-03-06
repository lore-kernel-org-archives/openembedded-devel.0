Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NnvnO-0005vX-Bx
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 16:20:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o26FH8oR029975;
	Sat, 6 Mar 2010 15:17:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29935-01; Sat,  6 Mar 2010 15:17:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o26FGxZN029968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 6 Mar 2010 15:17:00 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <141020e31003052236w4afdcc26x1008a539f0491c9a@mail.gmail.com>
References: <E1NnJzb-0001K2-HM@melo.openembedded.org>
	<141020e31003052236w4afdcc26x1008a539f0491c9a@mail.gmail.com>
Date: Sat, 06 Mar 2010 07:16:57 -0800
Message-ID: <1267888617.11175.42.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and package it appropriately
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
X-List-Received-Date: Sat, 06 Mar 2010 15:20:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-03-06 at 07:36 +0100, Martin Jansa wrote:
> So I guess that
> find ${D}${libdir} -name "libpixbufloader-*.so" -exec rm \{\} \;
> in gtk+-native could help gdk-pixbuf-csource-native to work
> 
> but replacing gdk-pixbuf-csource-native with gtk+-native would be much better

No, it wouldn't, that recipe is useful to people who don't want to build
a whole native gtk/X stack ;-).

Ideally, gtk+-native should just replace all the gdk-pixbuf-csource
package but I don't think we can do that currently :(

> There is also bug when you rebuild gdk-pixbuf-csource-native and then
> don't rebuild gtk+-native to fix pkgconfig gtk.
> http://bugs.openembedded.org/show_bug.cgi?id=5405

gdk-pixbuf-csouce should not be installing a .pc file.

Cheers,

Richard



