Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MskBO-0000m8-W8
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 23:24:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 530F6140971E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2009 23:18:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7c43O1EebiyX
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2009 23:18:25 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 1F9F31417186
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2009 23:18:24 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200909281855.03885.marcin@juszkiewicz.com.pl>
References: <1253741018.5229.23.camel@utx.utx.cz>
	<200909281855.03885.marcin@juszkiewicz.com.pl>
Date: Tue, 29 Sep 2009 23:23:43 +0200
Message-Id: <1254259423.3868.18.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: functional Matchbox2 in oe.dev
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
X-List-Received-Date: Tue, 29 Sep 2009 21:24:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz wrote:
> Dnia =C5=9Broda, 23 wrze=C5=9Bnia 2009 o 23:23:38 Stanislav Brabec napi=
sa=C5=82(a):
>=20
> > I just spent some time to make Matchbox2 working, as I considered is =
as
> > possible optimal solution for minimalistic GTK+/GPE based environment=
.
>=20
> Thanks a lot - I had that on my todolist but lacked time for it.

There is still a lot of things to do:

- No CPU load and wireless applet (well, old ones works), maybe better
  integration of bluez.

- Impossible to change applet list without restart (the code does not
  implement applet destructors).

- No way to close "split screen windows" (e. g. audio mixer)

- It would be nice to make possible to change some main windows to
  non-full-screen (e. g. pidgin list+talk windows, terminal+application)

- Window manager configuration does not allow to make relative size
  panels with XRandR.

- Add XRandR support code to matchbox-desktop

- Fix matchbox-common menu definition to show all installed
  applications.

- Fix everything for both "icon theme" icons and deprecated "pixmaps".

- Make possible to manipulate with windows from window list (it would
  make possible to make main windows borderless.

- Make hicolor icon theme.

- I18N

> I do not know does mb-wm2 was ever finished. OpenedHand never used it i=
n Poky=20
> images and Moblin development moved to Mutter (or how was that Clutter =
based=20
> WM named).
=EF=BB=BF
I guess it was not finished. The last race condition=EF=BB=BF crash patch=
 (which
caused several crashes daily on my Zaurus) still rots only in the
Bugzilla and was not yet checked into SVN.

Also SVN version of panel is unstable and crashing many times daily.

> MB-wm2 was meantiirc for Fremantle (Nokia N900 system) but I did=20
> not checked is it used or not there.

It looks so. There are simple and maemo managers.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



