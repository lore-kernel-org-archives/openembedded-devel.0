Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L9PHx-00088D-OD
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 20:27:34 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081207192342.ONHB131.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 7 Dec 2008 14:23:42 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id oKPf1a0061E665w04KPgbn; Sun, 07 Dec 2008 14:23:42 -0500
X-Authority-Analysis: v=1.0 c=1 a=b2ZvGRdsAAAA:8 a=22pK5S-mAAAA:8
	a=8oruoXz5JlhY0R2RZ5UA:9 a=pROzsTaCYg8ULu0k1lwA:7
	a=kVhrYYklUoMUVc04VRx6OrZGaYMA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 7 Dec 2008 12:23:48 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081207192348.GB15204@smtp.west.cox.net>
References: <20081207021144.GL16628@smtp.west.cox.net>
	<1228647455.5427.0.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1228647455.5427.0.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Broken kernel recipes
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
X-List-Received-Date: Sun, 07 Dec 2008 19:27:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 07, 2008 at 10:57:35AM +0000, Richard Purdie wrote:
> On Sat, 2008-12-06 at 19:11 -0700, Tom Rini wrote:
> > As part of testing meta-toolchain-sbox builds on different arches, I
> > found that sbrsh, on ARM, brings in both the 2.6 kernel for the MACHINE
> > in question, as well as a 2.4 kernel.  In the case of the 2.4 kernel, it
> > first picks up poodle-kernel-2.4-embedix.bb on nokia800, which doesn't
> > work as it wants gcc-2.95, which doesn't exist.  Can I move the
> > following support to packages/obsolete/linux/ ?
> > corgi-kernel-2.4-embedix.bb
> > husky-kernel-2.4-embedix.bb
> > openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.bb
> > poodle255-kernel-2.4-embedix.bb
> > poodle-kernel-2.4-embedix.bb
> > shepherd-kernel-2.4-embedix.bb
> > openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb
> > openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb
> 
> These are needed for sharprom-compat. The more interesting question is
> why they were being brought in - the 2.6 version should provide
> everything they do and have preference?

What's over in http://bugs.openembedded.net/attachment.cgi?id=13197
matches what I was seeing (search for "NOTE: selecting linux-rp to
satisfy virtual/kernel due to PREFERRED_PROVIDERS").  The 2.6 recipe
gets picked as expected, then bitbake adds in the 2.4 recipe too.  I was
seeing this with up to date bitbake-1.8 svn.

> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Tom Rini


