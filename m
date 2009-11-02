Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N4t1f-0003Wj-RA
	for openembedded-devel@openembedded.org; Mon, 02 Nov 2009 10:16:38 +0100
Received: (qmail 4483 invoked by uid 813007); 2 Nov 2009 09:15:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Nov 2009 09:15:26 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 Nov 2009 10:18:43 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.2; x86_64; ;
	)
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
	<c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
In-Reply-To: <c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200911021018.45997.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Mon, 02 Nov 2009 09:16:39 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 1 listopada 2009 o 21:35:32 Leon Woestenberg napisa=C5=82(a=
):
> On Thu, Oct 29, 2009 at 12:41 PM, Marcin Juszkiewicz
> > [archivename]
> > url0=3Durl-to-sources
> > url1=3Dalternative-url-to-sources
> > url2=3Danother-alternative-url-to-sources
> > md5=3Dmd5sum
> > sha256=3Dsha256sum
>=20
> Can we simplify this a bit? i.e.
>=20
> archivename
> url=3Durl-to-sources
> url=3Dalternative-url-to-sources
> url=3Danother-alternative-url-to-sources
> md5=3Dmd5sum
> sha256=3Dsha256sum
>=20
> Why not just url instead of url0, url1, url2, ... ?
>=20
> If you need ordering, just use the order they appear in the file.

ConfigParser class which we use will not behave properly I think (not teste=
d=20
that). And urlX lines are not used by OE anyway (but are usable for mirror=
=20
scripts).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




