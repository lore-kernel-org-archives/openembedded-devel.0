Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 200146E672
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 04:28:31 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v104so14850732wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jun 2017 21:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rq+LpX+hSHFlV3KjMeAEqWxDStla1tUMlEoIOfQezfc=;
	b=REawhx0XHF1x1kKZnvb3BqMCtjDj4xb05SgnkybYnP917+MQ1oxA1/3cCxqxoH+wp2
	TQPNMUPtk5Op0PPNxJBwiqATMI8mLjHDU7wtVmt7IKErZPJ42eFTrJr26X2MXijlqzPQ
	pfRiAr7oKIqFQ762Ftp/a6lrQTkc+W0LYCM11XFfOopE6LLA3kOFUyJlT0sORisl6QLR
	8RMKzM95iL581k8QrfrJ45axWOtVLEAUKN3QB3mo6q6QSwqv2Z827fRd5/pH/YulaNpA
	1W+vAk0dAjPB0/Z53AbGgRnP8Q7uIlHd4b4m1lGzs6vVVc1bTb1gRbW2cqJCUfNSQP9c
	F/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rq+LpX+hSHFlV3KjMeAEqWxDStla1tUMlEoIOfQezfc=;
	b=GHKT/j08/KjoGIqXqEb3rGp6DUgQp7X1nZAblbhJxXhtJAQHxnOLeZZZNvsbIPu45i
	c3879JUTi0flmaiyMHaJCJWeVTvhM9oHmwQGHEDSqQtbo/DAvtF0kUGwtEYb1127NaSk
	ac85IFY+OQ3QKOoIiscpttxMLyvGk0SOWSDZOfWc9ySXh9KC9DjTfZadOiSXDbctMQZ0
	QdWDZcfobTf+Zd/xTCAhYXAN052qqiP/ykMa1H32a2v45WNfV+TdDBZIAK/3hn6G7y0o
	8cdZaeJr/SIfY4Yvp/ujM54/VcW7ISE39liGyx38mLYR9Jf6ws8ZTxdZKonhDC9ddxDB
	OP1g==
X-Gm-Message-State: AODbwcB+bdJ5GwbgLJ7/3waMoTyKMUbytDusJhRKudk/IefKT+5TSLeu
	cTJ5HOgNJ7OOTrWDzA0G1Yx2aoEiBg==
X-Received: by 10.80.182.35 with SMTP id b32mr39509837ede.123.1497155312806;
	Sat, 10 Jun 2017 21:28:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Sat, 10 Jun 2017 21:28:02 -0700 (PDT)
In-Reply-To: <1497133168-19819-1-git-send-email-maryan.pricak@gmail.com>
References: <1497133168-19819-1-git-send-email-maryan.pricak@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Jun 2017 21:28:02 -0700
Message-ID: <CAMKF1sqjyTTGnJFqTFd-0O=odVqWdFHMug5Y8puoR2cn4JFXZA@mail.gmail.com>
To: Marian Pritsak <maryan.pricak@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hiredis: Add recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 04:28:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 10, 2017 at 3:19 PM, Marian Pritsak <maryan.pricak@gmail.com> wrote:
> Hiredis is a C client library for Redis database.
>
> Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
> ---
>  .../0001-Makefile-remove-hardcoding-of-CC.patch    | 32 ++++++++++++++++++++++
>  meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb | 24 ++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
>  create mode 100644 meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
>
> diff --git a/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
> new file mode 100644
> index 0000000..fef2bc7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
> @@ -0,0 +1,32 @@
> +From d13b918a3ff8b0ebfd1e7b18b198b4b45841d720 Mon Sep 17 00:00:00 2001
> +From: Andrea Galbusera <gizero@gmail.com>
> +Date: Fri, 31 Jul 2015 16:42:08 +0200
> +Subject: [PATCH] Makefile: remove hardcoding of CC
> +
> +* upgrade previous patch to avoid wiping CFLAGS. This fixes build on arm
> +platforms which previously caused and issue due to -fPIC being lost
> +
> +Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> +---
> + Makefile | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 8b0f0c2..66a4317 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -34,11 +34,6 @@ define REDIS_TEST_CONFIG
> + endef
> + export REDIS_TEST_CONFIG
> +
> +-# Fallback to gcc when $CC is not in $PATH.
> +-CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
> +-OPTIMIZATION?=-O3
> +-WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
> +-DEBUG?= -g -ggdb
> + REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) $(ARCH)
> + REAL_LDFLAGS=$(LDFLAGS) $(ARCH)
> +
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
> new file mode 100644
> index 0000000..c1b905f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Minimalistic C client library for Redis"
> +HOMEPAGE = "http://github.com/redis/hiredis"
> +LICENSE = "BSD-3-Clause"
> +SECTION = "libs"
> +DEPENDS = "redis"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
> +SRC_URI = "git://github.com/redis/hiredis;protocol=git;rev=f58dd249d6ed47a7e835463c3b04722972281dbb \
> +           file://0001-Makefile-remove-hardcoding-of-CC.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_compile() {
> +  cd ${S}
> +  oe_runmake
> +}

I think you can inherit autotools-brokensep instead of autotools and
completely get rid of
do_compile override

> +
> +do_install() {
> +  cd ${S}
> +  oe_runmake PREFIX=${D}/usr INSTALL='cp -r' install
> +  cp hiredis.pc ${D}/${libdir}/pkgconfig/
> +}

you dont need to cd into ${S} then. Can you explain why INSTALL needs to be
overridden ?

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

