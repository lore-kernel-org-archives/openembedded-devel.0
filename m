Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1O1X8j-0007m6-LQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 05:50:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o3D3kqdw006426
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:46:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06189-04 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:46:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o3D3ke93006420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:46:45 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hq06ad$tnf$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex> <hpum4g$18m$1@dough.gmane.org>
	<1271090705.14344.16.camel@localhost.localdomain>
	<hq06ad$tnf$1@dough.gmane.org>
Date: Tue, 13 Apr 2010 04:46:35 +0100
Message-ID: <1271130396.15813.131.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Tue, 13 Apr 2010 03:50:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-04-13 at 00:19 +0200, Koen Kooi wrote:
> OK, I reproduced the abiword failure, it's in enchant:
> 
> | /bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=CC
> - --mode=link ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a
> - -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
> -
> -isystem/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
> - -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
> - -ggdb3 -module -avoid-version -no-undefined
> - -L/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> -
> -Wl,-rpath-link,/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> - -Wl,-O1 -Wl,--hash-style=gnu -o libenchant_aspell.la -rpath
> /usr/lib/enchant aspell_provider.lo -Wl,--export-dynamic -pthread
> - -lgmodule-2.0 -lrt -lglib-2.0
> - -L/OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> - -laspell ../../src/libenchant.la
> | /bin/grep:
> /OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la:
> No such file or directory
> | /bin/sed: can't read
> /OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la:
> No such file or directory
> | arm-angstrom-linux-gnueabi-libtool: link:
> `/OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la'
> is not a valid libtool archive
> 
> The file referenced
> (/OE/angstrom-dev/cross/armv7a/arm-angstrom-linux-gnueabi/lib/libstdc++.la)
> doesn't exist since it is located in
> /OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.la
> instead.
> 
> Any clues in which direction I should look to debug this?

Sorry I've not been able to spend the time I'd like on this stuff, work
and travel have got in the way and are probably going to tie me up for a
while yet if I'm realistic. Anyone at ELC should say hello btw! :) 

Jet lag prevents me thinking too clearly at the moment but whats
happening above is that the sysroot is starting to look more like the
real target filesystem and libstdc++ is moving to what I would say is
the correct place for it. This is good but it seems something, probably
a .la file has the incorrect path? Is this a build from scratch or an
old build? I suspect it would work with a build from scratch but if this
was one, there is some more subtle problem :/.

Alternatively, the lamangler may be causing this by leaving incorrect
paths in the .la files as I saw that issue isn't addressed yet.

Cheers,

Richard



