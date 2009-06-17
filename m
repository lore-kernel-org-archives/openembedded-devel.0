Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MH3r1-0001Nf-6w
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 00:43:39 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MH3gg-0006qj-JJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 23:33:00 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A396D6B.2030505@cbnco.com>
References: <05DB01B9-1334-4650-873E-96B20CAC9D8C@mac.com>
	<4A396D6B.2030505@cbnco.com>
Date: Wed, 17 Jun 2009 23:32:44 +0100
Message-Id: <1245277964.29153.144.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: glibc_2.6.1.bb - dangling symlink to /lib/libcidn-2.6.1.so
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
X-List-Received-Date: Wed, 17 Jun 2009 22:43:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 18:25 -0400, Michael Smith wrote:
> You could also set:
> 
> ASSUME_SHLIBS += "libgcc_s.so.1:libgcc"
> 
> (cribbed from openwrt-sdk -- but I wonder if it should be global?)

This thing with the shlibs data for libgcc going missing is a
long-standing, intermittent yet annoying bug.  Ideally it would be nice
to figure out why it happens and stop it; I don't think there's any good
reason why libgcc's shlibs data should behave any different to any other
libraries.

I'd be a bit reluctant to add a global ASSUME_SHLIBS for this unless it
turns out that the underlying issue is really an intractable one and
there's some particular reason why it can't be fixed.

p.




