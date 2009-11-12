Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N8Wd0-0003MM-Sl
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 11:10:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nACA5jbn006916 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 10:05:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5NSW+HewhbYA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 10:05:45 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nACA5a6J006887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 10:05:43 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911121045.36412.holger+oe@freyther.de>
References: <4AFBA741.6090207@techsol.ca>
	<200911121045.36412.holger+oe@freyther.de>
Date: Thu, 12 Nov 2009 10:03:48 +0000
Message-Id: <1258020228.7382.29.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: curl-native doesn't install includes
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
X-List-Received-Date: Thu, 12 Nov 2009 10:10:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-12 at 10:45 +0100, Holger Hans Peter Freyther wrote:
> On Thursday 12 November 2009 07:12:17 Dallas Foley wrote:
> > Pretty sure curl-native doesn't install it's includes, because from a clean
> > build opkg-native cant' find curl includes.
> > 
> > $ git show-ref org.openembedded.dev
> > 0462985d8af5e8d2a71f548abe29c6e3bbaa2d2a refs/heads/org.openembedded.dev
> > 
> > I'm not really sure if this patch is correct, but seems to work.
> 
> Is this a recent breakage? Could you attempt to build from a weeks older OE 
> metadata?

I can confirm this is a recent breakage and I'll push some fixes
shortly.

Cheers,

Richard



