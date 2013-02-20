Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U89sj-0003HF-TK
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 14:38:47 +0100
Received: by mail-oa0-f47.google.com with SMTP id o17so7943575oag.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 05:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=u94oxl5+zxrGxyeb15pwfKbqlveN6WOlJyVogU7WxY0=;
	b=ia5siXb9Sj4r89HCA9RE3q/vMgTurjTRA6Hh7mw5Mgi+vZHeNoPTPZkEqMH+13TCmQ
	9q9Mm7C/KHPf3glgipObCkwaUas+L3JQrWU5h6fffT56tfMi00powFuKGanBBDnHnHYe
	SfCWcF4vk9zCvXkzRDI2Qho5Tv1oVELTHG7fLZZ4bD1DigLY1MkzsM0cdVXf6xMUlMIp
	B+67tTvPtyuVM8o9nsYOGnjM4hkX/Ate4dUeDPVcnJabpLq2eTaejaj+bUCwAw0sTkhl
	HbfmX3+AedObCYJTqIbT/04g6CX0+wGEea7vYlAZiWNUTcA6EQfJes/As08gehTpgLds
	4yyA==
MIME-Version: 1.0
X-Received: by 10.60.8.65 with SMTP id p1mr9582338oea.4.1361366554609; Wed, 20
	Feb 2013 05:22:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Wed, 20 Feb 2013 05:22:34 -0800 (PST)
In-Reply-To: <1361355187-7426-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1361355187-7426-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Wed, 20 Feb 2013 10:22:34 -0300
X-Google-Sender-Auth: YJ5bDkllQb_59RBE8HbOljpRe7I
Message-ID: <CAP9ODKoT2KTTWB=DiLXwyjy7K_2wK8Osa2_i9tmbsbQXS8s+4Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] onig: do not use system headers
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
X-List-Received-Date: Wed, 20 Feb 2013 13:38:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 20, 2013 at 7:13 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> When build on host with older eglibc (Ubuntu 12.04) build fails with:
>
> /tmp/OE/build/tmp-eglibc/sysroots/genericarmv8/usr/include/bits/predefs.h:23:3: error: #error "Never use <bits/predefs.h> directly; include <stdc-predef.h> instead."
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../onig/files/do-not-use-system-headers.patch     | 44 ++++++++++++++++++++++
>  meta-oe/recipes-support/onig/onig_5.9.3.bb         |  3 +-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
>
> diff --git a/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch b/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
> new file mode 100644
> index 0000000..859446f
> --- /dev/null
> +++ b/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
> @@ -0,0 +1,44 @@
> +Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +When build on host with older eglibc (Ubuntu 12.04) build fails with:
> +
> +/tmp/OE/build/tmp-eglibc/sysroots/genericarmv8/usr/include/bits/predefs.h:23:3: error: #error "Never use <bits/predefs.h> directly; include <stdc-predef.h> instead."
> +
> +Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +Upstream-Status: not valid (OE specific patch)

From the guidelines:

  Inappropriate [reason]
  - The patch is not appropriate for upstream, include a brief reason on the
    same line enclosed with []
    reason can be:
      not author (You are not the author and do not intend to upstream this,
                  source must be listed in the comments)
      native
      licensing
      configuration
      enable feature
      disable feature
      bugfix (add bug URL here)
      embedded specific
      no upstream (the upstream is no longer available -- dead project)
      other (give details in comments)

More at: http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

> +---
> + Makefile.am        |    2 +-
> + sample/Makefile.am |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +--- onig-5.9.3.orig/Makefile.am
> ++++ onig-5.9.3/Makefile.am
> +@@ -4,11 +4,11 @@ sampledir = $(top_srcdir)/sample
> + libname = libonig.la
> +
> + ACLOCAL_AMFLAGS = -I m4
> + #AM_CFLAGS = -DNOT_RUBY
> + AM_CFLAGS =
> +-INCLUDES  = -I$(top_srcdir) -I$(includedir)
> ++INCLUDES  = -I$(top_srcdir)
> +
> + SUBDIRS = . sample
> +
> + include_HEADERS = oniguruma.h oniggnu.h onigposix.h
> + lib_LTLIBRARIES = $(libname)
> +--- onig-5.9.3.orig/sample/Makefile.am
> ++++ onig-5.9.3/sample/Makefile.am
> +@@ -1,10 +1,10 @@
> + noinst_PROGRAMS = encode listcap names posix simple sql syntax crnl
> +
> + libname = $(top_builddir)/libonig.la
> + LDADD   = $(libname)
> +-INCLUDES  = -I$(top_srcdir) -I$(includedir)
> ++INCLUDES  = -I$(top_srcdir)
> +
> + encode_SOURCES  = encode.c
> + listcap_SOURCES = listcap.c
> + names_SOURCES   = names.c
> + posix_SOURCES   = posix.c
> diff --git a/meta-oe/recipes-support/onig/onig_5.9.3.bb b/meta-oe/recipes-support/onig/onig_5.9.3.bb
> index 230e585..f67ceed 100644
> --- a/meta-oe/recipes-support/onig/onig_5.9.3.bb
> +++ b/meta-oe/recipes-support/onig/onig_5.9.3.bb
> @@ -5,7 +5,8 @@ HOMEPAGE = "http://www.geocities.jp/kosako3/oniguruma/"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0d4861b5bc0c392a5aa90d9d76ebd86f"
>
> -SRC_URI = "http://www.geocities.jp/kosako3/oniguruma/archive/onig-${PV}.tar.gz"
> +SRC_URI = "http://www.geocities.jp/kosako3/oniguruma/archive/onig-${PV}.tar.gz \
> +           file://do-not-use-system-headers.patch"
>
>  SRC_URI[md5sum] = "0d4eda2066d3c92970842a6790ce897a"
>  SRC_URI[sha256sum] = "c3bba66b2a84760e6582c40881db97c839d94f327870009724bb8b4d0c051f2a"
> --
> 1.8.1.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


