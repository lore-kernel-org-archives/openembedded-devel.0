Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lvc3k-0005Up-PW
	for openembedded-devel@openembedded.org; Sun, 19 Apr 2009 20:48:09 +0200
Received: (qmail 3502 invoked by uid 813007); 19 Apr 2009 18:43:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Apr 2009 18:43:54 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Apr 2009 20:44:37 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc2-00199-g51f1622-dirty; KDE/4.2.2;
	x86_64; ; )
References: <c15f914f0904180744m137b82c5r552a3b8431954165@mail.gmail.com>
In-Reply-To: <c15f914f0904180744m137b82c5r552a3b8431954165@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904192044.39103.marcin@juszkiewicz.com.pl>
Subject: Re: Building python without downloading dependencies for all modules
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
X-List-Received-Date: Sun, 19 Apr 2009 18:48:13 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia sobota, 18 kwietnia 2009 o 16:44:29 Bart Staal napisa=C5=82(a):

> I'm a relative new guy to the OE world, but I fairly managed to find
> my way through it and build images for my NAS (ch3snas).

If it is not in OE then will you merge support for it?

> I want to equip my NAS with the python interpreter. If I 'bitbake
> python' a big nasty list of dependencies is pulled from the net, eg
> x11 headers, sqlite, openssl, tcltk, etc, etc. Calling 'bitbake
> python-core' doesn't work, but I now I understand that this package
> is created if the python recipe is built.

> I'd like to have a way to only download/build the core python stuff,
> with only a few modules which I really need. Is there a way to
> achieve this with the existing python recipes in the OE repository or
> should I create my own python recipes?

We build Python with lot of extensions. Each module is packaged=20
separately so you can choose which exactly parts you need. What you see=20
is build dependencies (which are huge) but result will require all those=20
extra libs only if you will install all modules.

So live with it or change DEPENDS line in python_VER.bb recipe (but that=20
way is not so supported by us).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




