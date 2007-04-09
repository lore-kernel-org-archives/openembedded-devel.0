Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Hb3U8-0002Ny-KY
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 01:41:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l39NfJU1024269;
	Tue, 10 Apr 2007 00:41:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23841-07; Tue, 10 Apr 2007 00:41:13 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l39NfCAc024262
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 10 Apr 2007 00:41:12 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1175383522.5852.21.camel@localhost.localdomain>
References: <1175383522.5852.21.camel@localhost.localdomain>
Date: Tue, 10 Apr 2007 00:41:13 +0100
Message-Id: <1176162073.5842.46.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Fixing OE.dev dependency issues
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
X-List-Received-Date: Mon, 09 Apr 2007 23:41:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-04-01 at 00:25 +0100, Richard Purdie wrote:
> I'm proposing we add the syntax:
> 
> do_patch[depends] = "quilt-native:populate_staging" 
> 
> to handle needs like this. Experiments on my local tree suggest we need
> the following patch to generate the correct dependencies:
> 
> http://www.rpsys.net/openzaurus/temp/oe-depends-fixes.patch
> 
> but of course once we do this, bitbake 1.6 is no longer going to work
> with the metadata since this change is not backwards compatible.

Since two months with bitbake 1.8 not working properly with trunk is
obviously unacceptable, I've given it some thought and found a way to
hopefully maintain backwards compatibility with bitbake 1.6:

http://www.rpsys.net/openzaurus/temp/oe-depends-fixes-r3.patch

This won't help performance of 1.6 but does let it continue to work. It
gathers together most of the code that can be removed when we switch to
1.8 too as an added bonus.

Can 1.6 users give this patch a test and report any problems please? If
there are no objections, I will check this in soon.

For reference I've already checked this into poky (without the
compatibility code) where its working fine with bitbake 1.8.

Cheers,

Richard



