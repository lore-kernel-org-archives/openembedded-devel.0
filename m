Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PuTxX-0004z0-MO
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 19:06:07 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PuTwB-0007Mj-FE
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 19:04:43 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D6D32B9.9080708@mentor.com>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
	<4D6D19AD.5010505@mentor.com>
	<AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>
	<4D6D2F3F.7060403@mentor.com>
	<AANLkTik7Cm2P6KL5aRDVf4sOUGsnAbpACyS+PucRpHiX@mail.gmail.com>
	<4D6D32B9.9080708@mentor.com>
Date: Tue, 01 Mar 2011 18:10:13 +0000
Message-ID: <1299003013.23547.118.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] sane-toolchain-*: add -g to FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Tue, 01 Mar 2011 18:06:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-01 at 10:54 -0700, Tom Rini wrote:
> That's why I'm asking for the -g part to be put into a variable so that 
> it can be overriden easily, in all cases, without needing to know the 
> special cases (ie glibc).

Why is glibc special anyway (or, why is the optimization in a
libc-specific conf file)?  It seems a bit bogus that the choice of your
C library would be having such a global impact on the compiler flags for
everything else.

p.




