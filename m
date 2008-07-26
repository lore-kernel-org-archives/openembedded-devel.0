Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KMhDu-0007ot-Ur
	for openembedded-devel@openembedded.org; Sat, 26 Jul 2008 12:42:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6QAedXU010425
	for <openembedded-devel@openembedded.org>;
	Sat, 26 Jul 2008 11:40:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10216-05 for <openembedded-devel@openembedded.org>;
	Sat, 26 Jul 2008 11:40:33 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6QAeT14010416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 26 Jul 2008 11:40:29 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <488AF2ED.2030709@gmx.de>
References: <4889169C.7040108@gmx.de>
	<1217065082.22069.111.camel@mill.internal.reciva.com>
	<488AF2ED.2030709@gmx.de>
Date: Sat, 26 Jul 2008 11:40:29 +0100
Message-Id: <1217068829.5463.20.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: kernel.bbclass and collie changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 26 Jul 2008 10:42:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-07-26 at 11:48 +0200, Thomas Kunze wrote:
> Phil Blundell wrote:
> > On Fri, 2008-07-25 at 01:56 +0200, Thomas Kunze wrote:
> >   
> >> +/dev/mmcblk0p1	b	6600	0	6	179	1	-	-	-
> >>     
> >
> > Is that "6600" really correct?
> >   
> Of course not. Just a typo.
> > It does also seem bit odd having an mmc device in the "minimal" device
> > table.  I can understand why you need it on collie but I am not sure it
> > is all that desirable for device-table-minimal.txt to become the union
> > of the devices that everybody needs on their favourite platform for
> > booting purposes.  Since this is truly a machine specific thing I would
> > be inclined to use a separate file, or a collie-specific catenation onto
> > the installed copy.
> >   
> I see your point. But OTOH we have 20 hda*, 9 serial consoles and 16 mtd
> nodes in there. So its hardly minimal. In my opinion it doesn't hurt to add
> a further node.

As mentioned on irc, there is a more fundamental problem. The mmc block
device number is assigned from the dynamic pool, not the static one. If
you have any other device which uses a dynamic block number the file
becomes incorrect. You therefore really have to create these nodes using
udev/mdev or some custom script which finds the right value from sysfs.

Regards,

Richard



