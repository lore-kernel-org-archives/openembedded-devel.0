Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 29D6C74589
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 14:21:26 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z8-v6so8874120qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EEFRPjzCCMKtfCPhPOPWLj8M4C/0c5WiWerMi3CZFnk=;
	b=H+QV8xoObT8XOKjfGNkFILRWrxg7pvoh2USg7mG17dUjoqilQx7kWBo1UvMzQboEVx
	G2WQcDwLRRdedl0+mMc4cQ//Up0Sf8XbEjb9hRXcwVp+NEJ2oAqfBhCqrip05iFzce+8
	yc58r8g6OgMA7ufcA+8ovndUHnIL3Fu1YJUW5MoV/Qf7RO9l09o7Pcxl4lgvFHYO9mF0
	2hlvNeYQZmQO4jkd1vJ01+NehJDsfVMb192++5xTIp0Ds8DsdeVxO6CGSC7H7RJbszwV
	MrMiLnVuLkB8YsgGx8vS6jHuH90QvX6WnDezBV2CxqbS3IEDR9R04X9SrOW9o6dTCaf4
	JcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EEFRPjzCCMKtfCPhPOPWLj8M4C/0c5WiWerMi3CZFnk=;
	b=mkOhhXKTeXt3Ft4LZek2RSDoUqNJrsamEYTYTlaQEe7ssS71s4QX+J3MYYsxjVNwo0
	4RWtAyQnnj0h1ZyH8aqoaEPaqtzrnn6l5SA2oM2MlcpSukwkDbcGc0OtUFNh6o3hgzv0
	VVsMvf6m5UqLWZwlJxbXvW4hCPSBGVjTpo/oI91wWnW7l1BYkRs0YjA4GLQSx82Fxjcq
	R3tkg7je6++DDwlP/fXmBDCIkL0lBX8sIZyO9xmwuonuaU81mR3a1U88MOHN+c0rjqNh
	OrSluuE/342w+77fhxfCzjfrN/VRODvXnYQ2onnMgdw/8rgNhvvc/p9iKPc9d2imBBzi
	lBfQ==
X-Gm-Message-State: AOUpUlFYDS2yCNgwXqnJoAlQQ9V91Pfd5mV5BNA61r5z7P19T+zDxFsl
	7BDCxyKIzmBzydJ6XorN7qNApN0vlg0WrPV83ng=
X-Google-Smtp-Source: AA+uWPzXnj0Z5lx0wwedz61ccxA1hFSkqlq/Hj6bFm8qi5FY8JsKB8+b5fQ4HAn5zmRcob4WNwa3sPs6r7hkHCj5kaw=
X-Received: by 2002:ac8:25f1:: with SMTP id
	f46-v6mr35491972qtf.20.1534515687698; 
	Fri, 17 Aug 2018 07:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180723231104.23011-1-alistair.francis@wdc.com>
In-Reply-To: <20180723231104.23011-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Aug 2018 07:21:01 -0700
Message-ID: <CAMKF1sqs1Xtj6o=yReDTjg7qp=w68PBZRWOXOrWENS3fn+fgFg@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	megha.dey@linux.intel.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] ndctl: Add the NDCTL package
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
X-List-Received-Date: Fri, 17 Aug 2018 14:21:27 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Alistair

We have accepted this patch however a new run with x86-64/musl shows
that it failed to build with following error
probably #include <sys/types.h> will fix it


| In file included from util/abspath.c:5:
| ./util/strbuf.h:68:45: error: unknown type name 'ssize_t'; did you
mean 'size_t'?
|  extern void strbuf_init(struct strbuf *buf, ssize_t hint);
|                                              ^~~~~~~
|                                              size_t
| ./util/strbuf.h:73:15: error: unknown type name 'ssize_t'
|  static inline ssize_t strbuf_avail(const struct strbuf *sb) {
|                ^~~~~~~
| ./util/strbuf.h:105:8: error: unknown type name 'ssize_t'
|  extern ssize_t strbuf_read(struct strbuf *, int fd, ssize_t hint);
|         ^~~~~~~
| ./util/strbuf.h:105:53: error: unknown type name 'ssize_t'; did you
mean 'size_t'?
|  extern ssize_t strbuf_read(struct strbuf *, int fd, ssize_t hint);
|                                                      ^~~~~~~
|                                                      size_t
| make[2]: *** [Makefile:678: util/abspath.o] Error 1

On Mon, Jul 23, 2018 at 4:11 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add the NDCTL package (the libnvdimm utility library). This is based
> on the work from the meta-luv layer with a version bump.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> V2:
>  - Fix install failure
>
>  meta-oe/recipes-core/ndctl/ndctl_git.bb | 29 +++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-core/ndctl/ndctl_git.bb
>
> diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
> new file mode 100644
> index 000000000..36f94ecfd
> --- /dev/null
> +++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
> @@ -0,0 +1,29 @@
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

