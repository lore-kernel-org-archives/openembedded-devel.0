Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OBkAL-0001Y9-0t
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 09:46:09 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 2EAD6491278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 09:42:18 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 11 May 2010 09:43:35 +0200
Message-ID: <4BE90A56.3090605@dresearch.de>
Date: Tue, 11 May 2010 09:42:14 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273518881.22943.378.camel@trini-m4400>
In-Reply-To: <1273518881.22943.378.camel@trini-m4400>
X-OriginalArrivalTime: 11 May 2010 07:43:35.0433 (UTC)
	FILETIME=[A96BBF90:01CAF0DD]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kernel Headers Quality Issue
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
X-List-Received-Date: Tue, 11 May 2010 07:46:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 10.05.2010 21:14, Tom Rini wrote:
> Looking at it again and based on what Khem said (and re-reading your
> failures), the problem is not with glibc, but with other programs (glib,
> udev are both mentioned specifically) and these programs specifically
> not failing gracefully.  For example, it's quoted over in:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-May/019626.html
> that glib falls way back.  I think Phil was wrong here and without
> checking the code, I imagine glib is trying fancy newer syscall,
> failing, and then falling far back, rather than to just inotify_init as
> you expected.  So the bug here is with glib.
> 
> As for the udev issue, I do not know how they will react to making the
> udev version be soft-assign as that too may raise issues.  And iirc,
> udev is or at least can be more tied to min kernel versions.

No, it seems not to be a problem of glib, rsyslog, or udev.

As i see in the build logs glibc is build using --enable-kernel=2.6.16 (i do not know any --with-kernel option).

After running autotools config.h of e.g. glib-2.0 contains

 /* Define to 1 if you have the `inotify_init1' function. */
 #define HAVE_INOTIFY_INIT1 1

So the glib-2.0 is allowed to use inotify_init1. But this is only available for kernel version >= 2.6.27.

Same behaviour for epoll_create1 in e.g. rsyslog

 /* Define to 1 if you have the `epoll_create' function. */
 #define HAVE_EPOLL_CREATE 1

 /* Define to 1 if you have the `epoll_create1' function. */
 #define HAVE_EPOLL_CREATE1 1

Conclusion: glibc reports functions "available" which are not available for our kernel 2.6.24 (and not "emulated" inside glibc). :(

Regards, Steffen



