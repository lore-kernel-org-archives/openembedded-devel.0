Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JXmIW-0002NV-0G
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Mar 2008 00:48:22 +0100
X-ASG-Debug-ID: 1204933600-3d1400140000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id B576B10DFF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2008 17:46:40 -0600 (CST)
Received: from [192.168.1.71] (LRS-CiscoRouter [192.168.1.1]) by
	barracuda.pager.net with ESMTP id hTlRQo1ltjOaS3Ey for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 07 Mar 2008 17:46:40 -0600 (CST)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 + OpenEmbedded:
	=?iso-8859-1?q?Problems=09with=09uclibc-initial=09do=5Fpopulate=5Fstagi?=
	=?iso-8859-1?q?ng?= ()
Date: Fri, 7 Mar 2008 17:46:46 -0600
User-Agent: KMail/1.9.7
References: <200803051349.39583.geoffrey@pager.net>
	<200803071656.41738.geoffrey@pager.net>
	<1204932800.8161.45.camel@dax.rpnet.com>
In-Reply-To: <1204932800.8161.45.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803071746.46288.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoRouter[192.168.1.1]
X-Barracuda-Start-Time: 1204933600
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AVR32 + OpenEmbedded: Problems	with	uclibc-initial	do_populate_staging ()
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
X-List-Received-Date: Fri, 07 Mar 2008 23:48:22 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 07 March 2008 05:33:20 pm Richard Purdie wrote:
> On Fri, 2008-03-07 at 16:56 -0600, Geoffrey Wossum wrote:
> > Checking the log.do_configure for gcc-cross-initial, --with-sysroot was

> I was meaning to ask what changed you'd have to make to get your image
> to build.
>
> By strange coincidence I was looking at gcc-cross-initial today and
> wondered about this. I concluded that gcc-cross-initial does not need
> sysroot support though. gcc-cross-initial is only used to build the libc
> for gcc-cross "proper" and for that you don't need anything in staging.
>
> So the question is why would gcc-cross-initial need to find things in
> staging?

I'm using currently uClibc 0.9.28.  glibc doesn't currently support the AVR32.  
It's during uclibc-initial-0.9.28's do_populate_staging() step that this 
whole sysroot issue pops up.  Something about that step causes something to 
get linked, and that's when you the problem occurs.  I recreated the problem 
today.  Should have saved the log.

Maybe uClibc 0.9.29 fixes this issue.  I need to move to it anyway.  Koen 
suggested it as a fix for my init segfault issue, plus I think avahi needs 
it, and I need avahi in my final product.

It looks like Atmel's AVR32 patches for uClibc 0.9.29 are already in 
OpenEmbedded.  Looks like I just need to create a uClibc.machine file for the 
AVR32.  I'll try out building against uClibc 0.9.29 on Monday.

---
Geoffrey


