Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E21A748CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 18:18:00 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id c19-v6so11384872pls.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 11:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QDPvNbDUjJ8lh9E5tKsCGcxZ9EZK3f5N2WzdbotgO+s=;
	b=AgdetpAdv1CVHfOROD9q0l18SmmADW9qZqoqpZSZ0gA+BfVpryP+isoh5D7sjPVB3r
	frK9hCm5AcRHwbKJshEtKbDzEtJLi1SPM983/15Etet5H0bzZIBPo3QRZsQO+fO0lEgN
	8ka2cw/12xoYsC01hY2h3gRmddkb4N8kxTSKZ0C8XutaEJddv2OZmeiQw6g759OBxyy9
	cr24+44JL++McENwgzfLlbnXus5szAwf2i4rY/1gXwf7MF/sFDs10jWj5+MbfoEkjJJA
	Ku3ScsAptwesXDuMVZkKqBU74MhdhnTer8mvmdZ64uZ6Vf7H6Iv+FcuurvmhmA2uJWx2
	Xsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QDPvNbDUjJ8lh9E5tKsCGcxZ9EZK3f5N2WzdbotgO+s=;
	b=WN4PdFPRLjuejaORKcZg0ZFIkfAP3FXY5gMbK19t28IL1uJ4EWhUe23gCpZ3n0ZLxu
	d6IP/T+13UrB78jy97mO7iklTbGmc/lIf8wDmQNJWcD8QM82PvaC3hqsLtFnTjmws1cs
	hfXzpMEkf/RUOtfbk2LW80MTRnRjDKrptXeVG4Kq+0c+pmYAwNTN+cv7ncuJD71kb0MP
	pzqxTotbPfvm128l80VJzxOkZymp+CJgUN7wnGWBfaIZ484iQ8djt7+4Ecc2ehCuLtY3
	+ZjY/RKOfq5aPY05mgaast5zEFHNB8jr+fXjpGvro5uyHeM2LsvimIAtnKhudBGEcruy
	0uMQ==
X-Gm-Message-State: ALKqPwcKXDbmY+w4U5R/0KewNJumPrpZdYZC7ivyKRka0Clanx6HgxQr
	R+7CENT//LNTuwagdjbEk1v+vNL7r6uqgLoUiJg=
X-Google-Smtp-Source: AB8JxZqJ3X8KncR8pAkZgIcHreY9aAOgWBqhlCQ+YUySGY203YtCQvz304OSl12IXjvUZh3DVq9xAb/nR4SWXsisQv8=
X-Received: by 2002:a17:902:28ab:: with SMTP id
	f40-v6mr26062866plb.208.1527013081130; 
	Tue, 22 May 2018 11:18:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Tue, 22 May 2018 11:17:30
	-0700 (PDT)
In-Reply-To: <20180522122500.4092-1-richard.leitner@skidata.com>
References: <20180522122500.4092-1-richard.leitner@skidata.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 May 2018 14:17:30 -0400
Message-ID: <CAMKF1spmcZsgQzsvBXhNtoovvZUWtwv9hanzf=L9Yuiu_xYAnw@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@g0hl1n.net
Subject: Re: [meta-oe][PATCH] uhubctl: add recipe
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
X-List-Received-Date: Tue, 22 May 2018 18:18:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 8:25 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> Add recipe for uhubctl v2.0.0, an utility to control USB power per-port
> on "smart" USB hubs.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  ...001-Makefile-set-program-version-to-2.0.0.patch | 34 ++++++++++++++++++++++
>  meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb   | 22 ++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch
>  create mode 100644 meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
>
> diff --git a/meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch b/meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch
> new file mode 100644
> index 000000000..e9e06bc71
> --- /dev/null
> +++ b/meta-oe/recipes-support/uhubctl/files/0001-Makefile-set-program-version-to-2.0.0.patch
> @@ -0,0 +1,34 @@
> +From 4f241d2f407e834c30db4047cfb6863cd5f14ea6 Mon Sep 17 00:00:00 2001
> +From: Richard Leitner <richard.leitner@skidata.com>
> +Date: Tue, 22 May 2018 13:42:20 +0200
> +Subject: [PATCH] Makefile: set program version to 2.0.0
> +
> +Remove the dynamic PROGRAM_VERSION gathering via "git describe" an
> +replace it with the hardcoded value "2.0.0".
> +
> +This is needed because "git describe" fails with an error when executed
> +in a non-git directory as it will occur when uhubctl source is not
> +downloaded via "git clone". But for example as an source archive.
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + Makefile | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 7074cbf..c80fa17 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -14,8 +14,7 @@ RM           := rm -rf
> + CC ?= gcc
> + CFLAGS ?= -g -O0
> + CFLAGS += -Wall -Wextra -std=c99 -pedantic
> +-GIT_VERSION := $(shell git describe --abbrev=4 --dirty --always --tags)
> +-CFLAGS += -DPROGRAM_VERSION=\"$(GIT_VERSION)\"
> ++CFLAGS += -DPROGRAM_VERSION=\"2.0.0\"

can we do it via some other means ? may be via sed or some such and use ${PV}
be used instead of hardcoding version.

> +
> + ifeq ($(UNAME_S),Linux)
> +       LDFLAGS += -Wl,-z,relro -lusb-1.0
> +--
> +2.11.0
> +
> diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
> new file mode 100644
> index 000000000..80fc92332
> --- /dev/null
> +++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "USB hub per-port power control"
> +HOMEPAGE = "https://github.com/mvp/uhubctl"
> +BUGTRACKER = "https://github.com/mvp/uhubctl/issues"
> +DEPENDS = "libusb1"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "\
> +    https://github.com/mvp/${PN}/archive/v${PV}.tar.gz \
> +    file://0001-Makefile-set-program-version-to-2.0.0.patch \
> +    "
> +SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
> +SRC_URI[sha256sum] = "4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +

this looks redundant.

> +do_install () {
> +    oe_runmake install DESTDIR=${D}
> +}
> +

do we need this ?

> +FILES_${PN} = "${sbindir}/uhubctl"

Do we need this ?

> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

