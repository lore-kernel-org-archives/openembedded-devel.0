Return-Path: <akuster808@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 919A876AE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 10:19:13 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so265571448wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 03:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:mime-version:subject
	:message-id:date:references:in-reply-to:to;
	bh=SBwhcE9rHBdkqHmqs0D5fZPgY8YAfeHZTh8tvXkiUJk=;
	b=qEORTHgfcrQhl/VI9RZiDiqvVqt9LWJRRM67WN53H7bu0EalymZIFMeXIXxWvrzmQi
	G9pgA2kYs1XoR161Hz8saKH+uHTCe/aIEwnCCeJKuFEyWYflWozWP27PqPFpGuEEJfWf
	kStqwkttHZOk26r+xg2O2xHyhBj1AMAHVSVnBKJobr2Xkl+ZZSMx5X4yhsGaiPJeBJfX
	Jlk9ha3AIMUREWXXsCCbxOcAVFOqIAM9B6osQpEsVhjtanVfRIl8yTUBrbkeoa5wDCV0
	xuN+SHNH98OcJ48TNKW/mtLjPtlk03DkDZ1bU+CSUk+meqGEDczbW8lvjmuQiqsEwvD+
	7epw==
X-Received: by 10.194.93.229 with SMTP id cx5mr9447994wjb.62.1444904353871;
	Thu, 15 Oct 2015 03:19:13 -0700 (PDT)
Received: from [10.32.170.199] ([37.205.56.247])
	by smtp.gmail.com with ESMTPSA id
	cc8sm15550125wjc.46.2015.10.15.03.19.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 03:19:12 -0700 (PDT)
From: Akuster808 <akuster808@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <E57D1D43-7D35-4307-8FDC-29809E1FE756@gmail.com>
Date: Thu, 15 Oct 2015 11:19:12 +0100
References: <1444850269-18516-1-git-send-email-Martin.Jansa@gmail.com>
	<1444850269-18516-3-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1444850269-18516-3-git-send-email-Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: iPhone Mail (13A452)
Subject: Re: [PATCH][meta-oe][fido 3/3] ruby: explicitly disable dtrace support
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
X-List-Received-Date: Thu, 15 Oct 2015 10:19:15 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Oct 14, 2015, at 20:17, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> both 2.2.1 and 2.2.2 are failing on some hosts native builds with:
> | linking miniruby
> | load.o: In function `rb_f_load':
> | load.c:(.text+0x3af): undefined reference to `RUBY_DTRACE_LOAD_ENTRY_ENA=
BLED'
> | load.c:(.text+0x428): undefined reference to `RUBY_DTRACE_LOAD_RETURN_EN=
ABLED'
> | load.c:(.text+0x452): undefined reference to `RUBY_DTRACE_LOAD_RETURN'
> | load.c:(.text+0x492): undefined reference to `RUBY_DTRACE_LOAD_ENTRY'
> | load.o: In function `rb_require_internal':
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Thought this was fixed already. Oh well.

Acked-by: Armin Kuster <akuster808@gmail.com>

Traveling today. Will merge soon
> ---
> meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb b/meta-ruby/rec=
ipes-devtools/ruby/ruby_2.2.1.bb
> index 29f2291..080d455 100644
> --- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
> +++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
> @@ -16,6 +16,7 @@ EXTRA_OECONF =3D "\
>     --enable-wide-getaddrinfo \
>     --disable-versioned-paths \
>     --disable-rpath \
> +    --disable-dtrace \
>     --enable-shared \
>     --enable-load-relative \
> "
> --=20
> 2.6.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

