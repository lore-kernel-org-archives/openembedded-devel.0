Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IHzea-0001Bj-53
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2007 12:17:36 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id C68D26282E4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2007 12:15:11 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B63294.30107@klever.net>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
	<1186064138.5972.259.camel@hammer.suse.cz>
	<46B1E812.8020706@dominion.kabel.utwente.nl>
	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>
	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>
	<46B20D9F.70704@dominion.kabel.utwente.nl>
	<1186093013.6626.57.camel@localhost.localdomain>
	<1186132901.5972.314.camel@hammer.suse.cz>
	<1186313563.5962.36.camel@localhost.localdomain>
	<46B63294.30107@klever.net>
Date: Mon, 06 Aug 2007 12:15:10 +0200
Message-Id: <1186395310.5972.360.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Mon, 06 Aug 2007 10:17:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Michael Krelin wrote:
> >> A random idea:
> >>
> >> Define TARGET_ROOT_MAP, which may use similar syntax like overlay
> >> filesystems have. It will allow to construct sysroot by these
> >> filesystems on fly as well, e. g. for use with emulators.
> > 
> > That would be a much nicer solution. Staging could them have its own
> > mapping and it should solve most of the problems we see. Have you any
> > idea how difficult that would be to implement?
> 
> I don't see how this random idea could be easily implemented (well, I
> have to admit I haven't really given it a thought), but it serves a
> perfect explanation why we can't go for sysroot at the moment and
> probably anytime soon... Unfortunately, I think I'm convinced.

Instead of defining
CC="my-platform-gcc"
we can define
CC="wrap-compile-time-paths my-platform-gcc"

All OE recipes already handle CC. We will only change cross-CC (and
similar) values. If recipes don't use buggy quoting, it will work out of
the box. Autoconf and friends handle CC string with spaces without any
problems.

Writing of wrap-compile-time-paths should be easy - I guess no more than
30 lines of bash code. Maybe I would prefer pure Bourne shell + sed or C
to make such code acceptable for upstream autoconf.

It looks like gcc implementation of sysroot does following things:
- Search some compiler stuff in sysroot.
- Add sysroot to all includes paths including default system paths
- Add sysroot to all library paths including default system paths
- Pass it to the linker, if it supports it.

Linker uses sysroot as well - it is able to strip it from certain paths.
Its use may be platform specific there.

I am still not sure, how correct will be binaries created by upper
mentioned wrappers, but it will be for sure better than the
libtool-level hack. And it's easy to catch remaining references by QA
scripts.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



