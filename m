Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JaENd-0002cS-NG
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Mar 2008 19:11:53 +0100
X-ASG-Debug-ID: 1205518168-570401160000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 2DD6E1FFC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2008 13:09:28 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id 07XBwjHOt7gZYtzJ for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2008 13:09:28 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Eureka! AVR32 ld-uClibc.so segfault solved
Date: Fri, 14 Mar 2008 13:09:27 -0500
User-Agent: KMail/1.9.7
References: <200803121450.09688.geoffrey@pager.net>
	<200803131417.52399.geoffrey@pager.net>
	<c384c5ea0803141036w4f7254e6k28e0e7482487acb0@mail.gmail.com>
In-Reply-To: <c384c5ea0803141036w4f7254e6k28e0e7482487acb0@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200803141309.27673.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205518168
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
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
X-List-Received-Date: Fri, 14 Mar 2008 18:11:54 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 14 March 2008 12:36:46 pm Leon Woestenberg wrote:
> Hello Geoffrey,
>
> On Thu, Mar 13, 2008 at 8:17 PM, Geoffrey Wossum <geoffrey@pager.net> wrote:
> > On Wednesday 12 March 2008 02:50:09 pm Geoffrey Wossum wrote:
> > ...
> >  I just submitted all my patches for the AVR32 to OE's bugzilla.  They
> > are ...
> >  All of the patches are straight forward, except for patch to uclibc.inc
> >  (attachment #8196).  Some one who knows more about why CPU_CFLAGS and
> >  OPTIMIZATION were being overridden by uclibc.inc needs to comment about
> > the effect this change would have on other platforms.  This is really the
> > important patch, since without it you can't build a working ld-uClibc.so.
>
> Good question. I had a similar question about something that wasn't
> trivial in the (uclibc) bitbake recipe.

I'm beginning to think no one actually remembers why this change was made.  I 
located the comment for this change in monotone (it's from 2005-08-11):

---begin--
This set of changes ensures that TARGET_CC_ARCH is passed reliably to all 
packages in a build.  The change fixes problems in the following packages:
<snip>
 | |   uclibc{,-initial}_0.9.27
| | | TARGET_CC_ARCH added to the do_compile.  For the do_stage step the
| | | build actually compiles target code (make utils), but this will not
| | | accept a CC with whitespace.  The TARGET_CC_ARCH flags have therefore
| | | been added to CFLAGS (a bit ugly, but it works).
---end---

My current opinion is that this may have been change made to help debug this 
problem, but wasn't really part of the solution and wasn't intended to be in 
the patch.
 
Even if this was really a fix for a problem on another platform, since it 
breaks at least one platform (AVR32), it wasn't an optimal solution.   Since 
the patch to stop overriding CPU_CFLAGS and OPTIMIZATIONS was applied, I 
guess we'll found out soon if another platform need this :)

---
Geoffrey


