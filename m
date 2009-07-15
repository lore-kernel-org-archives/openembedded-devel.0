Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MR3Bb-0006KF-9S
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 14:02:12 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MR2yd-0006tQ-Lw
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 12:48:47 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MR2yd-0000di-DO
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 12:48:47 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200907151316.33659.thebohemian@gmx.net>
References: <200907151316.33659.thebohemian@gmx.net>
Date: Wed, 15 Jul 2009 12:48:43 +0100
Message-Id: <1247658523.6648.233.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: remove guile-native 1.8.2, switch to 1.8.6
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
X-List-Received-Date: Wed, 15 Jul 2009 12:02:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-07-15 at 13:16 +0200, Robert Schuster wrote:
> guile-native 1.8.2 fails for me with distribution 'openmoko'. I get the same 
> error as this one: http://tinderbox.openembedded.net/packages/96906/
> 
> guile-native 1.8.6 builds fine though. anyone unhappy about dumping 1.8.2 ?

I guess you should take this up with the openmoko people.  Presumably
they have set 1.8.2 as their preferred version for a reason and it would
be worth checking that 1.8.6 really does work (rather than just build)
for them before changing it.

As a general rule I am not in favour of removing old recipes unless they
are obviously and grossly broken in such a way that nobody could
possibly be using them.  In other words, the fact that the recipe
happens not to build in one particular configuration is not, in itself,
a compelling reason to delete it.  I haven't looked at the 1.8.2 error
closely enough to say whether that's the case here or not.

p.




