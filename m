Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NUig1-00031e-QN
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 16:29:04 +0100
Received: from mcgi44.rambler.ru (mcgi44.rambler.ru [81.19.67.197])
	by mxa.rambler.ru (Postfix) with ESMTP id 56B7CA33B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 18:26:53 +0300 (MSK)
Received: from mcgi44.rambler.ru (localhost [127.0.0.1])
	by mcgi44.rambler.ru (Postfix) with ESMTP id BED4B1143C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 18:26:50 +0300 (MSK)
Received: from [77.52.17.176] by mcgi44.rambler.ru with HTTP (mailimap);
	Tue, 12 Jan 2010 18:26:48 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Jan 2010 18:26:48 +0300
MIME-Version: 1.0
References: <1234549968.1263282575.49599928.71648@mcgi65.rambler.ru>	<1263288966.457.153.camel@lenovo.internal.reciva.com>	<728686868.1263292036.179341680.5053@mcgi53.rambler.ru>	<727203316.1263292376.164699196.97945@mcgi41.rambler.ru>
	<1263305804.3675.396.camel@mill.internal.reciva.com>
	<4B4C92E7.3090107@cbnco.com>
Message-Id: <677336408.1263310008.156348904.7710@mcgi44.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Gnu/stubs-32.h not found
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
X-List-Received-Date: Tue, 12 Jan 2010 15:29:05 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

Thanks, Michael, Phil!
I will try but I now stuck with e2fsprogs and AM_GNU_GETTEXT.
After I resolve I try changes which Michael propose

* Michael Smith <msmith@cbnco.com> [Tue, 12 Jan 2010 10:19:03 -0500]:
> Phil Blundell wrote:
> > On Tue, 2010-01-12 at 13:32 +0300, Perepelica Alexander wrote:
>
> > Ah, I see.  So, you were right: it is in fact a multilibs problem.
> What
> > has happened here is that gcc is trying to build a 32-bit version of
> > libgcc2, but you haven't compiled a 32-bit version of glibc yet.
> >
> > There are two possible fixes:
> >
> > - write a variant .bb file to build a 32 bit glibc, and arrange for
> > gcc-cross to DEPEND on that; or
> >
> > - patch t-linux64, and/or the gcc configury, to stop it trying to
> build
> > the 32-bit multilib.
>
> One hack that worked for me is to amend the gcc-cross recipe to 
include:
>
> # glibc only built the 64-bit stubs, so don't try to build a 32-bit 
gcc
> EXTRA_OECONF_append_x86_64 = " --disable-multilib"
>
> And for gcc-cross-intermediate:
>
> do_compile_prepend() {
>          # On x86_64, glibc-initial stages crti.o to
>          # x86_64-oe-linux/lib64/crti.o.
>          # When gcc-cross-intermediate tries to build libgcc, it looks
>          # for x86_64-oe-linux/lib/../lib64/crti.o.
>          # Create the "lib" dir so this shenanigan works.
>          install -d ${STAGING_DIR_TARGET}/lib
> }
>
> Mike




--
Thank you.
Perepelica Alexander


