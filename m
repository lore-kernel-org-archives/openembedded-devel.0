Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1P5EMn-0007OT-QZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 11:08:23 +0200
Received: (qmail 8258 invoked by uid 813007); 11 Oct 2010 09:07:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 11 Oct 2010 09:07:47 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Oct 2010 11:09:37 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-22-generic; KDE/4.5.2; x86_64; ; )
References: <AANLkTi=qFpjK39fB7NzZ-aTBfasWBjq5LBxKSbG9dWec@mail.gmail.com>
In-Reply-To: <AANLkTi=qFpjK39fB7NzZ-aTBfasWBjq5LBxKSbG9dWec@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201010111109.38439.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: zsafe
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
X-List-Received-Date: Mon, 11 Oct 2010 09:08:23 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 8 pa=C5=BAdziernika 2010 o 22:54:20 Frans Meulenbroeks na=
pisa=C5=82(a):
> By incident bumped into zsafe. No idea what it is, but something in
> the recipe drew my attention:
>=20
> FILES_zsafe =3D "zsafe"
>=20
> do_install() {
>         install -d ${D}${palmtopdir}/pics/${APPNAME}/
>         install -m 0644 ${WORKDIR}/pics/${APPNAME}/*.xpm
> ${D}${palmtopdir}/pics/${APPNAME}/
>         install -m 0644 ${WORKDIR}/zsafe.png ${D}${palmtopdir}/pics/
> }
>=20
> Seems kinda weird, installing files like zsafe.png and *.xpm but not
> add them to the package

> maybe inherit opie (which is also in the recipe will do some things
> with this under water, but I would expect these files to go with the
> exe.

Those files go into package. opie.bbclass uses APPNAME/APPTYPE/APPDESKTOP=20
variables to check what kind of application it is and how it is supposed to=
 be=20
run, then it takes care of copying icon and desktop file and few other thin=
gs.=20
It was written years ago and I think that most of today OE developers never=
=20
played with OPIE.

Dropping that FILES_zsafe =3D "zsafe" line may be safe - but I would sugges=
t=20
doing build to check it.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




