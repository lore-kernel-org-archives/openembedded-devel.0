Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nem32-0001wm-4B
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 10:06:23 +0100
Received: (qmail 11537 invoked by uid 813007); 9 Feb 2010 09:03:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 9 Feb 2010 09:03:49 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 9 Feb 2010 10:03:19 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc5-00011-gf6760aa; KDE/4.3.4; x86_64; ;
	)
References: <1265676216-9722-1-git-send-email-ynezz@true.cz>
	<1265676216-9722-2-git-send-email-ynezz@true.cz>
	<1265676216-9722-3-git-send-email-ynezz@true.cz>
In-Reply-To: <1265676216-9722-3-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Message-Id: <201002091003.19947.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux 2.6.24: moving ts72xx to 2.6.27 as default kernel so change DEFAULT_PREFERENCE
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
X-List-Received-Date: Tue, 09 Feb 2010 09:06:23 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 9 lutego 2010 o 01:43:32 Petr =C5=A0tetiar napisa=C5=82(a):
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
>  recipes/linux/linux_2.6.24.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.bb
> index 31a8a04..9aca4c7 100644
> --- a/recipes/linux/linux_2.6.24.bb
> +++ b/recipes/linux/linux_2.6.24.bb
> @@ -7,12 +7,12 @@ DEFAULT_PREFERENCE_mpc8313e-rdb =3D "1"
>  DEFAULT_PREFERENCE_simpad =3D "1"
>  DEFAULT_PREFERENCE_atngw100 =3D "1"
>  DEFAULT_PREFERENCE_at32stk1000 =3D "1"
> -DEFAULT_PREFERENCE_ts72xx =3D "1"
> +DEFAULT_PREFERENCE_ts72xx =3D "-1"

Just drop DEF_PREF, do not set it to default value.

> -PR =3D "r34"
> +PR =3D "r35"

Do not bump kernel PR if you do not use it anymore. This part should go to=
=20
previous patch as it changes patches.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




