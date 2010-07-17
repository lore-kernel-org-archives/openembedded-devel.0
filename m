Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OaD4N-0002Rw-3V
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 21:29:12 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OaD4H-0007ww-CN
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 20:29:01 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimFuoxBKczjwGexQZAVGwEXqkHqfSbCf7xf7x90@mail.gmail.com>
References: <AANLkTikZkRU-dCiBNlVdZ6XYsdBk3MjZBksexc6JtSAT@mail.gmail.com>
	<i1qodg$i28$1@dough.gmane.org> <20100717000603.GK23169@mx.loc>
	<1279373863.21888.10.camel@lenovo.internal.reciva.com>
	<AANLkTimFuoxBKczjwGexQZAVGwEXqkHqfSbCf7xf7x90@mail.gmail.com>
Date: Sat, 17 Jul 2010 20:29:11 +0100
Message-ID: <1279394951.21888.31.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: busybox mdev
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
X-List-Received-Date: Sat, 17 Jul 2010 19:29:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm not familiar with that recipe and I don't seem to have a
micro-base.bb in my tree.  But, if it's sucking in udev, it sounds like
a bogus dependency somewhere.  You can use bitbake -g to find out where.

p.

On Sat, 2010-07-17 at 17:09 +0200, Bernhard Reutner-Fischer wrote:
> Baking micro-base (not -image) tries to build udev for me?
> 
> On 17 Jul 2010 15:39, "Phil Blundell" <philb@gnu.org> wrote:
> 
> On Sat, 2010-07-17 at 02:06 +0200, Bernhard Reutner-Fischer wrote:
> > (what's the reason micro-base u...
> Er, does it?  My copy of micro-base-image.bb says:
> 
> # Include minimum init and init scripts
> 
> IMAGE_DEV_MANAGER = "busybox-mdev"
> IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
> IMAGE_INITSCRIPTS = ""
> 
> If it's using udev then that is definitely a bug.
> 
> p.
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-deve...
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




