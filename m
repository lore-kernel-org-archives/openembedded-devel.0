Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDA260EA3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 01:12:21 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id w47so305900qtk.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2020 17:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gH//ZhHEaI/B0rYU8FC9Kb0zc06dAI20AJDawqwrkGc=;
	b=jgKjI2LfR3SRANnIsn9qy/KQvBX7qFUA2THX+QSVepQZIrIVy1uGHRf0q4/Z4fOrf6
	XLinRVba9xqkRAUN2BnQrYngCC+/DMF97YlcRqq8BxWl5WzEM7aeZFMvWKX2HnEjtk5D
	X5WRawyG2n8xgqDl6wyx/HsLtTHinQ2t5RBtBEPmbA9U19mEftuDlLpyQHaNw5Jqcnsv
	IbfKRn+Y47sLqjCSGIwBlisfuXU8i6oxZaNieyxvNUJ9lhBN7D6BFBdIdr+FCQq9n9qf
	jJ9aerJLUqPdazgG5L6wRnxROi2md9LHUhKim8PdM+5K7dueleMbSBWQH3YogeAPDHbU
	oqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gH//ZhHEaI/B0rYU8FC9Kb0zc06dAI20AJDawqwrkGc=;
	b=kdLnmBkJEi88zXpTd52Kn+ut7rYVkglyrMh9D3FYGVbkbHGvWI+nzkGXmuQ2ItuAkJ
	jai9yCtxYYfjLYB3Mft0WWK+2DGE6bOQ6Lq8rt6pfnNIIXmUNvt6JXQ7cuaG5pBMST+z
	GRkTnAEMJb+UAlNnz6zfie0mT4X1Zto8mpF9zDwB8QbyvkFceEj36RYnJSNU+G7VE0Id
	t2lw1hJ4ptUvxjxdjZRB4iKHnGQt4n5qFVSqjF8KGwhLz3c+xz9a47SWwQcUOMwFmmuI
	Y3aClwe3ayTQ6XHIrRAWcajal4PVibLwT+bRpK8d53qtahWWn1+qMQv+Md68ESQlsJtS
	Z3dg==
X-Gm-Message-State: APjAAAXEsjIaMPeMx9yNThDUnpyKIxAz8I6sFNjGQxmEr1AEGFMOxAp+
	36sqXr7YdtAWceUZj0bswLa+FoZ2TRbG4eBdT80=
X-Google-Smtp-Source: APXvYqwFd1sSnqA27WZEnZjTt4BARe2cvjF5QlVPTTREb/JIeV8Fu1sxxaigaC7PLLHDDH9JD1s4ZaDEno7PVL2S9i0=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr31593915qtq.53.1580865141502; 
	Tue, 04 Feb 2020 17:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20200204092126.19209-1-asmithakarun@gmail.com>
In-Reply-To: <20200204092126.19209-1-asmithakarun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Feb 2020 17:11:55 -0800
Message-ID: <CAMKF1sqpBXWGgxhu1xBAmu_1C_QvKC03ydndDe1iFiy=woDi7g@mail.gmail.com>
To: Asmitha Karunanithi <asmithakarun@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Library to aid multi-part form data parsing
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
X-List-Received-Date: Wed, 05 Feb 2020 01:12:21 -0000
Content-Type: text/plain; charset="UTF-8"

it also fails on musl/aarch64

https://errors.yoctoproject.org/Errors/Details/385285/

On Tue, Feb 4, 2020 at 1:21 AM Asmitha Karunanithi
<asmithakarun@gmail.com> wrote:
>
> From: asmitha <asmithakarun@gmail.com>
>
> Mimetic library helps parsing the multi-part form data. This library
> can be used for scenarios that includes multi-part form data file uploads
> to the BMC.
>
> The patch file (config.patch) includes:
> i) addition of a compilation flag - "no-narrowing" since this has been
> treated as warning in earlier versions of c++ and now with the higher
> versions, this is treated as errors.
> ii) the test directory is removed as there were errors (relocation errors)
> since the shared object files of libc++ and libc were not taken from the
> sysroot path but from the system's library path where the required
> version of the .so is not present.
>
> Signed-off-by: asmitha <asmithakarun@gmail.com>
> ---
>  .../libmimetic/libmimetic/config.patch        | 25 +++++++++++++++++++
>  .../libmimetic/libmimetic_0.9.8.bb            | 19 ++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic/config.patch
>  create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
>
> diff --git a/meta-oe/recipes-support/libmimetic/libmimetic/config.patch b/meta-oe/recipes-support/libmimetic/libmimetic/config.patch
> new file mode 100644
> index 000000000..52bf7b450
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmimetic/libmimetic/config.patch
> @@ -0,0 +1,25 @@
> +diff --git a/Makefile.am b/Makefile.am
> +index 634bd4c..c7cbae7 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,6 +1,6 @@
> + MAINTAINERCLEANFILES = Makefile Makefile.in config.cache
> + EXTRA_DIST=LICENSE m4
> +-SUBDIRS = mimetic doc examples test win32
> ++SUBDIRS = mimetic doc examples win32
> + INCLUDES=-I$(top_srcdir)
> + ACLOCAL_AMFLAGS=-I m4
> +
> +diff --git a/configure.in b/configure.in
> +index 5e8f3d4..af1018e 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -30,7 +30,7 @@ debug_enabled=false
> + dnl CFLAGS and CXXFLAGS default to -O2 -g
> +
> + dnl CXXFLAGS="$CXXFLAGS -DNDEBUG -fno-exceptions"
> +-CXXFLAGS="$CXXFLAGS -DNDEBUG"
> ++CXXFLAGS="$CXXFLAGS -DNDEBUG -Wno-narrowing"
> +
> + AC_ARG_ENABLE(debug,
> +   [  --enable-debug[=LEVEL]  enables debug symbols [default=2]],
> diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> new file mode 100644
> index 000000000..a0a704188
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> @@ -0,0 +1,19 @@
> +# Released under the MIT license.
> +
> +SUMMARY = "Mimetic Library for multi-part parsing"
> +DESCRIPTION = "Email library (MIME) written in C++ designed to be easy to use and integrate but yet fast and efficient."
> +AUTHOR = "Stefano Barbato <stefano@codesink.org>"
> +HOMEPAGE = "http://www.codesink.org/mimetic_mime_library.html"
> +BUGTRACKER = "https://github.com/LadislavSopko/mimetic/issues"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b49da7df0ca479ef01ff7f2d799eabee"
> +
> +SRCREV = "50486af99b4f9b35522d7b3de40b6ce107505279"
> +SRC_URI += "git://github.com/LadislavSopko/mimetic/ \
> +            file://config.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

