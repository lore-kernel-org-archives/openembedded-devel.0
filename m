Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M1yjc-0008F9-E5
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 10:13:42 +0200
Received: from 79-79-173-112.dynamic.dsl.as9105.com ([79.79.173.112]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M1yIF-0007M0-TE
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 08:45:24 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090506223838.GA15339@denix.org>
References: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>
	<84090287fafa5bca668308285fcfa06650df22cd.1241639516.git.msmith@cbnco.com>
	<20090506223838.GA15339@denix.org>
Date: Thu, 07 May 2009 07:45:21 +0100
Message-Id: <1241678721.23982.71.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 2/2] grub: allow menu.lst to be overridden	using	GRUB_CONFIG_PACKAGE.
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
X-List-Received-Date: Thu, 07 May 2009 08:13:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-05-06 at 18:38 -0400, Denys Dmytriyenko wrote:
> On Wed, May 06, 2009 at 03:55:57PM -0400, Michael Smith wrote:
> > If GRUB_CONFIG_PACKAGE is set, don't ship menu.lst with grub. Instead,
> > RRECOMMEND the config package. This allows overlays to override menu.lst
> > in a separate package, rather than copying the whole grub package into
> > the overlay.
> 
> It was discussed many times here - no USE flags in OE. You'll end up with 2 
> grub packages of the same name but with different contents - with menu.lst 
> and without.

Although you're right that it comes up here frequently, I think this "no
USE flags" dogma is somewhat misguided.  It seems, frankly, absurd to
require people to effectively fork a recipe whenever they want to make
some or other configuration change.  Firstly, this is just tiresome to
do; secondly, it leads to source tree clutter and corresponding
maintenance headaches because you end up with large numbers of
possibly-defunct recipes lying around; and thirdly it leads to a worse
end-user experience because suddenly their binary packages end up with
crazy names that encode some aspect of the distro configuration. 

Also, it simply isn't reasonable to expect that you can encode
everything about a binary package into its filename: there are too many
unknown inputs for this to be feasible.  If you want to know whether two
packages are the same then you should compare the md5sums, and if it's
vital (for whatever reason) for you to have an unambiguous, unique
fingerprint for each binary package then you should probably consider
making the md5sum be part of the output filename.

I do understand the desire to have package builds be repeatable and
deterministic, and that's clearly a reasonable thing to want.  But USE
flags at the recipe level don't materially alter the situation here: if
you use a given distro configuration, unmodified, then you're going to
get the same values of the USE flags as everybody else who builds for
that distro.  If you start randomly flipping USE flags in your local
copy of the distro configuration or overriding them from local.conf then
sure, you will lose, but if your source tree contains arbitrary local
hacks then there already countless ways in which you could lose by, for
example, selecting a different compiler, C library or global build
options to everybody else.

And, indeed, we do already have a certain number of USE-type flags in OE
today: the most obvious one that comes to mind is
ENABLE_BINARY_LOCALE_GENERATION, which impacts the way that glibc is
packaged and yet doesn't seem to be causing any significant grief at the
moment.

p.




