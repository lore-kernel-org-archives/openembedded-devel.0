Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HEP0Y-0004Nj-BC
	for openembedded-devel@openembedded.org; Tue, 06 Feb 2007 13:01:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l16C19h8016311
	for <openembedded-devel@openembedded.org>; Tue, 6 Feb 2007 12:01:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14397-10 for <openembedded-devel@openembedded.org>;
	Tue,  6 Feb 2007 12:01:06 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l16C15Tm016303
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 6 Feb 2007 12:01:05 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45C85F79.7040201@dominion.kabel.utwente.nl>
References: <45BB64DC.1080601@dominion.kabel.utwente.nl>
	<45C85593.3060603@dominion.kabel.utwente.nl>
	<74d0deb30702060248p7d13b997w6d997f1d9b804721@mail.gmail.com>
	<45C85F79.7040201@dominion.kabel.utwente.nl>
Date: Tue, 06 Feb 2007 12:01:05 +0000
Message-Id: <1170763266.5826.31.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: diet-x11, small-x11 and fat-x11
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
X-List-Received-Date: Tue, 06 Feb 2007 12:01:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-02-06 at 11:59 +0100, Koen Kooi wrote:
> > One thing I'd like to see would be a different package name for all
> > three of them, so we can actually have all versions in the feeds
> > (currently both libx11 and diet-x11 build packages with the same
> > name).
> 
> However annoying, it is a feature which we can exploit. If we take care that PR_small-x11
> < PR_medium-x11 < PR_big-x11 we can split those into different feeds containing libx11 +
> dependant apps.

Its probably unrealistic to maintain that and it will end up in a mess.

If we are going down this route, we should probably have applications
say which flavour of libx11 they want through some virtual namespaces.
virtual/libx11 would mean they'll work with any of the versions.

I'm also not keen on your naming. As Philipp said, it mixes different
naming styles and we should really have one.

Richard



