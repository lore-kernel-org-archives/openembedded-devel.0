Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1IxLAR-00022M-58
	for openembedded-devel@openembedded.org; Wed, 28 Nov 2007 12:33:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lASBUSMI009995
	for <openembedded-devel@openembedded.org>; Wed, 28 Nov 2007 11:30:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09931-02 for <openembedded-devel@openembedded.org>;
	Wed, 28 Nov 2007 11:30:24 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lASBULAk009977
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 28 Nov 2007 11:30:21 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1868947900.20071127171928@gmail.com>
References: <474AFA66.30509@gmx.net>
	<1196166155.6780.11.camel@localhost.localdomain>
	<157949636.20071127154357@gmail.com>
	<1196172204.6780.37.camel@localhost.localdomain>
	<1712551091.20071127161727@gmail.com>
	<1196175943.6780.46.camel@localhost.localdomain>
	<1868947900.20071127171928@gmail.com>
Date: Wed, 28 Nov 2007 11:30:20 +0000
Message-Id: <1196249420.8098.21.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Build-time vs run-time virtuals, was: Re: python skills	and bug 2412
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
X-List-Received-Date: Wed, 28 Nov 2007 11:33:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-11-27 at 17:19 +0200, Paul Sokolovsky wrote:
>   Yes, thought about namespace came to my mind too. I wonder, if
> there're any ideas regarding that. Indeed, reusing "virtual-" prefix
> while being familiar, would be confusing ;-(. Any ideas about another
> standard prefix, or there would be adhoc naming conventions? From the
> examples given, at least sometimes it makes sense to use prefix-less
> Provides names:
> 
> gtk+ - real package, also implicitly provides gtk+
> gtk+-directfb - real packages, Provides gtk+
> 
> Or infamous libxine. I envision it should be:
> 
> libxine-x11, Provides libxine
> libxine-qpe, Provides libxine

Yes, various solutions like that are possible and probably the best way
to proceed.

> (The problem here is that actually built package will be linked
> against real package, and thus would apparently pull its name via
> shlib dependencies).

This is the real problem. If what Matt mentioned is correct about the
library names being embedded in the binaries at link time it could well
be doing the right thing though...

I guess someone interested in resolving this will have to experiment :)

Cheers,

Richard



