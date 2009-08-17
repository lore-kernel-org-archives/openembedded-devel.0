Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Md409-0006d6-9z
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 17:20:04 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Md3je-0001m5-SN
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:02:59 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1Md3je-0008Mm-JJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:02:58 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250521270.27980.6.camel@mill.internal.reciva.com>
References: <4A8960BC.4000603@cam.ac.uk>
	<200908171606.57153.holger+oe@freyther.de>
	<1250521270.27980.6.camel@mill.internal.reciva.com>
Date: Mon, 17 Aug 2009 16:02:55 +0100
Message-Id: <1250521375.27980.8.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH] glibc 2.7 and 2.9 (arm): Remove unnecessary asm/page.h include
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
X-List-Received-Date: Mon, 17 Aug 2009 15:20:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-08-17 at 16:01 +0100, Phil Blundell wrote:
> On Mon, 2009-08-17 at 16:06 +0200, Holger Hans Peter Freyther wrote:
> > To be honest I wonder why you are triggering this area, and why other builds 
> > don't do that... it is  a bit frightening.
> 
> I expect it's nothing more sinister than different versions of
> linux-libc-headers.  <asm/page.h> was there in 2.6.23 but, it seems,
> gone by 2.6.29.  So, probably no cause for alarm.

Oh, and, as for bumping PR: in this case I would suggest not doing it.
The output binaries should be identical with and without that header,
and for folks doing online upgrades it is a bit of a pain to have glibc
rebuild unnecessarily.

p.




