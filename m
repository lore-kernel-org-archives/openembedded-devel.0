Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 167317F9A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 03:29:21 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id z3so15779031qvn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 19:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VpbHQntRT8ZiWE6xG7yqFaJhPYPvJoC/V7m4SjXDVc4=;
	b=rgmsKlMnqGueRj6ASLrtfdI6PeHlzXzsWtEXK1LGo7apQl9vbm8c9xwyH7g4VGkNVR
	xL7j03XUI5vlPVstb5opIkSGCDEU5/im8HMm8uJgwPQqCgCZK71AGbNGUUcQOSqi1Jl5
	UJ4ZNIHY3+TRpBUCKeR80eOf+XYjwgFfDVKoiYwqgs1t+td7v46o+RuU6JIFC1xQrMI5
	JEPLVDZn5ZtndWap3OFub5/EqK7sO8VXqnbmV4JUMNMEqFZny6FzfUBiVrSnHlfbZSsc
	f1BO44pIXQHl6bYgyxrRvOBJdxFfkGO8CZZB16hOpvyHFwq7bL4weNISHOzwBihQCzG3
	HPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VpbHQntRT8ZiWE6xG7yqFaJhPYPvJoC/V7m4SjXDVc4=;
	b=AhIXzbi4EUSW0ysDfRCphphIDbd1i20YDjJnAW4Dh45yxG123xpjVBuHCboDxufNw1
	w4Og7xXzK5PNySt1slmJ9xV0DTIbt8G2iElfwqgFruzemKifZhuX07VFh3lhqzhE4uPp
	kpspfjyEkU+zrf4dFMsiSp1KV3cMAY1xHdf1dNXejQo8pbwSsA2sZE2NdLtuGWf6BPDq
	DQ5jPo+cauD23UzWXfu2JHGY3a5ZcFmvHSWRD/RF7uVemxobdXXHULAi6cyBgehT104P
	rMbYJrWwI6S5Qg1wi/UK2U/a5yDGXwWfsC1rVRhzjxlbp+bb09RMRXzunOUsOnwDpp1T
	2EVA==
X-Gm-Message-State: APjAAAUy8jfgobErX29/bm66YrqkY3QCLRle1Vz9pRL8WoiFpkPwI1ah
	BZZiiRcI/EKGZzIqnf0QxKC1A6fbNLsZOQd3+H4=
X-Google-Smtp-Source: APXvYqzXG8CMVTytPOZGn95fd8SvuaMbdsnLc77YwC5H5sxZY9ssZAzkttRHJhocddVIn1WFoCjYlpslJpid5wzMDro=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr66349164qvy.185.1578022162584;
	Thu, 02 Jan 2020 19:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20200102133724.1383-1-sno@netbsd.org>
In-Reply-To: <20200102133724.1383-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jan 2020 19:28:56 -0800
Message-ID: <CAMKF1spL-KgeibPDCjK-bJsyPD5LkWxujbiA9Eo2NsrjS-UiUg@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] libconfig-autoconf-perl: add recipe
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
X-List-Received-Date: Fri, 03 Jan 2020 03:29:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 2, 2020 at 5:37 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> Introduce Config::Autoconf module to meta-perl which will allow some
> probes can be run without leaving perl5 context.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  .../libconfig-autoconf-perl_0.317.bb          | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
>
> diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
> new file mode 100644
> index 000000000..62983764f
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
> @@ -0,0 +1,41 @@
> +# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "A module to implement some of AutoConf macros in pure perl"
> +DESCRIPTION = "Config::AutoConf is intended to provide the same opportunities to Perl \
> +developers as GNU Autoconf <http://www.gnu.org/software/autoconf/> does for \
> +Shell developers."
> +
> +HOMEPAGE=       "https://metacpan.org/release/Config-AutoConf"
> +
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-0.317.tar.gz"
> +
> +SRC_URI[md5sum] = "29f87fc7803f1725f6daafcf416089ce"
> +SRC_URI[sha256sum] = "01e4b22d2fecb7cfd3cc1f4dabe95cd137cf249cc5e38184f88556e5c98a9ce1"
> +RDEPENDS_${PN} += "libcapture-tiny-perl"
> +RDEPENDS_${PN} += "perl-module-base"
> +RDEPENDS_${PN} += "perl-module-carp"
> +RDEPENDS_${PN} += "perl-module-config"
> +RDEPENDS_${PN} += "perl-module-constant"
> +RDEPENDS_${PN} += "perl-module-file-basename"
> +RDEPENDS_${PN} += "perl-module-file-spec"
> +RDEPENDS_${PN} += "perl-module-file-temp"
> +RDEPENDS_${PN} += "perl-module-extutils-cbuilder"
> +RDEPENDS_${PN} += "perl-module-extutils-cbuilder-unix"

perl-module-extutils-cbuilder-unix seems to be not provided by anyone,
I am seeing

18:24:25 WARNING: libconfig-autoconf-perl-0.317-r0 do_package_qa: QA
Issue: libconfig-autoconf-perl rdepends on
perl-module-extutils-cbuilder-unix, but it isn't a build dependency?
[build-deps]

perhaps you need to bring this recipe along, from meta-cpan

> +RDEPENDS_${PN} += "perl-module-scalar-util"
> +RDEPENDS_${PN} += "perl-module-strict"
> +RDEPENDS_${PN} += "perl-module-text-parsewords"
> +RDEPENDS_${PN} += "perl-module-warnings"
> +RRECOMMENDS_${PN} += "libfile-slurper-perl"
> +
> +S = "${WORKDIR}/Config-AutoConf-${PV}"
> +
> +inherit cpan ptest-perl allarch
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

