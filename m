Received: from [139.142.208.99] (helo=mail.franticfilms.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gneuf@ca.rr.com>) id 1Hwk2i-0000QU-Mz
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2007 21:22:43 +0200
Received: from neuf.ca.rr.com (unknown [75.5.31.74])
	by mail.franticfilms.com (Postfix) with ESMTP id 62799B7CCB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2007 14:20:05 -0500 (CDT)
Message-Id: <6.2.3.4.2.20070608115117.0ba979e8@pop-server.ca.rr.com>
X-Mailer: QUALCOMM Windows Eudora Version 6.2.3.4
Date: Fri, 08 Jun 2007 12:06:43 -0700
To: openembedded-devel@lists.openembedded.org
From: Glenn Neufeld <gneuf@ca.rr.com>
In-Reply-To: <eed7f0160706040138y6a777b6ay86b8237c3462373c@mail.gmail.co
 m>
References: <eed7f0160706040138y6a777b6ay86b8237c3462373c@mail.gmail.com>
Mime-Version: 1.0
Subject: Re: Gumstix machine support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2007 19:22:45 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed

Tom-
At 01:38 AM 6/4/2007, you wrote:
>Over the last few months I've been looking for an alternative to
>buildroot for the gumstix devices (www.gumstix.com). After giving up
>on Gentoo, I thought I'd have a go with OpenEmbedded. After reading
>through the documentation I realized what I needed to do was create a
>gumstix.conf in conf/machine, only to find one already there!

         I've been working with the gumstix and OE for a few months, 
and I've gotten everything to work except for my inability to get 
newer versions of u-boot to compile.  For that I still use buildroot.

         There's also a problem when building images in that the 
"mkimage" command doesn't get installed, so I've been putting it 
elsewhere and adding it to my PATH.

         I haven't contributed anything back because of my own 
uber-newbieness and the fact that I haven't been solving anything by 
*really* understanding the ins and outs of OE, although I'm getting there.

         I'm still using bitbake 1.6, and there are still problems 
related to my own understanding of the kernel - for example, I'm 
using the existing (working) 2.6.15, but I'm still trying to get my 
task-base version of my erzatz gumstix distro (temporarily called 
"gumstix-tb") to successfully compile 2.6.18.  I need a more in-depth 
understanding of the kernel features that are changing, and which 
patches I need (or now *don't* need) to make it all work.

         I've altered a lot of existing kernel patches to apply, but 
there's a lot more to it than just that.

         My current state of things is that the network, modules, 
wifi are working, matchbox and friends compiles and runs in the 
Xserver, and my cheap LCD with touchscreen works intermittently with 
respect to the touchscreen - I'm still struggling with the version of 
kdrive I'm using - kernel input event support is eluding me 
patch-wise.  Or maybe it's an X-org version problem?

         I can get data from the touchscreen with "ts_print", but 
when I try to get the X server to use it, the TS data stream dies 
until I reset.  I'm still working on that one.

         I'd like to think I could be "supporting" the gumstix in OE 
sometime soon, but I've got a lot more to learn before that happens.  :)

         Hope this helps.

-G!

>So my question is, how far along is gumstix support in OE and is it
>being supported/maintained? I've had a good look through the
>gumstix.conf which is there and it all looks right (although I'm an
>uber OE newbie at the moment!)
>
>Finally, the bitbake manual seems to neglect to mention the "?="
>operator in chapter 2. A kind chap on irc confirmed that ?= assigns a
>value to a variable if one has not already been set. I assume this is
>a := assignment, otherwise it would get confused if there were more
>than two ?= for a single variable?
>
>
>Cheers,
>
>Tom
>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



