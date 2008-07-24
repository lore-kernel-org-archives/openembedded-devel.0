Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KM4hJ-0000zZ-Ip
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jul 2008 19:33:49 +0200
Received: from 88-109-64-9.dynamic.dsl.as9105.com ([88.109.64.9]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KM4g2-0003b2-1b
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jul 2008 18:32:32 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4888B297.5070701@gmx.net>
References: <4888B297.5070701@gmx.net>
Date: Thu, 24 Jul 2008 18:32:34 +0100
Message-Id: <1216920754.5414.40.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: compiling buildhelper programs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 17:33:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-07-24 at 18:49 +0200, Robert Schuster wrote:
> Is it OK when the recipe provides the native CC via BUILD_CC to build
> those helper binaries while at the same time TARGET_CC compiles the real
> libraries and binaries or do we strictly want a separate -native recipe
> that builds the helpers and injects them?

If they are strictly build time helpers for this one specific package,
and would have no use as part of any conceivable installed target
system, you can just build them with BUILD_CC and be done with it.  I
think there is precedent for this in at least some of the X11 packages.
If they are binaries that you might want to install on the target, you
should make a separate package for them, with a -native version, and
install them into staging.

p.




