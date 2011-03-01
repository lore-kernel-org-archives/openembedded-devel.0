Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PuW2K-0000IH-JG
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 21:19:12 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PuW0y-0007Vy-Gi
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 21:17:48 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D6D3B0E.9030309@mentor.com>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
	<4D6D19AD.5010505@mentor.com>
	<AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>
	<4D6D2F3F.7060403@mentor.com>
	<AANLkTik7Cm2P6KL5aRDVf4sOUGsnAbpACyS+PucRpHiX@mail.gmail.com>
	<4D6D32B9.9080708@mentor.com> <1299003013.23547.118.camel@phil-desktop>
	<4D6D3B0E.9030309@mentor.com>
Date: Tue, 01 Mar 2011 20:17:42 +0000
Message-ID: <1299010662.3235.6.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Tue, 01 Mar 2011 20:19:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-01 at 11:29 -0700, Tom Rini wrote:
> But my point is that 
> today we have a few special case FULL_OPTIMIZATION_pn-'s and it'd be 
> great to just not have to worry about that when setting the debug level 
> we build with.

Yeah, agreed.  Debugging is only tangentially related to optimization
and having the two things conflated in one variable is a bit of an
anachronism.  It certainly would be good to have that separated out in
some cleaner way.

p.




