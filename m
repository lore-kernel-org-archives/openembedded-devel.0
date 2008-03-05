Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JX2PW-0003v5-Te
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Mar 2008 23:48:32 +0100
X-ASG-Debug-ID: 1204757225-032e00330000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id CAD208EF35
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2008 16:47:05 -0600 (CST)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id 3VB7ybwP4z2jftzE for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2008 16:47:05 -0600 (CST)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 + OpenEmbedded: Problems
	=?iso-8859-1?q?with=09uclibc-initial=09do=5Fpopulate=5Fstaging?=
	()
Date: Wed, 5 Mar 2008 16:47:05 -0600
User-Agent: KMail/1.9.7
References: <200803051349.39583.geoffrey@pager.net>
	<200803051458.03954.geoffrey@pager.net>
	<1204754380.8110.186.camel@dax.rpnet.com>
In-Reply-To: <1204754380.8110.186.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803051647.05397.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1204757225
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AVR32 + OpenEmbedded: Problems with	uclibc-initial	do_populate_staging ()
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
X-List-Received-Date: Wed, 05 Mar 2008 22:48:33 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 05 March 2008 03:59:40 pm Richard Purdie wrote:

> Which distro and machine are you using? This sounds like something which
> isn't using sysroot or the sysroot workarounds.

Distro: angstrom-2008.1
Machine: at32stk1000 (AVR32)

It's using binutils-2.17, gcc-4.1.2-atmel.1.1.0, uClibc-0.9.28.

I'll investigate whether this compiler is sysroot capable.  Looking at the log 
of configuring binutils and gcc, it was built using --sysroot 
and --with-build-sysroot.  There's an AVR32 binutils patch that does 
something to sysroot handling, though.  I'll have to look at it more to 
figure out what they were trying to do.  I'll bet this has something to do 
with my problem.  

Thanks!
---
Geoffrey


