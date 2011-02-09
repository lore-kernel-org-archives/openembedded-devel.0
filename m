Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Pn6XG-0001r8-5l
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:40:30 +0100
Received: (qmail 19756 invoked by uid 2404007); 9 Feb 2011 09:39:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89-73-120-20.dynamic.chello.pl (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@89.73.120.20)
	by host4.kei.pl with ESMTPA; 9 Feb 2011 09:39:27 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 9 Feb 2011 10:39:27 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-1-generic; KDE/4.6.0; x86_64; ; )
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
In-Reply-To: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
MIME-Version: 1.0
Message-Id: <201102091039.27832.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Wed, 09 Feb 2011 09:40:30 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 7 lutego 2011 o 23:13:42 Filip Zyzniewski napisa=C5=
=82(a):
> This reduces amount of tasks for bootstrap-image from around 3400 to
> around 1600 for jlime.
>=20
> Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
> ---
>  recipes/tasks/task-base.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
> index 32d871d..c8d6df7 100644
> --- a/recipes/tasks/task-base.bb
> +++ b/recipes/tasks/task-base.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION =3D "Merge machine and distro options to create a basic mach=
ine
> task/package" -PR =3D "r92"
> +PR =3D "r93"
>=20
>  inherit task
>=20
> @@ -31,8 +31,8 @@ PACKAGES =3D ' \
>              ${@base_contains("MACHINE_FEATURES", "redboot",
> "task-base-redboot", "",d)} \ ${@base_contains("MACHINE_FEATURES", "apex",
> "task-base-apex", "",d)} \ \
> -            task-base-bluetooth \
> -            task-base-wifi \
> +            ${@base_contains("MACHINE_FEATURES", "bluetooth",
> "task-base-bluetooth", "",d)} \ +          =20
> ${@base_contains("MACHINE_FEATURES", "wifi", "task-base-wifi", "",d)} \ \
>              ${@base_contains("DISTRO_FEATURES", "cramfs",
> "task-base-cramfs", "", d)} \ ${@base_contains("DISTRO_FEATURES", "ipsec",
> "task-base-ipsec", "", d)} \

This change is bogus. You just remove building of BT/Wifi support for "bitb=
ake=20
bootstrap-image" for your machine not distro. Use DISTRO_FEATURES instead a=
nd=20
then remove "bluetooth wifi" from DISTRO_FEATURES in your distribution conf=
ig=20
file.

Other way is to create own copy of task-base and boostrap-image recipes.=20
Easiest way would to have jlime overlay with recipes/task-base-jlime.bb whi=
ch=20
would "require task-base.bb" + "PROVIDES =3D task-base" + define own PACKAG=
ES=20
variable - this will give you everything from task-base defined + your chan=
ge=20
above. You only need to select it in your distro config as preferred provid=
er=20
of task-base.

task-base was created several years ago as attempt to get something better=
=20
then task-bootstrap which we used before. BT/Wifi part was done to have=20
support for cf/usb/pci connected dongles/cards. And it worked fine but was =
not=20
perfect.=20

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz


