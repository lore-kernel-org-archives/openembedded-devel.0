Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nrucs-00039z-F4
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 15:53:51 +0100
Received: (qmail 16448 invoked by uid 813007); 17 Mar 2010 14:50:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Mar 2010 14:50:36 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Mar 2010 15:49:26 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <4BA0DB15.1030904@eukrea.com>
In-Reply-To: <4BA0DB15.1030904@eukrea.com>
MIME-Version: 1.0
Message-Id: <201003171549.27421.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: root login over serial port using shadow
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
X-List-Received-Date: Wed, 17 Mar 2010 14:53:55 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 17 marca 2010 o 14:37:25 Eric B=C3=A9nard napisa=C5=82(a):
> Hi,
>=20
> for the followinf, the distro in Angstrom.
>=20
> When using shadow as the IMAGE_LOGIN_MANAGER, login doesn't work as root
> over the serial port if a password is set for root and whatever the
> setting done under securretty or /etc/security or /etc/login.defs
>=20
> The problem is the following :
> inittab says :
> S:2345:respawn:/sbin/getty 115200 ttyS0
>=20
> getty is using /bin/login as a default. But /bin/login is a link to
> busybox thus when login on the serial port, busybox's login will be used
> and not shadow's login which is at /usr/bin/login
>=20
> changing inittab to :
> S:2345:respawn:/sbin/getty 115200 ttyS0 -l /usr/bin/login
> solves the problem.
>=20
> Now the question : what is the right way to tell the shadow package to
> replace /bin/login of busybox by its proper /usr/bin/login when it's
> installed ?

You need this commit as it moves login to /bin/ dir:

commit b3045d2a282ef408f599d9a722df61e85ef636b5
Author: Koen Kooi <koen@openembedded.org>
Date:   Fri Mar 5 11:33:36 2010 +0100

    shadow: use u-a on binaries that conflict with util-linux-ng


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




