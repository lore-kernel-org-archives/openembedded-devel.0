Return-Path: <net147@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id CB9206612C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 May 2016 08:37:46 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id d62so161783016iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2016 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=gG36xKmXnxcRp+DL86ih8JDRiMiucNZ/yFTrn+uB0pU=;
	b=XdfdkgtHkcDcB6ZGbtkcJi82XahJ/PZIFc+QO9DXJatuEhS1xHzmWJ8ydVbHk/WQcS
	i1ONUuqCub0xh/SfNF6TCtr04VUmtMhjRDzYBwgdzNkCJ7IET0Q+MU6+dpPiL1RQB6Lk
	0+9hsmsxyvv7RQZailJK/KOnH9s4atqgrbecGpgcs925YTamAVLOHslAgKioJ/uSE/iM
	1CCrxdetmgJrqtXMVOVicDqNG3mXVHo/zS/xYNexcuecSbSa5NW3WKzlqNKkreNVgUmG
	ceyJHd2gBbQ9dmcBl6xlRIkb5ZKRse6W6XapUwYipMbM3tmw2rEBYwMJcD1a4068N4HP
	2ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=gG36xKmXnxcRp+DL86ih8JDRiMiucNZ/yFTrn+uB0pU=;
	b=Wp1IRI76sn4YAlQWDBFyhet2Ym8QtF67IyRkqlgt0hIs9pj0MpgVy69SVmGTnpTxL7
	xqnCeSEtEPBGWcFoKekjau0NoxAa847w1HWOEO95IQ7bkdMub5rnZf8wu8bxhEtcqMZD
	CKxa03m107VE/CQN3NU9CzeCmdKBjOhbqlGQDE0BRNBogNNw638p1MPGccyR8Ioiuo9o
	UR854Vl/UWFCes9PAtxPrDzmEgA81d0JKj5exSY5V1JRgVYiPfLWppm7qTxwTmI6niqR
	cG67VrBmisdeVtVci/mdEZhm6bpc9eg3nkB/0JPGFxAmDGKnL3c4YNR9CUwhXtmfP6lH
	QkIQ==
X-Gm-Message-State: AOPr4FUKUAmJESaZPaarhO7FTVRqiGBFkhmA4lUoSsohVKbCaZ8uSinKeo/ASeq2mAFUPHRZkcJbN+yegUdqdg==
MIME-Version: 1.0
X-Received: by 10.107.182.138 with SMTP id g132mr34663074iof.27.1462178267080; 
	Mon, 02 May 2016 01:37:47 -0700 (PDT)
Received: by 10.36.69.40 with HTTP; Mon, 2 May 2016 01:37:47 -0700 (PDT)
In-Reply-To: <1461909488-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1461909488-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Mon, 2 May 2016 18:37:47 +1000
Message-ID: <CANwerB2JV=wDngzfxLzTehOHwQ95=VcfYQsD2RfeAm6hcyE8tw@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtchooser: add new recipe
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
X-List-Received-Date: Mon, 02 May 2016 08:37:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi Li,

On 29 April 2016 at 15:58, Li Xin <lixin.fnst@cn.fujitsu.com> wrote:
> qtchooser is a wrapper used to select between Qt binary versions.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../0001-Makefile-install-the-man-dir.patch        | 35 ++++++++++++++++++++++
>  recipes-qt/qtchooser/qtchooser_39.bb               | 24 +++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 recipes-qt/qtchooser/qtchooser/0001-Makefile-install-the-man-dir.patch
>  create mode 100644 recipes-qt/qtchooser/qtchooser_39.bb
>
> diff --git a/recipes-qt/qtchooser/qtchooser/0001-Makefile-install-the-man-dir.patch b/recipes-qt/qtchooser/qtchooser/0001-Makefile-install-the-man-dir.patch
> new file mode 100644
> index 0000000..8e8e1c6
> --- /dev/null
> +++ b/recipes-qt/qtchooser/qtchooser/0001-Makefile-install-the-man-dir.patch
> @@ -0,0 +1,35 @@
> +From 3f142e100cc3dd69b816ce79152760c823cb86e9 Mon Sep 17 00:00:00 2001
> +From: Li Xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 29 Apr 2016 12:41:34 +0900
> +Subject: [PATCH] Makefile: install the man dir
> +
> +upstream-status: backported
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + Makefile | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 20b9100..1fd8cd3 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,5 +1,6 @@
> + prefix = /usr
> + bindir = $(prefix)/bin
> ++MKDIR  = mkdir -p
> + TOOLS = assistant \
> +       designer \
> +       lconvert \
> +@@ -56,6 +57,8 @@ install:
> +       case `uname -s` in Darwin) \
> +           for tool in $(MACTOOLS); do ln -sf qtchooser "$(INSTALL_ROOT)$(bindir)/$$tool"; done \
> +       ;; esac
> ++      $(MKDIR) $(INSTALL_ROOT)$(prefix)/share/man/man1
> ++      install -m 644 -p doc/qtchooser.1 $(INSTALL_ROOT)$(prefix)/share/man/man1
> +
> + uninstall:
> +       cd src/qtchooser && $(MAKE) uninstall
> +--
> +1.8.4.2
> +
> diff --git a/recipes-qt/qtchooser/qtchooser_39.bb b/recipes-qt/qtchooser/qtchooser_39.bb
> new file mode 100644
> index 0000000..7fceb9c
> --- /dev/null
> +++ b/recipes-qt/qtchooser/qtchooser_39.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Wrapper to select between Qt development binary versions"
> +HOMEPAGE = "http://macieira.org/qtchooser"
> +LICENSE = "LGPLv2 | GPLv3"
> +SRC_URI = "http://macieira.org/qtchooser/${BP}-g4717841.tar.gz \
> +           file://0001-Makefile-install-the-man-dir.patch"
> +SRC_URI[md5sum] = "fcf1b5e8373147e48ce72b9c1ffe3d10"
> +SRC_URI[sha256sum] = "4681d0561bf96599bf9bf5eb25103d07ee8f045f31576dc2e72b8529587a67c6"
> +
> +LIC_FILES_CHKSUM = " \
> +    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
> +"
> +S = "${WORKDIR}/${BP}-g4717841"
> +
> +inherit pkgconfig
> +
> +do_compile() {
> +    oe_runmake
> +}
> +
> +do_install() {
> +    oe_runmake install INSTALL_ROOT=${D}
> +}
> --
> 1.8.4.2

Wouldn't it be better to use the latest version from
http://code.qt.io/cgit/qt/qtchooser.git/?

Regards,
Jonathan

