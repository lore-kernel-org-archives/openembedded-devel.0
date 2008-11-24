Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1L4Yh8-0004hc-EF
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 11:29:30 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1L4YeO-0007n7-5R
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 10:26:40 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1L4YeN-0002kk-NR
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 10:26:40 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081124090648.GU2475@buddha.tw.openmoko.com>
References: <20081124090648.GU2475@buddha.tw.openmoko.com>
Date: Mon, 24 Nov 2008 10:26:38 +0000
Message-Id: <1227522398.31396.4.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: What to do with obsolete kernel modules
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
X-List-Received-Date: Mon, 24 Nov 2008 10:29:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-11-24 at 17:06 +0800, John Lee wrote:
> If kernel-module-foobar exists in an old rootfs, but in later version
> we disabled module foobar in kernel config, how can we remove the
> obsolete module from the old rootfs after opkg upgrade ?

Assuming the old module has a correctly versioned dependency on its
corresponding kernel version, opkg should automatically tear out the
module package when the kernel is upgraded since its dependencies will
no longer be met.  If that isn't working, I think it would be an opkg
bug.

p.




