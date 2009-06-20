Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MHxfV-0005Nj-8k
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 12:19:29 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MHxV6-0001Yw-4F
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 11:08:44 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1245396977.29153.192.camel@lenovo.internal.reciva.com>
References: <20090617042909.GA21132@denix.org>
	<1245224450.29153.99.camel@lenovo.internal.reciva.com>
	<20090617214104.GC21132@denix.org>
	<1245396977.29153.192.camel@lenovo.internal.reciva.com>
Date: Sat, 20 Jun 2009 11:08:27 +0100
Message-Id: <1245492507.29153.244.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: update-rc.d: don't add runtime dependency if not	doing	online package management; only add it to ${PN} in any case.
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
X-List-Received-Date: Sat, 20 Jun 2009 10:19:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-06-19 at 08:36 +0100, Phil Blundell wrote:
> On Wed, 2009-06-17 at 17:41 -0400, Denys Dmytriyenko wrote:
> > Any ideas why RDEPENDS_{PN} in "udev" recipe works, but RDEPENDS_udev doesn't? 
> > It only happens with inherit update-rc.d.bbclass, which also changes 
> > RDEPENDS_{PN}... I have the same issue with my own recipes, which I need to 
> > fix similarly.
> 
> It's a side effect of the way that overrides work in bitbake. 

... and Chris Larson, being the great guy that he is, has now added a
check for this issue to recipe_sanity.bbclass.  If you have sanity
checking enabled, this situation will now elicit a diagnostic along the
lines of:

NOTE: glibc-2.9: recipe_sanity: rename of variable 'RPROVIDES_${PN}-dev'
to 'RPROVIDES_glibc-dev' overwrote existing value ' libc-dev' with
'libc6-dev virtual-libc-dev'. 

which should make it easy to identify such issues in the future.  Thanks
Chris!

p.




