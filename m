Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NSoaV-0001Lg-RA
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 10:23:30 +0100
Received: by fxm4 with SMTP id 4so15027584fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 01:21:23 -0800 (PST)
Received: by 10.103.76.22 with SMTP id d22mr3899911mul.79.1262856082021;
	Thu, 07 Jan 2010 01:21:22 -0800 (PST)
Received: from xora-vm2.xora.org.uk (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id 25sm24909048mul.50.2010.01.07.01.21.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 07 Jan 2010 01:21:21 -0800 (PST)
Received: by xora-vm2.xora.org.uk (Postfix, from userid 500)
	id B714124162; Thu,  7 Jan 2010 09:21:22 +0000 (GMT)
Date: Thu, 7 Jan 2010 09:21:21 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100107092121.GC1950@xora-vm2.xora.org.uk>
References: <201001060507.31754.holger+oe@freyther.de>
	<hi31m7$hc3$1@ger.gmane.org>
	<20100107084341.GB1950@xora-vm2.xora.org.uk>
	<ac9c93b11001070050i67af2caem7ac6d7164b130c@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11001070050i67af2caem7ac6d7164b130c@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Thu, 07 Jan 2010 09:23:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jan 07, 2010 at 09:50:36AM +0100, Frans Meulenbroeks wrote:
> 2010/1/7 Graeme Gregory <dp@xora.org.uk>:
> > On Wed, Jan 06, 2010 at 11:09:10PM +0100, Rolf Leggewie wrote:
> >> allergic to COMPATIBLE_MACHINE for no particular reason).  Bitbake can't
> >> do versioned depends and so we can't say that $bb2-$version does not
> >> compile with gcc less than 3.4.x, for example.  Those are just two
> >> examples.  XorA "solved" this in a hackish way with angsstrom.bbclass.
> >>
> > No he didnt and no its not a hack. Its a blacklist of packages that for
> > various reasons Angstrom NEVER wants built.
> 
> Should we have such a blacklist per machine?
> My sheevaplug rungs angstrom, but as it has no display it has no need
> for an X server, nor for ide or pci or sata tools.
> 
It follows the standard overide rules (or should do) so you should
be able to blacklist per machine.

Of course you chose a bad example as I know quite a few people are using
the sheeva with usb displaylink adapters.

Graeme



