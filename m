Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QZ0Ro-0002XF-GD
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 14:52:52 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QZ0OP-0002ey-EF
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 14:49:21 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201106211432.22700.embedded@gmx.net>
References: <201106211432.22700.embedded@gmx.net>
Date: Tue, 21 Jun 2011 13:49:20 +0100
Message-ID: <1308660560.21613.16.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: openssl-native-1.0.0d-r14.0 compile fails
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
X-List-Received-Date: Tue, 21 Jun 2011 12:52:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 14:32 +0200, A. Schallenberg wrote:
> I tried to compile Angstrom (which is based on openembedded). 
> Unfortunately it fails with a message that is very similar to the
> one Robert Schuster reported on 07 Mar 2011.
> (Since I wasn't subscribed to this list back then I cannot reply
> to his mail now.)
> 
> Here is what I get:
> 
> Log data follows:
> | + do_compile
> | + oe_runmake
> | + oenote make -e MAKEFLAGS=
> | + echo NOTE: 'make -e MAKEFLAGS='
> | NOTE: make -e MAKEFLAGS=
> | + make -e MAKEFLAGS=
> | make: *** No targets specified and no makefile found.  Stop.
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> NOTE: package openssl-native-1.0.0d-r14.0: task do_compile: Failed
> 
> I didn't find any Makefile that "touch"ing would make it compile.
> 
> Has anybody an idea what I am doing wrong?
> Wrong toolchain? Wrong distro version selection?

It isn't likely that your choice of toolchain is causing this problem,
since the package in question is a -native one.  From the error you
pasted it looks as though the recipe has simply failed to unpack any
source code, or at least not the complete source code.  What do you have
in the WORKDIR at that point?

p.




