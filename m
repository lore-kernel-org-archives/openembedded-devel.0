Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nm1CP-0000wk-EG
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 09:42:01 +0100
Received: (qmail 10983 invoked by uid 813007); 1 Mar 2010 08:39:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Mar 2010 08:39:09 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 1 Mar 2010 09:39:05 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <1267383448-7009-1-git-send-email-ospite@studenti.unina.it>
	<hmehnp$n57$1@dough.gmane.org>
In-Reply-To: <hmehnp$n57$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201003010939.06161.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ezx: Use pulseaudio 0.9.15
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
X-List-Received-Date: Mon, 01 Mar 2010 08:42:02 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 28 lutego 2010 o 20:55:37 Koen Kooi napisa=C5=82(a):
> > diff --git a/conf/machine/include/motorola-ezx-base.inc
> > b/conf/machine/include/motorola-ezx-base.inc index 75c0f42..4d17211
> > 100644
> > --- a/conf/machine/include/motorola-ezx-base.inc
> > +++ b/conf/machine/include/motorola-ezx-base.inc
> > @@ -2,6 +2,7 @@ TARGET_ARCH =3D "arm"
> >
> >  PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
> >  PREFERRED_PROVIDER_virtual/kernel ?=3D "openezx-kernel"
> > +PREFERRED_VERSION_pulseaudio =3D "0.9.15"
>=20
> NAK: machines have no business setting versions (except for kernels and
> even that is debatable).
>=20
> If it doesn't build, fix your distro.

Agreed with Koen - what if my Umbaumba distro really, really require other=
=20
version of pulseaudio because using 0.9.15 makes device explode? Ok, it is =
a=20
bit hardcode description but it is to show that machines should not set any=
=20
versions.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




