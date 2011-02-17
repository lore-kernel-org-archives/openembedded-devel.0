Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1Pq6hH-0008Vq-EL
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 17:27:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 6BB362C821
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 16:25:05 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hs3zjyZn43lW
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 16:25:01 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 0F7122C7D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 16:25:00 +0000 (UTC)
Message-ID: <4D5D4C10.6060704@gmail.com>
Date: Thu, 17 Feb 2011 17:25:52 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297956266-30032-1-git-send-email-tom_rini@mentor.com>
	<1297956266-30032-2-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1297956266-30032-2-git-send-email-tom_rini@mentor.com>
Subject: Re: [PATCH 2/2] gettext: Pass --disable-rpath on target
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
X-List-Received-Date: Thu, 17 Feb 2011 16:27:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Tom Rini ha scritto, Il 17/02/2011 16:24:
> We disable rpath stuff as this casues problems with libtool 2.2
> and 2.4 is fine.
>=20
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  recipes/gettext/gettext_0.18.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_=
0.18.bb
> index e9e613e..850b269 100644
> --- a/recipes/gettext/gettext_0.18.bb
> +++ b/recipes/gettext/gettext_0.18.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "The GNU internationalization library."
>  HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
>  SECTION =3D "libs"
>  LICENSE =3D "GPLv3"
> -PR =3D "r4"
> +PR =3D "r5"
>  DEPENDS =3D "gettext-native virtual/libiconv ncurses expat"
>  DEPENDS_virtclass-native =3D "libxml2-native"
>  PROVIDES =3D "virtual/libintl"
> @@ -26,7 +26,7 @@ PARALLEL_MAKE =3D ""
> =20
>  inherit autotools
> =20
> -NATIVECONF =3D ""
> +NATIVECONF =3D "--disable-rpath"
>  NATIVECONF_virtclass-native +=3D "--enable-relocatable --disable-curse=
s"
> =20
>  EXTRA_OECONF +=3D "--without-lispdir \


ACK


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



