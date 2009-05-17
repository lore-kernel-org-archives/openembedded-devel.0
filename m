Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5g8x-0007tz-Q5
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 15:11:07 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5g22-0007cH-4n
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 13:03:58 +0000
Received: from p5b3b31b9.dip.t-dialin.net ([91.59.49.185])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 13:03:58 +0000
Received: from no2spam by p5b3b31b9.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 13:03:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 17 May 2009 15:03:41 +0200
Message-ID: <gup1vi$sjq$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b31b9.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
Sender: news <news@ger.gmane.org>
Subject: uim and scim recipes - request for help
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
X-List-Received-Date: Sun, 17 May 2009 13:11:08 -0000
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

it seems like bitrot has crept in to the uim and scim recipes.  uim
1.3.1 is in OE and used to compile fine.  scim has never been a part of
OE thus far, but 1.4.6 used to compile fine when I tried about a year
ago　(had some other trouble with it then, so I never pushed the bb).  I
have published the scim recipe in a private branch in the OE git server now.

http://cgit.openembedded.net/cgit.cgi?url=openembedded/tree/recipes/scim&h=laibsch/scim

I asked in IRC for help (thanks RP and pb_) and it looks like this
problem is related to libtool, which AFAIK has recently been updated.

http://www.hentges.net/irclogs/%23oe/2009/May/20090517_oe.log#[20090517%2014:23:19]

Build logs (the successful ones are usually do_clean only):
uim: http://tinderbox.openembedded.net/packages/uim
scim: http://tinderbox.openembedded.net/packages/scim

Any help to get these compile again is greatly appreciated.  Latest uim
version is 1.5.5.  While we're at it, I guess it makes sense to get that
into OE.  I'll push a WIP bb to the laibsch/scim branch.

Regards

Rolf



