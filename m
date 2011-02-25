Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pt5Km-000352-VG
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 22:36:21 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1Pt5JV-0008Iz-9l; Fri, 25 Feb 2011 22:35:01 +0100
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
	<AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
Date: Fri, 25 Feb 2011 21:34:54 +0000
Message-ID: <1298669695.3818.5.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Fri, 25 Feb 2011 21:36:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-02-25 at 20:58 +0000, Otavio Salvador wrote:
> On Fri, Feb 25, 2011 at 20:40, Phil Blundell <philb@gnu.org> wrote:
> > On Fri, 2011-02-25 at 20:14 +0000, Otavio Salvador wrote:
> >> It fails at runtime. The application I am compiling is freerdp and
> >> sem_ symbols are not versioned, dunno why.
> >
> > Do you mean that the symbols aren't versioned at all, or that they are
> > versioned but your libc.so.6 doesn't provide the versions that the
> > binary is expecting?  If the latter, what versions does it have?
> 
> The binary lacks version for sem_post, for example. objdump -T show
> the undefined symbol without the GLIBC_2.1 version. This happens only
> with the sem_ methods.

Is it actually including -lpthread during final link?  Failing to do
that is the most obvious reason for not getting the right version
information.

p.




