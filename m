Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nc5N6-00044k-Ki
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 00:07:59 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nc5Ki-0006GV-Ac from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 15:05:28 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Feb 2010 15:05:27 -0800
Received: from 134.86.101.223 ([134.86.101.223]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  1 Feb 2010 23:04:40 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Feb 2010 17:04:39 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265028954.3777.317.camel@mill.internal.reciva.com>
References: <1265011036-9086-1-git-send-email-raj.khem@gmail.com>
	<1265028954.3777.317.camel@mill.internal.reciva.com>
Organization: Mentor Graphics Corporation
Date: Mon, 01 Feb 2010 17:04:39 -0600
Message-Id: <1265065479.4255.32.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 01 Feb 2010 23:05:27.0821 (UTC)
	FILETIME=[0B471BD0:01CAA393]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][RFC] gcc: Restructure package creation.
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
X-List-Received-Date: Mon, 01 Feb 2010 23:07:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2010-02-01 at 12:55 +0000, Phil Blundell wrote:
> On Sun, 2010-01-31 at 23:57 -0800, Khem Raj wrote:
> > Hi,
> > 
> > Inspired by a discussion with RP on IRC this patch does following.
> > 
> > * Package most of target libraries during gcc-cross recipes
> >   and not during gcc target recipe.
> > 
> > * Do not build and package libraries like libstdc++ and others
> >   twice (once during cross compile and then during target gcc compile)
> > 
> > More libraries that can be built in cross gcc recipe should be packaged
> > there. These changes can be done after this patch.
> > 
> > Comments ?
> 
> I think it might be better to unbundle the libraries from gcc{-cross}
> altogether, and put them in a new recipe called gcc-runtime or
> something.  Having them built as part of gcc-cross seems to cause a
> certain level of headache for people who are using external toolchains;
> this happens already with libgcc and libstdc++, and I suspect your patch
> will cause the same issues to start popping up with the other libraries.

Well, isn't that exposing problems that exist today, rather than adding
new ones (ie the problem is that an unexpected (OE-built) libfoo is
used) ?

> Or, even better, put the different language runtimes in separate recipes
> so that folks who want to use Fortran can build those libraries without
> everybody else needing to do so.

It would be a good idea, I think, to 'time' a few builds like this, to
see how much time we save not building libgfortran (and the java one
too) and how much time we do or don't save by building libstdc++ on its
own.

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


