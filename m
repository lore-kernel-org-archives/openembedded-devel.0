Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M51mQ-0003eT-6O
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 20:05:10 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M51fg-0003bK-2r
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 18:58:12 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200905152146.52710.khimov@altell.ru>
References: <1242390849-28989-1-git-send-email-khimov@altell.ru>
	<20090515152626.GU7973@smtp.west.cox.net>
	<200905152146.52710.khimov@altell.ru>
Date: Fri, 15 May 2009 18:58:09 +0100
Message-Id: <1242410289.4514.81.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 1/2] glibc-package: fix kernel version passed	to	qemu
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
X-List-Received-Date: Fri, 15 May 2009 18:05:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-05-15 at 21:46 +0400, Roman I Khimov wrote:
> On Friday 15 May 2009 19:26:26 Tom Rini wrote:
> > On Fri, May 15, 2009 at 04:34:08PM +0400, Roman I Khimov wrote:
> > > Binary locale generation fails with
> > >
> > > FATAL: kernel too old
> > >
> > > if glibc is configured for kernels newer then 2.6.16.
> > >
> > > Fix qemu "-r" parameter to match OLDEST_KERNEL.
> >
> > Just to be sure, this is happy with 2.4.0 too, right?
> 
> Hmmm. It's untested on 2.4, obviously. But OLDEST_KERNEL is the kernel glibc 
> built against, so whatever it is, it should be a perfect match.

Do you know what the reason is for passing this -r parameter in the
first place?  It seems like we should just be letting qemu use the most
recent kernel emulation that it knows about, since a glibc compiled
against any given kernel version should always run with newer versions.

p.




