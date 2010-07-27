Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Odegr-0000JC-6D
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 09:35:05 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OdegX-0003En-1a
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 08:34:45 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C4E1332.9080804@mentor.com>
References: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
	<4C4E1332.9080804@mentor.com>
Date: Tue, 27 Jul 2010 08:34:57 +0100
Message-ID: <1280216097.4708.6.camel@lenovo.internal.reciva.com>
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
Subject: Re: [PATCH 0/7] Make multi-machine toolchains to co-exist (revised)
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
X-List-Received-Date: Tue, 27 Jul 2010 07:35:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-07-26 at 15:58 -0700, Tom Rini wrote:
> Khem Raj wrote:
> > Hi
> > 
> > Following series of patches are for making multi-machine toolchains co-exist with
> > new cross staging for toolchain.
> > 
> > It changes the toolchain triplet from ${TARGET_ARCH}-${VENDOR}-${OS} to 
> > ${TARGET_ARCH}-${CPU_SUB_TARGET}_${VENDOR}-OS
> > 
> > which means that a toolchain for armv7 is called armi-v7a_oe-linux-gnueabi-*
> > and for armv5te its called arm-v5te_oe-linux-gnueabi-*
> 
> Sorry to come in late here, but why can't we instead populate 
> sysroot/../usr/bin/${MACHINE_SYS}/ and keep the old toolchain triplet?

Agreed, that sounds better to me.  Or, as I mentioned to Khem on IRC,
leave the actual configuration triplet alone but set a custom
program-prefix for gcc (i.e. one that involves MACHINE_SYS) and adjust
${CC} to match it.  I am definitely not very fond of abusing the vendor
field for this purpose.

p.




