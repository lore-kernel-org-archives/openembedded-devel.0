Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 00F9660116
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 18:34:15 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j12so8819198vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 10:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=R7XJs2tHocyuR0+36FReQLZUkDxEFUVkGF8/yluhq6w=;
	b=EtnHe1v0WXq6uJHZRGJgbouSQEYCHUPmTOIv6MiMZ5D1pEtqvYJdBBdZTDwUpQcfWa
	/ui0iOweahL4nwEPZlv1s4VE+znf2kVwxpEywQ/DcGUDHAOOOZYuL4pmUP7ig5xwAZZj
	fCw2Rb/3CWbAXnsh59AhH1KTgT9gegEWlvSGfW+h/LABEDlEvuZkICi7X0jGCqocHuzQ
	7MUGHy7mFgjqaLMyNGzPBXuE+vj7yue+oVX0Yt6v+6wCJ8/ci1IMnxAAgifbI1HVc5xa
	QGhlJhKp4Za/2esr1jmGqfg3klg5n3jljI9Bg8bqoFTmN6jOeNLGuP0v3BKr/y84aq8/
	BYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=R7XJs2tHocyuR0+36FReQLZUkDxEFUVkGF8/yluhq6w=;
	b=o5770V9qEys/eAItCbnCNci9nS2pnlbzyxa5Cc3z+i41lPCcncAeliOH8X9y5Mj8W8
	P2i1DW1O2CMxNX+8heO6JS0f2Rls5yoBfoUaldynheLjzNKyYhmFP8KEK73LPOy3cpie
	eEdDYvTn7irgMUt8w6rqGSCKzDcJEr8YkqsnqME/SqJ5o2GAYNQeU0Th9pdtEQ1GqAhg
	7ZhK+vw5hihx+sCHs6SRq6xrGwIdX3i8FPGIn449IO7/zhfeHxE5Fa9PnLJ7HU4LNAtC
	Ey0uBDvz9Z6gZ4hwP8c6aIA0+DJpzM/7nL6pTDuZ9hpWAWhYN3EL7GC7btixRn69fEth
	lr0Q==
X-Gm-Message-State: AIkVDXKJ5F9+SjujN2091uZ6W7AWLoKwPNJdA3z6j2F1VtrXoabbXMKsnAkzTO05ur69RQwDakztmqyEhjTEPw==
X-Received: by 10.31.115.142 with SMTP id o136mr4886029vkc.139.1484159655175; 
	Wed, 11 Jan 2017 10:34:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Wed, 11 Jan 2017 10:33:44 -0800 (PST)
In-Reply-To: <1484134588-15143-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
References: <1484134588-15143-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2017 10:33:44 -0800
Message-ID: <CAMKF1sqFQ+q-GDgWG0aqSqE2khKe6P=XGD4aF6hb6bgseJS+WA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nano: upgrade to 2.7.4
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
X-List-Received-Date: Wed, 11 Jan 2017 18:34:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 3:36 AM, Oleksandr Kravchuk
<oleksandr.kravchuk@pelagicore.com> wrote:
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  .../nano/nano-2.2.5/ncursesw.includedir.patch                | 12 ------------
>  meta-oe/recipes-support/nano/nano.inc                        |  6 +++---
>  meta-oe/recipes-support/nano/nano_2.2.5.bb                   |  8 --------
>  meta-oe/recipes-support/nano/nano_2.7.4.bb                   |  6 ++++++
>  4 files changed, 9 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
>  delete mode 100644 meta-oe/recipes-support/nano/nano_2.2.5.bb
>  create mode 100644 meta-oe/recipes-support/nano/nano_2.7.4.bb
>
> diff --git a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch b/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
> deleted file mode 100644
> index 0f224be..0000000
> --- a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -uNr nano-2.2.5.orig//configure.ac nano-2.2.5/configure.ac
> ---- nano-2.2.5.orig//configure.ac      2010-08-06 03:00:51.000000000 +0200
> -+++ nano-2.2.5/configure.ac    2010-08-10 14:11:52.000000000 +0200
> -@@ -442,7 +442,7 @@
> -     AC_CHECK_HEADERS(ncurses.h)
> -
> -     if test x$enable_utf8 != xno; then
> --      AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB="-lncursesw" CPPFLAGS="-I/usr/include/ncursesw $CPPFLAGS" CURSES_LIB_NAME=ncursesw CURSES_LIB_WIDE=yes])
> -+      AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB="-lncursesw" CURSES_LIB_NAME=ncursesw CURSES_LIB_WIDE=yes])
> -     fi
> -
> -     if eval "test x$CURSES_LIB_NAME = x"; then
> diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
> index 0f31c6c..8a9f1e8 100644
> --- a/meta-oe/recipes-support/nano/nano.inc
> +++ b/meta-oe/recipes-support/nano/nano.inc
> @@ -12,8 +12,8 @@ INC_PR = "r3"
>
>  PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
>
> -SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
> +SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
>
> -inherit autotools gettext
> +inherit autotools gettext pkgconfig
>
> -PACKAGECONFIG[tiny] = "--enable-tiny,--enable-all,"
> +PACKAGECONFIG[tiny] = "--enable-tiny,"
> diff --git a/meta-oe/recipes-support/nano/nano_2.2.5.bb b/meta-oe/recipes-support/nano/nano_2.2.5.bb
> deleted file mode 100644
> index e656f46..0000000
> --- a/meta-oe/recipes-support/nano/nano_2.2.5.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -include nano.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI += "file://ncursesw.includedir.patch"
> -
> -SRC_URI[md5sum] = "77a10a49589f975ce98350a4527a2ebf"
> -SRC_URI[sha256sum] = "9015945d1badabbada203b37c4779d3dd1066234235c714deb439989c5cd7d9e"
> diff --git a/meta-oe/recipes-support/nano/nano_2.7.4.bb b/meta-oe/recipes-support/nano/nano_2.7.4.bb
> new file mode 100644
> index 0000000..5016f2e
> --- /dev/null
> +++ b/meta-oe/recipes-support/nano/nano_2.7.4.bb
> @@ -0,0 +1,6 @@
> +include nano.inc
> +
> +PR = "${INC_PR}.0"
> +

Get rid of PR and INC_PR setting would be good

> +SRC_URI[md5sum] = "c011c7f9e47cb1da27d4e7cc8b56ec6a"
> +SRC_URI[sha256sum] = "752170643039e2c95a433de357f0c70a8c4c4c561a90a7e7259a63e225b659b9"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

