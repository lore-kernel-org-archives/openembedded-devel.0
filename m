Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1QRnud-0002AV-Ox
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 18:04:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 2038C2C812
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jun 2011 16:00:23 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4jMF5FHgYHV
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jun 2011 16:00:19 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 9D2F32C7D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jun 2011 16:00:18 +0000 (UTC)
Message-ID: <4DE66259.3080206@gmail.com>
Date: Wed, 01 Jun 2011 18:01:29 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1306934980-19272-1-git-send-email-matteo.facchinetti@sirius-es.it>
In-Reply-To: <1306934980-19272-1-git-send-email-matteo.facchinetti@sirius-es.it>
Subject: Re: [PATCH] wxbase_2.8.9: fix includepath for SDL dependency
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
X-List-Received-Date: Wed, 01 Jun 2011 16:04:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Matteo Facchinetti ha scritto, Il 01/06/2011 15:29:
> From: Matteo Facchinetti <engineering@sirius-es.it>
>=20
> Compile task fail with error:
> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
> | cc1plus: internal compiler error: in add_path, at c-incpath.c:425
>=20
> Fix it forcing right path in configuration.
>=20
>=20
> Signed-off-by: Matteo Facchinetti <engineering@sirius-es.it>
> ---
>  recipes/wxwidgets/wxbase_2.8.9.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/wxwidgets/wxbase_2.8.9.bb b/recipes/wxwidgets/wxba=
se_2.8.9.bb
> index fb18710..7d593ad 100644
> --- a/recipes/wxwidgets/wxbase_2.8.9.bb
> +++ b/recipes/wxwidgets/wxbase_2.8.9.bb
> @@ -9,7 +9,8 @@ SRC_URI +=3D "file://Makefile.in.patch"
>  EXTRA_OECONF =3D " --disable-gui \
>                   --enable-largefile \
>                   --enable-gpe \
> -                 --without-subdirs"
> +                 --without-subdirs \
> +                 --with-sdl-prefix=3D${D}"
> =20
>  LEAD_SONAME =3D "libwx_base-2.8.so"
> =20


Acked-by: Marco Cavallini <m.cavallini@koansoftware.com>


Thank you

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



