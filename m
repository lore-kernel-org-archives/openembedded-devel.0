Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IGGUB-0001AH-L3
	for openembedded-devel@openembedded.org; Wed, 01 Aug 2007 17:51:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l71FnkKr019103;
	Wed, 1 Aug 2007 16:49:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18895-06; Wed,  1 Aug 2007 16:49:39 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l71Fnb4V019088
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 1 Aug 2007 16:49:37 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46AF2B6C.3040600@dominion.kabel.utwente.nl>
References: <1185839805.7719.103.camel@localhost.localdomain>
	<46AF0E33.4000107@dominion.kabel.utwente.nl>
	<1185882248.6173.20.camel@localhost.localdomain>
	<46AF2B6C.3040600@dominion.kabel.utwente.nl>
Date: Wed, 01 Aug 2007 16:49:36 +0100
Message-Id: <1185983376.6101.18.camel@localhost.localdomain>
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
X-List-Received-Date: Wed, 01 Aug 2007 15:51:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-07-31 at 14:30 +0200, Koen Kooi wrote:
> > 2. You have a valid head revisions cache from the last time you had
> > network access and you set the bitbake cache policy not to wipe that
> > cache.
> 
> Is there a nice way to distribute such a cache, for e.g. evil firewalls?

Its currently in a very simple SQL database table...

sqlite3 tmp/cache/MACHINE/bb_persist_cache.sqlite3
.dump BB_URI_HEADREVS

to see the info...

Cheers,

Richard




