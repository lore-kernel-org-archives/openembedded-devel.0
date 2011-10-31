Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RKptG-0000l4-1J
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 12:18:54 +0100
Received: (qmail invoked by alias); 31 Oct 2011 11:12:46 -0000
Received: from p5B0A152D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.45]
	by mail.gmx.net (mp038) with SMTP; 31 Oct 2011 12:12:46 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19UoyhL5VRUP7uPEHXzzvW9k7/XKgWu7IKTnmJAa+
	znJJnvs9zhp9Jr
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2011 12:17:28 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1319968917-3120-1-git-send-email-schnitzeltony@gmx.de>
	<j8lu30$7vb$1@dough.gmane.org>
	<201110311210.28693.schnitzeltony@gmx.de>
In-Reply-To: <201110311210.28693.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201110311217.28604.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe] task-basic: include wireless-tools for distros featuring wifi
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
X-List-Received-Date: Mon, 31 Oct 2011 11:18:54 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday, October 31, 2011 12:10:28 PM Andreas M=C3=BCller wrote:
> On Monday, October 31, 2011 11:42:40 AM Koen Kooi wrote:
> > Op 30-10-11 11:01, Andreas M=C3=BCller schreef:
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de> ---
> > > meta-oe/recipes-core/tasks/task-basic.bb |    2 +- 1 files changed, 1
> > > insertions(+), 1 deletions(-)
> > >=20
> > > diff --git a/meta-oe/recipes-core/tasks/task-basic.bb
> > > b/meta-oe/recipes-core/tasks/task-basic.bb index 34aa7e1..9b9385e
> > > 100644 --- a/meta-oe/recipes-core/tasks/task-basic.bb +++
> > > b/meta-oe/recipes-core/tasks/task-basic.bb @@ -51,7 +51,7 @@
> > > RRECOMMENDS_${PN} =3D "\ ${@base_contains("MACHINE_FEATURES",
> > > "usbgadget", "kernel-module-g-ether kernel-module-g-serial
> > > kernel-module-g-mass-storage", "", d)} \ \
> > > ${@base_contains("DISTRO_FEATURES", "bluetooth", "bluez4", "", d)} \ -
> > > ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "",
> > > d)} \ +	${@base_contains("DISTRO_FEATURES", "wifi", "iw wireless-tools
> > > wpa-supplicant", "", d)} \
> >=20
> > I have to NAK this one, 'iw' has replaced wireless in the linux-wireless
> > world and having both doesn't make sense.
>=20
> I had the feeling (am not 100% sure), that adding wireless-tools to image
> made my wlan work under networkmanger control - will do some tests on
> that.
>=20
> FYI: networkmanager has wireless-tools in DEPENDS but that is not enough =
to
> make wireless-tools into the image.
>=20
> How about wireless-tools in RDEPENDS for networkmanager?
>=20
I took a look at networkmanager configure.ac:=20

| AC_MSG_ERROR(wireless-tools or libiw development headers >=3D 28pre9 not=
=20
installed or not functional)

I seems better to have iw in dependencies there instead of wireless-tools. =
Will=20
give that one a try.

Andreas


