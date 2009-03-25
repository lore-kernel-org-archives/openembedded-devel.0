Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LmbDn-00008h-RP
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 23:05:16 +0100
Received: by ewy20 with SMTP id 20so287536ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:x-x-sender:to:cc
	:subject:message-id:user-agent:mime-version:content-type;
	bh=9K2NC06ucB/2gAImEafk5+nyzl2TXzpEGiH/AqfAGA4=;
	b=wrnHGKLG9q5NbURBXNIy2j03J4cEuvSnXMQ6JNu6hjpEaVW42wfA1TUscdSKmzGIL7
	jUJkjAYIHrb60ka4xN+e5mL4Fm+iMiSRQ3QZtzZjKlP/d6urmyckXHgrSZi07qK+HctR
	m4NyTkMO4pugPLqljHKqQshW5iKCz0WksYmU8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:x-x-sender:to:cc:subject:message-id:user-agent
	:mime-version:content-type;
	b=wwB3Q3vBOVCXk0xvSMLB8TRyuBl5hdk0bEhJ5EHYuEmaOzUPxeLW/WKA1DGxz85Rd8
	o1PPDqobuDSd07mAgPmxpn6SX3xWotebNrFgGLT4+dDBSvOG2XiO17LFUJ37u0LNya+t
	Y1rZJAu4WFdoJTf+qcopB9Yzs++Ha4ORVUpEo=
Received: by 10.216.20.197 with SMTP id p47mr59826wep.13.1238018616861;
	Wed, 25 Mar 2009 15:03:36 -0700 (PDT)
Received: from linux-suse (195-241-226-180.ip.telfort.nl [195.241.226.180])
	by mx.google.com with ESMTPS id 10sm264949eyd.33.2009.03.25.15.03.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 25 Mar 2009 15:03:34 -0700 (PDT)
Date: Wed, 25 Mar 2009 23:03:28 +0100 (CET)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
X-X-Sender: frans@linux-suse.site
To: drzeus-mmc@drzeus.cx
Message-ID: <alpine.LNX.2.00.0903252248430.32070@linux-suse.site>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
MIME-Version: 1.0
Cc: beagleboard@googlegroups.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, openembedded-devel@lists.openembedded.org
Subject: [PATCH] drivers/mmc/core/core.c: extend limit
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
X-List-Received-Date: Wed, 25 Mar 2009 22:05:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,

For some reason my 4GB Kingston SDHC class 6 cards stopped functioning 
properly with 2.6.28 on my beagleboard (arm based). The very same cards (I 
have two of them) worked properly with 2.6.27. What happened was that if I 
booted from the card I would get errors -110.
They are similar to the ones reported at lkml last sept in 
http://lkml.org/lkml/2008/9/23/390

Fortunately later on in this thread was a fix:
http://lkml.org/lkml/2008/10/20/124

This did not help me as the limit was already at 300000. However, I 
decided to raise the limit to 500000. Still no go so I also doubled the 
read limit from 100000 to 200000. After that the cards work without 
problem. Changing the write timing back to 300000 brought the problem back 
so apparently both timings need to be extended. Attached is the patch I 
used for this. As it is a timeout limit value, it should not harm anyone, 
and a longer timeout at least allows more cards to be used.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

What somewhat troubles me is that this worked in .27, so it might be this 
patch does not address the root cause. Then again this is the best I can 
do. If someone has a better solution, I am more than happy to test it.

Frans.

Index: git/drivers/mmc/core/core.c
===================================================================
--- git.orig/drivers/mmc/core/core.c
+++ git/drivers/mmc/core/core.c
@@ -284,9 +284,9 @@ void mmc_set_data_timeout(struct mmc_dat
 			 * The limit is really 250 ms, but that is
 			 * insufficient for some crappy cards.
 			 */
-			limit_us = 300000;
+			limit_us = 500000;
 		else
-			limit_us = 100000;
+			limit_us = 200000;

 		/*
 		 * SDHC cards always use these fixed values.


