Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LdRZ0-0007L7-OJ
	for openembedded-devel@openembedded.org; Sat, 28 Feb 2009 16:57:19 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090228155335.QHKA4363.fed1rmmtao103.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 28 Feb 2009 10:53:35 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id MTtb1b00B4dMFYL04TtbJP; Sat, 28 Feb 2009 10:53:35 -0500
X-Authority-Analysis: v=1.0 c=1 a=w2fQQtqhE8cA:10 a=fsJ8Y90igy4A:10
	a=4cZEuU3xeSNu3g-4IrQA:9 a=SQ512uo60muPX0iNAjYy6Rqjg_EA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 28 Feb 2009 08:53:35 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090228155335.GJ5420@smtp.west.cox.net>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
	<c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
	<20090227162633.GD5420@smtp.west.cox.net>
	<ac9c93b10902280254j3ac8533bod972dfd150b46621@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b10902280254j3ac8533bod972dfd150b46621@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Sat, 28 Feb 2009 15:57:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 28, 2009 at 11:54:46AM +0100, Frans Meulenbroeks wrote:
[snip]
> Not sure whether it will be easy to make a build env with chroot
> (although I know debian does something like that).

Having done this, yes.  It's basically using deboostrap to setup a new
system, then for Ubuntu use aptitude and mark everything auto-installed
except ubuntu-minimal and ubuntu-standard.  Then use (and update)
the OEAndYourDistro wiki page + bitbake to see what other host stuff you
must bring in.  Vanilla Debian would be, I think, just a different set
of meta packages.

-- 
Tom Rini


