Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OEUa9-0003lb-9d
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 23:44:10 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OEUWI-0000Z9-4G
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 22:40:10 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BF1969E.3020408@eukrea.com>
References: <1273877583-31604-1-git-send-email-eric@eukrea.com>
	<hsp64i$r3s$2@dough.gmane.org>  <4BF1969E.3020408@eukrea.com>
Date: Tue, 18 May 2010 22:40:12 +0100
Message-ID: <1274218812.4620.189.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cross.bbclass: fix build of meta-toolchain
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
X-List-Received-Date: Tue, 18 May 2010 21:44:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-05-17 at 21:18 +0200, Eric B=C3=A9nard wrote:
> Hi,
>=20
> Le 16/05/2010 18:22, Koen Kooi a =C3=A9crit :
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > I can confirm that 'meta-toolchain' builds against with this
> > (angstrom/beagleboard), but I don't know what the effect of this is on
> > cross recipes.
>=20
> Who could confirm that this change may not introduce any unwanted=20
> behaviour ?

In the long term I think this patch is a good idea, and I think we
already have a similar change on the toolchain-desuck branch.=20

In the short term, this patch is probably harmless since I think the
other bits in cross.bbclass will prevent any packages from actually
being generated (since the install paths won't match against any FILES).
If you did get packages out then they would be somewhat misleadingly
named and this would probably be a bad thing.

I think you might as well go ahead and check this in, if you haven't
already, and if any issues do crop up we can deal with them at that
time.  I would like to try to get the other toolchain-packaging changes
merged as well at some point soonish.

p.




