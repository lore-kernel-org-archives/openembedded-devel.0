Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HPcyJ-0000kE-2e
	for openembedded-devel@openembedded.org; Fri, 09 Mar 2007 12:09:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l29B9EDi015204
	for <openembedded-devel@openembedded.org>; Fri, 9 Mar 2007 11:09:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14383-08 for <openembedded-devel@openembedded.org>;
	Fri,  9 Mar 2007 11:09:11 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l29B9A3Z015192
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 9 Mar 2007 11:09:10 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200703091033.41288.christopher.lang@plus.cablesurf.de>
References: <1173131731.5842.140.camel@localhost.localdomain>
	<200703082126.20092.christopher.lang@plus.cablesurf.de>
	<1173393085.5805.51.camel@localhost.localdomain>
	<200703091033.41288.christopher.lang@plus.cablesurf.de>
Date: Fri, 09 Mar 2007 11:09:09 +0000
Message-Id: <1173438550.5864.57.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Bitbake Request for Testing of bitbake 1.8
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
X-List-Received-Date: Fri, 09 Mar 2007 11:09:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-03-09 at 10:33 +0100, Christopher Lang wrote:
> This is the output without -v without the 'GLIBC_ADDONS = "nptl"'. The "triple 
> glibc" note does not show.
> 
> http://pastebin.ca/387372
> 
> 
> This one is the original output (without the 'GLIBC_ADDONS = "nptl"') but with 
> -v. Only there you can see the line:
> NOTE: multiple preferred providers are available for runtime libsegfault 
> (glibc, glibc, glibc);
> 
> http://pastebin.ca/387374
> 
> I thought that multiple identical PREFERRED_PROVIDERS might indicate an issue. 

That just looks like the new logic in bitbake working as expected (it
examined all possible libc providers of which there were probably 3,
each one gave a messge). Yes, the output could be more friendly/readable
but that is an on going problem to be revisited during the UI overhaul. 

Bitbake 1.6 would do something similar if it had tried to build all 3
glibc providers.

Cheers,

Richard



