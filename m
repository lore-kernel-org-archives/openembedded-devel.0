Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1ObGzq-0006j1-QG
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 19:52:51 +0200
Received: (qmail invoked by alias); 20 Jul 2010 17:52:40 -0000
Received: from p508857E4.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.87.228]
	by mail.gmx.net (mp053) with SMTP; 20 Jul 2010 19:52:40 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX195I9ISZ5t5c0MgiBKc1qY8lC7hzteixg1I7315QN
	9Sze8i1QgCISRe
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jul 2010 19:44:05 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201007201654.41292.schnitzeltony@gmx.de>
	<i24ku9$5b7$1@dough.gmane.org>
In-Reply-To: <i24ku9$5b7$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201007201944.05812.schnitzeltony@gmx.de>
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
X-List-Received-Date: Tue, 20 Jul 2010 17:52:52 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 20 July 2010 07:04:08 pm Koen Kooi wrote:
> > 1. Merge omap3-sgx-modules -> libgles-omap3:
> >       Reduce memory & built time consumption.
> >       Note: By 'inherit module' all libgles packages
> >       get machine specific.
> 
> NAK on that, the split is done this way on purpose. Making the libs
> machine specific is NOT acceptable.
We got a similar discussion on clutter-box2d (but in the other way round). On my question for a rule when to make packages machine specific or not I got no response - I don't expect it now.
> > 2. Work around the missing (??) function omap_rev_lt_3_0()
> 
> It's not missing, it's present in all omap3 kernels in .dev that are
> supported. This incarnation of the test wasn't accepted upstream, but
> it's easy enough to patch in.
All the guys sitting on the gumstix tree like me are missing it. The latest driver is simply diabled with a commit msg. like 'does not build for kernel > 2.6.32'
> > 3. Make kernel modules buildable for kernel 2.6.33
> >       (fix-1.4.14.2616-for-kernel-gt-2.6.32.patch)
> > 4. Install script 'cpu-sgx-rev' returning the SGX version
> >       supported by CPU (2.x / 3.x / 5.x)
> 
> And NAK on that as well, the existing script handles that already. I
> know that since I have all those ES revisions on my desk :)
Do you mean the init script - or am I missing something?
> So basically only 3) and maybe 2) would be acceptable.
NAK My main intention was to reduce massive time and memory consumption - end of the story for me

regards

Andreas


