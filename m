Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <EliSko@FastMail.fm>) id 1KnAEr-0002QX-Gy
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 12:56:25 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 5CAD21783F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2008 06:51:52 -0400 (EDT)
Received: from web6.messagingengine.com ([10.202.2.215])
	by compute1.internal (MEProxy); Tue, 07 Oct 2008 06:51:52 -0400
Received: by web6.messagingengine.com (Postfix, from userid 99)
	id 2B3A83430E; Tue,  7 Oct 2008 06:51:52 -0400 (EDT)
Message-Id: <1223376712.29377.1277948719@webmail.messagingengine.com>
X-Sasl-Enc: Adqe9wuTgHYac0r16UV2A0VSN3E9G/4aSh+dUqTidVfz 1223376712
From: "Eliyahu Skoczylas" <EliSko@FastMail.fm>
To: "Developers@OE.net" <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <1223374579.21329.1277940603@webmail.messagingengine.com>
In-Reply-To: <1223374579.21329.1277940603@webmail.messagingengine.com>
Date: Tue, 07 Oct 2008 12:51:52 +0200
Subject: Re: PHP on PPC little-endian? Conflicts w/ ncurses big-endian
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
X-List-Received-Date: Tue, 07 Oct 2008 10:56:25 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

FWIW, php-5.1.4-r2 from .stable does NOT have this problem.
So it seems like something might have broken w/ big-endian PHP in
transition from 5.1.4 to 5.2.0.

HTH,

-    Eliyahu

--
Eliyahu Skoczylas    +972 (54) 214-1505
While <EliSko@Eli-Sko.com> is temporarily down, please use <EliSko@FastMail.fm>, instead.

----- Original message -----
From: "Eliyahu Skoczylas" <EliSko@FastMail.fm>
To: "Developers at OE.net" <openembedded-devel@lists.openembedded.org>
Date: Tue, 07 Oct 2008 12:16:19 +0200
Subject: [oe] PHP on PPC little-endian? Conflicts w/ ncurses big-endian

Hi!

I'm building for PPC405 (using a new machine .conf that I'll upload when
the board is released).

So far, everything has built and run successfully, but I just tried
adding in PHP.

Every time it conflicts with libncurses:
> NOTE: package php-5.2.6-r2: task do_configure: started
> ERROR: function do_configure failed
> ERROR: log data follows (/tmp/OE_temp-new/work/ppc405-linux/php-5.2.6-r2/temp/log.do_configure.26285)
> | automake (GNU automake) 1.9.3
>   <snip>
> | AUTOV is 1.9
> | NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I/tmp/OE_temp-new/staging/powerpc-linux/usr/share/aclocal-1.9 -I /tmp/OE_temp-new/staging/powerpc-linux/usr/share/aclocal
> | sh: error while loading shared libraries: /tmp/OE_temp-new/staging/powerpc-linux/usr/lib/libncurses.so.5: ELF file data encoding not little-endian
> | autoreconf: Entering directory `.'
> | autoreconf: configure.in: not using Gettext
> | autoreconf: running: aclocal -I /tmp/OE_temp-new/staging/powerpc-linux/usr/share/aclocal-1.9 -I /tmp/OE_temp-new/staging/powerpc-linux/usr/share/aclocal --force
> | acinclude.m4:1089: warning: underquoted definition of PHP_CHECK_SIZEOF
> |   run info '(automake)Extending aclocal'
> |   or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
> | sh: error while loading shared libraries: /tmp/OE_temp-new/staging/powerpc-linux/usr/lib/libncurses.so.5: ELF file data encoding not little-endian
> | aclocal: autom4te failed with exit status: 127
> | autoreconf: aclocal failed with exit status: 127
> | FATAL: autoreconf execution failed.
> NOTE: Task failed: /tmp/OE_temp-new/work/ppc405-linux/php-5.2.6-r2/temp/log.do_configure.26285
> NOTE: package php-5.2.6-r2: task do_configure: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package php-5.2.6: failed
> ERROR: Build of /home/eliyahu/stuff/org.openembedded.dev/packages/php/php_5.2.6.bb do_configure failed
> ERROR: Task 4 (/home/eliyahu/stuff/org.openembedded.dev/packages/php/php_5.2.6.bb, do_configure) failed
> NOTE: Tasks Summary: Attempted 253 tasks of which 253 didn't need to be rerun and 1 failed.
> ERROR: '/home/eliyahu/stuff/org.openembedded.dev/packages/php/php_5.2.6.bb' failed

At first I thought it was a problem with ncurses, and I tried rebuilding
using older recipes and version of ncurses, but no luck.
(And why does PHP need ncurses, anyway?)
But suddenly it hit me - this is the target version for ppc405, and
libncurses.so.5 is CORRECTLY big-endian.  The problem is that PHP (or at
least autoreconf for PHP) wants little-endian.

Has no one built PHP recently for a big-endian platform?  Besides the
php-5.2.6-r2 in .dev, I also tried php-5.2.0-r1 from .stable and got the
same thing.


TIA,

-    Eliyahu
--
Eliyahu Skoczylas    +972 (54) 214-1505
While <EliSko@Eli-Sko.com> is temporarily down, please use
<EliSko@FastMail.fm>, instead.


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


