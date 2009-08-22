Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Melfk-0005T0-T0
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 10:10:02 +0200
Received: from 79-79-178-204.dynamic.dsl.as9105.com ([79.79.178.204]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MelOf-0003AA-HH
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 08:52:23 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A8F6FE3.5080901@arcor.de>
References: <4A8F6FE3.5080901@arcor.de>
Date: Sat, 22 Aug 2009 08:51:59 +0100
Message-Id: <1250927519.4215.321.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: bitbake source fetch problem :(
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
X-List-Received-Date: Sat, 22 Aug 2009 08:10:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-08-22 at 06:11 +0200, Martin Wegner wrote:
> PATH=/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/sbin:/stuff/tmp/staging/i686-linux/usr/bin:/stuff/tmp/cross/armv5te/bin:/stuff/tmp/staging/i686-linux/sbin:/stuff/tmp/staging/i686-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games;
> /usr/bin/env hg clone -r bb7ad7d43804
> http://icedtea.classpath.org/hg/icedtea6 hg/icedtea6 failed with signal
> 127, output:
> /usr/bin/env: hg: No such file or directory

This error seems fairly self-explanatory: it would appear that you are
trying to check out from a mercurial repository without having the
mercurial client installed.

p.




