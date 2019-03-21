Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 10CA27CE63
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:55:13 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id s1so6387024qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OZ65L6SUPaZZQKOOR5ghLVaM43d3FQTBNdiA2fz0aM4=;
	b=giOtIS91vV+Oa32ls0OJZmTf78V692AS4JwOBUQQlJ+n0VanajorePh5/U1JfwDA0/
	xLMhhFbSU/a6nvnLPmxkmJ6qtFdH6WoLMhCYECtkreTuo547BM3IAH2rfhnJU+TDNJB9
	srUjyAhCV+ikUgPVyneHDe4qsefBOv4YCzGCv45tTiMRTRPHsYwFl97UXzOHyFCsXH3w
	tp5FoOMWbdOhFXaV7M8HWfgi2Q/hpxCZrKAnbkECqr4WFTrUn0f8BdpfBq2EDzcnHtQA
	J4IsfOEOTGOARwSkdCny/h9ZHsqw36rALDED6oXDkyhftskVmm2FaDgnZh54ElKk3Sf2
	Ps5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OZ65L6SUPaZZQKOOR5ghLVaM43d3FQTBNdiA2fz0aM4=;
	b=Ug/IG1Ysy4rboVkiuA4poi22/32BjcDxZulvtkwDIG9ESy1uPjwp8HjxLv8e6SWOwV
	FAKGQq2WGygIJbOilj6Fv6aJRKcmcvEHhirTcfeZ/XF1h1gYAC/AHZdJHGNPK1q0IXhq
	ZgEe31OeCg5Sw6llTJ+5qEhR5S1Y2DYwfZqc2z5YAh6j2XdbJR/30oJ0DzLZKeBlPKCD
	CBM3/4/1kJIq+4VdDinzlqYGBEvoahu9Bdcn8XYxnSxnTZ+JGPEL0eM4t0IWqJF8ePJ2
	rFJ+PKdlKTbViC9j8oLDrSubdFQIEWyd8jrwsdQ3dNVjDFoHRuxhGqcCAPychbRur0Jk
	/+zA==
X-Gm-Message-State: APjAAAUAHfCRkPNpw8X7NILH4m6Jbzs26mJjiA3w5G0WwxEzevoGMNRZ
	hxbSKouFJ1B9pxAs2yxNIAjNd92QYDUYicH1EscGVXZ0
X-Google-Smtp-Source: APXvYqz9Q6xU+vT5W8eWcde+yJ0KUDSoa/sruietcv+uAlrolevkdiK/2YjTgL+V1lSxmJ0oYZZ+ba/3cy1L7IC8oL0=
X-Received: by 2002:ac8:2f10:: with SMTP id j16mr2870618qta.29.1553172914649; 
	Thu, 21 Mar 2019 05:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190319185054.28570-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190319185054.28570-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Mar 2019 05:54:48 -0700
Message-ID: <CAMKF1sr1woN-ga0e1pAypc8GdwVNsurJMNNJxK5aecS1HiZRTA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] blueman: update to 2.0.8
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
X-List-Received-Date: Thu, 21 Mar 2019 12:55:14 -0000
Content-Type: text/plain; charset="UTF-8"

fails with systemd
https://errors.yoctoproject.org/Errors/Details/233766/

On Tue, Mar 19, 2019 at 11:51 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../blueman/0001-Fix-building-on-musl.patch   | 56 +++++++++++++++++++
>  .../{blueman_git.bb => blueman_2.0.8.bb}      |  8 +--
>  2 files changed, 60 insertions(+), 4 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/blueman/blueman/0001-Fix-building-on-musl.patch
>  rename meta-networking/recipes-connectivity/blueman/{blueman_git.bb => blueman_2.0.8.bb} (78%)
>
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-Fix-building-on-musl.patch b/meta-networking/recipes-connectivity/blueman/blueman/0001-Fix-building-on-musl.patch
> new file mode 100644
> index 000000000..beef5d7c5
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/blueman/blueman/0001-Fix-building-on-musl.patch
> @@ -0,0 +1,56 @@
> +From ff03542e1ff24646ef16754157a6eb6437172153 Mon Sep 17 00:00:00 2001
> +From: Kylie McClain <somasis@exherbo.org>
> +Date: Sun, 13 Dec 2015 21:32:05 -0500
> +Subject: [PATCH] Fix building on musl libc
> +
> +The addition of sys/time.h to libblueman.c is needed for `tv`'s usage,
> +which is defined by musl's time.h.
> +
> +In addition, XCASE must be defined since it is normally provided by
> +glibc's termios.h.
> +---
> + blueman/main/PPPConnection.py | 2 +-
> + module/libblueman.c           | 1 +
> + module/modem-prober.c         | 4 ++++
> + 3 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/blueman/main/PPPConnection.py b/blueman/main/PPPConnection.py
> +index 0aab1d98..1a3a9925 100644
> +--- a/blueman/main/PPPConnection.py
> ++++ b/blueman/main/PPPConnection.py
> +@@ -131,7 +131,7 @@ def Connect(self):
> +         attrs[0] &= ~(termios.IGNCR | termios.ICRNL | termios.IUCLC | termios.INPCK | termios.IXON | termios.IXANY |
> +                       termios.IGNPAR)
> +         attrs[1] &= ~(termios.OPOST | termios.OLCUC | termios.OCRNL | termios.ONLCR | termios.ONLRET)
> +-        attrs[3] &= ~(termios.ICANON | termios.XCASE | termios.ECHO | termios.ECHOE | termios.ECHONL)
> ++        attrs[3] &= ~(termios.ICANON | getattr(termios, 'XCASE', 4) | termios.ECHO | termios.ECHOE | termios.ECHONL)
> +         attrs[3] &= ~(termios.ECHO | termios.ECHOE)
> +         attrs[6][termios.VMIN] = 1
> +         attrs[6][termios.VTIME] = 0
> +diff --git a/module/libblueman.c b/module/libblueman.c
> +index 7f1626bc..a86fad59 100644
> +--- a/module/libblueman.c
> ++++ b/module/libblueman.c
> +@@ -28,6 +28,7 @@
> + #include <string.h>
> + #include <sys/ioctl.h>
> + #include <sys/socket.h>
> ++#include <sys/time.h>
> + #include <unistd.h>
> + #include <linux/sockios.h>
> + #include <linux/if.h>
> +diff --git a/module/modem-prober.c b/module/modem-prober.c
> +index daffaa4e..972ec146 100644
> +--- a/module/modem-prober.c
> ++++ b/module/modem-prober.c
> +@@ -34,6 +34,10 @@
> +
> + #include "modem-prober.h"
> +
> ++#ifndef XCASE
> ++#define XCASE 0000004
> ++#endif
> ++
> + #if PY_MAJOR_VERSION >= 3
> + #define PyString_FromString PyUnicode_FromString
> + #endif
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
> similarity index 78%
> rename from meta-networking/recipes-connectivity/blueman/blueman_git.bb
> rename to meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
> index 947db7836..459db2a73 100644
> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
> @@ -7,12 +7,12 @@ DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-nat
>  inherit autotools systemd gsettings python3native gtk-icon-cache
>
>  SRC_URI = " \
> -    git://github.com/blueman-project/blueman.git \
> +    https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
>      file://0001-Search-for-cython3.patch \
> +    file://0001-Fix-building-on-musl.patch \
>  "
> -SRCREV = "c4a03417e81e21543d4568e8e7f7de307582eb50"
> -PV = "2.0.5+git${SRCPV}"
> -S = "${WORKDIR}/git"
> +SRC_URI[md5sum] = "51dc07d48125ee9600e7f6168d6e67f6"
> +SRC_URI[sha256sum] = "04afd07b4c900a401f39e711dedbf8b9cf12000ddeda0d8ef3c3327caf34704e"
>
>  EXTRA_OECONF = " \
>      --disable-runtime-deps-check \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

