Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qynus-0001KZ-3R
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 18:45:30 +0200
Received: by bkbzu17 with SMTP id zu17so963314bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=pRO4yFcBN4dze8fDqlnHVSLM0hMIvc4sEtJ+vHsYs/E=;
	b=hTx9oWb65Y/9tCcZF2H9A16YONeL897pw/lQh5aOhze91y6ZVtc6LAAvSavQhN3HdO
	Utoj4yxEXwu9AfUUOY304iHqYI4Y2izfdC5kMED0D313uZZsYBQQh4wB8e7ake3PLb2G
	mWlj11SUFrrD0OFML8c8L3eu02eOhgBKkD9tQ=
MIME-Version: 1.0
Received: by 10.204.146.137 with SMTP id h9mr344667bkv.316.1314808831140; Wed,
	31 Aug 2011 09:40:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.156.217 with HTTP; Wed, 31 Aug 2011 09:40:31 -0700 (PDT)
In-Reply-To: <04a735b690f58a4b9f0eaf0b1e243f0b806a4500.1314710525.git.otavio@ossystems.com.br>
References: <cover.1314710525.git.otavio@ossystems.com.br>
	<04a735b690f58a4b9f0eaf0b1e243f0b806a4500.1314710525.git.otavio@ossystems.com.br>
Date: Wed, 31 Aug 2011 13:40:31 -0300
X-Google-Sender-Auth: ZI1ExylzGiTo4oABFGDVZVo6dGA
Message-ID: <CAP9ODKpc5dXL5kcOGHjEFRmgrcWq81n0wgpofxG_No8HwC8FuA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] json-glib: drop specific recipe to use OpenEmbedded-Core
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
X-List-Received-Date: Wed, 31 Aug 2011 16:45:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ping?

On Tue, Aug 30, 2011 at 10:42, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =A0.../recipes-devtools/json-glib/json-glib_0.10.4.bb | =A0 14 ----------=
----
> =A01 files changed, 0 insertions(+), 14 deletions(-)
> =A0delete mode 100644 meta-oe/recipes-devtools/json-glib/json-glib_0.10.4=
.bb
>
> diff --git a/meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb b/met=
a-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb
> deleted file mode 100644
> index 87c60cb..0000000
> --- a/meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION =3D "JSON-GLib is a library providing serialization and dese=
rialization support for the JavaScript Object Notation (JSON) format"
> -LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903=
e34"
> -DEPENDS =3D "glib-2.0"
> -
> -PR =3D "r1"
> -
> -EXTRA_OECONF =3D "--enable-introspection=3Dno"
> -
> -inherit autotools
> -SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/json-glib/0.10/json-=
glib-0.10.4.tar.gz"
> -
> -SRC_URI[md5sum] =3D "87677e939a4b3d42e1c56b2a3046b9bb"
> -SRC_URI[sha256sum] =3D "9561b3c58b350c89333d154f1e8669b8ece611c9c724252a=
ed0e6273cda9cc6f"
> --
> 1.7.2.5
>
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


