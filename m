Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N8YaO-0003rx-M2
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 13:15:39 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nACCBBOa021272 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 12:11:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tdVM415-g3gK
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 12:11:11 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nACCB7fG021255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 12:11:09 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911120611.24699.holger+oe@freyther.de>
References: <200911120457.39018.holger+oe@freyther.de>
	<6ec4247d0911112034v54f570ccn4c4334a1da094f0d@mail.gmail.com>
	<200911120549.11166.holger+oe@freyther.de>
	<200911120611.24699.holger+oe@freyther.de>
Date: Thu, 12 Nov 2009 12:09:20 +0000
Message-Id: <1258027760.7382.36.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: meta-toolchain continues to woe
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
X-List-Received-Date: Thu, 12 Nov 2009 12:15:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-12 at 06:11 +0100, Holger Hans Peter Freyther wrote:
> On Thursday 12 November 2009 05:49:11 Holger Hans Peter Freyther wrote:
> 
> > The test case is really simple and I will repeat it here:
> > 
> > 	bitbake -c populate_sdk -b meta-toolchain.bb
> 
> 
> bisect shows me:
> 	bea72c2fecde175add169bb55df1922b048030c8
> 
> 
> IMHO the pace of the recent classes/ change was way too high, a branch and 
> some builds would have been a lot better (no critics on the changes 
> themselves). I'm about to write a simple meta-toolchain checker and plan to 
> run it once a a week.... or if someone has a spare machine I would run this 
> test there with every day..

I think regardless of how we did this there would be some bumps. It was
on a branch for a week and it was obvious nobody was testing it expect
me. Getting on and doing it and dealing with problems quickly seemed
like the best approach and was what we agreed at OEDEM.

For this specific issue, I've pushed some fixes for meta-toolchain, let
me know if there are any further problems. My test build completed
locally (bitbake meta-toolchain).

Cheers,

Richard



