Received: from [65.182.109.75] (helo=mta6.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LXHoY-0005CD-U4
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2009 17:19:55 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta6.brinkster.com (Postfix) with ESMTP id 192043E84AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 11:59:33 -0700 (MST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.479
X-Spam-Level: 
X-Spam-Status: No, score=0.479 tagged_above=-10 required=5 tests=[AWL=-0.253, 
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta6.brinkster.com ([127.0.0.1])
	by localhost (mta6.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtO+2kvYs9LE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 11:59:32 -0700 (MST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta6.brinkster.com (Postfix) with ESMTP id 933A03E84C7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 11:59:30 -0700 (MST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <20090210204817.GH11815@smtp.west.cox.net>	<03499B67-9FFC-43D7-91C4-A92ECDB55370@student.utwente.nl>	<20090210225940.GI11815@smtp.west.cox.net>	<gmt3da$4r1$1@ger.gmane.org>
	<20090211002752.GJ11815@smtp.west.cox.net>
In-Reply-To: <20090211002752.GJ11815@smtp.west.cox.net>
Date: Wed, 11 Feb 2009 16:18:02 -0000
Message-ID: <000c01c98c64$51bfc3b0$f53f4b10$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmL3/kaKvEQRe5BS2iEtW7GY580ogAgq5jQ
Subject: Re: [RFC] Add ubi volume image support, fix ubifs
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
X-List-Received-Date: Wed, 11 Feb 2009 16:19:55 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Hi,

Thanks for these patches. Looking good IMHO.

> >> Really?  iirc from the mounting commandline stuff that means you
> have to
> >> pass in machine-rootfs rather than just rootfs, ie
> >> root=ubi0:machine-rootfs not root=ubi0:rootfs
> >
> > You'll have to update your bootloaders anyway, so cutting down on
> > 'flashed wrong machine' errors is a big win :)
> 
> The PoV we have is of starting things from scratch, so that's not
> something we worry about.  How about this so distros can take care of
> it?

Yep, I can't really see many normal OE users will have converted existing
images over to UBI so it seems like the right way to start is as we mean to
go on.

I'll test these patches on the Pandora NAND image later (they are along the
same lines as the patches I have been working on for UBI/UBIFS support but
have the extra bonus feature of actually looking like they work). 
It will make a nice change from post processing a TAR ;).
 
Regards,

John Willis





