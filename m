Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MhprN-0001Af-Ns
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 21:14:41 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MhpZY-0001Zz-QF
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 19:56:17 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0908291351p1843c1ddw4d5e7f8523f21dd0@mail.gmail.com>
References: <f96d234e0908291351p1843c1ddw4d5e7f8523f21dd0@mail.gmail.com>
Date: Sun, 30 Aug 2009 19:56:15 +0100
Message-Id: <1251658575.4215.712.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: getting back to < 2MB rootfs with mtd-utils
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
X-List-Received-Date: Sun, 30 Aug 2009 19:14:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-08-29 at 16:51 -0400, Cliff Brake wrote:
> micro-base-image is currently 1.6MB for cpio.gz, which is much larger
> than the 1MB uclibc images I built about a year ago, but that would be
> acceptable.
> 
> However, adding mtd-utils to the image which I need for system update
> functionality bloats it up to 4MB.

Per our conversation on IRC yesterday, I built a micro-base-image for
micro-uclibc, with mtd-utils added and dropbear removed, and it comes
out as:

-rw-r--r-- 1 pb pb  964394 2009-08-30 19:51 tmp/deploy/images/nslu2be/micro-micro-base-image-uclibc-ipk-20090830-nslu2be.rootfs.tar.gz

Without mtd-utils I get:

-rw-r--r-- 1 pb pb 550078 2009-08-30 19:53 tmp/deploy/images/nslu2be/micro-micro-base-image-uclibc-ipk-20090830-nslu2be.rootfs.tar.gz

... so, it does appear that mtd-utils adds a non-trivial amount of bloat, though nowhere near the amount you seem to be suffering.

Looking at the contents of mtd-utils itself, it seems that you would
probably benefit from breaking that one package up into multiple
subpackages for different binaries.  It currently contains more than 40
separate executables, most of which are probably unnecessary in any
given system.

p.




