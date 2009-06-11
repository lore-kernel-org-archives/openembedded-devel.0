Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MEhSt-0006e1-Tx
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 12:24:59 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MEhJL-0006Xx-QM
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 11:15:09 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MEhJI-0004H8-9C
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 11:15:05 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <878wjzf7z1.wl%peter@chubb.wattle.id.au>
References: <87ljnzik4z.wl%peter@chubb.wattle.id.au>
	<1244706269.4151.80.camel@lenovo.internal.reciva.com>
	<878wjzf7z1.wl%peter@chubb.wattle.id.au>
Date: Thu, 11 Jun 2009 11:15:03 +0100
Message-Id: <1244715303.21585.91.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH] Micro image needs some help
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
X-List-Received-Date: Thu, 11 Jun 2009 10:25:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-06-11 at 19:14 +1000, Peter Chubb wrote:
> Do you mean /etc/init.d/rcS ? It's supposed to be invoked from
> /etc/inittab in sysinit state, but doesn't seem to be succeeding.
> I'll be doing some more debugging tomorrow.

Yes, sorry, that one.

> Is there an easy way to work out which recipe installed which file
> into the rootfs? find recipes -type f -print0 | xargs -0 grep rcS took a long
> time to find sysvinit together with a lot of false positives.

If you've got a running system with the opkg metadata installed, "opkg
search /etc/init.d/rcS" might reveal the truth.  Otherwise, check
tmp/deploy/ipk/*/Packages.filelist.

> How will this work if I try to use busybox init instead of sysvinit?

Good question.  I've never tried busybox init myself, but I guess it
must ship with some equivalent scripts to the ones in sysvinit and I
guess they should be patched to do the same job.

p.



