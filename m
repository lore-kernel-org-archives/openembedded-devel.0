Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MQQ2R-0002o4-Rh
	for openembedded-devel@openembedded.org; Mon, 13 Jul 2009 20:14:07 +0200
Received: (qmail 21324 invoked by uid 813007); 13 Jul 2009 18:00:55 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Jul 2009 18:00:55 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jul 2009 20:00:15 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.31-rc1-00272-g404d6df; KDE/4.2.4; x86_64; ;
	)
References: <E1MQN0M-0007Vp-D6@melo.openembedded.org>
In-Reply-To: <E1MQN0M-0007Vp-D6@melo.openembedded.org>
MIME-Version: 1.0
Message-Id: <200907132000.15889.marcin@juszkiewicz.com.pl>
Subject: Re: [oe-commits] Marco Cavallini : Added machine taskit Stamp9G20 Evaluation Board
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
X-List-Received-Date: Mon, 13 Jul 2009 18:14:08 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 13 lipca 2009 o 16:59:46 git version control=20
napisa=C5=82(a):

> +++ b/conf/machine/stamp9g20evb.conf
> @@ -0,0 +1,26 @@
> +#@TYPE: Machine
> +#@Name: taskit Stamp9G20 Evaluation Board
> +#@DESCRIPTION: Machine configuration for the Stamp9G20 Evaluation=20
> +#@MAINTAINER: Marco Cavallini <m.cavallini@koansoftware.com>=20

Can you add URL to homepage of board (if such exists)?

> +TARGET_ARCH =3D "arm"
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> +PREFERRED_VERSION_linux =3D "2.6.29"

I think that we need to create policy about selecting PREF_VER in=20
machine config - especially when recipes used have DEF_PREF set for this=20
device. For me recipes are better place to handle that.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




