Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HXDkZ-000570-Cf
	for openembedded-devel@openembedded.org; Fri, 30 Mar 2007 11:50:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2U9oP6T027076;
	Fri, 30 Mar 2007 10:50:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26871-04; Fri, 30 Mar 2007 10:50:20 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2U9o1u1027049
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 30 Mar 2007 10:50:01 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <18310385162.20070330115222@gmail.com>
References: <18310385162.20070330115222@gmail.com>
Date: Fri, 30 Mar 2007 10:50:00 +0100
Message-Id: <1175248200.5822.3.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Solving ipkg-utils issues
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
X-List-Received-Date: Fri, 30 Mar 2007 09:50:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Paul,

Thanks for looking at this, its something that does need fixing.

On Fri, 2007-03-30 at 11:52 +0300, Paul Sokolovsky wrote:
>   For quite some time bugs in ipkg-utils package (mostly in
> ipkg-make-index tool) plagued image creation process in OE. Many of
> them are known to old-time developers, and being (manually) worked
> around. I was working on resolving them for some time, and guess now
> finally have both clear picture of the issues and their interaction
> with each other, and fixes for them. So, I would like to push these
> fixes to mainline, and am opening this thread for review of
> them, as well as to collect any other concerns about ipkg-utils.
> 
>   In my list, there're 3 major issues:
> 
> 1. Broken version comparison logic in ipkg-utils (note that this is
> exactly ipkg-utils issues, nether bitbake nor ipkg is affected).
> 
> 2. Inability of ipkg-make-index to detect packages which were updated,
> while version stays the same.
> 
> 3. Performance issues.
> 
> 
>   Patch for p.1 is here: http://bugs.openembedded.org/show_bug.cgi?id=2061

I agree with fixing all the above. I've only had a quick glance at the
actual patch but I'm fine with committing it and getting testing that
way. There is python version comparison code in bitbake which may or may
not be of use.

Does this correctly handle epochs btw? We're going to need that soon...

Cheers,

Richard



