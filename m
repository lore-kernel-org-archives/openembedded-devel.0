Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LxpLI-0008Ty-Bg
	for openembedded-devel@openembedded.org; Sat, 25 Apr 2009 23:23:24 +0200
Received: (qmail 2921 invoked by uid 813007); 25 Apr 2009 21:18:32 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 25 Apr 2009 21:18:32 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Apr 2009 23:18:17 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc2-00199-g51f1622-dirty; KDE/4.2.2;
	x86_64; ; )
References: <gsst4a$cvj$1@ger.gmane.org>
In-Reply-To: <gsst4a$cvj$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200904252318.18413.marcin@juszkiewicz.com.pl>
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Sat, 25 Apr 2009 21:23:25 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=C4=85tek, 24 kwietnia 2009 o 19:32:57 Koen Kooi napisa=C5=82(a):

> Recently the e17 people made a change to how libtool names their
> libraries by poking in some magic string (ver-pre-svn-00) into
> SONAME. This has some implications for OE, namely that you get the
> old *and* new lib in your rootfs. There was one bug that killed
> everything at runtime:

> http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&id=3D149
>6aea759adb716453d0fbf85795a5a6e914484

> So after that cset you'd get a completely working rootfs again with
> e17 stuff.

=46irst I want to say that I am total ignorant when it comes to E17. I=20
have it installed on Beagleboard just because it is part of=20
'beagleboard-demo-image' which I installed. As it I did not built it=20
during last 2 years on any of my machines. Thats some kind of =20
background introduction.

> Today a few csets have been pushed that break things horribly:
>
> http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&id=3D
> 6898f8ca089d35109b3652d640ebb907d8115736

I see edje RRECOMMENDS adapted to other changes here (not counting PV=20
upgrades).

> http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&id=3D
> 8101ad8e1229b3b9f8aa0be0fdc262b5283034d0

This one looks quite sane.

> http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&id=3D
> 80c85e0af3865710a189ba536022d326fa996d26

s/libevas/evas - but should not debian.bbclass take care of that?=20

> Let's take a look at the generated packages:
>
> before:
> libecore-evas-ver-pre-svn-00-0_0.9.9.050+svnr40247-r3.1_armv7a.ipk
> after:
> libecore-ver-pre-svn-00-lib-evas_0.9.9.060+svnr40247-r3.1_armv7a.ipk

So why not change call to populate_packages_prepend() to make old names=20
again? That way we will get autosplit (which is good) and old names=20
(which will keep some kind of upgrade path).

> So suddenly the library packages (or plugin packages, but no
> difference in this case) have a new name, but don't set RPROVIDES or
> RREPLACES to the old packages containing *the same files*. This means
> that 'opkg install <foo>' or 'opkg upgrade' doesn't work anymore. It
> will abort saying to package <foo> wants to overwrite files belonging
> to <bar>. Depending on the way you build your images in OE, your
> build will break.

Provide a patch which will add such ones? We have many developers in OE=20
=2D some of them use OE for development of software (Mickeyl for example),=
=20
some use it to build software for distribution users (Koen), some use it=20
for different purposes (me for example). It is hard to make all of them=20
happy with each commit. This is .dev tree - things will break and we can=20
not stop it (we have stable/2009 for not breaking changes).=20

The real problem is not how to keep quality after each commit but how to=20
keep it overall. If something break do not automatically shout "you=20
moron, you broke OE" - it is not SouthPark and OE is not Kenny. So when=20
problem shows we need to discuss how to fix it instead of shouting at=20
each other. Otherwise it is no longer fun but just work. And when it is=20
just work then...

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




