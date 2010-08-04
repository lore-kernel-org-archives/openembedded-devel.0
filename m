Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Ogfii-0003PB-RT
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 17:17:31 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 076A84656
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 19:22:04 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 4 Aug 2010 19:17:20 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
	<201008041802.01481.khimov@altell.ru>
	<20100804141748.GC28187@mx.loc>
In-Reply-To: <20100804141748.GC28187@mx.loc>
MIME-Version: 1.0
Message-Id: <201008041917.20529.khimov@altell.ru>
X-Altell-MailScanner-ID: 076A84656.EE0BA
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] perl: honour DISTRO_FEATURE largefile
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
X-List-Received-Date: Wed, 04 Aug 2010 15:17:31 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 04 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=
=B0 2010 18:17:48 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Bernhard Reutner-Fischer=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Wed, Aug 04, 2010 at 06:02:01PM +0400, Roman I Khimov wrote:
> >=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=A1=D1=80=D0=B5=D0=B4=D0=B0 04 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=
=D0=B0 2010 17:51:56 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Bernhard
> > Reutner-Fischer
> >
> >=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> >> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> >> ---
> >>  recipes/perl/perl-native_5.8.8.bb |    4 ++--
> >>  recipes/perl/perl_5.8.8.bb        |    6 ++++--
> >>  2 files changed, 6 insertions(+), 4 deletions(-)
> >
> >Is it really appropriate for -native? And how about Perl 5.10.1?
>=20
> it's perfectly fine to build on a uclibc-based host with LFS off.

Well, that's _build machine_ characteristic anyway, that's what I'm concern=
ed=20
about. DISTRO_FEATURES on the other hand characterize what we want to get o=
n=20
_target_ machine. So you might be building on uclibc-based no-LFS system fo=
r=20
uclibc-based LFS-enabled target or more common case with glibc-based build=
=20
system and uclibc no-LFS target. I'm very unsure about what kind of result=
=20
that might give.

> Dunno about 5.10.1, it has a default preference of -1

I think we should try to keep two versions in sync wrt to such changes, I c=
an=20
test on 5.10.1.


