Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HlOpw-00042x-To
	for openembedded-devel@openembedded.org; Tue, 08 May 2007 14:30:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l48CU9PS005822
	for <openembedded-devel@openembedded.org>;
	Tue, 8 May 2007 13:30:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05680-03 for <openembedded-devel@openembedded.org>;
	Tue,  8 May 2007 13:30:06 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l48CU5NK005803
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 8 May 2007 13:30:05 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <432beae0705062129i11f69731n1d12777f46a83316@mail.gmail.com>
References: <35653307.20070503154732@gmail.com>
	<1178198199.6312.30.camel@localhost.localdomain>
	<432beae0705062129i11f69731n1d12777f46a83316@mail.gmail.com>
Date: Tue, 08 May 2007 13:30:05 +0100
Message-Id: <1178627405.6061.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [ALERT] Security vulnerability with recent OE	bitbake.conf changes
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
X-List-Received-Date: Tue, 08 May 2007 12:30:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-05-06 at 21:29 -0700, Justin Patrin wrote:
> Ummm...where? I tried that in my local.conf and it did nothing. I've
> also grepped for PATCH_RESOLVER in both bitbake and oe and found
> nothing.

Sorry, it should be PATCHRESOLVE = "noop", my memory is playing tricks.

> Please, let's remove the gnome-terminal default, it makes no sense to
> assume that the lowest common denominator is running bitbake from X...

"noop" should be the default. There is no good argument for which
terminal UI should/shouldn't be the default. Ideally I guess it would
autoselect unless the user specifies, I'll give that some thought. A
warning from sanity.bbclass about a missing command might be good too...

Cheers,

Richard



