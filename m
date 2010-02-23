Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NjwgE-0003g8-EW
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 16:28:13 +0100
Received: from tamarin.localnet (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 72F991B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 15:26:50 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2010 16:25:17 +0100
User-Agent: KMail/1.13.0 (Linux/2.6.33-rc8; KDE/4.4.0; i686; ; )
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>
	<4B83DBDD.7020004@tycoelectronics.com>
In-Reply-To: <4B83DBDD.7020004@tycoelectronics.com>
MIME-Version: 1.0
Message-Id: <201002231625.18070.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Openembedded-devel Digest, Vol 43, Issue 99
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
X-List-Received-Date: Tue, 23 Feb 2010 15:28:13 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 23 February 2010 14:45:01 Jay Snyder wrote:

> 
> I'll post details next time I run into it.     Your solution above
> doesn't fix the problem, as the error the OE build system complaining
> about binaries NOT having the GNU Hash.

Why the need for capital letters? Take a look at the insane.bbclass, it will 
check if the target has the GNU hash only if --hash-style=gnu or --hash-
style=both is in the LDFLAGS (as seen from Bitbake). This means if you do not 
have --hash-style=* in your LDFLAGS, insane.bbclass will not test and it will 
not complain.

z.


