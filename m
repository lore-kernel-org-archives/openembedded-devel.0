Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jg4wX-0001Da-Nx
	for openembedded-devel@openembedded.org; Sun, 30 Mar 2008 23:19:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2ULJjoH021713
	for <openembedded-devel@openembedded.org>;
	Sun, 30 Mar 2008 22:19:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21503-05 for <openembedded-devel@openembedded.org>;
	Sun, 30 Mar 2008 22:19:41 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2ULJehS021704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 30 Mar 2008 22:19:40 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Sun, 30 Mar 2008 22:19:41 +0100
Message-Id: <1206911981.4838.12.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: libgcc not being pulled into OABI images
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
X-List-Received-Date: Sun, 30 Mar 2008 21:19:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

Various people had reported problems with libgcc not being pulled into
OABI images after some of the recent changes. Basically libgcc isn't
being listed as NEEDED (in objdump -p) when it used to be.

I did some tests comparing a good build with a bad build and it looked
like there was some problem with the crtbegin.o and crtbeginS.o files in
the cross directory. Swapping those two files over makes the difference
between libgcc appearing in NEEDED and not appearing.

These come from gcc-cross and the difference in compile options which
seems to trigger the problem is the -Dinhibit_libc flag. This is set in
the Makefile by the inhibit_libc option. Dependencies work as expected
if its true and break if its false.

That variable is set from gcc/configure with:

# If this is a cross-compiler that does not
# have its own set of headers then define
# inhibit_libc

# If this is using newlib, without having the headers available now,
# then define inhibit_libc in LIBGCC2_CFLAGS.
# This prevents libgcc2 from containing any code which requires libc
# support.
inhibit_libc=false
if { { test x$host != x$target && test "x$with_sysroot" = x ; } ||
       test x$with_newlib = xyes ; } &&
     { test "x$with_headers" = x || test "x$with_headers" = xno ; } ;
then
       inhibit_libc=true
fi

and in the recent gcc changes we've messed around with a number of these
options so this is likely to be the reason for the change.

I suspect in EABI builds something else causes libgcc to be pulled in
since inhibit_libc=false for these too yet they don't break.

So no, I don't have a fix as such and someone needs to look into this
further but at least we have a clue to the problem.

The bug reports were pthread related and it could be that specific
library has a problem which this other change was masking until now...

Cheers,

Richard



