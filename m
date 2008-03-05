Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JX0hv-0003TF-TL
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Mar 2008 21:59:28 +0100
X-ASG-Debug-ID: 1204750679-61f801420000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 7CF968EB68
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2008 14:57:59 -0600 (CST)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id nuTJXCGY1FMBBlhg for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2008 14:57:59 -0600 (CST)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 + OpenEmbedded: Problems with
	=?iso-8859-1?q?uclibc-initial=09do=5Fpopulate=5Fstaging?=()
Date: Wed, 5 Mar 2008 14:58:03 -0600
User-Agent: KMail/1.9.7
References: <200803051349.39583.geoffrey@pager.net>
	<1204749821.8110.178.camel@dax.rpnet.com>
In-Reply-To: <1204749821.8110.178.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803051458.03954.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1204750679
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AVR32 + OpenEmbedded: Problems with uclibc-initial	do_populate_staging ()
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
X-List-Received-Date: Wed, 05 Mar 2008 20:59:29 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 05 March 2008 02:43:41 pm Richard Purdie wrote:

> On Wed, 2008-03-05 at 13:49 -0600, Geoffrey Wossum wrote:
> > I'm working on getting OpenEmbeddded to build for an AVR32 system.  Right
> > now I'm using an AT32STK1000, although eventually I'll be running on
> > custom hardware.
> >
> > I've been having problems getting past the uclibc-initial (0.9.28).  I
> > get an error when it attempts do_populate_staging().  Here's the error
> > I've been getting.
>
> I think both your fixes are correct. Those changes were already made in
> poky but had got lost somewhere between there and OE.dev, I'll sync them
> up. Thanks for the report and let us know if anything doesn't work after
> I merge them.

I ended up getting an error much later on in the build process, while 
executing do_install() for uclibc (0.9.28).  ld couldn't find crt1.o while 
executing the "make install_dev install_runtime" step.  ld wants crt1.o in 
the cross directory.  Sorry, didn't save the exact error message.

I got around this by defining UCLIBC_PREFIX to what it was before 
("${CROSS_DIR}/${TARGET_SYS}"), and then adding the following to the top of 
uclibc.inc's do_install():

	oe_runmake PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
		install_dev install_runtime

This is essentially what was there before.  With this in place, I get much 
further.  

It almost feels like the patch a week ago to uclibc.inc needed some patches to 
binutils-cross or something to go with it...

Now the build stopped while building ncurses-native_5.4.  Patch didn't apply 
properly...

---
Geoffrey




