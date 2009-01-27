Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LRmG9-0000rA-P3
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 12:37:38 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1LRm8k-0005rW-Fi
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 11:29:59 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1LRm8i-00053y-Er
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 11:29:56 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <497EEAE6.7090904@gmx.net>
References: <497EEAE6.7090904@gmx.net>
Date: Tue, 27 Jan 2009 11:29:55 +0000
Message-Id: <1233055796.31102.42.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: RFC: thinking about DEPENDS properties
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
X-List-Received-Date: Tue, 27 Jan 2009 11:37:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-01-27 at 12:07 +0100, Robert Schuster wrote:
> 1) Strong dependencies
> 
> Some recipes have a strong dependency on another recipe. Take llvm as an
> example. llvm puts a bunch of static libraries (.a) and object code
> files into staging which another program links to. So, if llvm is
> recompiled (e.g. changed CFLAGS or applied a patch) those having a
> dependency on llvm should be recompiled as well.

I'm not exactly sure what the concrete difference is between a "strong"
and a "weak" dependency in this view of the world.  Even for packages
with just shared libraries, a change in the depended-on header files
or .so files could easily cause a difference in the dependent binaries.

> 2) Minimum & Maximum supported versions
> Some recipes cannot be built with certain versions of other recipes.
> 
> DEPENDS += "automake-native;minver=1.10"

Bitbake already has a notation for this: you can write:

DEPENDS += "automake-native (>= 1.10)"

and the current parser will accept it although the version information
is ignored.  It would just be a small matter of programming to teach
bitbake to do something useful with that data.

> If the distro uses a lower automake version OE should error out when
> someone tries to build that recipe:
> 
> ERROR: Recipe 'foo' needs at least 'automake-native 1.10' but
> 'PREFERRED_VERSION_automake-native' is set to '1.9.6'.

Not that this was really your point, but the version check shouldn't be
looking at PREFERRED_VERSION_anything.  What matters is the specific
version that you end up trying to build, which might be quite different
to the preferred one for a variety of reasons.

p.




