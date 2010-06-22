Received: from mta9.brinkster.com ([65.182.109.78])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1OR93K-0003tR-5C
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 21:22:36 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta9.brinkster.com (Postfix) with ESMTP id 276CA2480CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 15:12:09 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mta9.brinkster.com
Received: from mta9.brinkster.com ([127.0.0.1])
	by localhost (mta9.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id giAmEqgPAuHa
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 15:12:08 -0400 (EDT)
Received: from MareImbrium (cpc1-bath2-0-0-cust327.aztw.cable.virginmedia.com
	[82.46.19.72])
	by mta9.brinkster.com (Postfix) with ESMTPA id 0DF882484EC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 15:12:07 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1277201329-1339-1-git-send-email-sledz@dresearch.de>	<hvq586$1jc$1@dough.gmane.org>	<4C20A60D.40102@dresearch.de>
	<hvqhbh$hqo$2@dough.gmane.org>
In-Reply-To: <hvqhbh$hqo$2@dough.gmane.org>
Date: Tue, 22 Jun 2010 20:11:56 +0100
Message-ID: <111b01cb123e$c90177a0$5b0466e0$@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQLaT1/I4uR17kgr7xaT/Y/+HKTECQJ/L8PeAnWeBmsB66oftpA41oug
X-SA-Exim-Connect-IP: 65.182.109.78
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev/mount.sh: try to kill active processes before umount
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jun 2010 19:22:36 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

> >> Wouldn't a umount -l be a lot better in this case?
> >
> > I'm not sure if this would do the right things.
> >
> > mount.sh is called with REMOVE action when the device *is
> > disconnected* i.e. the filesystem is no longer available.
> > So i believe it is not possible to "cleanup all references to the
> > filesystem as soon as it is not busy anymore".
> >
> > I think killing all the processes is the only way here.
> 
> I don't like the idea of killing random processes, especially is that
process is
> smart enough to "move on" after a timeout.

I concur, the issue at hand is a little 'rock and a hard place' (what is the
'correct' way to deal with processes left over when the file system has most
definitely been pulled with prejudice ;)). Killing processes feels a little
wrong as a lot of apps can recover from filesystem pulls.

That said, we have been experimenting with umount -l on the OpenPandora with
some promising initial results. We are also playing with some other changes
that may also be of wider interest (mountpoints based on SD card labels if
they exist etc.). I'll keep this thread updated with the results of testing,
if it works out well I was going to suggest some of the changes for the
stock mount.sh.

There is little harm in a umount -l in the short term.

Regards,

John





