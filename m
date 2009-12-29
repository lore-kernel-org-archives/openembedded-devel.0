Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NPe7M-00032L-D3
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 16:36:19 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NPe5U-00052S-JB
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 15:34:20 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NPe5U-0001F6-95
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 15:34:20 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>
References: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>
Date: Tue, 29 Dec 2009 15:34:16 +0000
Message-Id: <1262100857.15344.112.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Move IMAGE_BOOT stuff into distro's?
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
X-List-Received-Date: Tue, 29 Dec 2009 15:36:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-12-29 at 16:15 +0100, Leon Woestenberg wrote:
> Why do we hardcode names of default packages in the "image.bbclass"?
> 
> Now every image recipe that doesn't want these has to know the
> variables it has to override.
> 
> Shouldn't this be distro material instead?

Funnily enough I was just discussing a similar issue with Mickey on IRC
a few minutes ago.

Most of these variables did use to be part of the distro configuration
but it appears they were moved into image.bbclass by commit
9752b780ae9cbe8b36507890d8ee55c439eb2b35.  Presumably this change was
made for a reason, but it does seem like a retrograde step to me: one
particular ill-effect of that change is that images built for micro have
regressed to using udev, whereas previously they were selecting
busybox-mdev via ${DISTRO_DEV_MANAGER}.  There doesn't seem to be any
obviously-correct way to restore the previous behaviour.

I have suggested to Mickey that perhaps the TSC would like to consider
this issue and come up with a coherent policy on how this stuff should
be managed.

p.




