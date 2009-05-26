Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M8zSW-0004zp-7i
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 18:25:00 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M8zKe-0007FP-Gk
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 17:16:52 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1M8zKe-0005qW-A0
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 17:16:52 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
References: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
Date: Tue, 26 May 2009 17:16:52 +0100
Message-Id: <1243354612.9080.372.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Tue, 26 May 2009 16:25:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-25 at 23:35 -0400, Michael Smith wrote:
> For insane backwards compatibility reasons (my own fault) I would like
> to be able to create packages with no /usr and /sbin == /bin. Most
> autoconf packages are happy about this; busybox just needs a little
> help.

This looks pretty cool.  I've been thinking for a while that it would be
nice to eliminate /usr for embedded distros such as micro (and maybe
minimal).  That separation is basically just a waste of time and space
on those kinds of devices.

> btw, I have not yet figured out where ${layout_blah} vs. ${blah}
> should be used (e.g. ${layout_prefix} and ${prefix}). I've tried to be
> consistent, so I figure there's a 50% chance I guessed right.

I'm not quite sure either but I think the recipes should probably always
be using ${blah}, as you've done.  I don't remember now why I introduced
${layout_blah} into busybox.bb in the first place but I suspect it was
probably an attempt to work around some kind of Qt and/or MythTV-related
path lossage.

p.




