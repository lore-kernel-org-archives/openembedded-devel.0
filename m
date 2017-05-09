Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C854E6FFEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 16:41:50 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v42so1515864wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P2z6LZZhIsH1kDF1MS67+Cy3lIzLEIUm8bN9su6oZmM=;
	b=MZ40uLox6hNXOaSRuzw+NYWjZOy6tlU4o1ssbA8Wl+HMv3Qt9L3dtbxA2ovOKsCf/N
	x5U+u4koFoSA3uk2UR3Z7Xo1alUny7IZ1umKN2x4SRoqJCAJK+yUo2s3S2n4RTz+4qzo
	GXRK64Hj0qk/yCJpZhUOyXWRms9C/T5THuEEDvgI21dAKErXr71wb/J6yGBvn/ycI50w
	kEoQ5DsU+A2c4qfXZoLm2XMj/OS8kI8KA1Mm6ndfYtyf9txt8bSrxi4Nzh7pY81sujz3
	4sFIhlZVBwBOywNEU5+XUXfBSEHpIY7e3NKbzTAW0sTz7vUUtxOgqRrU4xhrecTWRod6
	+AmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P2z6LZZhIsH1kDF1MS67+Cy3lIzLEIUm8bN9su6oZmM=;
	b=KBHojEBba7Ss0+/yfSoLUzRq4BmU+NtbuV9MUJUWwZvP6JDomyjEZ0XSsFMLR35syv
	7fE94aQCwPELkq/e/cBmLKq3i+4zkakLhrZ0b8HO9EVMlgOu1iZizQANjfJcqa7BUVQc
	t/VOfK4M+EhqxXTGEA7Nthw8JzUqcyooFhewnNM6X+mXXvF+QnuH3vaXPQR5JHlq8FNP
	HeqxIyDwD0+RzjKRe58cGZKf+DDr+rWi5SDozvLLwvfo2qRcpSiRHMSZXUaGb3j8ISRt
	y861msUk0jpzMyenZaR5pmjopeut5mi4Law6yNdhovZ5f8PT6rVcgicGMYJNgG+mRmoj
	ijrQ==
X-Gm-Message-State: AODbwcBUV3W750CkrERimu53HO8C71yCvSWm4R7J9JXSsSryEX2hhDry
	mjo+LWtAf6RGhq5hYVzDUPNRvGq/1A==
X-Received: by 10.80.195.17 with SMTP id a17mr808498edb.9.1494348110940; Tue,
	09 May 2017 09:41:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Tue, 9 May 2017 09:41:50 -0700 (PDT)
In-Reply-To: <20170509163755.13614-1-martin.sjobeck@multiq.com>
References: <20170509163755.13614-1-martin.sjobeck@multiq.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 9 May 2017 18:41:50 +0200
Message-ID: <CA+chaQexioba-1sv_SW3nnfaBKSuY7wtqs+SeDUzps16C=9ZKg@mail.gmail.com>
To: =?UTF-8?Q?Martin_Sj=C3=B6beck?= <martin.sjobeck@multiq.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][morty][PATCH] Removed blacklist for wvstream.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 16:41:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It needs to be merged in master and pyro branches first before it's
backported to morty and it's missing your Signed-off-by line.

On Tue, May 9, 2017 at 6:37 PM, Martin Sj=C3=B6beck <martin.sjobeck@multiq.=
com>
wrote:

> Added patch to make wvstream compile with gcc6.
> ---
>  meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb               | 1 -
>  .../recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch  | 9
> +++++++++
>  meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb           | 3 +--
>  3 files changed, 10 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-
> compilefix.patch
>
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
> b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
> index 65617fa3b..47fbf0ac8 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
> @@ -29,4 +29,3 @@ do_install() {
>      oe_runmake prefix=3D${D}/usr PPPDIR=3D${D}/etc/ppp/peers install
>  }
>
> -PNBLACKLIST[wvdial] ?=3D "Depends on broken wvstreams"
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefi=
x.patch
> b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch
> new file mode 100644
> index 000000000..87dca49c5
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch
> @@ -0,0 +1,9 @@
> +--- a/wvrules.mk 2017-01-11 09:53:36.764897285 +0100
> ++++ b/wvrules.mk 2017-01-11 09:56:24.227454405 +0100
> +@@ -83,7 +83,7 @@
> + INCFLAGS=3D$(addprefix -I,$(WVSTREAMS_INC) $(XPATH))
> + CPPFLAGS+=3D$(INCFLAGS) \
> +-      -D_BSD_SOURCE -D_GNU_SOURCE $(OSDEFINE) \
> ++      -D_BSD_SOURCE -D_DEFAULT_SOURCE -D_GNU_SOURCE -std=3Dgnu++98
> $(OSDEFINE) \
> +       -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 \
> +       -DUNSTABLE
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> index 8d864484a..cc0023a7b 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> @@ -11,6 +11,7 @@ SRC_URI =3D "http://${BPN}.googlecode.com/
> files/${BP}.tar.gz \
>             file://05_gcc.diff \
>             file://06_gcc-4.7.diff \
>             file://07_buildflags.diff \
> +           file://gcc6-compilefix.patch \
>            "
>
>  SRC_URI[md5sum] =3D "2760dac31a43d452a19a3147bfde571c"
> @@ -47,5 +48,3 @@ FILES_libwvstreams-extras-dbg =3D
> "${libdir}/.debug/libwvbase.so.* ${libdir}/.debu
>  FILES_${PN}-valgrind =3D "${libdir}/valgrind/wvstreams.supp"
>  RDEPENDS_${PN} +=3D "perl"
>
> -# http://errors.yoctoproject.org/Errors/Details/68614/
> -PNBLACKLIST[wvstreams] ?=3D "BROKEN: fails to build with gcc-6"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

