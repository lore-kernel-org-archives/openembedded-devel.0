Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gwossum@pager.net>) id 1JZu2J-0002SE-Vc
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 21:28:31 +0100
X-ASG-Debug-ID: 1205439970-351000390000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 312911ECC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 15:26:10 -0500 (CDT)
Received: from mail.pager.net ([192.168.1.254]) by barracuda.pager.net with
	ESMTP id QLm0MhhP9XGGGu3g for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 15:26:10 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by mail.pager.net with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 13 Mar 2008 14:21:15 -0500
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Eureka!  AVR32 ld-uClibc.so segfault solved
Date: Thu, 13 Mar 2008 14:17:52 -0500
User-Agent: KMail/1.9.7
References: <200803121450.09688.geoffrey@pager.net>
In-Reply-To: <200803121450.09688.geoffrey@pager.net>
MIME-Version: 1.0
Message-Id: <200803131417.52399.geoffrey@pager.net>
X-OriginalArrivalTime: 13 Mar 2008 19:21:15.0484 (UTC)
	FILETIME=[6807E1C0:01C8853F]
X-Barracuda-Connect: UNKNOWN[192.168.1.254]
X-Barracuda-Start-Time: 1205439970
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: gwossum@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Eureka! AVR32 ld-uClibc.so segfault solved
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
X-List-Received-Date: Thu, 13 Mar 2008 20:28:31 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 12 March 2008 02:50:09 pm Geoffrey Wossum wrote:

> I just tracked down the culprit for my AVR32 system always segfaulting
> whenever ld-uClibc.so ran (usually as soon as the kernel attempted to run
> the init process).

I just submitted all my patches for the AVR32 to OE's bugzilla.  They are 
attachments under bug #4062.

These patches should let you build a bootable Angstrom 2008.1 AVR32 image 
using gcc-4.2.1-atmel.1.3.0 and uClibc-0.9.29-atmel.1.

All of the patches are straight forward, except for patch to uclibc.inc 
(attachment #8196).  Some one who knows more about why CPU_CFLAGS and 
OPTIMIZATION were being overridden by uclibc.inc needs to comment about the 
effect this change would have on other platforms.  This is really the 
important patch, since without it you can't build a working ld-uClibc.so.

---
Geoffrey





