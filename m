Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <EliSko@FastMail.fm>) id 1KnBFi-0000eW-BP
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 14:01:22 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 031C3176F2C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2008 07:56:49 -0400 (EDT)
Received: from web6.messagingengine.com ([10.202.2.215])
	by compute1.internal (MEProxy); Tue, 07 Oct 2008 07:56:49 -0400
Received: by web6.messagingengine.com (Postfix, from userid 99)
	id D20B23C9B9; Tue,  7 Oct 2008 07:56:48 -0400 (EDT)
Message-Id: <1223380608.10806.1277957855@webmail.messagingengine.com>
X-Sasl-Enc: zKr6igyXFCA5LW+qnIYXRKtRtR8qmS4sra2YxdouIxSO 1223380608
From: "Eliyahu Skoczylas" <EliSko@FastMail.fm>
To: "Developers@OE.net" <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <1223374579.21329.1277940603@webmail.messagingengine.com>
	<gcffp7$7pm$1@ger.gmane.org>
In-Reply-To: <gcffp7$7pm$1@ger.gmane.org>
Date: Tue, 07 Oct 2008 13:56:48 +0200
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
X-List-Received-Date: Tue, 07 Oct 2008 12:01:22 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

On Tue, 07 Oct 2008 13:05:11 +0200, "Koen Kooi"
<k.kooi@student.utwente.nl> said:
> Your host autoreconf (most likely i386) is trying to link with target 
> libncurses (ppc405). I'm not sure how you expect that to work when 
> changing that to LE ppc binaries.
> 
> regards,
> 
> Koen

Yes, I saw that.
> > ...  The problem is that PHP (or at
> > least autoreconf for PHP) wants little-endian.

Note the place that the log data is coming from:
> >> ... (/tmp/OE_temp-new/work/ppc405-linux/php-5.2.6-r2/temp/log.do_configure.26285)

This is in the target stage (ppc405-linux) instead of the host stage
(i686-linux).

My question is better stated as:

+++ Why is php-5.2.6-r2 (and php-5.2.0-r1 before it) using a HOST
autoreconf when building (and linking to) a TARGET binary?

Thanks for helping me to clarify that.

-    Eliyahu

> On 07-10-2008 12:16, Eliyahu Skoczylas wrote:
> > Hi!
> >
> > I'm building for PPC405 (using a new machine .conf that I'll upload when
> > the board is released).
> >
> > So far, everything has built and run successfully, but I just tried
> > adding in PHP.
> >
> > Every time it conflicts with libncurses:
> >> NOTE: package php-5.2.6-r2: task do_configure: started
> >> ERROR: function do_configure failed
> >> ERROR: log data follows (/tmp/OE_temp-new/work/ppc405-linux/php-5.2.6-r2/temp/log.do_configure.26285)
> >> | automake (GNU automake) 1.9.3
> >>    <snip>
> >> | AUTOV is 1.9
> >> | NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I/tmp/OE_temp-new/staging/powerpc-linux/usr/share/aclocal-1.9 -I /tmp/OE_temp-new/staging/powerpc-linux/usr/share/aclocal
> >> | sh: error while loading shared libraries: /tmp/OE_temp-new/staging/powerpc-linux/usr/lib/libncurses.so.5: ELF file data encoding not little-endian
> >> | autoreconf: Entering directory `.'
> >> | autoreconf: configure.in: not using Gettext
> >> | autoreconf: running: aclocal -I /tmp/OE_temp-new/staging/powerpc-linux/usr/share/aclocal-1.9 -I /tmp/OE_temp-new/staging/powerpc-linux/usr/share/aclocal --force
> >> | acinclude.m4:1089: warning: underquoted definition of PHP_CHECK_SIZEOF
> >> |   run info '(automake)Extending aclocal'
> >> |   or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
> >> | sh: error while loading shared libraries: /tmp/OE_temp-new/staging/powerpc-linux/usr/lib/libncurses.so.5: ELF file data encoding not little-endian
> 
> Your host autoreconf (most likely i386) is trying to link with target 
> libncurses (ppc405). I'm not sure how you expect that to work when 
> changing that to LE ppc binaries.
> 
> regards,
> 
> Koen
> 
> 
> 
> >> | aclocal: autom4te failed with exit status: 127
> >> | autoreconf: aclocal failed with exit status: 127
> >> | FATAL: autoreconf execution failed.
> >> NOTE: Task failed: /tmp/OE_temp-new/work/ppc405-linux/php-5.2.6-r2/temp/log.do_configure.26285
> >> NOTE: package php-5.2.6-r2: task do_configure: failed
> >> ERROR: TaskFailed event exception, aborting
> >> NOTE: package php-5.2.6: failed
> >> ERROR: Build of /home/eliyahu/stuff/org.openembedded.dev/packages/php/php_5.2.6.bb do_configure failed
> >> ERROR: Task 4 (/home/eliyahu/stuff/org.openembedded.dev/packages/php/php_5.2.6.bb, do_configure) failed
> >> NOTE: Tasks Summary: Attempted 253 tasks of which 253 didn't need to be rerun and 1 failed.
> >> ERROR: '/home/eliyahu/stuff/org.openembedded.dev/packages/php/php_5.2.6.bb' failed
> >
> > At first I thought it was a problem with ncurses, and I tried rebuilding
> > using older recipes and version of ncurses, but no luck.
> > (And why does PHP need ncurses, anyway?)
> > But suddenly it hit me - this is the target version for ppc405, and
> > libncurses.so.5 is CORRECTLY big-endian.  The problem is that PHP (or at
> > least autoreconf for PHP) wants little-endian.
> >
> > Has no one built PHP recently for a big-endian platform?  Besides the
> > php-5.2.6-r2 in .dev, I also tried php-5.2.0-r1 from .stable and got the
> > same thing.
> >
> >
> > TIA,
> >
> > -    Eliyahu
> > --
> > Eliyahu Skoczylas    +972 (54) 214-1505
> > While<EliSko@Eli-Sko.com>  is temporarily down, please use<EliSko@FastMail.fm>, instead.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
--
Eliyahu Skoczylas    +972 (54) 214-1505
While <EliSko@Eli-Sko.com> is temporarily down, please use <EliSko@FastMail.fm>, instead.



