Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1I8DOr-0004rs-Rz
	for openembedded-devel@openembedded.org; Tue, 10 Jul 2007 12:56:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6AApFRw026370;
	Tue, 10 Jul 2007 11:51:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26255-03; Tue, 10 Jul 2007 11:51:12 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6AAp8vB026362
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 10 Jul 2007 11:51:08 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <309753579.20070710112118@vanille-media.de>
References: <E1I7yE2-0000V0-1x@linuxtogo.org>
	<126613333.20070709215755@vanille-media.de>
	<f6u4pj$fk0$1@sea.gmane.org> <f6ubg3$97c$1@sea.gmane.org>
	<309753579.20070710112118@vanille-media.de>
Date: Tue, 10 Jul 2007 11:51:07 +0100
Message-Id: <1184064667.6435.45.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Rolf Leggewie <no2spam@nospam.arcornews.de>
Subject: Re: dbg packages
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
X-List-Received-Date: Tue, 10 Jul 2007 10:56:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-07-10 at 11:21 +0200, Dr. Michael Lauer wrote:
> Rolf Leggewie wrote:
> > Koen Kooi wrote:
> >> Packaging is tedious, but let's not automate doing the wrong thing  
> 
> > I certainly agree with the general statement.  But I wonder if in this
> > case it would not be OK to have just one big -dbg package per bb file
> > even if there are more subpackages.  Going granular is certainly nice
> > but I wonder if just having a dbg package suffices even if contains more
> > than necessary.  I guess the -dbg packages should not be necessary most
> > of the time.
> 
> > My vote would go for "bigger size" if it means "easier packaging right
> > now instead of later" unless that entails "something breaks".
> 
> I totally agree. If I have to decide between slightly less granular
> packaging of debug packages vs. tedious error-prone repetetive stating
> of packaging for debug packages I gladly chose the first one.
> 
> For debugging, one or very few packages per recipe makes perfect sense to me.

I also agree for what its worth, having one -dbg package per recipe
isn't really a hardship since when you're debugging you usually have
enough space not to worry about the slight extra space usage. In the
past I've gone for the one -dbg package approach when packaging apps.

Automating the debug package generation would be good. The best way to
do it would probably be to allow full regexps in FILES rather than the
existing rather limited python globs. Can we convert and maintain
backwards compatibility?

Cheers,

Richard





