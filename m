Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Md3yO-0006ZH-PG
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 17:18:13 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Md3hy-0001kj-HP
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:01:14 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1Md3hy-0008MK-BF
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:01:14 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200908171606.57153.holger+oe@freyther.de>
References: <4A8960BC.4000603@cam.ac.uk>
	<200908171606.57153.holger+oe@freyther.de>
Date: Mon, 17 Aug 2009 16:01:10 +0100
Message-Id: <1250521270.27980.6.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Mon, 17 Aug 2009 15:18:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-08-17 at 16:06 +0200, Holger Hans Peter Freyther wrote:
> To be honest I wonder why you are triggering this area, and why other builds 
> don't do that... it is  a bit frightening.

I expect it's nothing more sinister than different versions of
linux-libc-headers.  <asm/page.h> was there in 2.6.23 but, it seems,
gone by 2.6.29.  So, probably no cause for alarm.

p.




