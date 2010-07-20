Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1ObLW5-0001i1-P4
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 00:42:27 +0200
Received: (qmail invoked by alias); 20 Jul 2010 22:42:15 -0000
Received: from p508857E4.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.87.228]
	by mail.gmx.net (mp072) with SMTP; 21 Jul 2010 00:42:15 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19kWSo3ElxkSWOZHrIJ+gmllhUtoyZtfKT6cANG58
	02WBCi+NOOFpc+
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 00:33:41 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201007201654.41292.schnitzeltony@gmx.de>
	<i24qu7$qc6$2@dough.gmane.org>
	<AANLkTinhpRrgv_cs5BojuTJFjMmhX-b-ZApiMf6KGNNK@mail.gmail.com>
In-Reply-To: <AANLkTinhpRrgv_cs5BojuTJFjMmhX-b-ZApiMf6KGNNK@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007210033.41887.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omap3/powervr-drivers: Cleanups & fixes
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
X-List-Received-Date: Tue, 20 Jul 2010 22:42:28 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 20 July 2010 08:46:31 pm Koen Kooi wrote:
> > 2. Work around the missing (??) function omap_rev_lt_3_0()

> Time is better spent on getting those vender changes upstream first. 
I agree. 

On Tuesday 20 July 2010 10:53:46 pm Frans Meulenbroeks wrote:
> Ehm. What about the other omap kernel recipes.
> There are 38 (!) of them in 15 different flavours that have omap in the 
Is git-clone git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6 the 'official' omap3 kernel source? Still I haven't found omap_rev_lt_3_0() yet..

> NAK on that, the split is done this way on purpose. Making the libs
> machine specific is NOT acceptable.
I need to understand how to decide if a package is machine or architectue specific. So PLEASE anybody out there give me some hints/links:

1.  What pitfalls are to expect making a package machine specific which is architecture specific?
2.  How do you decide if a package is machine/architecture specific? For example clutter: clutter itself is machine specific because it configures against machine specific gl/gles causing different 
builds - OK. What about the dependent: clutter-box2d is machine dependent / clutter-gst, clutter-gtk is not. What caused the different handling?
3.  This question is also related (correct me if I am wrong - maybe I haven't got the basic point): The reason for different handling machine/architecture is to reuse as much as possible in case 
you have more than one machine of same architecture. For clutter: configure decides according to the include files it finds in tmp/sysroot/<arch>/.. to build against gl or gles. What happens in 
case we have two machines of same architecture: one with gl only / the other gl/gles (e.g different OMAPs). What happens if we first build the gles-machine and then the gl-only: Does the 
second get gles too or what mechanisms am I missing?

regards

Andreas


