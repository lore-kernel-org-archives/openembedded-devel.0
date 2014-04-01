Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 832386F9DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 11:52:11 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id id10so9733711vcb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=b+XlVv5SA0D3/gCSbJC9wsERBenmZNF4dQs0s+3sXkc=;
	b=r7Pqgp0lDtwLClYyDDAOkHAGTenaV4/lvvDGVZFfKldYZIqGyPlekTO51fgxl0zK5A
	TnPNOiiF01FqTPfc/Tp2MTg1qz06x+pAAl7HRBXxhgYrMrXPE3BKNF4gm3JmGdh/gh7V
	t0IMAHfUsJUI1+lVmWDjGNvpZSk7T+gOpPh8+/+ax+OAcbQa70JEz8MPBf90KMtSRzsD
	kbzjMZ9IKkOO9kftpjjux3IACzUkxmhqPLBAWWk8OlG5AkQe/zpzplEMYSD8emEdZg+U
	kbzD0oXahSBU09UrtU1P6kx/G+KbN24RD2Vf5nFEdtvfhQkiMUBI3Ax9za44a3DKLoSq
	GzYw==
MIME-Version: 1.0
X-Received: by 10.52.191.100 with SMTP id gx4mr23799937vdc.4.1396353131990;
	Tue, 01 Apr 2014 04:52:11 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Tue, 1 Apr 2014 04:52:11 -0700 (PDT)
In-Reply-To: <1396318229-13509-2-git-send-email-trevor.woerner@linaro.org>
References: <1396318229-13509-1-git-send-email-trevor.woerner@linaro.org>
	<1396318229-13509-2-git-send-email-trevor.woerner@linaro.org>
Date: Tue, 1 Apr 2014 13:52:11 +0200
Message-ID: <CALbNGRTDzfcUMqe+0Qb+t0NDAHxBQMXXiB4vc3_Hr=W7g6pu2w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: patches@linaro.org
Subject: Re: [meta-oe][PATCH] asio: package bump
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 11:52:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2014 at 4:10 AM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> This recipe had been failing to build, bumping to the latest stable relea=
se
> resolves all build issues.
>
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-oe/recipes-support/asio/asio.inc       | 11 ++++++-----
>  meta-oe/recipes-support/asio/asio_1.10.1.bb |  6 ++++++
>  meta-oe/recipes-support/asio/asio_1.4.1.bb  |  8 --------
>  3 files changed, 12 insertions(+), 13 deletions(-)
>  create mode 100644 meta-oe/recipes-support/asio/asio_1.10.1.bb
>  delete mode 100644 meta-oe/recipes-support/asio/asio_1.4.1.bb
>
> diff --git a/meta-oe/recipes-support/asio/asio.inc b/meta-oe/recipes-supp=
ort/asio/asio.inc
> index 49c236f..c2a6b1b 100644
> --- a/meta-oe/recipes-support/asio/asio.inc
> +++ b/meta-oe/recipes-support/asio/asio.inc
> @@ -1,9 +1,10 @@
> -DESCRIPTION =3D "Asio"
> -HOMEPAGE =3D "http://asio.sf.net/"
> +DESCRIPTION =3D "Asio is a cross-platform C++ library for network and lo=
w-level \
> +        I/O programming that provides developers with a consistent async=
hronous \
> +        model using a modern C++ approach."
> +AUTHOR =3D "Christopher M. Kohlhoff (chris at kohlhoff dot com)"
> +HOMEPAGE =3D "http://think-async.com/Asio"
>  SECTION =3D "libs"
> -LICENSE =3D "Boost Software License"
> -
> -INC_PR =3D "r0"
> +LICENSE =3D "BSL-1.0"
>
>  DEPENDS =3D "boost"
>
> diff --git a/meta-oe/recipes-support/asio/asio_1.10.1.bb b/meta-oe/recipe=
s-support/asio/asio_1.10.1.bb
> new file mode 100644
> index 0000000..fdfaaf6
> --- /dev/null
> +++ b/meta-oe/recipes-support/asio/asio_1.10.1.bb
> @@ -0,0 +1,6 @@
> +require asio.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D113f800aa522d9e38c3309c98ec53=
ade"
> +
> +SRC_URI[md5sum] =3D "4d508c9947404fee40945375b8a5fd32"
> +SRC_URI[sha256sum] =3D "820a5dad3c56a4f3e937f2b9ae059ab2696c6058345d71b7=
a8b072a0f2fcbd99"
> diff --git a/meta-oe/recipes-support/asio/asio_1.4.1.bb b/meta-oe/recipes=
-support/asio/asio_1.4.1.bb
> deleted file mode 100644
> index 396a553..0000000
> --- a/meta-oe/recipes-support/asio/asio_1.4.1.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require asio.inc
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db99840878263c0bfaa70ca7143624=
413"
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "1879b246f9217d64bd3126aa16488bc2"
> -SRC_URI[sha256sum] =3D "aeb5c997940e6afd399c62316f03f480557f2b721354adff=
065d230183ff2782"
> --
> 1.9.0
>
> --
You were faster than me :)

Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

