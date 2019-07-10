Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id DDB287EDB2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 16:23:32 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j19so3027858qtr.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1J4C/9JF9h/qWJc3uOeQY+J1ZyaiBTZtJ8v/c2jJG7s=;
	b=UrQhIUWzmEZNylCwdSKeYxrBue5zx/u0NG++tKQONiQFrFptbgjldFw2RICkUiSCSn
	dMQ2Urkv9ffGfW+v9LFLojtU1YNEyU1TNNz+Een7kuh65WosDJKqkPAX1xJhFZ665v5n
	aP5AXHX4N65jH7lBInq2S5JptfvahG//nKd8a/KsbRrnMLDIE3EoSdsRLNV0nyorADga
	kHs0+It7Co5w66NzzEMPLkYEjtseDZ8+9JnUozAy3adbYartHluNqAc7V9nhD8+7bbYK
	JWP2J4weioKOCHzl2T29cixE4cAKbE4qGxiSbMSzR/JqP6gL2tUj2wX0sKUwSChnYPl7
	OYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1J4C/9JF9h/qWJc3uOeQY+J1ZyaiBTZtJ8v/c2jJG7s=;
	b=dRoytvxDi9Rhhht6cIoF+YhWVzXrIex7olHZ28vUk1fFY5vwml8aW8JoPf764qYbnL
	aziovTy33d2aI5QCpJ1gyAnXKuXQJF1MfiUWF7vj229jBj9pOMXl0FgVWK/39KyvUSZ4
	vpj/VyXQF1CUjWMhpFqY8Ga5Yc1qQnCiR+spkZpaIbCD2ixCovn5n/lVymyUbSWZSmRS
	EqUXu/xUalL127ZeRU3w1mHaL5kbzr8I3JeL+8RLSj0goOZIeVWYxATlh/K+Ocn2l8au
	iOiX6E6/y/A0k5U5cBGrK9+n4+lvQhSi3OBdCZdMxHzwvK/nW/CVW/o3VRhqSQyeaQjE
	R63A==
X-Gm-Message-State: APjAAAUt3TjR+P7EPP4zKJAvk70xKCsG+ygIMxNLWkTC31/lV/+uYVb2
	hrXjSZqJ9G0NzTaS03nkRrEDC8uqO3qMYu+SD9z9+FEWcZQ=
X-Google-Smtp-Source: APXvYqxpxWU9WMG0mEUtg897BrAZFglw9RHagBaabt4XtytEywq1DKjiHnhyd8/VlC+MpCB38C1JahPnr60W4rFjTwA=
X-Received: by 2002:aed:3644:: with SMTP id e62mr23918526qtb.80.1562775813360; 
	Wed, 10 Jul 2019 09:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <1559871393-38760-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1559871393-38760-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jul 2019 09:23:07 -0700
Message-ID: <CAMKF1sqOR-Ljt5p3mMZanUtQwf5qUNdhUFEyt+zFuMv+NGoD2A@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] adcli: added new recipe.
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
X-List-Received-Date: Wed, 10 Jul 2019 16:23:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 26, 2019 at 10:57 PM Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
>
> radiusclient-ng is too old. So, added a substitute.
>

This fails to build on musl
https://errors.yoctoproject.org/Errors/Details/251280/

Can you try a patch like this and see if it works for you?
it will also fix the build on musl

--- a/library/adutil.c
+++ b/library/adutil.c
@@ -30,6 +30,7 @@
 #include <assert.h>
 #include <ctype.h>
 #include <errno.h>
+#include <endian.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>


> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../recipes-connectivity/adcli/adcli_0.8.2.bb      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
>
> diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
> new file mode 100644
> index 0000000..a98a1b3
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Active Directory enrollment"
> +DESCRIPTION = "A helper library and tools for Active Directory client operations."
> +
> +HOMEPAGE = "http://cgit.freedesktop.org/realmd/adcli"
> +SECTION = "net"
> +
> +SRCREV = "cc3ef52884a48863a81acbfc741735fe09cd85f7"
> +
> +SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +LICENSE = "LGPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
> +
> +inherit autotools xmlcatalog
> +
> +DEPENDS += "virtual/crypt krb5 openldap gettext libxslt xmlto libxml2-native \
> +            cyrus-sasl libxslt-native xmlto-native coreutils-native\
> +           "
> +
> +EXTRA_OECONF += "--disable-static \
> +                 --disable-silent-rules \
> +                 --disable-doc \
> +                "
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

