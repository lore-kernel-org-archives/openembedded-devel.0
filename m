Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Ntkcp-0003L7-8H
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 17:37:21 +0100
Received: (qmail 4390 invoked by uid 813007); 22 Mar 2010 16:33:59 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 16:33:59 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 17:33:57 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.34-rc2; KDE/4.4.1; x86_64; ; )
References: <20100322160729.4972.62697.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322160729.4972.62697.stgit@ES-J7S4D2J.amer.consind.ge.com>
MIME-Version: 1.0
Message-Id: <201003221733.58036.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH v2] Alternative to busybox, using "proper tools"
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
X-List-Received-Date: Mon, 22 Mar 2010 16:37:21 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 22 marca 2010 o 17:08:20 Martyn Welch napisa=C5=82(=
a):

> This patch provides a mechanism to replace busybox by defining a busybox
> package which actually just requires a set of other packages.
>=20
>     To get it to be used rather than the standard busybox, define:
>=20
>     PREFERRED_PROVIDER_busybox =3D "busybox-alt"
> ---
>=20
>  Marcin: Something like this you mean?

Yes, few notes:
=20
> diff --git a/recipes/busybox/busybox-alt_1.bb
> b/recipes/busybox/busybox-alt_1.bb new file mode 100644

busybox-alt.bb is fine too - PV will be 1.0 then

> +++ b/recipes/busybox/busybox-alt_1.bb

> +ALLOW_EMPTY =3D "1"
> +PACKAGES =3D "busybox"
> +PACKAGE_ARCH =3D "all"
> +
> +PROVIDES =3D "busybox"
> +DEFAULT_PREFERENCE =3D "1"

"-1" is more proper - we do not want people to get busybox-alt instead of=20
busybox by mistake.

RDEPENDS =3D "task-proper-tools"

One line looks better. DEPENDS are not needed.

> +++ b/recipes/tasks/task-proper-tools.bb
> @@ -4,33 +4,107 @@ PR =3D "r11"

Bump PR.

>  RDEPENDS_${PN} =3D "\
> +		bash \
> +		bc \
> +		bind-utils \

> +		binutils \

Not needed - 'binutils-symlinks' depends on it.

> +		bzip2 \
> +		console-tools \

> +		dhcp-client \

I added 'pump' - but thats minor.

> +		e2fsprogs-fsck \

In .dev this is in util-linux-ng now.

> +		e2fsprogs-libs \

What for this is?

> +		ifupdown-ubuntu \

Can we rename it to 'ifupdown'?

> +		iputils-ping \
> +		iputils-ping6 \
> +		iputils-arping \


> +		minicom \

Maybe 'picocom' would be nice too.

> +		mktemp \

> +		ncurses \

I added "ncurses-tools" - gives few utils more.

> +		openrdate \
> +		realpath \


> +		start-stop-daemon \

Nice - I added 'dpkg' instead but it was overkill.

> +		syslog-ng \
> +		sysvinit \
> +		tftp-hpa \
> +		time \

I added 'shadow' to the list.


> +DEPENDS_${PN} =3D "\

DEPENDS are not needed.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




