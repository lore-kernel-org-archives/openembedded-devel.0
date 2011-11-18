Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RRDLT-0007Hr-Nn
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 02:34:23 +0100
Received: (qmail invoked by alias); 18 Nov 2011 01:27:57 -0000
Received: from p4FDF0932.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.9.50]
	by mail.gmx.net (mp003) with SMTP; 18 Nov 2011 02:27:57 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18Zzjta4CYZOiP+w+mc2JVWe9yqTjk4mk0QaKm4GM
	Ury5b7Wjwqv22K
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2011 02:27:55 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201111140105.00784.schnitzeltony@gmx.de>
	<ja4446$vbc$1@dough.gmane.org>
	<201111180021.48213.schnitzeltony@gmx.de>
In-Reply-To: <201111180021.48213.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201111180227.55333.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: networkmanager: update to 0.9.2.0 causes trouble
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
X-List-Received-Date: Fri, 18 Nov 2011 01:34:24 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday, November 18, 2011 12:21:47 AM Andreas M=C3=BCller wrote:
> On Friday, November 18, 2011 12:07:50 AM Koen Kooi wrote:
> > Op 15-11-11 15:07, Andreas M=C3=BCller schreef:
> > > On Tuesday, November 15, 2011 12:23:45 PM Koen Kooi wrote:
> > >> Op 14-11-11 22:07, Andreas M=C3=BCller schreef:
> > >>> On Monday, November 14, 2011 01:05:00 AM Andreas M=C3=BCller wrote:
> > >>>> since
> > >>>>=20
> > >>>> commit 037cb32f99f229c9c55a029bec088ebc7f59d278 Author: Koen Kooi
> > >>>> <koen@dominion.thruhere.net> Date:   Fri Nov 11 12:50:38 2011
> > >>>> +0100
> > >>>>=20
> > >>>> networkmanager: update to 0.9.2.0
> > >>>>=20
> > >>>> wlan connects successfully to my router but *fails* to connect
> > >>>> external locations.
> > >>>>=20
> > >>>> networkmanager / nm-applet set up my network as eth0: IPv4 fixed
> > >>>> IP wlan0: WPA & WPA 2 Personal / IPv4 DHCP
> > >>>>=20
> > >>>> Attached you find the results for networkmanager 0.9.2 and
> > >>>> networkmanager 0.9.0 (reverted
> > >>>> 037cb32f99f229c9c55a029bec088ebc7f59d278)
> > >>>>=20
> > >>>> My suggestion: * revert 037cb32f99f229c9c55a029bec088ebc7f59d278
> > >>>> until fixed * send a note to gnome bugzilla
> > >>>=20
> > >>> FYI: with network-manager-applet the problem persists
> > >>=20
> > >> I'm seeing the same problem with default route not getting set, but
> > >> rolling back to the older release won't solve much since binaries are
> > >> already out there :/
> > >>=20
> > >> regards,
> > >>=20
> > >> Koen
> > >=20
> > > So let's see it as another challenge :)
> >=20
> > As a small update: I'm still working on it. Although I haven't fixed the
> > route issue, I have found (and fixed!) other issues :)
>=20
> I saw that - and I was full of hope but 10 minutes ago I tested your last
> commit fixing version detecttion of dhclient.
>=20
> It is not much but I tried with elder versions to bisect a bit when we we=
re
> kicked out.
>=20
> 0.9.1.95: same - no default route
> 0.9.1.90: build gets totally confused when libnl-1 and libnl-2 are found.
> So I build from scratch with libnl-2 only but fall over a linker error...
>=20
I checked the first commit working with libnl-2 (two commits after our work=
ing=20
version 0.9.0) [1] together with libnl-2 and nm-applet 0.9.0: It does not c=
reate=20
a default route.

Two possible reasons for not working:
* commit [1] causes malfunction
* libnl-2 causes our trouble for networkmanager 0.9.0 libnl-1 was used

So long

Andreas

[1]=20
http://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=3D0fe8=
c80faef07777b9d6712abbdfbb9671b70899


