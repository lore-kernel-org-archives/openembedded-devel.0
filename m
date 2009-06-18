Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MHFXS-0006hN-Pr
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 13:12:14 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MHFNH-0005kg-D2
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 12:01:43 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MHFNH-0006qc-44
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 12:01:43 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090618000630.GD21132@denix.org>
References: <20090618000630.GD21132@denix.org>
Date: Thu, 18 Jun 2009 12:01:42 +0100
Message-Id: <1245322902.25995.21.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: Suppress kernel image from the filesystem image
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
X-List-Received-Date: Thu, 18 Jun 2009 11:12:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 20:06 -0400, Denys Dmytriyenko wrote:
> I played with it for some time and realized that in order for it to work, the 
> kernel needs to be rebuilt before the new dependencies take place. So, I 
> added this to the local.conf:
> 
> RDEPENDS_kernel-base = ""
> 
> And after rebuilding the kernel and the filesystem I no longer see kernel 
> image in the filesystem!

Ah, very good.  I wonder why that wasn't working properly for me when I
tried it.

> The only problem I see with this approach is it builds the kernel packages 
> differently (USE-flags, anyone?) and if I use a public feed, I may end up 
> installing kernel image into the system again...

I wouldn't have thought this would be too much of a problem in practice
since, generally, the choice of whether or not to put the kernel in the
rootfs is just going to be governed by the (DISTRO,MACHINE) tuple and
doesn't depend on any other details of the image being built.  Is that
not true in your use-case?

p.




