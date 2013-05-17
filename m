Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UdFEw-0005ve-Vh
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 May 2013 09:38:12 +0200
Received: by mail-ve0-f170.google.com with SMTP id 15so1897453vea.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2013 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=1iqn1aqubhaXRR9HKyPjJpDq0k/ykymcbJKofd0JFNY=;
	b=F3yBBNbRWyoBF8u9wpWOE54bwt04TAe2yF4JncNBdAJbvDZzkXznn/O+qwDqEio5Vt
	Ql/8QWIxRia0rOP77qcpDVr6mnDtBJpubsLKr+0efpv3K8aD2S9fKPWFcDD19vZyEAgS
	0eGLbjoq6TLZS4oJqx4gqvMZCXe8VVrJyDvOgZX0dDzkm1D+kdb3jh3jO3SXdfuBt7Tf
	iVFziteGgU/qSWeOd8CASuzZ6awG8wnt8a1bJ8x7fgfLtdjH/yTkIDo4EgfhFZiti1Tx
	PTfR81f2uER33k97peRR3RsmOmZ7+t37gq8TUbxoIsF8sbn/qvlQt/UztmW3skubxvwh
	b4kw==
MIME-Version: 1.0
X-Received: by 10.58.32.131 with SMTP id j3mr17452540vei.57.1368775195282;
	Fri, 17 May 2013 00:19:55 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Fri, 17 May 2013 00:19:55 -0700 (PDT)
In-Reply-To: <1368769995-29266-1-git-send-email-raj.khem@gmail.com>
References: <1368769995-29266-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 17 May 2013 09:19:55 +0200
Message-ID: <CALbNGRQyQjpW_2seu9NgzU1tb3-fVgeNO8yax=O2mLtWPKT=jg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] pangomm: Add missing dependency on pango
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
X-List-Received-Date: Fri, 17 May 2013 07:38:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2013 at 7:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Fixes errors like
>
> | configure:15678: error: Package requirements (glibmm-2.4 >=3D 2.14.1
> cairomm-1.0 >=3D 1.2.2 pangocairo >=3D 1.23.0) were not met:
> |
> | No package 'pangocairo' found
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/r=
ecipes-graphics/pango/pangomm_2.28.2.bb
> index 4419113..302062c 100644
> --- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
> +++ b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c=
1cb29a1e3fd737b499 \
>
>  PR =3D "r2"
>
> -DEPENDS =3D "mm-common cairomm glibmm"
> +DEPENDS =3D "mm-common cairomm glibmm pango"
>
>  SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).spl=
it('.')[1]}"
>
> --
> 1.7.9.5
>
>
You were faster than me :)

Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>


