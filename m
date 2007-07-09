Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1I7v2g-0007OF-R7
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 17:20:54 +0200
Received: (qmail 14197 invoked by uid 813007); 9 Jul 2007 15:15:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 9 Jul 2007 15:15:14 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 9 Jul 2007 17:15:10 +0200
User-Agent: KMail/1.9.7
References: <513012886.20070708041151@gmail.com>
	<4310707680.20070709161925@vanille-media.de>
	<20070709142544.GF2336@p3n3tr4t0r.internal>
In-Reply-To: <20070709142544.GF2336@p3n3tr4t0r.internal>
MIME-Version: 1.0
Message-Id: <200707091715.11794.openembedded@hrw.one.pl>
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 15:20:56 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 9 lipca 2007, Graeme Gregory napisa=B3:
> On Mon, Jul 09, 2007 at 04:19:25PM +0200, Dr. Michael Lauer wrote:
> > > Maybe a MACHINE_DEFAULT_ROTATION is also needed.
> >
> > I don't think so. What applications care about is if portrait or
> > landscape is the common default and this is already encoded in HEIGHT
> > and WIDTH.
>
> Applications do care, a short snippet of /etc/X11/Xserver
>
>         "SHARP Shepherd" | "SHARP Husky" | "SHARP Corgi")
>                 ARGS=3D"$ARGS -dpi 200 -rgba rgb" ;;
>         "SHARP Spitz" | "SHARP Akita" | "SHARP Borzoi")
>                 ARGS=3D"$ARGS -dpi 200 -rgba rgb -screen 480x640@270" ;;

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ARGS=3D"$ARGS -screen ${DISPLAY_WIDTH_PIXELS}x${DISPLAY_HEIGHT_PIXELS}@${DI=
SPLAY_ORIENTATION}x${DISPLAY_BPP}"

if [ ! -z "$DISPLAY_DPI" ]; then
        ARGS=3D"$ARGS -dpi $DISPLAY_DPI"
fi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is Poky version of that part XServer script - no machine related code=
=20
at all. Of course it support only machines with formfactor defines.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

       Nazwa=B3em swojego psa Internet, bo robi wuf... wuf... wuf...




