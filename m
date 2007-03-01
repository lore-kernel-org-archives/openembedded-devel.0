Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HMupE-0004RJ-64
	for openembedded-devel@openembedded.org; Fri, 02 Mar 2007 00:36:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l21NadlI008301
	for <openembedded-devel@openembedded.org>; Thu, 1 Mar 2007 23:36:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07900-03 for <openembedded-devel@openembedded.org>;
	Thu,  1 Mar 2007 23:36:36 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l21NaYsx008291
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 1 Mar 2007 23:36:34 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <06b101c75c25$edc2a410$6e01a8c0@twilight>
References: <06b101c75c25$edc2a410$6e01a8c0@twilight>
Date: Thu, 01 Mar 2007 23:36:35 +0000
Message-Id: <1172792195.19220.94.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: mtd-utils change: missing lzo1x.h
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
X-List-Received-Date: Thu, 01 Mar 2007 23:36:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-03-01 at 11:20 -0600, Mike (mwester) wrote:
> The latest changes to mtd-utils isn't working; complains about a missing
> header file (lzo1x.h).  Is there a missing dependency somewhere, or perhaps
> a PR didn't get bumped?   I can't find that file anywhere (oh, a google
> search finds many copies, but I expect that's not the right way to fix this
> ;-)   And it really didn't give me a good hint as to what package that file
> might be contained in so I could add the dependency...

It needs a DEPENDS += "lzo-native". Of course we don't have that yet but
it shouldn't be hard to build. My development system has the lzo
libraries installed so I didn't see this, sorry.

I'll try and get an lzo-native working...

> FWIW using PREFERRED_VERSION to go back to the original isn't working
> either; bbimage now apparently requires the newest mtd-utils-native:
> mkfs.jffs2: Unknown compressor name lzo

That's expected. We need to do that since otherwise people will get
messages about an unsupported compression format when they try to boot
their images. It can be enabled on a per machine basis once the kernels
have the right patches applied (see linux-rp 2.6.20).

Cheers,

Richard



