Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pu6em-0005Tv-Lh
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:13:12 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1Pu6dR-0006RE-OD; Mon, 28 Feb 2011 18:11:49 +0100
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
	<AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
Date: Mon, 28 Feb 2011 17:17:02 +0000
Message-ID: <1298913422.23547.20.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Mon, 28 Feb 2011 17:13:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-02-28 at 16:49 +0000, Otavio Salvador wrote:
> On Mon, Feb 28, 2011 at 15:08, Phil Blundell <philb@gnu.org> wrote:
> ...
> > It looks at first inspection as though this might be a linker bug,
> > though I can't immediately see anything very special about freerdp that
> > looks like it would be causing things to go wrong.  Some further
> > debugging needed, though it'd be interesting to know whether it works
> > any better with gold for example.
> 
> How could I make it to use gold? I am stuck on that issue since it is
> block us to advance on the development of a product :-(

Good question.  For local testing, I think it might be sufficient to
add:

EXTRA_OECONF += "--enable-gold=default"

to your binutils-cross recipe.  You can verify whether it's worked by
running "i586-oe-linux-ld --version" and checking to see whether it
claims to be gold or not.

That's definitely not a patch that you ought to check in, though.  For
wider consumption I guess there ought to be some kind of knob that
DISTROs can tweak to select the linker of their choice.  As far as I
know there isn't any such mechanism at present.

p.




