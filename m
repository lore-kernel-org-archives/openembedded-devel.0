Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IE8H3-0004aU-0H
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 20:41:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6QIdxaO027979
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 19:39:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27805-05 for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 19:39:54 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6QIdoxP027968
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 19:39:50 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46A8DB81.5070900@dominion.kabel.utwente.nl>
References: <46A88A22.5010608@dominion.kabel.utwente.nl>
	<46A89F67.5080907@klever.net>
	<46A8DB81.5070900@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 19:39:50 +0100
Message-Id: <1185475190.6132.53.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] make building working zaurus images easier
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
X-List-Received-Date: Thu, 26 Jul 2007 18:41:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-07-26 at 19:36 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Michael Krelin schreef:
> > I have never looked into all this machinery, but since we have, e.g.
> > x11-image-spitz.tar.gz and zImage-spitz.bin symlinks, I'd guess that we 
> > can do without these somewhat ugly when unnecessary `ls|sort|uniq|tail` 
> > things, can't we?
> 
> Won't tar package up the symlinks instead of the real files in that case?

Yes, but we can use readlink to work out the real file...

Cheers,

Richard



