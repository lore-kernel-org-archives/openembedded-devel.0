Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HUhVf-0000Kz-OP
	for openembedded-devel@openembedded.org; Fri, 23 Mar 2007 12:00:41 +0100
Received: (qmail 12895 invoked by uid 813007); 23 Mar 2007 11:00:38 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 23 Mar 2007 11:00:38 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2007 12:00:30 +0100
User-Agent: KMail/1.9.6
MIME-Version: 1.0
X-UID: 39
Message-Id: <200703231200.31520.openembedded@hrw.one.pl>
Subject: Building Python extensions
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
X-List-Received-Date: Fri, 23 Mar 2007 11:00:45 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Thanks to Mickeyl's work we have nice support for building Python and 
Python related stuff in OpenEmbedded.

Recently I was working for OpenedHand on project which required lot of 
Python work to get stuff done. And I got hit by lot of problems due to 
64bit host environment while I was building for 32bit target. In short: 
it is miracle that Python stuff was building before...

Longer version:

When we build Python extension (for example python-pygtk2) configure 
script builds one test program to check does it has Python headers. On my 
system it mostly failed due to this part of python2.4/pyport.h header:

#if LONG_BIT != 8 * SIZEOF_LONG
/* 04-Oct-2000 LONG_BIT is apparently (mis)defined as 64 on some recent
 * 32-bit platforms using gcc.  We try to catch that here at compile-time
 * rather than waiting for integer multiplication to trigger bogus
 * overflows.
 */
#error "LONG_BIT definition appears wrong for platform (bad gcc/glibc 
config?)."
#endif

And all because wrong include path is used:

configure:9284: checking for headers required to compile python extensions
configure:9303: arm-linux-gcc -E 
-isystem/a/home/hrw/devel/build/cel/tmp/staging/arm-linux/include 
-I/a/home/hrw/devel/build/cel/tmp/staging/i686-linux/include/python2.4 
conftest.c

So as long as we are building for target of same size as host (32bit for 
32bit) everything is ok but everything is going to break for 64bit -> 
32bit (or vice versa).

I got fix for it of course. M4 scripts of each used Python extensions use 
macro AM_CHECK_PYTHON_HEADERS which I edited to add one option to 
configure: --with-python-includes which should be pointed to 
${STAGING_INCDIR}/../ to get it working.

I will sync some of Python extensions with this fix from Poky into 
OpenEmbedded in next days (python-pygtk2 already pushed).

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           Q:      What's a light-year?
           A:      One-third less calories than a regular year.




