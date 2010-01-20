Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NXUKu-0000ui-9y
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 07:46:43 +0100
Received: (qmail 8641 invoked by uid 813007); 20 Jan 2010 06:44:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Jan 2010 06:44:26 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 07:43:49 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc2-00268-g45d28b0; KDE/4.3.4; x86_64; ;
	)
References: <4B564B3D.7020108@atmel.com>
In-Reply-To: <4B564B3D.7020108@atmel.com>
MIME-Version: 1.0
Message-Id: <201001200743.52552.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] Enable bmp and JPEG files for fbv
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
X-List-Received-Date: Wed, 20 Jan 2010 06:46:43 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 20 stycznia 2010 o 01:15:57 Ulf Samuelsson napisa=C5=82(a):
>  do_install() {
>         install -d ${D}${bindir}
> -        install -m 0755 fbv ${D}${bindir}
> -
> -        # man
> -        install -d ${D}${mandir}/man1/
> -        install -m 0644 fbv.1 ${D}${mandir}/man1/fbv.1
> +       install -m 0755 fbv ${D}${bindir}
>  }

I like to be able to install fbv-doc package to read manuals. Please revert=
=20
that part.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




