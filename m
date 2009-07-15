Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MR1eg-0005gA-3Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 12:24:06 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MR1Ri-0004FX-Mk
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 11:10:42 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MR1Ri-0008N8-8R
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 11:10:42 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090714234205.GN15944@smtp.west.cox.net>
References: <1247612892-19937-1-git-send-email-GNUtoo@no-log.org>
	<20090714233712.GM15944@smtp.west.cox.net>
	<20090714234205.GN15944@smtp.west.cox.net>
Date: Wed, 15 Jul 2009 11:10:38 +0100
Message-Id: <1247652638.6648.202.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: mdev.sh: permit serial console login and permit correct runlevel
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
X-List-Received-Date: Wed, 15 Jul 2009 10:24:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-07-14 at 16:42 -0700, Tom Rini wrote:
> To follow up to myself, the 'mdev' package should just go away really.
> This particular bug is because 'mdev' has an empty mdev.conf while
> busybox's mdev does not, and it contains console/null/etc entries.

Ah yes, right.  It looks like the immediate bug is that micro-base-image
is setting IMAGE_DEV_MANAGER = "mdev", which is causing the bogus
package to get dragged in.  I guess that variable should probably just
be left empty to use busybox mdev.

p.




