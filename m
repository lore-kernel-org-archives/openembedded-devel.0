Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 914C575260
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 04:12:19 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id s23-v6so11681462vks.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 21:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RNCFceAW9FyDw89cpDd2o8RyD4uSSx2l3lF3HsCgJV4=;
	b=LwRiK6PfKIbcyPMuE8J5E1RZeHz0yEj+iOAHjbpS9D6iK8lLWxuUJDaiveT+hVwMBM
	+xZMyN437Rx9tES8g5vhpikvt0+rm68SJ2mAzqJBHrP89XKJKRbouIn7cytSLFc1nThf
	PrWnkgTxSROnGWEWq3H5IwATxFQWLODiWaGGpY2+1zt5luh3F5+DYjaukhD/3sqyNlvE
	oUSi1Ei8HDD+6Kim86xyfCbPugcl6XM1BqPOsNbHVv1JhXJ2vFQ/nNgmzgWbP1LBlhIb
	hyPaKZswwTka2DNwFh95iB+SixVqZ8a4RpDYSXFY5Ax2gIccJDQVJv38hAyL13+3S7+/
	9mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RNCFceAW9FyDw89cpDd2o8RyD4uSSx2l3lF3HsCgJV4=;
	b=dpK9ZsD4/8OMLkjpi+fP8a9BaHhEVUTbOjJNIo3yIqTsCytu0geX9dOW1MpFMOM2Aw
	MfXNAHm8tuljdjYL++fddp/A2EFoEFfHpEIEN+/wJbmEG8ivKmKCYSDweWZQU6uQU1f/
	8+Gd4s+sFimhchi6AtyMDNV9NRJQwYmLWwS4Ueym8CM1B104NN6SmWSpelhqpCVm795X
	1lexiAPB+i+NRgDDamAMGRwlWkBs6DgPICB0eIfI9NXPPbhi2Ucyk7Y5VJ0rHOAz6zz3
	B+j8cdJVQYsSHSAtIftmLhBpXpo7mmYbPIes6zsErkT141E3mGJ/AD/tu7lAvAjoUc3c
	2dVA==
X-Gm-Message-State: APt69E0EUgd/3/hXr52DQI/eWdSCXZ2jnkDVZYMfW+CQvHGAmGWX4Crt
	Xzo5uxgFu3DK99Ud+h4OVim4iTXyK6FuMZ71AMc=
X-Google-Smtp-Source: AAOMgpd4yIbws3pN8uMrNwmmNKu9KWNyIDhcYtrNnlo6Ta4Imzov7+gBzGL7REFUDwVfNA2QC85yXfXcGh9SacEM5tI=
X-Received: by 2002:a1f:2cce:: with SMTP id
	s197-v6mr12942118vks.106.1531195940351; 
	Mon, 09 Jul 2018 21:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <1531029841-6475-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1531029841-6475-1-git-send-email-hongzhi.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2018 21:11:55 -0700
Message-ID: <CAMKF1srOBABtnM6hE7jnM0xWK5SYqDBerEL_Wc4Ys+Bbuy1jQg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] kselftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Tue, 10 Jul 2018 04:12:19 -0000
Content-Type: text/plain; charset="UTF-8"

This is failing to build here

| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 CROSS_COMPILE=x86_64-bec-linux- ARCH=x86
CC=x86_64-bec-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
-mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/recipe-sysroot
AR=x86_64-bec-linux-ar LD=x86_64-bec-linux-ld
--sysroot=/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/recipe-sysroot
  DESTDIR=/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/image
-C /mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf
| make: Entering directory
'/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf'
| Makefile:19: *** recipe commences before first target.  Stop.
| make: Leaving directory
'/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf'
| ERROR: oe_runmake failed
On Sat, Jul 7, 2018 at 11:05 PM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> The recipe builds the framework for kernel-selftest. Now, it just
> contains two sets of testcase, bpf and vm. We are appending others
> to the recipe.
>
> It needs some features which will be written into relevant recipe.
> But now, you should add them to conf/local.conf manually.
> KERNEL_FEATURES_append += "features/bpf/bpf.scc"
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  .../recipes-kernel/kselftest/kernel-selftest.bb    | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
>
> diff --git a/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
> new file mode 100644
> index 0000000..6f20bd3
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
> @@ -0,0 +1,94 @@
> +SUMMARY = "Kernel selftest for Linux"
> +DESCRIPTION = "Kernel selftest for Linux"
> +LICENSE = "GPLv2"
> +
> +# for bpf and vm
> +DEPENDS = " \
> +    elfutils \
> +    libcap \
> +    libcap-ng \
> +    fuse \
> +    util-linux \
> +    rsync-native \
> +"
> +# for vm
> +RDEPENDS_${PN} += "libgcc \
> +                   bash \
> +"
> +
> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
> +
> +inherit linux-kernel-base kernel-arch
> +
> +do_populate_lic[depends] += "virtual/kernel:do_patch"
> +
> +S = "${WORKDIR}/${BP}"
> +
> +# now we just test bpf and vm
> +# we will append other kernel selftest in the future
> +TEST_LIST = "bpf \
> +             vm \
> +"
> +
> +EXTRA_OEMAKE = '\
> +    CROSS_COMPILE=${TARGET_PREFIX} \
> +    ARCH=${ARCH} \
> +    CC="${CC}" \
> +    AR="${AR}" \
> +    LD="${LD}" \
> +'
> +
> +EXTRA_OEMAKE += "\
> +    'DESTDIR=${D}' \
> +"
> +
> +KERNEL_SELFTEST_SRC ?= "Makefile \
> +                        include \
> +                        tools \
> +                        scripts \
> +                        arch \
> +"
> +
> +do_compile() {
> +    for i in ${TEST_LIST}
> +    do
> +        oe_runmake -C ${S}/tools/testing/selftests/${i}
> +    done
> +}
> +
> +do_install() {
> +    for i in ${TEST_LIST}
> +    do
> +        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/opt/kselftest/${i} install
> +    done
> +
> +    chown root:root  -R ${D}/opt/kselftest
> +}
> +
> +do_configure() {
> +    :
> +}
> +
> +do_configure[prefuncs] += "copy_kselftest_source_from_kernel remove_clang_related"
> +python copy_kselftest_source_from_kernel() {
> +    sources = (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
> +    src_dir = d.getVar("STAGING_KERNEL_DIR")
> +    dest_dir = d.getVar("S")
> +    bb.utils.mkdirhier(dest_dir)
> +    for s in sources:
> +        src = oe.path.join(src_dir, s)
> +        dest = oe.path.join(dest_dir, s)
> +        if os.path.isdir(src):
> +            oe.path.copytree(src, dest)
> +        else:
> +            bb.utils.copyfile(src, dest)
> +}
> +
> +remove_clang_related() {
> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' ${S}/tools/testing/selftests/bpf/Makefile
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT="1"
> +FILES_${PN} += "/opt/kselftest/"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

