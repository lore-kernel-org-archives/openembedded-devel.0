Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1NjdnP-0000cd-Sb
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 20:18:23 +0100
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Mon, 22 Feb 2010 14:15:32 -0500
Message-ID: <4B82D6E0.7030005@tycoelectronics.com>
Date: Mon, 22 Feb 2010 14:11:28 -0500
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.3892.1266855314.14961.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.3892.1266855314.14961.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Build GCC QA Issue: with objc: No GNU_HASH in the elf binary: '/home/oe/build/tmp/work/i686-angstrom-linux/gcc-4.3.3-r10.1/packages-split/objc/usr/lib/libobjc.so.2.0.0'
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
X-List-Received-Date: Mon, 22 Feb 2010 19:18:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ERROR: QA Issue with gcc: non -dev package contains symlink .so: gcc 
path 
'/work/i686-angstrom-linux/gcc-4.3.3-r10.1/packages-split/gcc/usr/lib/gcc/i686-angstrom-linux/4.3.3/libgcc_s.so'                                                                                                                                                            

ERROR: QA Issue with objc: No GNU_HASH in the elf binary: 
'/home/oe/build/tmp/work/i686-angstrom-linux/gcc-4.3.3-r10.1/packages-split/objc/usr/lib/libobjc.so.2.0.0'       

ERROR: QA run found fatal errors. Please consider fixing them.     

I get the GNU_HASH problem with a lot of packages, and quite frankly, it 
is really getting annoying.   My project deadline is quickly 
approaching, and I need a compete system, even if it doesn't have some 
of this security stuff in it (which, is what I assume the HASH stuff is 
for).

Is there any way to configure OE to ingore the QA stuff?     The 
GNU_HASH is not required for a working executable is it?

In this particular case, I'm trying to build a compiler to run natively 
on my target, so I can build some packages that have proved to be real 
tough to cross compile.

I can't be the first one out there to try this?    Has anyone else had 
this problem?

Was this GNU_HASH stuff added somewhere along the way, because it seems 
an aweful lot of packages are broken by this?


Thanks,
Jay



