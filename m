Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Nl8vx-0004a8-Kr
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 23:45:22 +0100
Received: from 88-110-39-162.dynamic.dsl.as9105.com ([88.110.39.162]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Nl8tE-0005aL-S2
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 22:42:33 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100226222650.GG30265@mx.loc>
References: <1266951776.18176.47.camel@trini-m4400>
	<4B87EC32.6030807@mwester.net> <hm93de$tnt$1@dough.gmane.org>
	<18e217241002261221u5f43eaebn19a52e6b86a22c00@mail.gmail.com>
	<20100226222650.GG30265@mx.loc>
Date: Fri, 26 Feb 2010 22:42:30 +0000
Message-ID: <1267224150.5437.435.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_SOFTFAIL autolearn=no
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Fri, 26 Feb 2010 22:45:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-02-26 at 23:26 +0100, Bernhard Reutner-Fischer wrote:
> SUID_DROP applets do just that before the individual applet_main is called,
> i.e. drops privs. But whatever..
> If you really think you want to build the thing twice then i'd try
> FEATURE_SHARED_BUSYBOX, fyi.
> $ size 0_lib/{busybox,libbusybox.so.1.17.0.git}
>    text	   data	    bss	    dec	    hex	filename
>    1379	    520	     16	   1915	    77b	0_lib/busybox
>  339569	   6705	   8552	 354826	  56a0a	0_lib/libbusybox.so.1.17.0.git
> 
> duplicating 2k is better than duplicating all the innocent rest, but maybe
> that's just me..

Whether this is a good idea or not rather depends on what you're trying
to protect against.  The threat scenarios for a setuid busybox basically
fall into two categories:

a) user invokes an applet which shouldn't be setuid, but busybox fails
(for whatever reason) to drop its privs and allows the applet to run in
root context

b) user invokes an applet which is intended to be setuid, busybox
correctly retains the elevated privs while running it, but there is some
bug or vulnerability in the code which causes unwanted results

If you're primarily worried about case (a) then building two copies of
the frontend which share a common libbusybox, one setuid and one not,
probably is a reasonable thing to do.  However, as you say, busybox does
already have a fairly robust mechanism in place for dropping privs when
they are not wanted by a particular applet and hence the threat from
this side seems to be quite low anyway.

If you are primarily worried about case (b) then the easiest way to
mitigate the threat is to reduce the amount of code which is linked in
to the setuid binary (either statically or dynamically) and hence the
amount of code that you need to audit for security hazards.  In that
situation, linking with a shared libbusybox would not help, since you
still have essentially the whole of busybox to worry about and you might
as well just stick with a single large binary.  Instead you would be
better off making a minimal, standalone busybox binary which contained
the bare minimum of code that was required to fulfil its setuid
functions.

p.




