Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NdkRo-0000Wc-Sm
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 14:11:44 +0100
Received: from localhost ([127.0.0.1])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NdkPP-0008Qb-CW
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 13:09:11 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265306225.26642.3.camel@trini-m4400>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
	<20100204172234.GA5641@denix.org>
	<1265306225.26642.3.camel@trini-m4400>
Date: Sat, 06 Feb 2010 13:04:17 +0000
Message-ID: <1265461459.5019.20.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
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
X-List-Received-Date: Sat, 06 Feb 2010 13:11:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-02-04 at 11:57 -0600, Tom Rini wrote:
> On Thu, 2010-02-04 at 12:22 -0500, Denys Dmytriyenko wrote:
> > On Thu, Feb 04, 2010 at 11:57:51AM -0500, Chris Conroy wrote:
> > > Does this really make the SDK relocatable? I thought there were still
> > > major issues with relocating GCC.
> > 
> > GCC built from OE may still have relocation problems - haven't checked lately.
> > But it doesn't mean that's the only use case scenario... There is also 
> > external toolchain option, as well as building SDK without the toolchain.
> > Both of those cases were tested with the above change for several months now.
> 
> The hard part is that in some distributions you will have libmpfr.so &
> co if you have a host gcc, and on some you won't.  That in turn makes
> gcc relocatable or not.  Everything else is handleable via --sysroot=.

What exactly is the problem with libmpfr?  I would have thought you
could just ship libmpfr.so.6 inside the sysroot and link gcc against
that local copy (via -rpath $ORIGIN...), without using the system
library at all.

p.




