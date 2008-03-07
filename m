Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JXm5f-0002B6-2f
	for openembedded-devel@openembedded.org; Sat, 08 Mar 2008 00:35:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m27NXRig030406
	for <openembedded-devel@openembedded.org>; Fri, 7 Mar 2008 23:33:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30240-06 for <openembedded-devel@openembedded.org>;
	Fri,  7 Mar 2008 23:33:19 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m27NXIv0030385
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 7 Mar 2008 23:33:18 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803071656.41738.geoffrey@pager.net>
References: <200803051349.39583.geoffrey@pager.net>
	<200803051458.03954.geoffrey@pager.net>
	<1204754380.8110.186.camel@dax.rpnet.com>
	<200803071656.41738.geoffrey@pager.net>
Date: Fri, 07 Mar 2008 23:33:20 +0000
Message-Id: <1204932800.8161.45.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
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
X-List-Received-Date: Fri, 07 Mar 2008 23:35:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-03-07 at 16:56 -0600, Geoffrey Wossum wrote:
> Checking the log.do_configure for gcc-cross-initial, --with-sysroot was NOT 
> getting passed to gcc's configure script.
> 
> So I started parsing gcc-cross-initial_4.1.2.bb by hand.  Here's what it looks 
> like is happening to me.  Eventually, gcc3-build-cross.inc gets required in. 
> This file will set EXTRA_OECONF to have the "--with-sysroot" option.  But a 
> little later, gcc-cross-initial.inc gets required in.  This file resets 
> EXTRA_OECONF, so the "--with-sysroot" option added by gcc3-build-cross.inc 
> gets lost.
> 
> I attempted to just swap the order of "require gcc-cross_${PV}.bb" 
> and "require gcc-cross-initial.inc" in gcc-cross-initial_4.1.2.bb.  Doing 
> a "bitbake -c rebuild gcc-cross-initial" built the gcc-cross-initial with the 
> proper "--with-sysroot" option.  Hooray!  But then when I tried to resume 
> building the image, this swap made the overall build system think 
> that "avr32-gcc-initial-4.1.2" wasn't available.  Back to the drawing board.
> 
> So then I changed gcc-cross-initial.inc to append onto EXTRA_OECONF instead of 
> setting EXTRA_OECONF.  This seems to work for me now, although I don't know 
> what other implications this change may have.

I was meaning to ask what changed you'd have to make to get your image
to build.

By strange coincidence I was looking at gcc-cross-initial today and
wondered about this. I concluded that gcc-cross-initial does not need
sysroot support though. gcc-cross-initial is only used to build the libc
for gcc-cross "proper" and for that you don't need anything in staging.

So the question is why would gcc-cross-initial need to find things in
staging? 

Cheers,

Richard





