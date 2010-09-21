Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1Oy7Ig-0000mf-Nl
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 20:12:00 +0200
Received: from pi (unknown [10.240.22.2])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailhost.lundinova.se (Postfix) with ESMTP id 5B1D1B94006
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 19:47:26 +0200 (CEST)
Received: from johan by pi with local (Exim 4.72) (envelope-from <johan@pi>)
	id 1Oy6wA-0003hO-1a for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 19:47:26 +0200
Date: Tue, 21 Sep 2010 19:47:26 +0200
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100921174726.GA5750@lundinova.se>
References: <4C72C920.7080709@tycoelectronics.com>
	<AANLkTi=kCVt_+xBF+r400Nm6AXuApGk1ceuHVEim=K1c@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=kCVt_+xBF+r400Nm6AXuApGk1ceuHVEim=K1c@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: several recipes give a link error: libc.so, needed by libgcc_s.so, not found
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
X-List-Received-Date: Tue, 21 Sep 2010 18:12:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 23, 2010 at 10:58:07PM +0200, Frans Meulenbroeks wrote:
> 2010/8/23 Jay Snyder <jay.snyder@tycoelectronics.com>:
> > I am getting the following warning (I assume it is a warning, because they
> > all seem to produce working executables) for several recipes (rxvt-unicode
> > shown):
> >
> > ./rxvt-unicode-7.9-r1/temp/log.do_compile.9530:44:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/bin/ld:
> > warning: libc.so, needed by
> > /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/lib/libgcc_s.so,
> > not found (try using -rpath or -rpath-link)
[...]
> > There is a file, libc.so in the
> > /home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib path,
> > which IS in an -Wl,rpath= argument being passed to gcc (or g++) (and
> > subsequently to the linker).
> >
> > This problem didn't occur on a git-pull from December 4, 2009, but does on a
> > July 29,2010 pull.
> >
> I have seen the same message for libusb both with gcc 4.4.4 and 4.3.3
> Note that libc.so is in usr/lib while the lib.so.6 file is in lib.
> No idea if that is relevant.
> 
> libc.so contains:
> frans@linux-suse:~/oe/tmp_angstrom/sysroots> cat
> ./armv7a-angstrom-linux-gnueabi/usr/lib/libc.so
> /* GNU ld script
>    Use the shared library, but some functions are only in
>    the static library, so try that secondarily.  */
> OUTPUT_FORMAT(elf32-littlearm)
> GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED (
> /lib/ld-linux.so.3 ) )
> 
> No idea if these should be paths in sysroots (I'm not a dynamic linking expert).

Any progress on this issue?

Meanwhile, adding "-L${STAGING_DIR_TARGET}${base_libdir}" (and perhaps
also a rpath-link directive) to TARGET_LDFLAGS in conf/bitbake.conf
could serve as a work-around.

/Johan


