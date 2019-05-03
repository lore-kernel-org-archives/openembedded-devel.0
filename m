Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9F00A7DD93
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 May 2019 08:35:10 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id t200so7863657itf.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2019 01:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=42jz5RJMCMPXodN3+jaUth7E8inuIjU4ceDvTLV/iQE=;
	b=OagkNV8zburo+aHYWAI89XZa7YibGTTU7UWT81kShF56ZwsogG9THw+BJSBLLB1t35
	7+//uiNwmdNm63mwMOQXOSE+yhSV9DtgnL5EatqWZBLAZ98qf8mOXyiVCo/TnsGovCw9
	ySQl8Ym8EVGviPEktyRmBeVDoQ6/vyGBWRQLCBucMf5qSVlZF6/bP4DA+8fGQkzOd1iR
	Yt4V1uvCKfxyLifeIsCheyT9V3O6oGi0ngBhw0MtQpAD/QDA8vR9BSJU6ZN6ACrZa1NN
	+8ECNp7dsIUH0NeqwvLmGDbLrWGE3T3in2BLIRoTbsrBVN7Hsdl1EeprB0qli504ZeiI
	fhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=42jz5RJMCMPXodN3+jaUth7E8inuIjU4ceDvTLV/iQE=;
	b=PBLWOJle3P+pf01ibp1hYd0UjC0XRGdfElNGasbh8SY39plXb3tWFBud1IdNsWDRxY
	EE2J1VL3ifsbFrq6Gm7O2UaVpKy+Z3f8tGQRiQkqfVy8me7M3Gaz3Egrk7DDK64ZlZKL
	5fV5rmLxpX0pzGtu79cH+njT7hhELcDT1f9N2TmUls1rrC/Gwz1MwaJgfyAODKaNNb+P
	pFk5Pv1Ui4hEi4ngcwRxj8jddxJiQN4Fxs++ZNS3+RfvBfRYuUmwrnymziVklLdri4U9
	sTL+nFx392B7LtbBNbV8RYi6wakqh2sIIqHXx9Yd5fxK3bdMzsLLxG+DjFNI6fT7+Qu+
	qozA==
X-Gm-Message-State: APjAAAXY7aABlNkVqJlVL18obkaUsRYTFj7aEkynp8d1epvDQEhhI6fZ
	btgIPMJnfpsQBWVIN1bikiHy0oe1ceL7Z/kJi+4=
X-Google-Smtp-Source: APXvYqxlO1hXgjR64SJyyYPzVuYPQguytsq9Ofi6Pv5e0crCP0cpO/Q36YXHxb/Ji+bxHhCCegpRrXKQMh7YJhWxdlQ=
X-Received: by 2002:a24:fa88:: with SMTP id v130mr6116766ith.122.1556872511548;
	Fri, 03 May 2019 01:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190206004547.32351-1-raj.khem@gmail.com>
	<20190206004547.32351-5-raj.khem@gmail.com>
In-Reply-To: <20190206004547.32351-5-raj.khem@gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 3 May 2019 10:35:00 +0200
Message-ID: <CAB2nKc-E50apsLZGJYgGA85iXbFo8xEV8Mv9=QtfVbeHr4vtUw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/6] mongodb: Fix build with clang
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
X-List-Received-Date: Fri, 03 May 2019 08:35:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

I can't compile mongodb in Warrior branch with g++ either,
it fails in boost::asio with std::basic_string_view with "-std=3Dc++14"
cflags.
It seems C++17 support is only present in 4.1.x branch and not in r4.0.6?
Maybe we need to generalize this patch?

Regards,
Vincent

Le mer. 6 f=C3=A9vr. 2019 =C3=A0 01:47, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...sio-Dont-use-experimental-with-clang.patch | 28 +++++++++++++++++++
>  meta-oe/recipes-dbs/mongodb/mongodb_git.bb    |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644
> meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-=
clang.patch
>
> diff --git
> a/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wit=
h-clang.patch
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wit=
h-clang.patch
> new file mode 100644
> index 0000000000..b597422e40
> --- /dev/null
> +++
> b/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-wit=
h-clang.patch
> @@ -0,0 +1,28 @@
> +From 31ca5c563f1d9a3f70258be3dd2b1e547a65a550 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 5 Feb 2019 00:21:12 -0800
> +Subject: [PATCH] asio: Dont use experimental with clang
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + .../asio-master/asio/include/asio/detail/string_view.hpp      | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git
> a/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
> b/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
> +index 222c02186d..3bf7494529 100644
> +--- a/src/third_party/asio-master/asio/include/asio/detail/string_view.h=
pp
> ++++ b/src/third_party/asio-master/asio/include/asio/detail/string_view.h=
pp
> +@@ -28,8 +28,8 @@
> + namespace asio {
> +
> + #if defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
> +-using std::experimental::basic_string_view;
> +-using std::experimental::string_view;
> ++using std::basic_string_view;
> ++using std::string_view;
> + #else // defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
> + using std::basic_string_view;
> + using std::string_view;
> +--
> +2.20.1
> +
> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> index 6494e25bf0..53a9f66117 100644
> --- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "git://
> github.com/mongodb/mongo.git;branch=3Dv4.0 \
>             file://arm64-support.patch \
>
> file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
>             file://0001-Support-deprecated-resolver-functions.patch \
> +           file://0001-asio-Dont-use-experimental-with-clang.patch \
>             "
>  SRC_URI_append_libc-musl =3D"\
>             file://0002-Fix-default-stack-size-to-256K.patch \
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

