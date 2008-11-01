Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KwMHp-0004Il-2p; Sat, 01 Nov 2008 20:37:29 +0100
Received: from 88-111-134-150.dynamic.dsl.as9105.com ([88.111.134.150]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KwM1b-0006jD-QD; Sat, 01 Nov 2008 19:20:44 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1225539496.4090.6.camel@utx.utx.cz>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>
	<20081031233753.43f5f09d.raster@rasterman.com>	<gef9q7$o65$1@ger.gmane.org>
	<20081101085334.8afcd730.raster@rasterman.com>
	<geh3kt$bp7$1@ger.gmane.org> <1225539496.4090.6.camel@utx.utx.cz>
Date: Sat, 01 Nov 2008 19:20:42 +0000
Message-Id: <1225567242.4235.471.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run	ldconfig	on boot when ld.so. conf is present
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
X-List-Received-Date: Sat, 01 Nov 2008 19:37:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-11-01 at 12:38 +0100, Stanislav Brabec wrote:
> And what about something like:
> if ..../ld.so.cache -ot /usr/lib -o /etc/ld.so.cache -ot /lib ; then
>     /sbin/ldconfig
> fi

That would work fine for DISTROs which only put libraries in those two
directories.  But, frankly, if you only have those two library paths you
are probably better off not using ldconfig and ld.so.conf at all.

Even in the simple case I think a better solution would probably be to
teach ldconfig to do this checking of mtimes, rather than having to wrap
every call to it in a shell conditional.

> Call ldconfig only if ld.so cache is outdated. Fast for users of package
> managers, working for others, fast in subsequent reboots.

Just as an aside, there isn't really any need to have complicated
runtime logic to handle all possible combinations of DISTRO policy.  Any
single DISTRO would clearly have only one policy (for example, either it
uses a package manager or it doesn't) and hence it can make these
determinations at build time.  As an example of that, DISTROs which use
package management but don't require ldconfig can just set
USE_LDCONFIG=0 and suppress all those postinsts altogether, rather than
emitting a postinst with convoluted tests for file existence that ends
up doing nothing.

p.




