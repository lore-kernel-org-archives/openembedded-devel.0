Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFcZu-0002DS-PN
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 04:05:23 +0200
Received: by pzk33 with SMTP id 33so7207732pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2011 18:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Ezq0tHLkLAoG7igT3E/F0+ntNqdU4mNg2ZX2CV4PCVI=;
	b=aGt3mmyaTPF43mM7SNcwnTDUJfyhMno1eNOXIYIP/qeFuiYEkbPKrndqNmVhmRPInq
	yrzB15JsFJ4Sr1/Ar2l8iscaaxRR+nTLfgJZfMJgDWuOMcKGXC8fyAin8VasriReyrO4
	YEUH4EwevMXKrbjklAPwcgg+i0Ji1n5fGFI3A=
Received: by 10.68.8.233 with SMTP id u9mr34739808pba.30.1318816774091; Sun,
	16 Oct 2011 18:59:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Sun, 16 Oct 2011 18:59:04 -0700 (PDT)
In-Reply-To: <1318793613-10687-1-git-send-email-schnitzeltony@gmx.de>
References: <1318793613-10687-1-git-send-email-schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Oct 2011 18:59:04 -0700
Message-ID: <CAMKF1so4Kx4N8qvSLGqZ+nTyHFdMqb0x3wEhz0=qR74FFryayA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-efl] epdfview: add initial recipe with version 0.1.8
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
X-List-Received-Date: Mon, 17 Oct 2011 02:05:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 16, 2011 at 12:33 PM, Andreas M=C3=BCller <schnitzeltony@gmx.de=
> wrote:
> initial source taken from oe-classic epdfview_0.1.7.bb
> commit 44985d56bc556786812a0a02d6219afd31a7381d
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de>
> ---
> =C2=A0meta-efl/recipes-efl/efl/epdfview_0.1.8.bb | =C2=A0 12 ++++++++++++
> =C2=A01 files changed, 12 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
>
> diff --git a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb b/meta-efl/recipe=
s-efl/efl/epdfview_0.1.8.bb
> new file mode 100644
> index 0000000..9598990
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "A lightweight PDF viewer based on gtk and poppler"
> +HOMEPAGE =3D "http://www.emma-soft.com/projects/epdfview/"
> +LICENSE =3D "GPLv2"

Since I see "either version 2 of the License, or (at your option) any
later version."
in source file headers it is better to say GPLv2+ here

> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> +SECTION =3D "x11/applications"
> +DEPENDS =3D "gtk+ poppler"
> +
> +inherit autotools gettext
> +
> +SRC_URI =3D "http://www.emma-soft.com/projects/epdfview/chrome/site/rele=
ases/epdfview-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "e50285b01612169b2594fea375f53ae4"
> +SRC_URI[sha256sum] =3D "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d=
6b846a8de0f2f8f0"
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


