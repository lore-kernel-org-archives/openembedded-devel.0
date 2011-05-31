Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QRPkb-00053Y-L4
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 16:16:53 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QRPha-0000lh-GL
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 16:13:46 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DE4F1D0.1020508@gmail.com>
References: <4DE352E5.7090604@gmail.com> <is0a7n$4j8$1@dough.gmane.org>
	<4DE491DA.2000404@gmail.com> <1306848351.2525.492.camel@phil-desktop>
	<4DE4F1D0.1020508@gmail.com>
Date: Tue, 31 May 2011 15:13:45 +0100
Message-ID: <1306851225.2525.497.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Error building qt4e-base-image with angstrom-2010.x
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
X-List-Received-Date: Tue, 31 May 2011 14:16:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 15:49 +0200, Marco Cavallini wrote:
> Phil Blundell ha scritto, Il 31/05/2011 15:25:
> > On Tue, 2011-05-31 at 08:59 +0200, Marco Cavallini wrote:
> >> BTW looks like I have a major problem with gcc 4.4 and armel - the ABI
> >> of va_list changed (for c++ libraries)
> > 
> > Why is this a problem? 
>
> Phil,
> looks like the problem is gcc-4.3 on the Host side (Debian Lenny x86_64)
> and besides I wonder if I'm the only one OE user using this distro I'm
> doing a backup of the whole system and planned to upgrade to Squeeze
> tomorrow.
> 
> This is the output:
> 
> /home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/config/arm/neon.md:5730:
> internal compiler error: Segmentation fault
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <file:///usr/share/doc/gcc-4.3/README.Bugs> for instructions.

That certainly does indicate a bug in your host gcc (if it's
reproducible in the same place) or a broken computer (if it occurs at
different, random places).  Assuming the first, you might be able to
work around it by building the cross gcc with less optimisation, but if
you're going to upgrade to squeeze anyway then that probably will solve
the problem too.

This doesn't seem to have anything to do with the thing you originally
mentioned (ARM va_list ABI change in gcc 4.4) though.

p.




