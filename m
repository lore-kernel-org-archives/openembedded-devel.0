Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NeYtQ-0003V0-Cf
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 20:03:36 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NeYqx-0005Vh-BP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 11:00:59 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 8 Feb 2010 11:00:58 -0800
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  8 Feb 2010 19:00:04 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	08 Feb 2010 12:00:03 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265461459.5019.20.camel@lenovo.internal.reciva.com>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
	<20100204172234.GA5641@denix.org>
	<1265306225.26642.3.camel@trini-m4400>
	<1265461459.5019.20.camel@lenovo.internal.reciva.com>
Organization: Mentor Graphics Corporation
Date: Mon, 08 Feb 2010 12:00:03 -0700
Message-Id: <1265655603.16517.13.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 08 Feb 2010 19:00:58.0725 (UTC)
	FILETIME=[0CB4F150:01CAA8F1]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by using $SDK_PATH var in env setup script
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
X-List-Received-Date: Mon, 08 Feb 2010 19:03:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2010-02-06 at 13:04 +0000, Phil Blundell wrote:
> On Thu, 2010-02-04 at 11:57 -0600, Tom Rini wrote:
> > On Thu, 2010-02-04 at 12:22 -0500, Denys Dmytriyenko wrote:
> > > On Thu, Feb 04, 2010 at 11:57:51AM -0500, Chris Conroy wrote:
> > > > Does this really make the SDK relocatable? I thought there were still
> > > > major issues with relocating GCC.
> > > 
> > > GCC built from OE may still have relocation problems - haven't checked lately.
> > > But it doesn't mean that's the only use case scenario... There is also 
> > > external toolchain option, as well as building SDK without the toolchain.
> > > Both of those cases were tested with the above change for several months now.
> > 
> > The hard part is that in some distributions you will have libmpfr.so &
> > co if you have a host gcc, and on some you won't.  That in turn makes
> > gcc relocatable or not.  Everything else is handleable via --sysroot=.
> 
> What exactly is the problem with libmpfr?  I would have thought you
> could just ship libmpfr.so.6 inside the sysroot and link gcc against
> that local copy (via -rpath $ORIGIN...), without using the system
> library at all.

I hesitate to say this, since I haven't fully poked the other side of
the equation, but..  With $ORIGIN, you need I think 3 levels of
checking-back since cc1 (& others) need libmpfr.  That, mixed with just
how ugly the $ORIGIN stuff gets for gcc, is the problem.  Why you don't
always see the problem is that Ubuntu uses libmpfr.so for its gcc,
RHEL4Usomething (half I haven't checked into personally and so hesitate)
seems to not.

For gcc-cross-sdk, this isn't so much of an issue.  For gcc-cross and
$ORIGIN it gets ugly, but solvable.

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


