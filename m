Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MTD39-0005Fg-1U
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 12:58:33 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MTCpS-0001rO-ST
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 11:44:14 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MTCpQ-0005MG-MY
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 11:44:12 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A657D58.4070404@atmel.com>
References: <4A657D58.4070404@atmel.com>
Date: Tue, 21 Jul 2009 11:44:08 +0100
Message-Id: <1248173048.28930.59.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [RFC] hal-0.5.12 requires blkid >= 1.43
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
X-List-Received-Date: Tue, 21 Jul 2009 10:58:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-07-21 at 10:33 +0200, Ulf Samuelsson wrote:
> hal does not build when bitbaking gpe-image,since
> blkid is 1.41.8 and hal requires >= 1.43.
> 1.41.8 seems to be the latest!
> The attached patch fixes configure and configure.in in the hal

I think the idea is that you're meant to use libblkid from
util-linux-ng.  I've no idea what the difference is, though: it's
possible that 1.41.8 would indeed work correctly.  I guess you'd have to
ask the hal h4x0rs why they selected 1.43 as the minimum version to be
sure.

p.




