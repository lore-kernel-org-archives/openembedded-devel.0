Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 980FF7FAB2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 19:05:26 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id c24so13718954qtp.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0PY8YJH6oAZy3mknhKi3/2hpxxL0xie7SOdyydOosgE=;
	b=Gf3TCIaruVbvH8PD3tNITfiFkoo053PyPAA4ZYFQPmFg2hN0aTSCrDuGvHQjKT6f5f
	F48UrjwJP5+YI8mJJwuICuyTmu4b0rE7P7Iu3PIUWw7HmqQR8Zu3UYjeKEf9zc0XC+HB
	hNubiL/wxbxtauE3nsmXNL6jCQDaVFEsBWhrRIQmQBwJXStYRTiwYSN8KSK/bDcde9aE
	KEPILmF0UZeckvpWxG+KfSsa/v+17+h8y9lUdhNmAsTHRLBMyF9Z4HnUJpySExtyYc9V
	xLPnrW0B2NBvxDNw8YQL6umddX2LU3z0pwg/18+7BvNeeH/j1rUg5RcQRJGZg8MXaRR4
	U3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0PY8YJH6oAZy3mknhKi3/2hpxxL0xie7SOdyydOosgE=;
	b=gtF+GnqXI3aaqtUCQxLoh5sl9pJeEv6d5sUdnbiu3CLhEEy863qpOXD0p7Xsmro4GA
	iHdb7thstUYaH2SDYF00gSIFlw3/f3v6YWgsCjdliMua+zOa+Pi4hOQdcj7vQQ3Er2vQ
	PMZXgczkOVlpKd/WZmEKvY8rwYVxFgGKpNkia7w8dpXGRzC7qO+d0aMVAViboyArv4tL
	1D63eamKhvkaRDkmN9Rr1L/kNz8SrFqWgjvvIGrwStkripc0Fjudg416mi3Yo+Lv39jC
	M034xeRAfZVF3rpqRBDEyUqImpY1G2fmVb+GwQZajkSEdZBoS2NG8UyNTx+GM0hI+/3H
	GRAQ==
X-Gm-Message-State: APjAAAWejjC8rqheyPrRjrGTy/HB5xK/k6c9G8RK6g/2XmBn6F5pR6u1
	qhFzilCJMu3sfGMsnrssjTr77SA/OaI7YUz7Thc=
X-Google-Smtp-Source: APXvYqzc518MedmTjcQ6y0IgYxi7CnUPgYQ5LAzRrICrTQaXyNpZFr+Qc3NXuXVSoKS/ihBCtr8CRqibnNdjGfo9MJQ=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr13023693qtj.80.1579374327195; 
	Sat, 18 Jan 2020 11:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20200102133404.1274-1-sno@netbsd.org>
In-Reply-To: <20200102133404.1274-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Jan 2020 11:05:00 -0800
Message-ID: <CAMKF1srnugQEBQsu=7D+-Zzp_s4xzxCa5S4K6Hq+DaQVWUkqoQ@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] libfile-slurper-perl: add recipe
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
X-List-Received-Date: Sat, 18 Jan 2020 19:05:26 -0000
Content-Type: text/plain; charset="UTF-8"

ERROR: libtest-warnings-perl different signature for task
do_configure.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
37963, PID: 21473
Hash for dependent task
libtest/libtest-warnings-perl_0.028.bb:do_prepare_recipe_sysroot
changed from 75b4ffd1e226558df85fafa277dd429c1c03bfa308cf955164bde7feb343a8b6
to 97d353c4d2c068a6fb1282aeac614e93ffdb17390ac20eb4115fd811ed2c2c58
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb:do_prepare_recipe_sysroot
with hashes 75b4ffd1e226558df85fafa277dd429c1c03bfa308cf955164bde7feb343a8b6
or 97d353c4d2c068a6fb1282aeac614e93ffdb17390ac20eb4115fd811ed2c2c58

On Thu, Jan 2, 2020 at 5:34 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> Since File::Slurp is broken since ages and File::Slurp::Tiny discouraged
> for some years, newer perl5 module distributions often rely on File::Slurper.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  .../libfile/libfile-slurper-perl_0.012.bb     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
>
> diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
> new file mode 100644
> index 000000000..b684abd4b
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "A simple, sane and efficient module to slurp a file"
> +DESCRIPTION = "This module provides functions for fast and correct slurping and spewing. \
> +All functions are optionally exported. All functions throw exceptions on \
> +errors, write functions don't return any meaningful value."
> +
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +
> +HOMEPAGE=       "https://metacpan.org/release/File-Slurper"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/File-Slurper-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "5742c63096392dfee50b8db314bcca18"
> +SRC_URI[sha256sum] = "4efb2ea416b110a1bda6f8133549cc6ea3676402e3caf7529fce0313250aa578"
> +RDEPENDS_${PN} = " \
> +    perl-module-carp \
> +    perl-module-encode \
> +    perl-module-exporter \
> +    perl-module-perlio \
> +    perl-module-perlio-encoding \
> +    perl-module-strict \
> +    perl-module-warnings \
> +"
> +
> +RDEPENDS_${PN}-ptest += "libtest-warnings-perl \
> +    perl-module-test-more \
> +    "
> +
> +S = "${WORKDIR}/File-Slurper-${PV}"
> +
> +inherit cpan allarch ptest-perl
> +
> +BBCLASSEXTEND = "native"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

