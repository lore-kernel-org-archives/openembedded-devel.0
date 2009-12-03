Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NGAlx-0005ji-QS
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Dec 2009 13:27:07 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nB3CLvbw011051 for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2009 12:21:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mWRgQ31YCfua
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2009 12:21:57 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nB3CLrJA011046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2009 12:21:55 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200912030801.20540.holger+oe@freyther.de>
References: <200912021919.06663.marcin@juszkiewicz.com.pl>
	<200912030631.57262.holger+oe@freyther.de>
	<200912030801.20540.holger+oe@freyther.de>
Date: Thu, 03 Dec 2009 12:26:23 +0000
Message-Id: <1259843183.21323.74.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SVN fetcher fix for SRCREV=AUTOREV situations
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
X-List-Received-Date: Thu, 03 Dec 2009 12:27:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-12-03 at 08:01 +0100, Holger Hans Peter Freyther wrote:
> On Thursday 03 December 2009 06:31:57 Holger Hans Peter Freyther wrote:
> 
> > that sucks... we are doomed now. If the above directory is deleted in trunk
> > the -r option will not work to download a old rev...
> 
> 
> Stefan just highlighted the above might sound rude. What I tried to say is 
> that IIRC I changed the code to use @rev for the case of downloading a 
> revision where the directory is not in trunk with the current HEAD...
> 
> I don't think we can decide when to use -r and when to use @.. this is why I 
> say we are doomed. The best thing I can think of right now is to try @ and 
> then to go with -r... :(

I've heard reports of the same problem Marcin has from another user too.
I looked into it and I really don't know what the solution is. I think
you could find cases where either didn't work :(.

Cheers,

Richard




