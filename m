Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>)
	id 1MBFGC-0001zc-Sf; Mon, 01 Jun 2009 23:41:38 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MBF7g-00025s-2F; Mon, 01 Jun 2009 22:32:48 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h01f1l$7t1$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
	<20090601165809.GZ23842@smtp.west.cox.net> <h012tn$v40$1@ger.gmane.org>
	<1243887426.5049.18.camel@lenovo.internal.reciva.com>
	<h01f1l$7t1$1@ger.gmane.org>
Date: Mon, 01 Jun 2009 22:32:45 +0100
Message-Id: <1243891965.5049.22.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Mon, 01 Jun 2009 21:41:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-01 at 22:52 +0200, Koen Kooi wrote:
> On 01-06-09 22:17, Phil Blundell wrote:
> > In an ideal world, you'd even be able to generate a single ABI 
> > footprint by, say, taking a sha256 hash of the catenation of all 
> > the symbol versions.  Then, your kernel package could
> > Provide: kernel-abi-123456abc, all your module packages could Depend: on
> > the same thing, and (modulo a little bit of package manager tweaking
> > along roughly the same lines as we use for locales) everything would
> > "just work".
> 
> only if you use {o,i}pkg, which isn't good enough.

Indeed, in that respect this isn't an ideal world.  The other things
that I wrote in that same email are still applicable, though.

p.




