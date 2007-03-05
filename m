Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HO8J4-0001iT-Ms
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 09:12:30 +0100
Received: (qmail 9808 invoked by uid 813007); 5 Mar 2007 08:12:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 5 Mar 2007 08:12:30 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 5 Mar 2007 09:12:43 +0100
User-Agent: KMail/1.9.6
References: <407130732.20070227223500@gmail.com>
	<1173051658.5832.26.camel@localhost.localdomain>
	<45EBBF38.4020704@dominion.kabel.utwente.nl>
In-Reply-To: <45EBBF38.4020704@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200703050912.44261.openembedded@hrw.one.pl>
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Mon, 05 Mar 2007 08:12:31 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 5 marca 2007, Koen Kooi napisa=B3:
> Richard Purdie schreef:
> > On Mon, 2007-03-05 at 01:30 +0200, Paul Sokolovsky wrote:

> > You only ask for screen size but I can guarantee that wouldn't be the
> > last request. I'm dead set against this.

> Me too, since you will get something like this:

=2D1 from me too

> application_1.4.5-r5_bigscreen.ipk
> application_1.4.5-r5_ppc603e.ipk
> application_1.4.5-r5_armv5te.ipk
> application_1.4.5-r5_smallscreen.ipk

> Now Marcin wants to install 'application' on his webpad and it doesn't
> run. Why? Because 'application_1.4.5-r5_bigscreen.ipk' secretly is ARM
> instead of x86.

And what is bigscreen? VGA? SVGA? XGA? or maybe 1680x1050 which I use=20
under OE/x86 chroot system?

Instead of using crypto names like smallscreen/bigscreen we should use=20
MACHINE_ namespace instead:

MACHINE_SCREEN_RESOLUTION =3D "vga/svga/qvga/xga/wxga/hvga" etc
MACHINE_SCREEN_DPI =3D "100/280/75"

Because Neo1973 is smallscreen (2.8") but VGA (so bigscreen). I do not=20
feel good with using full AbiWord on it but probably AbiWord embedded=20
will be OK.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         Real programmers don't document.
         If it was hard to write, it should be hard to understand.




