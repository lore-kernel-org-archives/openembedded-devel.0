Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id EA39A78A68
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 16:21:48 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o2-v6so4585611qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FpI+hg8mlVK9mff5NWls0uYrx8TPViyWe6edJFtV+u0=;
	b=YQpu7bkHMh30X7G0DnZ1/t2TyJdxWXMW4QHUCXKuPapAY27l0cRnf+8QJDk4YdWvu0
	H5jUwLLUP5Ga7vwYxuuZL43WQzph3Tgnw1bWsfPYRDxdljvKjBF3rTYAiMG5DQwJXlV4
	Hj2zfB556hRwmoqeRoLGCt7ZQvTD1fwfKuL3jITBrih9pRtW8B+W+wly3wRpVYENYXMJ
	ypaQra8Rs4VIuT/gGyXysGDe6H8O+17G/a7mrKVT2mMQGqebxl04V5YQGJDB/Hk5ljLF
	y+2a6YsVnxlLY18VkUoEvLcyD1C9I0dZDJGvOxz6liHzb+fQ3xbLerdkjyl+tryFXYuv
	sNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FpI+hg8mlVK9mff5NWls0uYrx8TPViyWe6edJFtV+u0=;
	b=PsNUtMLeR1fi5NrPDk/JWCT+O0pz0nqNNNwJqURyobpQwri0FxOWfXa62H5fEPvQBk
	EFvxePyMV7Q9Zxq06opCIrZVBPSWgPYBDR7qIHYIJvEKKPYtd6dk7vTrMkYpJlZjXawT
	fXAVwCJIxotOAU2CItsNE72VTS7jJSqV8Lwt4RunrUrevS8dxxySNNzfSj4JhuKcpIob
	KG4R4QvI5hjj0MFh/cTfQPhWrYl/cNhcDJbYXUbbAH9ZcAo/s6nS48pTEalpTMTW6seR
	+PKF1AL2Gl6Vc8ygE0KAbfEzz2UlUG0hOqUGTi+WR98se7zc2FqcISjh/mTBAvQesMV9
	TpMw==
X-Gm-Message-State: AOUpUlG0S+woscX8Z5AjQarjEaRafdZG5F1oKq3kBkOw3kX5J4fokx5j
	mFGhKxHUyJFZ//Vo1sn28i+HQ9lYrcGO7L3lONDaUg==
X-Google-Smtp-Source: AAOMgpeZfPYv+dFat4KzLfgqsVHxZVwgoJ5mfp58ofxPGd71/dNfwfAzrgYO7QJnihLAjgjPUDlMpDylFNdaFP/GrFA=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr9266070qke.12.1532017309414; 
	Thu, 19 Jul 2018 09:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <1531029841-6475-1-git-send-email-hongzhi.song@windriver.com>
	<CAMKF1srOBABtnM6hE7jnM0xWK5SYqDBerEL_Wc4Ys+Bbuy1jQg@mail.gmail.com>
	<ce227b25-5e4b-4948-e4e8-df9e800694b6@windriver.com>
In-Reply-To: <ce227b25-5e4b-4948-e4e8-df9e800694b6@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jul 2018 09:21:22 -0700
Message-ID: <CAMKF1sqrzToZ3DM+_sJAKGguUaqv+qwReddDLMn8uiA+mWm3FQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Jul 2018 16:21:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

can you try with ptest enabled in DISTRO_FEATURES
On Wed, Jul 18, 2018 at 12:57 AM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> Hi Raj,
>
> I have try my best to reproduce your error, but I failed.
>
> Could you help me to do the build in docker and share the dock image
> with us. Or maybe you have a better method.
>
>
> Thanks,
>
> Hongzhi
>
>
> On 2018=E5=B9=B407=E6=9C=8810=E6=97=A5 12:11, Khem Raj wrote:
> > This is failing to build here
> >
> > | DEBUG: Executing shell function do_compile
> > | NOTE: make -j 16 CROSS_COMPILE=3Dx86_64-bec-linux- ARCH=3Dx86
> > CC=3Dx86_64-bec-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> > -mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wformat
> > -Wformat-security -Werror=3Dformat-security
> > --sysroot=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selfte=
st/1.0-r0/recipe-sysroot
> > AR=3Dx86_64-bec-linux-ar LD=3Dx86_64-bec-linux-ld
> > --sysroot=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selfte=
st/1.0-r0/recipe-sysroot
> >    DESTDIR=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selft=
est/1.0-r0/image
> > -C /mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0=
/kernel-selftest-1.0/tools/testing/selftests/bpf
> > | make: Entering directory
> > '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/k=
ernel-selftest-1.0/tools/testing/selftests/bpf'
> > | Makefile:19: *** recipe commences before first target.  Stop.
> > | make: Leaving directory
> > '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/k=
ernel-selftest-1.0/tools/testing/selftests/bpf'
> > | ERROR: oe_runmake failed
> > On Sat, Jul 7, 2018 at 11:05 PM Hongzhi.Song <hongzhi.song@windriver.co=
m> wrote:
> >> The recipe builds the framework for kernel-selftest. Now, it just
> >> contains two sets of testcase, bpf and vm. We are appending others
> >> to the recipe.
> >>
> >> It needs some features which will be written into relevant recipe.
> >> But now, you should add them to conf/local.conf manually.
> >> KERNEL_FEATURES_append +=3D "features/bpf/bpf.scc"
> >>
> >> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> >> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> >> ---
> >>   .../recipes-kernel/kselftest/kernel-selftest.bb    | 94 ++++++++++++=
++++++++++
> >>   1 file changed, 94 insertions(+)
> >>   create mode 100644 meta-oe/recipes-kernel/kselftest/kernel-selftest.=
bb
> >>
> >> diff --git a/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb b/met=
a-oe/recipes-kernel/kselftest/kernel-selftest.bb
> >> new file mode 100644
> >> index 0000000..6f20bd3
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
> >> @@ -0,0 +1,94 @@
> >> +SUMMARY =3D "Kernel selftest for Linux"
> >> +DESCRIPTION =3D "Kernel selftest for Linux"
> >> +LICENSE =3D "GPLv2"
> >> +
> >> +# for bpf and vm
> >> +DEPENDS =3D " \
> >> +    elfutils \
> >> +    libcap \
> >> +    libcap-ng \
> >> +    fuse \
> >> +    util-linux \
> >> +    rsync-native \
> >> +"
> >> +# for vm
> >> +RDEPENDS_${PN} +=3D "libgcc \
> >> +                   bash \
> >> +"
> >> +
> >> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> >> +
> >> +inherit linux-kernel-base kernel-arch
> >> +
> >> +do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
> >> +
> >> +S =3D "${WORKDIR}/${BP}"
> >> +
> >> +# now we just test bpf and vm
> >> +# we will append other kernel selftest in the future
> >> +TEST_LIST =3D "bpf \
> >> +             vm \
> >> +"
> >> +
> >> +EXTRA_OEMAKE =3D '\
> >> +    CROSS_COMPILE=3D${TARGET_PREFIX} \
> >> +    ARCH=3D${ARCH} \
> >> +    CC=3D"${CC}" \
> >> +    AR=3D"${AR}" \
> >> +    LD=3D"${LD}" \
> >> +'
> >> +
> >> +EXTRA_OEMAKE +=3D "\
> >> +    'DESTDIR=3D${D}' \
> >> +"
> >> +
> >> +KERNEL_SELFTEST_SRC ?=3D "Makefile \
> >> +                        include \
> >> +                        tools \
> >> +                        scripts \
> >> +                        arch \
> >> +"
> >> +
> >> +do_compile() {
> >> +    for i in ${TEST_LIST}
> >> +    do
> >> +        oe_runmake -C ${S}/tools/testing/selftests/${i}
> >> +    done
> >> +}
> >> +
> >> +do_install() {
> >> +    for i in ${TEST_LIST}
> >> +    do
> >> +        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=
=3D${D}/opt/kselftest/${i} install
> >> +    done
> >> +
> >> +    chown root:root  -R ${D}/opt/kselftest
> >> +}
> >> +
> >> +do_configure() {
> >> +    :
> >> +}
> >> +
> >> +do_configure[prefuncs] +=3D "copy_kselftest_source_from_kernel remove=
_clang_related"
> >> +python copy_kselftest_source_from_kernel() {
> >> +    sources =3D (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
> >> +    src_dir =3D d.getVar("STAGING_KERNEL_DIR")
> >> +    dest_dir =3D d.getVar("S")
> >> +    bb.utils.mkdirhier(dest_dir)
> >> +    for s in sources:
> >> +        src =3D oe.path.join(src_dir, s)
> >> +        dest =3D oe.path.join(dest_dir, s)
> >> +        if os.path.isdir(src):
> >> +            oe.path.copytree(src, dest)
> >> +        else:
> >> +            bb.utils.copyfile(src, dest)
> >> +}
> >> +
> >> +remove_clang_related() {
> >> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' ${S}=
/tools/testing/selftests/bpf/Makefile
> >> +}
> >> +
> >> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> +
> >> +INHIBIT_PACKAGE_DEBUG_SPLIT=3D"1"
> >> +FILES_${PN} +=3D "/opt/kselftest/"
> >> --
> >> 2.8.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

