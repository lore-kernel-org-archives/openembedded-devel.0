Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IFqBS-0005Qb-TC
	for openembedded-devel@openembedded.org; Tue, 31 Jul 2007 13:46:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6VBiFHK002169;
	Tue, 31 Jul 2007 12:44:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01891-05; Tue, 31 Jul 2007 12:44:12 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6VBi9Vj002161
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 31 Jul 2007 12:44:09 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46AF0E33.4000107@dominion.kabel.utwente.nl>
References: <1185839805.7719.103.camel@localhost.localdomain>
	<46AF0E33.4000107@dominion.kabel.utwente.nl>
Date: Tue, 31 Jul 2007 12:44:08 +0100
Message-Id: <1185882248.6173.20.camel@localhost.localdomain>
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
X-List-Received-Date: Tue, 31 Jul 2007 11:46:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-07-31 at 12:25 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Richard Purdie schreef:
> > Hi,
> > 
> > As people know the ability to build the latest head revisions of svn
> > (for example) repositories in OE with bitbake has been limited and less
> > than ideal.
> 
> What happens if I have no internet connection during parsing and do have a huge
> sourcemirror inside my firewall?

Two possible solutions:

1. You have locked down SRCREVs

2. You have a valid head revisions cache from the last time you had
network access and you set the bitbake cache policy not to wipe that
cache.

I can't see any other ways around that and its probably better than the
current situation.

Cheers,

Richard



