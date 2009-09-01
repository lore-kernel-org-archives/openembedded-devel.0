Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MiTuA-0001Ol-5T
	for openembedded-devel@openembedded.org; Tue, 01 Sep 2009 16:00:16 +0200
Received: (qmail 9971 invoked by uid 813007); 1 Sep 2009 13:41:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Sep 2009 13:41:36 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Sep 2009 15:41:34 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc6-00243-g53bc5c0; KDE/4.3.0; x86_64; ;
	)
References: <a63ecaf0908310519p3bc80147q6ad2d89e4c587d@mail.gmail.com>
	<200908311553.26539.marcin@juszkiewicz.com.pl>
	<a63ecaf0909010610hb7a1a50h2c4588a421fdb534@mail.gmail.com>
In-Reply-To: <a63ecaf0909010610hb7a1a50h2c4588a421fdb534@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200909011541.35665.marcin@juszkiewicz.com.pl>
Subject: Re: Xorg int10 module missing?
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
X-List-Received-Date: Tue, 01 Sep 2009 14:00:20 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 1 wrze=B6nia 2009 o 15:10:53 Sushi Sensei napisa=B3(a):
> 2009/8/31 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> > Dnia poniedzia=B3ek, 31 sierpnia 2009 o 14:19:40 Sushi Sensei napisa=B3=
(a):
> > > I'm trying to use cirrus driver but I can't load int10 and xaa
> > > driver vesa also depends of xserver-xorg-module-libint10 but I can'
> > > find this!!
> >
> > They are build as part of xserver-xorg recipe.

> No, I can't find any reference to int10 in any recipe!!  Nor in
> xserver-xorg neither in ALL recipes of OE

Then your grep skills are weak and you need to practice them more.

15:40 hrw@home:~$ cd devel/oe/openembedded/recipes/xorg-xserver/
15:40 hrw@home:xorg-xserver$ grep int10 *
xorg-xserver-common.inc:#  1360k   libint10.so
xorg-xserver-common.inc:             ${PN}-module-libint10 \
xorg-xserver-common.inc:FILES_${PN}-module-libint10 =3D "${libdir}/xorg/mod=
ules/libint10.so"

xserver-xorg recipes include xorg-xserver-common.inc file.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




