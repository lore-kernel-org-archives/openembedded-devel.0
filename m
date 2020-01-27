Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 378B67FE1F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:59:31 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g1so46927wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 12:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=N8Ya1dgCAXw4KRalHkLyCjNYIPJ08imwaF7Onzs/f6g=;
	b=IJC9mO85/USVvZw3R1JA44TZVY140Q48x08oNM9XfICjhTgRd3g70tm87U2iIfctZ+
	rFAj/i/ZvggM84TGPE01vjfz956T9g2tRlaGUvnzn3V00mNSWnOAkqcDCuha37EgGHQw
	CUlOynIikotQ5wyPYWE+kCQoExZiMNwWyi6uX60E8wCBqmNvxxgAAQjNayjOpC5q44Uf
	09rQZ1VpYL8wbNoSzWMe4/BLUFkBovxDyaLzOGrSK/3qq8qtAnzhfh7WKSYjeFRUgbMj
	NiLHRHZGGs380B7a0HzG5GuLF0r41ktqOgDIksNq1Yk2E/FnluDg8638yeVqL88ulmYL
	lC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=N8Ya1dgCAXw4KRalHkLyCjNYIPJ08imwaF7Onzs/f6g=;
	b=lBo96CAw/OnWiPXjbHYB/eliSTikt5uXxGn3rjgtcItaHEM6rYp71b3OdtBOjyqdc9
	C7El/1fCihs/q/XtSlk/vrDjcmdJH2bUGUJFuf7hCuFZEU0uWWWL61DZvMKoubg6+w27
	6CzAyjsgWRcr9JTizs/04YaJ1ZMRVlD0UMWgRjBb0XkFOWWhVqbjyS5TDZAXOf/d7r3C
	X3BXaSrNlaOXWoUFGTADc/U2fBOoic6Zqt8DTjk9zQ0pzvcZ53vn18hsW0ntvXGj1PSq
	5ZXUdT2J0IK7XzEcxwHE+FMiQD8+shvXpJHwtWGXYhFrzjuYu7nSqAWOkCpDq4Y5ZI4o
	bSXQ==
X-Gm-Message-State: APjAAAXncrTHeeaWl43tmbybmi5tBUzvoIn7fy3qEGYbZmK87UmDOg6Q
	d/JocqrbAKJoAep2PM3f+3M9o9CMkhMrsHV2aatsC/mlZrI=
X-Google-Smtp-Source: APXvYqz8+XiZJfkpGB8/vZTrr8qHas9l028lcDzD6VslPL1pFcyjoUaqLIUNuNf10xxCEa0J1tBb+uYPEvyFs3rwZgM=
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr562435wma.24.1580158771651; 
	Mon, 27 Jan 2020 12:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
In-Reply-To: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 27 Jan 2020 21:59:20 +0100
Message-ID: <CAHtQpK6ayzqiBn=QzrDRF+XGSA6Y0HB7Shg03N1XUYyWVu-TVw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH 1/3] pcsc-lite: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 20:59:31 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Raj,

On Mon, Jan 27, 2020 at 6:36 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> From: Andrey Zhizhikin <andrey.z@gmail.com>
>
> Update pcsc-lite recipe to target python3 since python2 is EOL and has
> been dropped from OE-Core.
>
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> ---
>  .../0001-pcsc-spy-use-python3-only.patch      | 43 +++++++++++++++++++
>  .../pcsc-lite/pcsc-lite_1.8.26.bb             |  7 ++-
>  2 files changed, 48 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
>
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> new file mode 100644
> index 000000000..3e7b0adda
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> @@ -0,0 +1,43 @@
> +From 75dd98876951d86890ceb30be521de57fd31e3c7 Mon Sep 17 00:00:00 2001
> +From: Andrey Zhizhikin <andrey.z@gmail.com>
> +Date: Mon, 27 Jan 2020 13:27:12 +0000
> +Subject: [PATCH] pcsc-spy: use python3 only
> +
> +Python2 has been EOL and most distributions would not provide any
> +support for it anymore. Since Python3 is available in all distributions
> +now, switch pcsc-spy to use it exclusively.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> +---
> + src/spy/pcsc-spy | 9 ++-------
> + 1 file changed, 2 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/spy/pcsc-spy b/src/spy/pcsc-spy
> +index 85222c6..965138e 100755
> +--- a/src/spy/pcsc-spy
> ++++ b/src/spy/pcsc-spy
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/python
> ++#!/usr/bin/env python3
> +
> + """
> + #    Display PC/SC functions arguments
> +@@ -22,12 +22,7 @@ from __future__ import print_function
> + import os
> + import signal
> + import time

Please take a note, that this block is different from the patch staged
in the [master-next] (ad388282aa2b6e286fc9f92d37d43cc061a6a753):
==================
> +-try:
> +-    # for Python3
> +-    from queue import Queue
> +-except ImportError:
> +-    # for Python2
> +-    from Queue import Queue
> ++from queue import Queue
==================

In addition to switching the interpreter, it also removes the block
which targets python2 as it does not make sense with explicit python3
interpreter invoked.

Not that I'm complaining that this patch was not taken :)
It might just be that you haven't seen the difference between this
patch and the one you picked up. Otherwise, if you feel that the
version staged is more correct - discard this patch.

> + from threading import Thread
> + from operator import attrgetter
> +
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> index 5e6084656..fb8c4a202 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> @@ -10,7 +10,10 @@ LICENSE_${PN}-spy = "GPLv3+"
>  LICENSE_${PN}-spy-dev = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
>
> -SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
> +SRC_URI = "\
> +       https://pcsclite.apdu.fr/files/${BP}.tar.bz2 \
> +       file://0001-pcsc-spy-use-python3-only.patch \
> +"
>  SRC_URI[md5sum] = "9d36882998449daceec267c68a21ff0d"
>  SRC_URI[sha256sum] = "3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9"
>
> @@ -50,6 +53,6 @@ RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} = "pcscd.socket"
> -RDEPENDS_${PN}-spy +="python"
> +RDEPENDS_${PN}-spy +="python3"
>
>  BBCLASSEXTEND = "native"
> --
> 2.17.1
>


-- 
Regards,
Andrey.

