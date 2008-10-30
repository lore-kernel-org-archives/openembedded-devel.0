Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KvZBd-0000hK-MO
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 16:11:49 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KvZ80-0008Be-Qm
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 15:08:05 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1KvZ80-0006CE-MC
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 15:08:04 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1KvYmj-0007s2-Og@linuxtogo.org>
References: <1225294016.3822.81.camel@mill.internal.reciva.com>
	<E1KvYmj-0007s2-Og@linuxtogo.org>
Date: Thu, 30 Oct 2008 15:08:04 +0000
Message-Id: <1225379284.3822.154.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: arm kernel configurations
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
X-List-Received-Date: Thu, 30 Oct 2008 15:11:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-10-30 at 10:40 -0400, Tom Talpey wrote:
> At 11:26 AM 10/29/2008, Phil Blundell wrote:
> >- if your userspace is pure EABI, make sure that you have
> >CONFIG_OABI_COMPAT turned off.
> 
> My kernel(s) have all hung during exec of init when trying this.
> Are you able to turn this off with non-thumb userspace?

Yes, it doesn't require Thumb.  Are you sure that your userspace really
is compiled for EABI and not OABI?

> One side effect of turning off OABI_COMPAT is that the floating
> point emulation also vanishes. I get the same behavior if I leave
> OABI_COMPAT on and play with fp settings.

That sounds rather like some part of your userspace has been built with
hard-fpa floating point.  FPA is basically incompatible with EABI (and I
think all extant EABI configs in OE are soft-float) so this would also
indicate that you are actually using OABI.

> This is mostly with 2.6.27 on my iPAQ h1940 (s3c2410). Same
> as GTA01, right?

Right.

p.




