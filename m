Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NsjX1-0000wl-Hb
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 22:15:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 72BEA2C9B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 21:11:55 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id KaOgkEjhUF6M
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 21:11:54 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 803C42C99A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 21:11:54 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 2926E27AD8; Fri, 19 Mar 2010 21:12:21 +0000 (GMT)
Date: Fri, 19 Mar 2010 21:12:20 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100319211220.GI2425@xora-desktop.xora.org.uk>
References: <201003182212.31873.roman@khimov.ru>
	<201003190004.37865.roman@khimov.ru>
	<201003190023.36525.roman@khimov.ru>
	<201003200005.35468.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201003200005.35468.roman@khimov.ru>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC/PATCH] Perl 5.10.1 and a bunch of modules
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
X-List-Received-Date: Fri, 19 Mar 2010 21:15:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 20, 2010 at 12:05:35AM +0300, Roman I Khimov wrote:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 19 =D0=BC=D0=B0=D1=80=D1=82=
=D0=B0 2010 00:23:25 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Roman I Khimov =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 19 =D0=BC=D0=B0=D1=80=D1=82=
=D0=B0 2010 00:04:30 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Roman I Khimov =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > > =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=
=D1=82 =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 18 =D0=BC=D0=B0=D1=80=D1=
=82=D0=B0 2010 23:47:01 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Roman I Khimov=20
> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > > > No. You mean, this one?
> > > > http://git.pokylinux.org/cgit.cgi/poky/commit/?id=3Dca5f36ee6ad75=
6e1e5402
> > > >88 a5 6a504c1d8ecc7a3
> > > >
> > > > Looks like a good thing to have, so if Richard will push it to OE=
.dev I
> > > > can do a rebase of my patchset.
> > >
> > > Actually, the better sequence is
> > >  * drop 5.8.4 and 5.8.7
> > >  * bring in staging changes
> > >  * bring in 5.10.1
> > >
> > > I'll prepare 5.8.4/5.8.7 removal patch.
> >=20
> > Updated rik/perl-5.10 branch with removal patch, please ACK.
>=20
> Tried to compile for arm, succeeded with perl, discovered and fixed som=
e=20
> problems in modules. Updated the branch.
>=20
> I think I need some ACK's for dusty old Perl versions removal and then=20
> Richard's Perl staging update could be merged better on top of that (CC=
'ing=20
> Richard) and than I'll update 5.10.1 to new staging and push the series=
. At=20
> least, that's how I think it should be. If there are any problems with =
staging=20
> update and it's not ready to be pushed in OE.dev, I think we can merge =
5.10.1=20
> as it is now.
>=20
For removal of old perl versions

Acked-by: Graeme Gregory <dp@xora.org.uk>



