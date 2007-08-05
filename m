Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IHeO3-0003oR-5A
	for openembedded-devel@openembedded.org; Sun, 05 Aug 2007 13:35:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l75BWmi9018471
	for <openembedded-devel@openembedded.org>;
	Sun, 5 Aug 2007 12:32:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18001-10 for <openembedded-devel@openembedded.org>;
	Sun,  5 Aug 2007 12:32:45 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l75BWhWg018464
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 5 Aug 2007 12:32:43 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1186132901.5972.314.camel@hammer.suse.cz>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
	<1186064138.5972.259.camel@hammer.suse.cz>
	<46B1E812.8020706@dominion.kabel.utwente.nl>
	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>
	<46B1FC60.6030908@dominion.kabel.utwente.nl>
	<46B1FDD8.8000404@klever.net>
	<46B20D9F.70704@dominion.kabel.utwente.nl>
	<1186093013.6626.57.camel@localhost.localdomain>
	<1186132901.5972.314.camel@hammer.suse.cz>
Date: Sun, 05 Aug 2007 12:32:43 +0100
Message-Id: <1186313563.5962.36.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Sun, 05 Aug 2007 11:35:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-08-03 at 11:21 +0200, Stanislav Brabec wrote:
> Richard Purdie wrote:
> 
> > I'm actually semi against forcing staging to look like an image. The
> > fact gcc requires this for its sysroot option is a sign that they
> > haven't got this right yet.
> > 
> > With packaged staging we need to decide which way we go, separate
> > staging packages or use the same ones as we use for images.
> > 
> > My personal gut feeling is that separate ones will work better. They
> > also mean we can handle the extra staging files like pkgmaps and perhaps
> > handle multi machine easier.
> 
> Well, the point of gcc --sysroot is a simplification of cross
> compilation for those using complete sysroot environment.

Yes, I understand that and I appreciate it does solve a certain mount of
the problem! I just think it could be better and that it isn't a "solves
everything" solution for OE.

> But maybe there is possible to invent better method than the sysroot
> design is.
> 
> A random idea:
> 
> Define TARGET_ROOT_MAP, which may use similar syntax like overlay
> filesystems have. It will allow to construct sysroot by these
> filesystems on fly as well, e. g. for use with emulators.

That would be a much nicer solution. Staging could them have its own
mapping and it should solve most of the problems we see. Have you any
idea how difficult that would be to implement?

Regards,

Richard




