Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GuP1Y-0003U5-1t
	for openembedded-devel@openembedded.org; Wed, 13 Dec 2006 08:59:32 +0100
Received: (qmail 13727 invoked by uid 813007); 13 Dec 2006 07:51:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 13 Dec 2006 07:51:39 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Dec 2006 08:51:37 +0100
User-Agent: KMail/1.9.5
References: <E1GuDwk-0002kI-IJ@linuxtogo.org>
	<26264111.20061212224755@gmail.com>
	<193365758.20061212220007@vanille-media.de>
In-Reply-To: <193365758.20061212220007@vanille-media.de>
MIME-Version: 1.0
Message-Id: <200612130851.38002.openembedded@hrw.one.pl>
Subject: Re: [oe-commits] org.oe.dev removal.txt: Push bluez*2.* removal to a month later, as it is known to be used by OPIE.
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
X-List-Received-Date: Wed, 13 Dec 2006 07:59:32 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 12 grudnia 2006 22:00, Michael 'Mickey' Lauer napisa=B3:

> The issue was (and still remains) that bluez3 depends on dbus which in
> turn brings glib with it and this is relatively huge.

obexpush already brings libglib-2.0-0 - someone had patch for it iirc

And dbus *NEED* more granular packaging - dbus-1 package is 440K unpacked=20
where 230K is dbus-daemon itself and OPIE images need only=20
lib/libdbus-1.so*

> The advantage of Opie fitting into 14.5MB flash like on Sharp SL5500
> would be void then.

OPIE from .dev already is hard to fit - qte-mt with Japanese support is=20
larger.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

             Today is the first day of the rest of your life.




