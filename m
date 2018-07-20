Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id D233D78B7D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 23:06:47 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id t5-v6so11724186qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 16:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nZoxX2YaRAmf+iPUCfZSvW/oe5jOQNAhF1+lubnDc/o=;
	b=ekZdNhmGsB3tg71MZ2yzLyyZhBXh8bdLqOuNUUuFMdfjYTAihnhhn2Cr9xZ8Nm6ky9
	9dqS85cr88CBgL2yjAdvR1aAz7vyiHYjPAcRP1HPVxanAtHfu5u/JoBcodLynqkTLQlQ
	pMoqZ8luaNzczH2aWHiDgn98m63t8h5ahHVw+q0R3J4HIQO8H7s8kuAfNPpi/Lvey9dq
	fqGgWpTIY9oa+Rqeqvy7Piip0ppc3r6FLumM8p4iejWcn2Sxrh2Vt7qdv8QXsqWlJI0Y
	vM5QxoBhw4rF00EqeGKrzHoDvaj3+PgkLwNNfRf0CRuau8g7Q9oseETzDQi2hO4PoalW
	dlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nZoxX2YaRAmf+iPUCfZSvW/oe5jOQNAhF1+lubnDc/o=;
	b=nowRWrFHZpjmx59HkJ7AZEkk5E0d/e5xsr9tGCU7aIQPQZmd0YrxX+9ioSyw9cNPxL
	y41AGdy/Sn6xJHmHOyZGXwNGNgq6bxjd0ReoVie30HDYsA2PFjXiO8k+lnbzOqGEnbp+
	KSlWdRk96c7ZAQKe+Km+686QUg3XLP4HEhZit9ijITOhR+ImkL+hcSCxo5OvT4qIFDb5
	MY4RNzw/S57u/v+kIS2CBsAihSwLO1F+7v72h25qDTqcFzx4Yw54Ybv7n1fyfxxUjM0y
	kWKHRaLscf9KM/Bn6SwozQ4uzewnxbQ10BBBuBejnK+TKq6xuQr18HYoiiYErW4fA+mf
	DVKw==
X-Gm-Message-State: AOUpUlHAqGqh9okkAtgwQryL4WaKCsbpM5rQnqtZxbV90dUFjkQfy6MX
	J+8XK8qvUml8OhOPVxrf8ocXPizgy74zMiz3NOU=
X-Google-Smtp-Source: AAOMgpcULe8O6E6x3lgQC79Ck38fOt8zcKX5wB14jSrIIISpOmLXqgNISIZ92AkPyocQb7R9A+t+TTcG4DrM0fCjPJk=
X-Received: by 2002:a0c:983d:: with SMTP id
	c58-v6mr3590187qvd.221.1532128008621; 
	Fri, 20 Jul 2018 16:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180716223703.1588-1-alistair.francis@wdc.com>
In-Reply-To: <20180716223703.1588-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jul 2018 16:06:22 -0700
Message-ID: <CAMKF1soTg324TAuiTLRczMKq2aF0GSqNdDqhTmUW+neGAtj+fw@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	megha.dey@linux.intel.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ndctl: Add the NDCTL package
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
X-List-Received-Date: Fri, 20 Jul 2018 23:06:48 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build on qemux86_64

| install: cannot stat
'/home/jenkins/oe/world/oe-build/build/tmpfs/work/qemux86_64-bec-linux/ndctl/v61+gitAUTOINC+0d6aeeabec-r0/ndctl_runner':
No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at
/home/jenkins/oe/world/oe-build/build/tmpfs/work/qemux86_64-bec-linux/ndctl/v61+gitAUTOINC+0d6aeeabec-r0/temp/log.do_install.28110)
On Mon, Jul 16, 2018 at 3:47 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add the NDCTL package (the libnvdimm utility library). This is based
> on the work from the meta-luv layer with a version bump.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta-oe/recipes-core/ndctl/ndctl_git.bb | 34 +++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-core/ndctl/ndctl_git.bb
>
> diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
> new file mode 100644
> index 000000000..3bf54e74b
> --- /dev/null
> +++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "libnvdimm utility library"
> +DESCRIPTION = "Utility library for managing the libnvdimm \
> +(non-volatile memory device) sub-system in the Linux kernel. \
> +The LIBNVDIMM subsystem provides support for three types of \
> +NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
> +simultaneously support both PMEM and BLK mode access."
> +HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
> +
> +inherit autotools-brokensep pkgconfig module-base
> +
> +SRCREV = "0d6aeeabec9d271e08c12e4cf679b59946e20156"
> +SRC_URI = "git://github.com/pmem/ndctl.git"
> +
> +DEPENDS = "virtual/kernel kmod udev json-c"
> +
> +PV = "v61+git${SRCPV}"
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
> +
> +do_configure_prepend() {
> +    ${S}/autogen.sh
> +}
> +
> +do_install_append() {
> +        install -d ${D}${bindir}
> +        install -m 755 ${WORKDIR}/ndctl_runner ${D}${bindir}
> +}
> +
> +COMPATIBLE_HOST='(x86_64).*'
> +
> +FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

