Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JYiZO-00012Z-7C
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Mar 2008 15:01:43 +0100
X-ASG-Debug-ID: 1205157577-33b000570000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 64E6890795
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2008 08:59:38 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id nMS43LhzaYmayJrp for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2008 08:59:38 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 + OpenEmbedded:
	=?iso-8859-1?q?Problems=09with=09uclibc-initial=09do=5Fpopulate=5Fstagi?=
	=?iso-8859-1?q?ng?= ()
Date: Mon, 10 Mar 2008 08:59:33 -0500
User-Agent: KMail/1.9.7
References: <200803051349.39583.geoffrey@pager.net>
	<1204932800.8161.45.camel@dax.rpnet.com>
	<200803071746.46288.geoffrey@pager.net>
In-Reply-To: <200803071746.46288.geoffrey@pager.net>
MIME-Version: 1.0
Message-Id: <200803100859.34113.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205157578
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
X-List-Received-Date: Mon, 10 Mar 2008 14:01:44 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 07 March 2008 05:46:46 pm Geoffrey Wossum wrote:
> On Friday 07 March 2008 05:33:20 pm Richard Purdie wrote:
> > On Fri, 2008-03-07 at 16:56 -0600, Geoffrey Wossum wrote:
> > > Checking the log.do_configure for gcc-cross-initial, --with-sysroot was
> >
> > I was meaning to ask what changed you'd have to make to get your image
> > to build.
> >
> > By strange coincidence I was looking at gcc-cross-initial today and
> > wondered about this. I concluded that gcc-cross-initial does not need
> > sysroot support though. gcc-cross-initial is only used to build the libc
> > for gcc-cross "proper" and for that you don't need anything in staging.
> >
> > So the question is why would gcc-cross-initial need to find things in
> > staging?

> Maybe uClibc 0.9.29 fixes this issue.  I need to move to it anyway.  Koen
> suggested it as a fix for my init segfault issue, plus I think avahi needs
> it, and I need avahi in my final product.

uClibc 0.9.29 does indeed fix these strange build issues I was having.  I can 
build everything with uClibc 0.9.29 without any mods to the files in 
packages/gcc.  So that's good.

Still getting the segfault when init starts up, though.

---
Geoffrey


