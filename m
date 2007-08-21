Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1INOjh-0003ln-Iy
	for openembedded-devel@openembedded.org; Tue, 21 Aug 2007 10:05:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7L84F7j009179
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Aug 2007 09:04:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08851-07 for <openembedded-devel@openembedded.org>;
	Tue, 21 Aug 2007 09:04:11 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7L847Uk009160
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Aug 2007 09:04:07 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0708201452q3b596e76j8d7623cd6907c799@mail.gmail.com>
References: <c384c5ea0708201339j44462d85o286bbb548b256aec@mail.gmail.com>
	<46CA0337.9050709@gmail.com>
	<c384c5ea0708201452q3b596e76j8d7623cd6907c799@mail.gmail.com>
Date: Tue, 21 Aug 2007 09:04:07 +0100
Message-Id: <1187683447.6234.4.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Add Intel Core 2 machine support (prescott and nocona)
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
X-List-Received-Date: Tue, 21 Aug 2007 08:05:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-08-20 at 23:52 +0200, Leon Woestenberg wrote:
> My current proposal is:
> 
> conf/machine/x86_32-prescott.conf
> conf/machine/include/x86_32-prescott.conf
> -arch=prescott
> TARGET_ARCH=i686
> 
> conf/machine/x86_64-nocona.conf
> conf/machine/include/x86_64-nocona.conf
> -arch=nocona
> TARGET_ARCH=x86_64
> 
> starting with GCC 4.3:
> conf/machine/x86_64-core2.conf
> conf/machine/include/x86_64-core2.conf
> -arch=core2
> TARGET_ARCH=x86_64

Please don't use '_' in the names. It may work but it has the potential
to mess up bitbake's override handling and would be better avoided. I
know people have had issues with "x86_64" already due to this.

> The remaining issue is that the TARGET_ARCH suggests that the
> resulting packages run on any i686 or x86_64 which is not necessarely
> true due to the instruction set being used.
> 
> Although we could create more generic machines, my direct interest is
> in (live) media encoding and some packages will use SSE3 and SSSE3.

When using optimised output like that you really do need to use a
different TARGET_ARCH since as you say, the packages will not run on
standard i686/x86_64...

Cheers,

Richard



