Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1OGSHg-0006nS-OM
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 09:41:14 +0200
Received: (qmail 28725 invoked by uid 813007); 24 May 2010 07:37:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 24 May 2010 07:37:08 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 May 2010 09:37:17 +0200
User-Agent: KMail/1.13.3 (Linux/2.6.32-22-generic; KDE/4.4.3; x86_64; ; )
References: <AANLkTimqsLv69OOmckplXCqoIZbybtIwjTVBAC-Uax4Q@mail.gmail.com>
In-Reply-To: <AANLkTimqsLv69OOmckplXCqoIZbybtIwjTVBAC-Uax4Q@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201005240937.19706.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Angstrom distro, qemu: uncaught target signal 4 (Illegal instruction) - core dumped on glibc package
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
X-List-Received-Date: Mon, 24 May 2010 07:41:14 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 23 maja 2010 o 12:17:43 Grzegorz Toporek napisa=C5=82(a):
> Unfortunately, I got this error while building glibc package:
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>=20
> I found this tread which says that gemu doesn't support iwmmxt...but how =
to
> deal with this? Is there a patch needed? Where to find it?
> http://ibot.rikers.org/%23oe/20060827.html.gz
>=20
> I use tune-iwmmxt.inc file with my machine.

I told you few days ago:

Also one thing: do not use tune-iwmmxt for Colibri. This does not give any=
=20
special improvements for system. Add "iwmmxt" to MACHINE_FEATURES like it i=
s=20
in few machines already - this will give you optimized versions of those=20
packages where it is really worth to enable that.

And as Qemu does not handle iwmmxt instructions you can't get working binar=
y=20
locale build.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




