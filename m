Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MeDjd-0001Of-HK
	for openembedded-devel@openembedded.org; Thu, 20 Aug 2009 21:55:47 +0200
Received: (qmail 14237 invoked by uid 813007); 20 Aug 2009 19:38:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Aug 2009 19:38:26 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2009 21:38:24 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc5-00256-g8e6bcae; KDE/4.3.0; x86_64; ;
	)
References: <4A847C46.7090306@atmel.com>
In-Reply-To: <4A847C46.7090306@atmel.com>
MIME-Version: 1.0
Message-Id: <200908202138.25680.marcin@juszkiewicz.com.pl>
Subject: Re: Common patch directory for a set of boards.
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
X-List-Received-Date: Thu, 20 Aug 2009 19:55:48 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia czwartek, 13 sierpnia 2009 o 22:49:10 Ulf Samuelsson napisa=C5=82(a):
> Is there a way to store a patch which is applied to a list of boards,
> but not every board, in a common directory?

Bitbake checks:

files/
files/MACHINE/
PN/
PN/MACHINE/
PN-PV/
PN-PV/MACHINE/

Each of those directories can contain MACHINE related patch and 3 of them c=
an=20
contain files for recipe (never mind which MACHINE used).

> For the at91 patches, I took the easy way out and put all the patches
> on www.at91.com, which is no good, since it has been down for
> almost two days :-(

I would choose simpler one and apply AT91 patch by default as it does not=20
change non-at91 devices.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




