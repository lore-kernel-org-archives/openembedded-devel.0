Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PtPib-00012b-SW
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 20:22:17 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PtPhJ-0000D3-71
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 20:20:57 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110226185959.GC10042@ibawizard.net>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
	<1298745578.3818.7.camel@lenovo.internal.reciva.com>
	<20110226185959.GC10042@ibawizard.net>
Date: Sat, 26 Feb 2011 19:20:41 +0000
Message-ID: <1298748041.3818.10.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] micro-uclibc: add xattr to distro features to fix build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 19:22:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-02-26 at 19:59 +0100, Petr =C5=A0tetiar wrote:
> Phil Blundell <philb@gnu.org> [2011-02-26 18:39:38]:
>=20
> > On Sat, 2011-02-26 at 18:44 +0100, Petr =C5=A0tetiar wrote:
> > > cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory
> >=20
> > Are you really using POSIX.1e caps on micro?  If yes then I guess this
> > is fine, though it would be interesting to know what the code size
> > impact is.
>=20
> I don't use micro at all, I've just added it as another test target for
> 2011.03 release and the build of console-image failed on libcap2 so I've =
tried
> to fix it. That's all behind it.

Which package in console-image depends on libcap2?  It might be worth
exploring whether there is a way to avoid that dependency.

It's worth noting that being able to build console-image is not really a
primary goal for micro.  It'd be nice if it worked but I don't want to
add any extra binary bloat in the base system purely for the sake of
getting a clean console-image build that may end up never being used.

So, absent a compelling usage scenario for libcap2 on micro, please
don't commit this patch.

p.




