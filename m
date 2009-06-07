Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MDNrp-0000tB-BL
	for openembedded-devel@openembedded.org; Sun, 07 Jun 2009 21:17:17 +0200
Received: (qmail 13867 invoked by uid 813007); 7 Jun 2009 19:07:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Jun 2009 19:07:53 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 7 Jun 2009 21:08:39 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.30-rc6-00082-g7aff192-dirty; KDE/4.2.4;
	x86_64; ; )
References: <921557650906061408x129a09c6j53d0e0a971a5eac8@mail.gmail.com>
	<1244372045.4151.19.camel@lenovo.internal.reciva.com>
	<921557650906070935r60adc48enb8ac30fc56a7d319@mail.gmail.com>
In-Reply-To: <921557650906070935r60adc48enb8ac30fc56a7d319@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200906072108.55900.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] netvista 8363/N2200 machine support
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
X-List-Received-Date: Sun, 07 Jun 2009 19:17:17 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 7 czerwca 2009 o 18:35:37 Mateusz Kijowski napisa=C5=82(a):
> Ok, I rearranged things a bit.

You can use tune-geode.inc instead of tune-x86.inc file. Also please add=20
those URLs from commit description into machine description so other=20
will get them without 'git log'. I am also not sure are=20
"FILES_kernel-image" works in this way which you use.

> Right now the patch and defconfig are in
> recipes/linux/linux/netvista8363 and all kernel related stuff is in
> linux_2.6.24.bb including the overriden do_install().

=46ix indenting in linux_2.6.24.bb in do_kernel_2x00_image().

Instead of copying kernel_do_install() as do_install_netvista8363() use=20
do_install_append_netvista8363() which will do only required stuff. It=20
will allow you to concentrate on your device working instead of having=20
to track kernel.bbclass do_install() changes (when they will happen).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




