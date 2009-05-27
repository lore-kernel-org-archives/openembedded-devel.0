Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M9GdA-0007IM-I8
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 12:45:09 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M9GVE-0003f4-Aq
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 11:36:56 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1M9GVE-0006yP-5T
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 11:36:56 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <Pine.LNX.4.64.0905262144170.6446@juice.ott.cti.com>
References: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
	<Pine.LNX.4.64.0905252339270.6446@juice.ott.cti.com>
	<1243353706.9080.367.camel@mill.internal.reciva.com>
	<Pine.LNX.4.64.0905262144170.6446@juice.ott.cti.com>
Date: Wed, 27 May 2009 11:36:55 +0100
Message-Id: <1243420616.14104.9.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] busybox: allow building when prefix is "", not	"/usr".
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
X-List-Received-Date: Wed, 27 May 2009 10:45:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-05-26 at 21:53 -0400, Michael Smith wrote:
> I changed the "cp" back to "mv" and the package looks a bit lighter on 
> symlinks, and the final rootfs is the same. I'd still want to play a bit 
> with upgrades though, and that may be a while. If it looks OK, I'll send 
> it up as a separate patch later.
> 
> This is where it changed from mv to cp:
> 
> commit f7f1ac27e90f042fa1c4322b193b5b6a27cd4c07
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Sat Aug 26 14:02:37 2006 +0000
> 
>     busybox 1.2.1: replace mv with a non-gnu-ish cp

Okay, great.  Yeah, that commit f7f1ac27e90f042fa1c4322b193b5b6a27cd4c07
looks fairly bogus: I don't know what the intent of it was, but it
doesn't seem like it can be the right way to solve any problem.

Keep us posted once you've had a chance to test the upgrades.

p.




