Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id E08DC7E1AB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 07:12:45 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id w25so634858ioc.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jun 2019 00:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/dNAUNeudi3zRj1EJlGuR00edFqPLOxGH+vfwoMKv1I=;
	b=CT73KqHSF3wsEvmA+g/qK3BI69bAtIj6b+TMYaErXdzPOKbqKiM7ZzwJnUv1s1hgUn
	gA1rOjREms/ZWm1aYRGMCW7U5iU2FUxGk6LDGod7U/IpfMxeE82j6OlGQ+fLFkU4uhm6
	i+yznKvatODdcV9aLm7c36PAkkRUv5kuPpYJJ+ZkLJS1oV8CBLLNKQTzCUdwCnCZ5z3D
	tX6toEvcNH8iVLW6xjoppkYm4fqtZTISeP24/sNrtFHjlm2RIj929THtvGkc3MkGhwD1
	RUySSOERh6Rp7KostS7/Eu4E4jeYw1v/QymilaqHcUjjcyrIi48IK662UJsaFu/vFtmn
	eipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/dNAUNeudi3zRj1EJlGuR00edFqPLOxGH+vfwoMKv1I=;
	b=B7MNikjnvUZJii6Q7RrvMNBz9LJ/svph/G8uorbv2u6Ldh7U8fJLZhqpWKVdhJrh9I
	FhoJYI80d65mT20cQYTu3/vsOIfstt3gdjRFBd6noOQ6qBV2kM0Khj2sFBFkn0KKTFBh
	QVLTJ28nnrhlMn5lna1xEkBAVK1pIr2Z70Yfo0S3PYgZmYtlzOKa269Kuj1rwN+FkJLw
	yy43SFV6NcOA5M3Fje9ShUrBtfUhfnBI7C1gFlbaxavAntYDPg8+3W3Gb1uk8fZapYuU
	iL/5asKIfIa9x8B5b5wjAUbY/CrEi1hOjrsvRjNrgMh1atya0wf8+UA7l12PnL3xSg1l
	jKlg==
X-Gm-Message-State: APjAAAUtuVfMRq1udfkDwOX1/QV1C74CR1SSNmxWXt2vv8+fMMPRtX3O
	IWjW5grPeJsoaJr+9TPfviBf7SZl7ZaXqHI3P08zdw==
X-Google-Smtp-Source: APXvYqxfut8lM+nkh/fwxdLId5GsB9DGQ3GgfFYN4/AMZqhvYy7k1CY6EqyTgLkfclWAzCqNDfS941jwVra94yFsgDk=
X-Received: by 2002:a6b:b642:: with SMTP id g63mr17170531iof.142.1559891566678;
	Fri, 07 Jun 2019 00:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
	<1559703841-263740-3-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1559703841-263740-3-git-send-email-changqing.li@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 00:12:35 -0700
Message-ID: <CANx9H-AQ46hCN=CzMQuGOWxjHeyEJz7ZyxW=HzXtJpxCAg2ZSA@mail.gmail.com>
To: changqing.li@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/7] python-pygobject: upgrade 3.28.3 -> 3.32.1
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
X-List-Received-Date: Fri, 07 Jun 2019 07:12:46 -0000
Content-Type: text/plain; charset="UTF-8"

Please consider providing a python3 version as well. Python2 will be EOL
soon.

On Tue, Jun 4, 2019 at 8:04 PM <changqing.li@windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> switch to meson build
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...thon-pygobject_3.28.3.bb => python-pygobject_3.32.1.bb} | 14
> +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-devtools/python/{python-pygobject_3.28.3.bb =>
> python-pygobject_3.32.1.bb} (64%)
>
> diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
> b/meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
> similarity index 64%
> rename from meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
> rename to meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
> index 348a039..c26b383 100644
> --- a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
> +++ b/meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
> @@ -4,6 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
>
> +GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gobject-introspection distutils-base
> upstream-version-is-even
>
>  DEPENDS += "python glib-2.0"
> @@ -13,16 +14,19 @@ SRC_URI = " \
>      http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz
> \
>  "
>
> -SRC_URI[md5sum] = "3bac63c86bb963aa401f97859464aa90"
> -SRC_URI[sha256sum] =
> "3dd3e21015d06e00482ea665fc1733b77e754a6ab656a5db5d7f7bfaf31ad0b0"
> +SRC_URI[md5sum] = "9d5dbca10162dd9b0d03fed0c6cf865d"
> +SRC_URI[sha256sum] =
> "32c99def94b8dea5ce9e4bc99576ef87591ea779b4db77cfdca7af81b76d04d8"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> -BBCLASSEXTEND = "native"
> +UNKNOWN_CONFIGURE_WHITELIST = "introspection"
> +
> +PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo
> python-pycairo, python-pycairo"
> +PACKAGECONFIG[tests] = "-Dtests=true, -Dtests=false, , "
>
> -EXTRA_OECONF = "--disable-cairo"
>
> -RDEPENDS_${PN} += "python-setuptools"
> +BBCLASSEXTEND = "native"
> +RDEPENDS_${PN} = "python-setuptools"
>  RDEPENDS_${PN}_class-native = ""
>
>  do_install_append() {
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

