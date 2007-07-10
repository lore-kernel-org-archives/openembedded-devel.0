Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1I8DAH-0004Th-4v
	for openembedded-devel@openembedded.org; Tue, 10 Jul 2007 12:41:54 +0200
Received: (qmail 29692 invoked by uid 813007); 10 Jul 2007 10:36:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 10 Jul 2007 10:36:12 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2007 12:36:03 +0200
User-Agent: KMail/1.9.7
References: <E1I8BNL-0002lu-BC@linuxtogo.org>
	<986250811.20070710125440@gmail.com>
In-Reply-To: <986250811.20070710125440@gmail.com>
MIME-Version: 1.0
Message-Id: <200707101236.04011.openembedded@hrw.one.pl>
Subject: Re: [oe-commits] org.oe.dev packages/glib-2.0/glib.inc : remove bogus ${PN}-dev from packages.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2007 10:41:56 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 10 lipca 2007, Paul Sokolovsky napisa=B3:
> Hello xora,
> > packages/glib-2.0/glib.inc : remove bogus ${PN}-dev from packages.

> > -PACKAGES =3D+ "${PN}-dev glib-2.0-utils "
> > +PACKAGES =3D+ " glib-2.0-utils "

>   This is not bogus. For this package, -dev must be packaged before
> the main package, or the latter will get *.h and *.m4 files.=20

fix FILES_${PN} then

> Putting something in packages twice works after all, and we should
> either accept its usage fro such cases,

=2D1 from me - we should not allow such things as they can hide bugs

> or find other solution to do proper flexible packaging (and that would
> be a bit hard on syntax. =20

=46ILES adapting was fast job - I am testing fix in Poky now.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

   Gdyby cz=B3owiek musia=B3 zezwala=E6 innym na to, co toleruje u siebie,
   =BFycie by=B3oby nie do wytrzymania.             [Georges Courteline]




