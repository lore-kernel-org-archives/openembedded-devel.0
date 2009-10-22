Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N13BL-0003AG-W9
	for openembedded-devel@openembedded.org; Thu, 22 Oct 2009 21:18:47 +0200
Received: (qmail 10768 invoked by uid 813007); 22 Oct 2009 19:17:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Oct 2009 19:17:43 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 21:19:40 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.2; x86_64; ;
	)
References: <c384c5ea0910221208y3efee675t6c292de20ed1d8f1@mail.gmail.com>
In-Reply-To: <c384c5ea0910221208y3efee675t6c292de20ed1d8f1@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200910222119.40861.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] package complete ${datadir} ${libdir} by default
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
X-List-Received-Date: Thu, 22 Oct 2009 19:18:47 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia czwartek, 22 pa=C5=BAdziernika 2009 o 21:08:27 Leon Woestenberg napisa=
=C5=82(a):
> Why does FILES_${PN} have ${PN} after ${datadir} and ${libdir}?
>=20
> I would propose to just package ${datadir} and ${libdir} as-is.
> Or am I overlooking something?

PACKAGES =3D "PN-dbg PN PN-doc PN-dev PN-locale"

With your suggestion PN-doc and PN-locale starts to be useless as PN will g=
et=20
/usr/share/{doc,man,info}/ which are part of PN-doc and /usr/share/locale/=
=20
which is packaged to PN-locale.

=46ix me if I am wrong.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




