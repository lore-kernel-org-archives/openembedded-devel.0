Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1L9mho-0003nl-Tx
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 21:27:49 +0100
Received: (qmail 9602 invoked by uid 813007); 8 Dec 2008 20:23:55 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 8 Dec 2008 20:23:55 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Dec 2008 21:23:30 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.28-rc7; KDE/4.1.3; x86_64; ; )
References: <c384c5ea0812081135l44781a3fw1a43dba861a44f0f@mail.gmail.com>
	<20081208200545.GM15204@smtp.west.cox.net>
In-Reply-To: <20081208200545.GM15204@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200812082123.33623.openembedded@haerwu.biz>
Subject: Re: OE buildable on headless hosts?
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
X-List-Received-Date: Mon, 08 Dec 2008 20:27:49 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Monday 08 of December 2008 21:05:45 Tom Rini napisa=C5=82(a):
> On Mon, Dec 08, 2008 at 08:35:53PM +0100, Leon Woestenberg wrote:

> > How many people are building GNOME/X stuff on non-X hosts (such as
> > Ubuntu Server)?
>
> I am, and found that libx11 has a dependency on host
> /usr/include/X11/keysymdef.h (it does a very stupid does this file
> exist test) but haven't had a chance to fix it yet.

Check xorg-lib/libx11/keysymdef_include.patch for solution. It is used=20
in libx11_1.1.5.bb for example.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




