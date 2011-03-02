Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Puo6v-0007ia-Kg
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 16:37:11 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1Puo5U-0000k8-N4; Wed, 02 Mar 2011 16:35:40 +0100
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <AANLkTimk6cXCRROwcD5cOkfarJuMkvg=A0cM_Um6oOSZ@mail.gmail.com>
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
	<1298979308.23547.67.camel@phil-desktop>
	<AANLkTimk6cXCRROwcD5cOkfarJuMkvg=A0cM_Um6oOSZ@mail.gmail.com>
Date: Wed, 02 Mar 2011 15:41:26 +0000
Message-ID: <1299080486.23547.230.camel@phil-desktop>
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
X-List-Received-Date: Wed, 02 Mar 2011 15:37:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-01 at 11:47 +0000, Otavio Salvador wrote:
> On Tue, Mar 1, 2011 at 11:35, Phil Blundell <philb@gnu.org> wrote:
> > On Mon, 2011-02-28 at 19:33 +0000, Otavio Salvador wrote:
> >> On Mon, Feb 28, 2011 at 17:17, Phil Blundell <philb@gnu.org> wrote:
> > I just tried linking xfreerdp by hand with gold and the resulting binary
> > seemed to come out fine.  So I think this is indeed a bug in GNU ld.
> 
> Personally I think we need to trace it down (we as project) since it
> can lead to broken and difficult to trace behaviour. It took 3 days
> until I managed to identify the symbol failure.

Yeah, that might be true.  Or we could maybe just switch the default
linker to be gold, at least on targets that it supports. 

> I am far from an expert on linking and GNU ld. For debugging it I'd
> need guidance.

I think the place to start looking would be _bfd_elf_merge_symbol(),
which is in bfd/elflink.c.  This gets called by
elf_link_add_object_symbols() to record the syms that it finds and I
suspect that one or other of those functions is probably doing the wrong
thing.

Or, if you don't want to debug it yourself, you could try to create a
testcase that shows the problem and then file a bug report with binutils
upstream.

p.




