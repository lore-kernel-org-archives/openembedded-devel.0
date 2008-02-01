Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JKszQ-0002Lv-PZ
	for openembedded-devel@openembedded.org; Fri, 01 Feb 2008 11:19:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m11AJUxg017487
	for <openembedded-devel@openembedded.org>; Fri, 1 Feb 2008 10:19:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17377-03 for <openembedded-devel@openembedded.org>;
	Fri,  1 Feb 2008 10:19:26 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m11AJQtj017481
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 1 Feb 2008 10:19:26 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Fri, 01 Feb 2008 10:19:24 +0000
Message-Id: <1201861164.4660.23.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Monotone issues
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
X-List-Received-Date: Fri, 01 Feb 2008 10:19:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Just so everyone is aware, it became apparent that a newer version of
strace in OE.dev had disappeared. This was traced back to something from
tmbinc which shouldn't have been merged but accidentally was.

A disapprove wouldn't work since the automerger had merged it. I asked
the monotone devs for advice on irc and was told I should be able to
suspend that revision and work from and older one.

I ran:

mtn suspend 50d03f17a42a3854cd87f47ef75084da297d194e

and then 

mtn up -r e651c4fa9a5d1fc6120cc2309e9cba1388cecc52

and then committed something to form a new head revision.

This appeared to work for me locally, I pushed it, pulled on another
machine and all seemed well, it would only affect anyone who'd actually
checked out the bad revision (50d03f17a42a3854cd87f47ef75084da297d194e)
who would then need to run 
mtn up -r11d1a9e6662c57de089d25a6900d5325f85d282e
and we ran the risk of someone merging this again but it could be worse.

monotone 0.37 wouldn't show the other head but I suspect older monotones
do and don't support the suspend certificate. I suspect the automerger
runs on a machine with an older monotone since it then merged the
problematic head back and put us back to square one.

So I've applied a reverse diff to restore the broken files and damaged
the history :(. I was thinking it was a larger scale problem than it is,
only about 12 files were affected. Its amazingly hard to work this out
though.

The difficulty in fixing this simple problem along with the speed issues
make me wonder if monotone is right for the future though? I do get put
off making commits due to the lack of speed too...

Richard



