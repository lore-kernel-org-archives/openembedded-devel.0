Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1P0bAW-0002VT-9p
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 16:28:33 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1P0bAM-0005FI-7j
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 15:28:22 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1P0bAL-0001k6-W9
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 15:28:22 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <lyocbim147.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1285456630-27680-1-git-send-email-raj.khem@gmail.com>
	<lyocbim147.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Tue, 28 Sep 2010 15:28:21 +0100
Message-ID: <1285684101.32349.3.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain.inc: Make gcc 4.5 & eglibc 2.12 as default sane versions
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
X-List-Received-Date: Tue, 28 Sep 2010 14:28:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-09-28 at 15:47 +0200, Enrico Scholz wrote:
> Khem Raj <raj.khem@gmail.com> writes:
> 
> > GCC 4.5 has been tested quite a bit
> 
> Probably not on ARMv5 ;) There 5/3 == 3 holds and ld.so crashes due to
> related errors.
> 
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=45817

That bug seems to be specific to --enable-target-optspace, which (afaik)
isn't selected for armv5 by the current recipes.  Are you actually
seeing that bug on a toolchain built with the settings in OE?

p.




