Received: from [195.64.66.119] (helo=mx1.grimmerink.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1N8aeg-0000Tu-2a
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 15:28:15 +0100
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 0D1836A0D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 15:20:21 +0100 (CET)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 15:20:18 +0100
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200911121520.18394.pieterg@gmx.com>
X-SA-Exim-Connect-IP: 195.64.66.119
X-SA-Exim-Mail-From: pieterg@gmx.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: initramfs dependency loop
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
X-List-Received-Date: Thu, 12 Nov 2009 14:28:15 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm using an initramfs image, based on klibc.
klibc depends on virtual/kernel, so my kernel is built before the initramfs 
image completes.
I then force the kernel to be rebuilt (with initfamfs.cpio.gz included), 
before I start building the actual production image (which has the kernel 
image included).

This works of course, but it's not very nice.

Now I'm wondering, what is the official way to deal with this initramfs / 
klibc / kernel dependency loop, how do you guys deal with that?

Rgds, Pieter


