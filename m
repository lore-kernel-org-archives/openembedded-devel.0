Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IUiUh-0004xi-GA
	for openembedded-devel@openembedded.org; Mon, 10 Sep 2007 14:35:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8ACX33q004894
	for <openembedded-devel@openembedded.org>;
	Mon, 10 Sep 2007 13:33:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04530-08 for <openembedded-devel@openembedded.org>;
	Mon, 10 Sep 2007 13:32:59 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8ACWvOK004887
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 10 Sep 2007 13:32:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46E4F9B0.3070806@gmx.net>
References: <46E4E5DB.7050501@gmx.net> <46E4F12B.9080102@student.utwente.nl>
	<46E4F9B0.3070806@gmx.net>
Date: Mon, 10 Sep 2007 13:32:56 +0100
Message-Id: <1189427576.6153.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: 3rd party feeds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2007 12:35:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2007-09-10 at 10:00 +0200, Robert Schuster wrote:
> > You ping the angstrom maintainers and they will build that package and put it in the
> > angstrom feeds.
> Right. Pushing things upstream is the best solution.
> 
> Sadly not every distribution has maintainers to ping. There are devices
> which are equipped with OE-built distributions for which no public
> distro.conf exists[0].
> 
> > Angstrom *highly* discourages people to add random feeds from the internet.
> Sure, but I am not convinced that this holds for other distributions.
> Angstrom was meant to be a placeholder in my previous mail.

I'd recommend implementing what you're after as a script to run against
OE's deploy directory creating a new directory with just the ipks you
need in it. I would not alter OE's directories directly since that has
potential to break subsequent builds in weird ways.

I'd hope most people don't need to resort to doing this although I can
understand why some would want to.

Regards,

Richard



