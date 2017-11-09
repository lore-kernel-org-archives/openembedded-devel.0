Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A62507834C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 20:43:51 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t139so20318310wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Nov 2017 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+WO1rB1tYA9yEFe85UhsScQ42z7+FHTBBYfJBnj4UAk=;
	b=aYgOl++GJK0YnKJYdL08UGXQd2VZ3W3PbEsvLeUVcWkUi0VHQpbC7ng0mJo9BONeoV
	yJv4WLbqjj9guJVtWbavuagHG6nXwUUVtacI46Y9GPoUUtBPwhZx/7X59yaSGgq+ZmBq
	aOjmyze+E3xmTxBcByETshtvy8p4GPc/4xCokltS3VK26Q94q3TW10pFLTEXeqk2zV9f
	sNxiw+6T7sUmISX8zwbkQhZvYCF8U/2wWA8DIKWXcL5cffvsqbmkmV/aQFr/6Oa9FWBp
	/S/dKD4/NChQd5kRNK4ujFLSHon8q0om6XdNxFBs2gop6denQUXz5abkun0V3pyTxNr0
	sxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+WO1rB1tYA9yEFe85UhsScQ42z7+FHTBBYfJBnj4UAk=;
	b=W78CZxrQkyV5UzROMbN8ZaDjTOXphUJ2HIZaNo3XikbVnGf8V1Ce8ryujOAR6f+pW1
	9rt1VmZNAjJYtzeYc8N9/Wuia38DibnoIzcVI7Eiw3tWypVx+bStE60CqrVgMyLimz0P
	FdOaVMQFPpooX5U9wt9ZE8SK1pb699IULzN4H5O1EFkkD9WVSsImScG6OA+Y1b+Xtlh9
	uHxRVXexy6uP9eKZiWmtunZ1rdHSN5nZbDbYGqHTlSkiiCHZetPMaJkSzTTHcqFH5Q8w
	H6kkdP8bN89FLDZiSxDdv5Zy+X8JWxYrwEu5IdgZezvV38zZ5XhN0hEGOf103hlp/+g2
	RoFw==
X-Gm-Message-State: AJaThX6PpZqX9MsP56fRJAVpkEZLW/uQeJgpN9SlggcKjVrsHLEipJl2
	T2sdAwz1hbfKbgQohJVSBpVwjhI/pXVscy33JEU=
X-Google-Smtp-Source: AGs4zMa5mI0OLBoj+/7sG/ARxO5p1mkcMuvP0dbVMBkqF5VuuBVKwifMyp8VjfYv7h5aDnty9H48t0NdLy6w7HC7G3U=
X-Received: by 10.28.54.89 with SMTP id d86mr810432wma.101.1510260232053; Thu,
	09 Nov 2017 12:43:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Thu, 9 Nov 2017 12:43:51 -0800 (PST)
In-Reply-To: <1507143118-9319-1-git-send-email-armccurdy@gmail.com>
References: <1507143118-9319-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 9 Nov 2017 12:43:51 -0800
Message-ID: <CAJ86T=Xfmmszw6aqEnGPpZkLwFzSST_gWmDTGxmyNzWJ1VcriQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][morty][PATCH] mariadb: Do not use ucontext_* APIs with musl
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
X-List-Received-Date: Thu, 09 Nov 2017 20:43:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 4, 2017 at 11:51 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> musl has ucontext.h header but does not implement the APIs

Ping. CCing Armin.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit b545c0643d2b2a1f1a816e789ff67116c613de5b)
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-oe/recipes-support/mysql/mariadb.inc          |  1 +
>  .../mariadb/0001-disable-ucontext-on-musl.patch    | 28 ++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
> index 689b8ab..f3eb4c7 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -16,6 +16,7 @@ SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${P
>             file://configure.cmake-fix-valgrind.patch \
>             file://fix-a-building-failure.patch \
>             file://change-cc-to-cc-version.patch \
> +           file://0001-disable-ucontext-on-musl.patch \
>            "
>  SRC_URI[md5sum] = "fca86f1eaed2163b4bdce4f98f472324"
>  SRC_URI[sha256sum] = "e142f9459507b97c5848042863b313ce70750118446bb4e35e5c07fe66007293"
> diff --git a/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch b/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
> new file mode 100644
> index 0000000..60e9199
> --- /dev/null
> +++ b/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
> @@ -0,0 +1,28 @@
> +From 5bc3e7ef9700d12054e0125a126f1bb093f01ef9 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 26 Mar 2017 14:30:33 -0700
> +Subject: [PATCH] disable ucontext on musl
> +
> +musl does not have *contex() APIs even though it has ucontext.h header
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/my_context.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/my_context.h b/include/my_context.h
> +index dd44103..9b28c17 100644
> +--- a/include/my_context.h
> ++++ b/include/my_context.h
> +@@ -31,7 +31,7 @@
> + #define MY_CONTEXT_USE_X86_64_GCC_ASM
> + #elif defined(__GNUC__) && __GNUC__ >= 3 && defined(__i386__)
> + #define MY_CONTEXT_USE_I386_GCC_ASM
> +-#elif defined(HAVE_UCONTEXT_H)
> ++#elif defined(__GLIBC__) && defined(HAVE_UCONTEXT_H)
> + #define MY_CONTEXT_USE_UCONTEXT
> + #else
> + #define MY_CONTEXT_DISABLE
> +--
> +2.12.1
> +
> --
> 1.9.1
>

