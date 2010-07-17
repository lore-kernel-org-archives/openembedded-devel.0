Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OaB1M-0007I1-6f
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 19:17:52 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OaB1G-0006nq-Mf
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 18:17:46 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i1s71i$d1j$2@dough.gmane.org>
References: <1279216536.3741.27.camel@mattotaupa>
	<1279270987.4164.29.camel@mattotaupa>
	<AANLkTimGrdHiLeLLsInSl9L-KS8SbvNt4ws2kDcpEEN1@mail.gmail.com>
	<i1qogv$i28$2@dough.gmane.org>
	<AANLkTin6E1D5KENkaXn4lf4dF8hog7f-bnDmDXSWQn7L@mail.gmail.com>
	<i1s71i$d1j$2@dough.gmane.org>
Date: Sat, 17 Jul 2010 18:17:56 +0100
Message-ID: <1279387076.21888.22.camel@lenovo.internal.reciva.com>
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
Subject: Re: angstrom-2008.1, uclibc: git-native: sysroot-destdir 6, 4 GB big, since some executables are 100 MB each
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
X-List-Received-Date: Sat, 17 Jul 2010 17:17:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-07-17 at 14:17 +0200, Koen Kooi wrote:
> And I was saying that the 8GB of git, if a bug in git, not with gdb3. I
> know gdb3 makes unstripped executables bigger and don't deny that.
> 
> I do take offence with you saying that the root cause is -ggdb3, when
> it's actually git being buggy. And as you have seen, instead of fixing
> git, people are removing -ggdb3 :(

It may well be true that the 8GB total folder size is due to a
deficiency in git.  But, if the individual binaries are coming out at
101MB, that's still an increase of something like 10000% compared to an
equivalent build without debugging.

Obviously it's up to angstrom to make its own policies, but I do wonder
how many of its users actually find themselves debugging -native
packages on a regular basis and, for those that do, how much benefit
they are really gaining from -ggdb3 versus plain -g.

p.




