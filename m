Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6B76D3A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2019 17:28:28 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i7so4298048qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2019 09:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xkex3seS3arHSAhOcMAxaNSYsqizVhF8aIYICPC4u50=;
	b=V/wfpUAG3B4XrYS7HP1jok9O4yBeelFMFCn0X8p0bmISiSVxGRYyi6XjOJPPCFPutW
	PIMrtDNt7Uoe0S1slXYuPjqi8sMKAYrSZV8+ufz1UK0XUEweKEbTats+fA/zmoI2FKvX
	Yv09vdAGzMAkDUsv3N6ene64u2QOPIyikbkaygQYzeH9lLbvrYIsHfZjTWh5W3viijuY
	zn17sDUtXFhjhqbYpNOWaaxCJqIwWKvNgjQoyNkj+bjNIXJzAYSDD8yNXEIb7trpQumf
	+gCblp5mwMUE3HU+F4ZZuqoqqsjw5ZUHuNMEfL7jrawtif1f3zh+2uxXyv8AwGF6ZSNj
	DD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xkex3seS3arHSAhOcMAxaNSYsqizVhF8aIYICPC4u50=;
	b=CO6yUXNcu4vVIr+zrbeVC76vS1Jgi3Oh22vSTCgSB2H+bN2+GbJ37UvSsMbyICjGZH
	jD3Ta+1UbYSX9s7CjTmRFtg+B5IZT9snp1bmmZKG6dubWevcEonhGNYqwVxdhSUtHZTn
	rZTWlajGCIiOKyji0wWAto3ZEhlboyhAw9TWaHCv7EP73heXmYOayzuCzmayKQxjmNoU
	P9qQ2SvF9GR7WATOKnwoddkaR6ZHBfvRSb1aUzzv1S9dj1oOFjII8mPXl+7ANNLNsqcd
	YtJ7zAW7JdhmZfRgj7gPaHUPr34Zc281DhZc38RP91vSIQXieIEbIf8cshOkpcnpjmft
	u/3g==
X-Gm-Message-State: AJcUukdciAPugD6MgFIURZRv3uR09YCU8TmhG/7w4IObBFHVnGoNsHhi
	TPX33U6DZSUoAY4sxx2qMc9wM8v7kQs4OZr+Fyo=
X-Google-Smtp-Source: ALg8bN75+ZDA+cyyMmQgnT33ZcRe2WERsyWCcC3wddLqz0gKREjaVSYNB0uITH/VBuvTw8vFW0XdFRLxgOzkzMnRsQ4=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr32395773qvd.224.1548955708672;
	Thu, 31 Jan 2019 09:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20190130072152.27331-1-dan.callaghan@opengear.com>
	<20190130072152.27331-2-dan.callaghan@opengear.com>
In-Reply-To: <20190130072152.27331-2-dan.callaghan@opengear.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Jan 2019 09:28:02 -0800
Message-ID: <CAMKF1spFaYBgu308Xy59wWC5yksRr2Rib=gj_hN_FoM7Gh0e=w@mail.gmail.com>
To: "Callaghan, Dan" <dan.callaghan@opengear.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] python-slip-dbus: add a python3 version of the recipe
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
X-List-Received-Date: Thu, 31 Jan 2019 17:28:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 31, 2019 at 7:43 AM Callaghan, Dan
<dan.callaghan@opengear.com> wrote:
>
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>  .../python/python-slip-dbus.inc               | 29 +++++++++++++++++
>  .../python/python-slip-dbus_0.6.5.bb          | 31 +------------------
>  .../python/python3-slip-dbus_0.6.5.bb         |  2 ++
>  3 files changed, 32 insertions(+), 30 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-slip-dbus.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
>

this patch does not apply cleanly, secondly it says patch 2/2 which
seems to be part of series
where 1/2 is missing.

> diff --git a/meta-python/recipes-devtools/python/python-slip-dbus.inc b/meta-python/recipes-devtools/python/python-slip-dbus.inc
> new file mode 100644
> index 000000000..0933b4559
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-slip-dbus.inc
> @@ -0,0 +1,29 @@
> +SUMMARY = "Convenience functions for dbus services in Python 2.x"
> +HOMEPAGE = "https://github.com/nphilipp/python-slip"
> +DESCRIPTION = "\
> +The Simple Library for Python 2.x packages contain miscellaneous code for \
> +convenience, extension and workaround purposes. \
> +\
> +This package provides slip.dbus.service.Object, which is a dbus.service.Object \
> +derivative that ends itself after a certain time without being used and/or if \
> +there are no clients anymore on the message bus, as well as convenience \
> +functions and decorators for integrating a dbus service with PolicyKit."
> +
> +SECTION = "devel/python"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
> +SRCNAME = "python-slip"
> +
> +SRC_URI = "https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2"
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +SRC_URI[md5sum] = "28ae5f93853466c44ec96706ba2a1eb4"
> +SRC_URI[sha256sum] = "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b"
> +
> +do_compile_prepend() {
> +    sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
> +}
> +
> +# http://errors.yoctoproject.org/Errors/Details/184713/
> +# python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
> +CLEANBROKEN = "1"
> diff --git a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
> index c2675cbdd..330fa1ba4 100644
> --- a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
> +++ b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
> @@ -1,31 +1,2 @@
> -SUMMARY = "Convenience functions for dbus services in Python 2.x"
> -HOMEPAGE = "https://github.com/nphilipp/python-slip"
> -DESCRIPTION = "\
> -The Simple Library for Python 2.x packages contain miscellaneous code for \
> -convenience, extension and workaround purposes. \
> -\
> -This package provides slip.dbus.service.Object, which is a dbus.service.Object \
> -derivative that ends itself after a certain time without being used and/or if \
> -there are no clients anymore on the message bus, as well as convenience \
> -functions and decorators for integrating a dbus service with PolicyKit."
> -
> -SECTION = "devel/python"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
> -SRCNAME = "python-slip"
> -
> -SRC_URI = "https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2"
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
>  inherit setuptools
> -
> -SRC_URI[md5sum] = "28ae5f93853466c44ec96706ba2a1eb4"
> -SRC_URI[sha256sum] = "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b"
> -
> -do_compile_prepend() {
> -    sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
> -}
> -
> -# http://errors.yoctoproject.org/Errors/Details/184713/
> -# python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
> -CLEANBROKEN = "1"
> +require python-slip-dbus.inc
> diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
> new file mode 100644
> index 000000000..2402a7a74
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-slip-dbus.inc

