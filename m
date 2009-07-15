Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MR5NW-0003Qu-2k
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 16:22:38 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MR5AS-0002AA-3H
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 15:09:11 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MR5AR-0001nd-Dz
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 15:09:07 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247662361-20485-2-git-send-email-khimov@altell.ru>
References: <1247662361-20485-1-git-send-email-khimov@altell.ru>
	<1247662361-20485-2-git-send-email-khimov@altell.ru>
Date: Wed, 15 Jul 2009 15:09:03 +0100
Message-Id: <1247666943.6648.285.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH 2/2] icecc: introduce ICECC_FALLBACK_PARALLEL
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
X-List-Received-Date: Wed, 15 Jul 2009 14:22:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-07-15 at 16:52 +0400, Roman I Khimov wrote:
> icecc-blacklisted packages currently built not only without icecc environment
> set but also without any parallel options enabled. The original intention was
> not to kill the build machine, I guess, since having a good icecc cluster it's
> easy to set '-j16' or '-j32' or whatever else which could do so. However as
> the toolchain packages are blacklisted for icecc they're becoming a
> bottleneck in the build process, while they can be built with local-machine
> parallelism.
> 
> So, in order to solve it, introducing ICECC_FALLBACK_PARALLEL option. It's
> simply used as PARALLEL_MAKE for icecc-blacklisted packages.

Maybe it would be better to do this the other way around: have an
ICECC_PARALLEL_MAKE which is used instead of PARALLEL_MAKE when icecc is
selected, and make this be the one that you set to "-j1024".  Then, if
icecc is disabled for any reason (blacklisted package, or just because
you stop inheriting the class) it would go back to using the regular
PARALLEL_MAKE setting.

p.




