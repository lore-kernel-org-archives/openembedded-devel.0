Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OmE94-00071v-Ei
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 01:03:39 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7F005MO9CM1992@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	19 Aug 2010 18:02:51 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1B54C14AF64; Thu,
	19 Aug 2010 19:02:46 -0400 (EDT)
Date: Thu, 19 Aug 2010 19:02:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100819230246.GC26112@denix.org>
References: <AANLkTi=haC49V6XnCQpBCY8ickT24PL1F0sKYoh8h6=J@mail.gmail.com>
	<4C65BA04.9020908@mentor.com>
	<AANLkTim0dxLN000-oqvGbeaBdLTs7P6=9ZVDBfGn4LuA@mail.gmail.com>
	<AANLkTikAY38Wg01czaYa_o3_a2pXg2YcjAL8vbrEUYpL@mail.gmail.com>
	<AANLkTik8ujUK5vczYTOuoDdjuEEzTuY7_ifxbBnePpN9@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTik8ujUK5vczYTOuoDdjuEEzTuY7_ifxbBnePpN9@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iputils fails to build due to missing sgmlspl
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
X-List-Received-Date: Thu, 19 Aug 2010 23:03:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Aug 14, 2010 at 09:35:02AM -0600, AJ ONeal wrote:

> I was mistaken. It didn't build iputils. I started over from scratch, built
> everything up to iputils, and failed!
> 
> sgmlspl wasn't installed correctly (not in the path). I tried:
> bash-3.2$
> cp $OVEROTOP/tmp/work/i686-linux/sgmlspl-native-1.03ii-r0/SGMLSpm/sgmlspl
> $OVEROTOP/tmp/sysroots/i686-linux/usr/bin/
> 
> but then got another error:
> Can't locate SGMLS/Output.pm in @INC (@INC contains: /etc/perl
> /usr/local/lib/perl/5.10.0 /usr/local/share/perl/5.10.0 /usr/lib/perl5
> /usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10
> /usr/local/lib/site_perl .) at
> /mnt/data/overo-oe/tmp/sysroots/i686-linux/usr/bin/sgmlspl line 62.
> 
> Seeing that is was looking outside of the OE paths and not able to find it,
> I gave up.
> 
> sudo-apt-get install sgmlspl
> bitbake iputils
> 
> now it appears to be running...

BTW, I think it has just been fixed:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4511027a40d9659d944ff2e02503d51536af92a6

-- 
Denys


