Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JRQRz-0004Vz-1I
	for openembedded-devel@openembedded.org; Tue, 19 Feb 2008 12:15:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1JBF4rl029947
	for <openembedded-devel@openembedded.org>; Tue, 19 Feb 2008 11:15:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29812-04 for <openembedded-devel@openembedded.org>;
	Tue, 19 Feb 2008 11:14:57 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1JBErvL029929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 19 Feb 2008 11:14:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Tue, 19 Feb 2008 11:14:52 +0000
Message-Id: <1203419692.21824.35.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE.dev roadworks notification
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
X-List-Received-Date: Tue, 19 Feb 2008 11:15:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

At OEDEM last year and in various other discussions it was decided that
sysroot support was in OE's interests. Since then I successfully rolled
that out in Poky, I'm now in a position to do the same for OE.dev.

On a similar note, I'll be doing some work on packaged staging over the
next few weeks. Again, its been agreed that its in the interests of
OE.dev on many occasions and now I/we have a chance for action which I'm
planing to make good use of it. 

Both sets of changes have the potential to break things. I will
obviously try to avoid that and endeavour to fix any breakage that does
happen as quickly as possible. I'd just ask that people keep an eye on
the commit messages and mailing list and appreciate that there may be
some instability. If your project/use of OE can't cope with the
instability and time debugging anything, just don't update or use the
stable branch!

With packaged staging one thing we need to decide whether ultimately its
something optional which people opt into, or whether having staging
under control of a package manager is something desirable at all times.
My gut feeling is that its something we should really make mandatory or
opt-out, maybe not at first but certainly longer term but I'm open to
views on that.

Note that I'm not going to RFC everything since the volume of changes
will mean we'd never get anywhere. I think the core team and other devs
trust me enough not to do anything too insane. If anyone does see
anything they don't like by all means question it on the mailing list.

As an opening salvo, I'll be updating the minimum bitbake version
requirement to 1.8.10 and removing all the compatibility code we have to
do with copyfile and file locking (packaged staging will need the
locking functions added in 1.8.10).

Cheers,

Richard




