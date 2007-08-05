Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IHiBf-0006Vo-5T
	for openembedded-devel@openembedded.org; Sun, 05 Aug 2007 17:38:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l75FaDdM028120;
	Sun, 5 Aug 2007 16:36:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27119-06; Sun,  5 Aug 2007 16:36:09 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l75Fa62m028109
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 5 Aug 2007 16:36:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46B42830.8060809@dominion.kabel.utwente.nl>
References: <1185839805.7719.103.camel@localhost.localdomain>
	<46B42830.8060809@dominion.kabel.utwente.nl>
Date: Sun, 05 Aug 2007 16:36:05 +0100
Message-Id: <1186328165.5962.128.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: The future of "svnnow"
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
X-List-Received-Date: Sun, 05 Aug 2007 15:38:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-08-04 at 09:18 +0200, Koen Kooi wrote:
> Or what about naming URIs:
> 
> SRC_URI = "svn://foo/bar;name=main \
>            svn://foo/baz;name=baz-module \
>            svn://snizzle/foo;name=snizzle-foo-support"
> 
> SRCREV_FORMAT = "main"

This is more like what I had in mind allowing things like:

SRCREV_FORMAT = "rmain-rbaz-module-rsnizzle-foo-support"

which should result in a:

SRCREV of "r80-r90-r100"

which might even work over package upgrades :)

Cheers,

Richard



