Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1BCF17FCA1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 18:30:52 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id f16so15329855qvi.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 10:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7OmGJ+Vm2lUlIXDE6ep6H7MHfoKDAIiKZ0mBBMFehbg=;
	b=A4K+3VsO95Ni2YZqNRvtTBOxwvZJMBkBhNduE0aICsE0i6J6ZHu+2ckTcwA2UYD+sp
	FlmTUQ1jXJkwN8+mkDTRkdO6WkMjDi+hPKO7AqQWzn/gVKTrsyw7SE7nX9blT32ySQ1C
	uChtgtrCIlZN7wuIf7EInja5vA/r4Iz7jtSAk2f4s+xpqRPPz0j+lqmhZdEgEmRJZCUR
	EGx/OUYuJHsVz7rj2pUJdm8mXtML6vcDht0PEPELnyi1xiAxcZ9f4yqKvZn7XWvUjcYz
	tj90z4fsM3qhLrmCnJEdrKKoe8oRGqcNzrvjO2dRLaWU5EiSynJSnTDfkbWoS/Bv5oHu
	elyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7OmGJ+Vm2lUlIXDE6ep6H7MHfoKDAIiKZ0mBBMFehbg=;
	b=bE7sd6s2GC7exp7VjSOTBOQuoCqEy7SsKIxgKad7VT8EmWaKaD7BEQGq+rrikRjPyp
	JFSftsaH9EesiG0V7QF1VvCTiMBnnZ4SW10rEuVkHagKLFr8BeOyEH/Ozr2zNs5B6Iao
	9ZvIBAzDjmwHOkhAKfn4FsihPk7gsgTDWWS7pkzP8IYucnf2jyCv15A5R5ppEZBdlPIa
	w845Gpd20y+u86/jzIhEMSg8qqsvT5bdYM3AchFE68aQM/+tbGINz9moDz7U1bfYfxBm
	UJWGHCIK7tk68YpBQhd7BH/gKRL3EGwn5+bFZkHmoAqlmYA8eJJ1GeTgh3mWNo7BmxpX
	URLQ==
X-Gm-Message-State: APjAAAVNLUgrK/gUewvHIrX0QVm7cwCP5EsVgwcE7qviggnGf7S014X1
	I4wUZfp4inkm3n2gnVbKFoDKWfe1dNiqEGoJAUDvvbHe+is=
X-Google-Smtp-Source: APXvYqy9HM2lI4h8KeacExcP5hCy2UP9FQwWefd5BaV53+Z/kaqohC4OhCJCXnZXvDZ1qYau1nu8yh6wyBdLuRIUJ1c=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr63800874qvo.55.1577989853611; 
	Thu, 02 Jan 2020 10:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20200102133915.1516-1-sno@netbsd.org>
In-Reply-To: <20200102133915.1516-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jan 2020 10:30:25 -0800
Message-ID: <CAMKF1srjDzrfhWgdnV2i0M=xxFFjKxbjgeFxrGu3r4pFB+F94A@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] libunix-statgrab: add recipe
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
X-List-Received-Date: Thu, 02 Jan 2020 18:30:53 -0000
Content-Type: text/plain; charset="UTF-8"

This seems to fail
https://errors.yoctoproject.org/Errors/Details/301385/
https://errors.yoctoproject.org/Errors/Details/301387/

On Thu, Jan 2, 2020 at 5:39 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> Add recipe for Unix::Statgrab perl module, a sane language binding for
> libstatgrab.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  .../libstatgrab/libunix-statgrab_0.112.bb     | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
>
> diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> new file mode 100644
> index 000000000..7402eb879
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "Perl interface to the libstatgrab library"
> +DESCRIPTION = "Unix::Statgrab is a wrapper for libstatgrab as available from \
> +<http://www.i-scream.org/libstatgrab/>. It is a reasonably portable attempt \
> +to query interesting stats about your computer. It covers information on \
> +the operating system, CPU, memory usage, network interfaces, hard-disks \
> +etc."
> +
> +HOMEPAGE = "https://metacpan.org/release/Unix-Statgrab"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+ | LGPL-2.1+"
> +DEPENDS += "libcapture-tiny-perl-native"
> +DEPENDS += "libconfig-autoconf-perl-native"
> +DEPENDS += "libstatgrab"
> +RDEPENDS_${PN} += "\
> +    libstatgrab \
> +    perl-module-autoloader \
> +    perl-module-carp \
> +    perl-module-dynaloader \
> +    perl-module-exporter \
> +    perl-module-strict \
> +    perl-module-vars \
> +    perl-module-warnings \
> +"
> +
> +SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Unix-Statgrab-${PV}.tar.gz"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +    file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d \
> +    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
> +"
> +
> +SRC_URI[md5sum] = "a6bc06b3f7749f7d77a2b1bd13402821"
> +SRC_URI[sha256sum] = "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea61d6afa"
> +
> +S = "${WORKDIR}/Unix-Statgrab-${PV}"
> +
> +inherit cpan ptest-perl
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

