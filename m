Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Mcncw-0007j8-Lu
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 23:50:59 +0200
Received: from 79-79-178-204.dynamic.dsl.as9105.com ([79.79.178.204]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1McnMN-0007kb-PB
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 22:33:54 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250330779.4406.9.camel@utx.utx.cz>
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1242507547.4226.1.camel@lenovo.internal.reciva.com>
	<4A867CCA.7060609@atmel.com>
	<1250329051.4215.167.camel@lenovo.internal.reciva.com>
	<1250330779.4406.9.camel@utx.utx.cz>
Date: Sun, 16 Aug 2009 22:33:35 +0100
Message-Id: <1250458415.4215.178.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Sun, 16 Aug 2009 21:51:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-08-15 at 12:06 +0200, Stanislav Brabec wrote:
> Phil Blundell wrote:
> > On Sat, 2009-08-15 at 11:15 +0200, Ulf Samuelsson wrote:
> > > Looks like xtscal in x11-image fails.
> > > 
> > > $ DISPLAY=":0.0" xtscal
> > > XCALIBRATE extension missing
> > 
> > That error is fairly self-explanatory: your xserver lacks the XCALIBRATE
> > extension.  Xtscal won't work if this is missing.
> 
> Well, there may be a problem in recipes. There is xcalibrate and
> libxcalibrate. Both provide the same library. Some recipes use
> xcalibrate in DEPENDS, some use libxcalibrate.

Although it might be true that there is an issue there, I don't think
this would be likely to cause the problem at hand.  If you get as far as
running xtscal then you must have at least some version of
libxcalibrate.so on hand, and as far as I know all recent-ish versions
of that library are wire-compatible so it shouldn't matter very much
which one you have.

It seems more likely that the xserver in question simply doesn't include
the extension.  Checking with xdpyinfo would quickly reveal whether or
not that's actually the case, anyway.

> libxcalibrate does not compile on images with xserver-kdrive.

I can't think offhand why libxcalibrate should care what xserver is in
your image.  What's the error you get?

p.




