Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JX1fi-0005FA-49
	for openembedded-devel@openembedded.org; Wed, 05 Mar 2008 23:01:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25Lxk96022435
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 21:59:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22406-01 for <openembedded-devel@openembedded.org>;
	Wed,  5 Mar 2008 21:59:42 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25Lxcpq022429
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 21:59:38 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803051458.03954.geoffrey@pager.net>
References: <200803051349.39583.geoffrey@pager.net>
	<1204749821.8110.178.camel@dax.rpnet.com>
	<200803051458.03954.geoffrey@pager.net>
Date: Wed, 05 Mar 2008 21:59:40 +0000
Message-Id: <1204754380.8110.186.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Wed, 05 Mar 2008 22:01:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, 2008-03-05 at 14:58 -0600, Geoffrey Wossum wrote:
> On Wednesday 05 March 2008 02:43:41 pm Richard Purdie wrote:
> 
> > On Wed, 2008-03-05 at 13:49 -0600, Geoffrey Wossum wrote:
> > > I'm working on getting OpenEmbeddded to build for an AVR32 system.  Right
> > > now I'm using an AT32STK1000, although eventually I'll be running on
> > > custom hardware.
> > >
> > > I've been having problems getting past the uclibc-initial (0.9.28).  I
> > > get an error when it attempts do_populate_staging().  Here's the error
> > > I've been getting.
> >
> > I think both your fixes are correct. Those changes were already made in
> > poky but had got lost somewhere between there and OE.dev, I'll sync them
> > up. Thanks for the report and let us know if anything doesn't work after
> > I merge them.
> 
> I ended up getting an error much later on in the build process, while 
> executing do_install() for uclibc (0.9.28).  ld couldn't find crt1.o while 
> executing the "make install_dev install_runtime" step.  ld wants crt1.o in 
> the cross directory.  Sorry, didn't save the exact error message.
> 
> I got around this by defining UCLIBC_PREFIX to what it was before 
> ("${CROSS_DIR}/${TARGET_SYS}"), and then adding the following to the top of 
> uclibc.inc's do_install():
> 
> 	oe_runmake PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
> 		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
> 		install_dev install_runtime
> 
> This is essentially what was there before.  With this in place, I get much 
> further.  
> 
> It almost feels like the patch a week ago to uclibc.inc needed some patches to 
> binutils-cross or something to go with it...
> 
> Now the build stopped while building ncurses-native_5.4.  Patch didn't apply 
> properly...

Which distro and machine are you using? This sounds like something which
isn't using sysroot or the sysroot workarounds.

Poking around cross hasn't been needed for a while and instead of the
above, building "cross-linkage" might help. This was removed from the
linux-libc-headers DEPENDS recently. You may also need
"staging-linkage", it all depends on the compiler though and if its
sysroot capable, enabling that would be infinitely preferable.

Regards,

Richard



