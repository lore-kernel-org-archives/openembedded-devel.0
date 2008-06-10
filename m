Received: from [58.28.6.13] (helo=oberon.wxnz.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tkemp@klc.net.nz>) id 1K62S4-0006FE-IB
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jun 2008 13:55:49 +0200
Received: from [192.168.10.2] (ip-118-90-48-148.xdsl.xnet.co.nz
	[118.90.48.148])
	by oberon.wxnz.net (Postfix) with ESMTP id AD1B246400E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2008 23:52:07 +1200 (NZST)
From: Terry Kemp <tkemp@klc.net.nz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jun 2008 23:50:21 +1200
Message-Id: <1213098621.16999.94.camel@sulphur.klc>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 (2.22.2-2.fc9) 
Subject: tar & ar native vs host (Fedora 9 issues)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 10 Jun 2008 11:55:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello devs,

I have been working on http://bugs.openembedded.net/show_bug.cgi?id=4350
and I have attached my recipe mods to this for review should someone
care to look at them. 

To explain though...
Fedora 9 builds won't get past do_rootfs - bad stuff happens in
arfile.py.  

First I tried forcing ipkg builds with tar-native. It didn't fix _this_
problem but I think it is a useful thing to do anyway. Dunno what you
will think of the brute force and ignorance approach in
ipkg-utils-native tho :-D

Next I have pretty much confirmed the Fedora 9 ar command doesn't play
nice with OE.. it inserts spurious ` characters into the ipkg.

To fix this I had to create a binutils-native recipe (its a bit ugly but
it gets me a native ar). Is there already a native staged ar somewhere?
The cross one dinnae wanna work with x86_64 anyway.

This seems to sort the issue (at least from looking at the ipkg in hex
editor) - although I am yet to confirm this, will know in about 4 hrs -
on about my 40th build from scratch.

5 hrs later... - IT WORKS! 

NOTE: Running task 1296 of 1299 (ID:
4, /home/tmk/gumstix/gumstix-oe/com.gumstix.collection/packages/images/gumstix-minimal-image.bb, do_rootfs)
NOTE: package gumstix-minimal-image-1.0: started
NOTE: package gumstix-minimal-image-1.0-r0: task do_rootfs: started
NOTE: package gumstix-minimal-image-1.0-r0: task do_rootfs: completed
NOTE: package gumstix-minimal-image-1.0: completed
NOTE: Tasks Summary: Attempted 1299 tasks of which 1297 didn't need to
be rerun and 0 failed.
NOTE: build 200806102336: completed


bigger question is - would it not be a good option to steer away from
host tools and used native staged ones (standardize), especially for
packaging. If so then the (host) tar and ar commands are pretty widely
used currently. 

I renamed my host /usr/bin/ar to /usr/bin/ar-old and built from scratch
watching what failed. most xxx-native packages seem to use (the host) ar
via libtool-native.

It would seem useful to add the binutils-native dependency to this
(libtool-native) recipe and use the natively staged ar for mostly
everything - especially given there is a known issue with at least the
Fedora 9 one when packaging. 
And I guess this should go for tar as well where needed - other than
un-packaging source of course.

And how does this all fit in with the packaging_xxx classes and opkg?

  
Caveat: most of my testing of this is done on the somewhat older
gumstix-oe fork (which I have updated with the latest ipkg-utils,
gmp-4.2.2 and dbus-1.2.1 etc as required). I do also have a current dev
that I use - mostly for checking the latest recipes. 
This seems however to be a current OE issue for stable, dev? and
gumstix-oe for Fedora 9 bleeding edgers.

Thanks and regards

Terry

BTW if I decide to take on a bug such as the above - should I change the
status to confirmed and assign to myself - not being a 'dev' and all?   
 



