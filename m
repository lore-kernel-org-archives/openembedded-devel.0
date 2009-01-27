Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LRk8D-0007zJ-0m
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 10:21:19 +0100
Received: from 88-110-5-187.dynamic.dsl.as9105.com ([88.110.5.187]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1LRk0t-0002tE-0z
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 09:13:43 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <497ECDCA.3000302@gmail.com>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF5FB@hiob.intern.dresearch.de>
	<497ECDCA.3000302@gmail.com>
Date: Tue, 27 Jan 2009 09:13:41 +0000
Message-Id: <1233047621.4890.119.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: AVR XMEGA?
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
X-List-Received-Date: Tue, 27 Jan 2009 09:22:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-01-27 at 10:03 +0100, Marco Cavallini wrote:
> Sledz, Steffen ha scritto:
> > Just a short question: Is somebody working on support for Atmel AVR XMEGA (8-bit AVR) architecture in OE?
> > 
> 
> http://wiki.openembedded.net/index.php/Main_Page
> Openembedded, your best-in class cross-compile environment. Openembedded
> allows developers to create a complete Linux Distribution for embedded
> systems
> 
> Linux doesn't run on 8 bit CPUs

There's nothing about OpenEmbedded itself that is inherently specific to
Linux; it just so happens that all the currently supported targets are
Linux-based.  There's certainly no reason that one couldn't build an OE
target system around, say, the Hurd or the BSD kernel.

Likewise, it would be perfectly feasible to use OE to generate binaries
for a 8-bit device, although the nature of those small deeply-embedded
systems tends to be that they use single monolithic application binaries
rather than a filesystem or "distribution" in the sense that larger,
general-purpose machines do.  That being the case I suspect some of the
advantages of OE would probably be negated in such an environment.

As far as I know nobody is working on XMEGA support, anyway.

p.




