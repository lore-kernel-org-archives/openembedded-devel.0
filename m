Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JZWp2-0004Cc-Sb
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 20:41:15 +0100
X-ASG-Debug-ID: 1205350730-30b400850000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 9CB7A1D558
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 14:38:51 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id yPtMlCzxiGBmeEh2 for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 14:38:51 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Stuck with AVR32 segfaults in init
Date: Wed, 12 Mar 2008 11:00:38 -0500
User-Agent: KMail/1.9.7
References: <200803111746.59194.geoffrey@pager.net>
	<1205277784.16531.18.camel@dax.rpnet.com>
In-Reply-To: <1205277784.16531.18.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803121100.39101.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205350731
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=AWL,DATE_IN_PAST_03_06,
	RDNS_NONE autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Stuck with AVR32 segfaults in init
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
X-List-Received-Date: Wed, 12 Mar 2008 19:41:15 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 11 March 2008 06:23:04 pm Richard Purdie wrote:
> Hi,

> If you take an OE binary and run it within a working filesystem from
> whereever, what happens? If it segfaults there you may be able to debug
> it. If it doesn't, try copying libs from OE into that system until it
> breaks? That should at least tell you where the problem is.

Here's the results:
 - Run OE busybox on working BR system
   Works

 - Run OE busybox with OE libc.so on working BR system
   Works

 - Run OE busybox with OE libc.so / libm.so on working BR system
   Works

 - Replace BR libc.so with OE libc.so
   Works

 - Replace BR libc.so / libm.so with OE libc.so / libm.so
   Works

 - Replace BR ld-uClibc.so with OE ld-uClibc.so
init[1]: segfault at 00000008 pc 2aaabc84 sp 7ff80f30 ecr 24

 - Replace OE ld-uClibc.so with BR ld-uClibc.so
   Works


So the ld-uClibc.so build by OE is definitely the culprit, and replacing it 
with the ld-uClibc.so from Atmel's buildroot makes everything better.


I'm going to investigate what possible differences could exist between the OE 
ld-uClibc.so and the BR ld-uClibc.so now.

---
Geoffrey


