Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M8H2t-0007xk-O0
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 18:59:39 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M8GvF-0000cs-B2
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 17:51:41 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gvbgli$1iu$1@ger.gmane.org>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>
	<1243095832.4226.105.camel@lenovo.internal.reciva.com>
	<c384c5ea0905231525u2248fcf7ycf512bd48ef05e56@mail.gmail.com>
	<gvb066$tov$1@ger.gmane.org>
	<1243157020.4226.124.camel@lenovo.internal.reciva.com>
	<gvbbh9$m3s$1@ger.gmane.org>
	<1243168060.4226.161.camel@lenovo.internal.reciva.com>
	<gvbgli$1iu$1@ger.gmane.org>
Date: Sun, 24 May 2009 17:51:40 +0100
Message-Id: <1243183900.4226.195.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sun, 24 May 2009 16:59:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-24 at 15:04 +0200, Koen Kooi wrote:
> On 24-05-09 14:27, Phil Blundell wrote:
> 
> > It seems fairly clear that, as the originator of the patch in question,
> > the onus is on you to minimise any resulting damage to other users.
> 
> I'm gradually fixing kernel as I encounter them, but since I don't have 
> access to all hardware present in OE, or computing power to test all 
> toolchain permutations needed to build all kernels (e.g. kernels 
> requiring gcc 2.93.3), I am currently limiting that effort to kernel I 
> can actually test.

In situations like this there are still steps you can reasonably take to
manage the impact on other people, even if you can't directly test all
the potentially-affected packages for yourself.  

In cases like the one at hand here, it's fairly straightforward to
consider what would happen to recipes and machines which haven't been
modified and ensure that the answer isn't anything undesirable.  If it
isn't practical to do that (because the change is more complex and the
interactions are hard to foresee), or if the answer is that something
bad will happen but you don't know how to fix it, you can arrange for
your patch to only take effect for DISTROs that have explicitly selected
it in order to limit the risk for others.

> Furthermore, only kernel actually used by machines present in OE can
> get fixed, we have a number of kernels that have recipes, but no
> machines using them.

That does seem like another indication that this enforced 1:1 mapping
between kernels and MACHINEs is not a good idea in general.  If I
remember right there are at least a few machines which have many-to-many
mappings here and it's hard to see how a MACHINE_KERNEL_PR variable can
really work in that situation.

p.




