Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Gm6O1-0006dT-82
	for openembedded-devel@openembedded.org; Mon, 20 Nov 2006 11:28:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAKAPWhd007305;
	Mon, 20 Nov 2006 10:25:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07152-03; Mon, 20 Nov 2006 10:25:28 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAKAPO2T007288
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 20 Nov 2006 10:25:24 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Mon, 20 Nov 2006 10:25:24 +0000
Message-Id: <1164018324.5818.9.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Profile of bitbake trunk
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
X-List-Received-Date: Mon, 20 Nov 2006 10:28:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

When experimenting over the weekend, I took an up to date profile of
bitbake trunk after the recent changes:

http://www.rpsys.net/openzaurus/temp/bb-profile.log

This shows three different sections of output:

1. A listing of the time spent in each function
2. A listing of where each function was called from
3. A listing of which functions a given function called.
(all with number of function calls in each case)

This was taken against poky i.e. about 600 .bb files. I disabled psyco
(-d) as it breaks the stack traces and I was using bitbake -p as well.

Some observations:

* We have 5.6 million function calls in total
* We process 221,762 lines of file (see readline and feeder). How much
of this is double processing of .inc/.bbclass files?
* feeder and handle are our heaviest functions now
* We still have 378,110 to getVarFlag
* The local.py fetcher is a heavier user of which (would caching help?)

Some notable changes:

* calls to getvarFlag were reduced from 1.1 million
* There are a lot less path.join calls thanks to the fetcher changes
* expand is now quite well down the list and isn't being used as heavily
as it was

Other comments/observations welcome :)

Parsing poky now takes 18 seconds from scratch :)

Richard



