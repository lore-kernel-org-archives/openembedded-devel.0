Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M51bT-00035F-BE
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 19:53:51 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M51Uh-000BMm-C4
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 21:46:51 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 May 2009 21:46:52 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1242390849-28989-1-git-send-email-khimov@altell.ru>
	<20090515152626.GU7973@smtp.west.cox.net>
In-Reply-To: <20090515152626.GU7973@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200905152146.52710.khimov@altell.ru>
Subject: Re: [PATCH 1/2] glibc-package: fix kernel version passed to	qemu
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
X-List-Received-Date: Fri, 15 May 2009 17:53:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 15 May 2009 19:26:26 Tom Rini wrote:
> On Fri, May 15, 2009 at 04:34:08PM +0400, Roman I Khimov wrote:
> > Binary locale generation fails with
> >
> > FATAL: kernel too old
> >
> > if glibc is configured for kernels newer then 2.6.16.
> >
> > Fix qemu "-r" parameter to match OLDEST_KERNEL.
>
> Just to be sure, this is happy with 2.4.0 too, right?

Hmmm. It's untested on 2.4, obviously. But OLDEST_KERNEL is the kernel glibc 
built against, so whatever it is, it should be a perfect match.


