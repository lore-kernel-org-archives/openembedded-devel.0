Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PuNnG-0000rW-E4
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 12:31:06 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1PuNlu-0007BJ-Kd; Tue, 01 Mar 2011 12:29:42 +0100
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
	<AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
	<1298913422.23547.20.camel@phil-desktop>
	<AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
Date: Tue, 01 Mar 2011 11:35:08 +0000
Message-ID: <1298979308.23547.67.camel@phil-desktop>
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
X-List-Received-Date: Tue, 01 Mar 2011 11:31:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-02-28 at 19:33 +0000, Otavio Salvador wrote:
> On Mon, Feb 28, 2011 at 17:17, Phil Blundell <philb@gnu.org> wrote:
> ...
> > That's definitely not a patch that you ought to check in, though.  For
> > wider consumption I guess there ought to be some kind of knob that
> > DISTROs can tweak to select the linker of their choice.  As far as I
> > know there isn't any such mechanism at present.
> 
> One interesting way to "fix" the issue is to explicitly link against
> -lpthread however it seems *wrong*.
> 
> It seems to be a gcc bug since -pthread is suppose to handle all the
> needed background for it to work and seems to be doing it wrong.

I just tried linking xfreerdp by hand with gold and the resulting binary
seemed to come out fine.  So I think this is indeed a bug in GNU ld.

It does seem to be sensitive to the order in which things are mentioned
in the command line: if you put -lpthread first then GNU ld gets it
right.  But if -lpthread is at the end then it seems to fail to pick up
the versioning information for symbols which are also mentioned (even as
SHT_UNDEF) in other objects.  Clearly that can't be the whole story
though because if it was that simple then it would be failing with
everything.  I guess you need to either debug this further or switch to
using gold for your own builds.

p.




