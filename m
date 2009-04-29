Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Lz9RK-0006H9-UF
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 15:03:07 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Lz9M5-0006TU-Pg
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 13:57:41 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Lz9M3-00047v-4u
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 13:57:39 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49F8468A.7060305@acn-group.ch>
References: <49F8468A.7060305@acn-group.ch>
Date: Wed, 29 Apr 2009 13:57:39 +0100
Message-Id: <1241009859.30742.168.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: do_rootfs : (offline root mode: not running	openntpd.postinst)
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
X-List-Received-Date: Wed, 29 Apr 2009 13:03:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-04-29 at 14:22 +0200, Christophe Aeschlimann wrote:
> Of course I can modify the recipe so it will change my passwd file during 
> install or add some initialization script to check that this user is created 
> before ntpd runs but I'm more curious about why we skip all the postinst scripts.

The postinst scripts are primarily intended to execute on the target
device (during "ipkg configure" or equivalent) and, in general, they
won't run correctly on the build host.  So, when ipkg is running in
offline root mode, it skips the postinsts and leaves the packages
installed but not configured.

The exact details of what happen next are dependent on your distro, but
most likely there will be some combination of: (a) a post-processing
step driven out of the do_rootfs() method, which identifies those
postinsts that can in fact be run successfully on the build host and
then runs them; and (b) a startup script which invokes "ipkg configure"
when you first boot the resulting rootfs on the target device in order
to get everything configured correctly.  Obviously there are other
possibilities too, such as running the postinsts inside qemu as part of
the build process, or in some cases just abolishing them completely. 

This complexity arises because different distros have rather different
(and, in some cases, conflicting) requirements for such processing.  For
example, if your rootfs is on a read-only medium then running "ipkg
configure" on the target device is likely to be a losing proposition.
Or, if your target device doesn't require package management at runtime,
you might not even want to have ipkg or its metadata installed in the
rootfs at all, in which case running it is clearly impossible.  On the
other hand, if you _do_ want to support arbitrary installation and
upgrading of packages after the fact then you can't rely on special
processing to be done at image construction time: the packages need to
be self-sufficient and the postinst needs to at least have the
capability to set everything up from scratch.

p.




