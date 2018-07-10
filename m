Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7691D75532
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 07:43:12 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 59-v6so13371711uas.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Em8n/TFVRoKsyg01paaqIgTdDUQd9w+ZRI2IpqolNEU=;
	b=sUj//AdtTlADKW4y0xWj2XWm1SqV6HJvq4N0cYLu/MGQrBR7kDeZaAbT9sd+z4cnwy
	ikzqyqIJxSS1ZVnBBjUwRkZ/voKMOVx+NhW41YgnuFdoWlLy7SedUCnHvrOQiU9Syo6D
	GfLMzmc2qVfUL0Iup072qVTroJcOy2kCa9I0QkIq9TjbbX509u4e1HrwLp5PoggbQmbC
	a0NA+IhMl7tLFwANX+uOdSox2kHE4aADDuX1qRw3pMkx0L8j13OjzpUGqEeuORSdoMB8
	fP5b6joxHAmxGk7dE/ALiE/E58ukZEudFBG0HNKrOzoVWF6znH8a+dL1BttSAmcW1aR0
	wqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Em8n/TFVRoKsyg01paaqIgTdDUQd9w+ZRI2IpqolNEU=;
	b=W0BssYcPcXRhO70WTv98VK10Vxitc3ncTnrLWXxgW7nZg6QY1B1CdGhpduF09FguYx
	+pwC6kuJ9v2UffxGcYVk4AIRKQUsIoQ+1UahKDO4G173pGakykGMhYcmcUFN9+RpUGVX
	Z0AQaFNBqDxAcuAoBdkgRbb1xgCL6PaQQxpCsYFH7ltdQrz+zMJPuonjJReU1eBV2fbR
	V17tyvDFX45PSe2lW6FCClsnqgd0ad9Jr8tdHjW6XlrvRi9CLjMWcUBPkJ8C/noNarxo
	2/euO8pOi6OLFpQwSnIvhYVaL9eAa9FZQxIKG9RAHxr3m+Tlf11oc5pDTNuZGdh6G7MW
	VUfA==
X-Gm-Message-State: APt69E3Ro/KEfjZGBJdf5rvRR5w0FT+9Pk9cDC/8eKFhdPiBY7RRgQfT
	Z7/ai/GmIo5/m6cCXsc2JnBw+j5H0UAqEqd/hBU=
X-Google-Smtp-Source: AAOMgpd/vIjtNE6o5Saia8Ndf9cWS+jw0Jjgw9o9SeaLlRw0whM0tsrn0vdub7t20/TBL9GGTVdjN78Y8qFYr0edk0M=
X-Received: by 2002:a9f:33d8:: with SMTP id
	y24-v6mr3840962uab.164.1531208593202; 
	Tue, 10 Jul 2018 00:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <1531029841-6475-1-git-send-email-hongzhi.song@windriver.com>
	<CAMKF1srOBABtnM6hE7jnM0xWK5SYqDBerEL_Wc4Ys+Bbuy1jQg@mail.gmail.com>
	<3410d266-209f-a545-56e2-62cf57226609@windriver.com>
In-Reply-To: <3410d266-209f-a545-56e2-62cf57226609@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jul 2018 01:43:02 -0600
Message-ID: <CAMKF1sqrrvEWBXiZ24Tb_4rD4FZmVpr9Zo6n_SnbNGHT0BfqRw@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 10 Jul 2018 07:43:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Look at the report I sent to oe Devel earlier it should have link to full
logs

On Mon, Jul 9, 2018 at 10:51 PM Hongzhi, Song <hongzhi.song@windriver.com>
wrote:

> Could you attach building arguments, conf/local.conf, log.do_compile for
> me?
>
> The text you pasted is not enough.
>
> -- Hongzhi
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
> >
> --sysroot=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest=
/1.0-r0/recipe-sysroot
> > AR=3Dx86_64-bec-linux-ar LD=3Dx86_64-bec-linux-ld
> >
> --sysroot=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest=
/1.0-r0/recipe-sysroot
> >
> DESTDIR=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1=
.0-r0/image
> > -C
> /mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/kern=
el-selftest-1.0/tools/testing/selftests/bpf
> > | make: Entering directory
> >
> '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/ker=
nel-selftest-1.0/tools/testing/selftests/bpf'
> > | Makefile:19: *** recipe commences before first target.  Stop.
> > | make: Leaving directory
> >
> '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/ker=
nel-selftest-1.0/tools/testing/selftests/bpf'
> > | ERROR: oe_runmake failed
> > On Sat, Jul 7, 2018 at 11:05 PM Hongzhi.Song <hongzhi.song@windriver.co=
m>
> wrote:
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
> >>   .../recipes-kernel/kselftest/kernel-selftest.bb    | 94
> ++++++++++++++++++++++
> >>   1 file changed, 94 insertions(+)
> >>   create mode 100644 meta-oe/recipes-kernel/kselftest/
> kernel-selftest.bb
> >>
> >> diff --git a/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
> b/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
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
> >> +        oe_runmake -C ${S}/tools/testing/selftests/${i}
> INSTALL_PATH=3D${D}/opt/kselftest/${i} install
> >> +    done
> >> +
> >> +    chown root:root  -R ${D}/opt/kselftest
> >> +}
> >> +
> >> +do_configure() {
> >> +    :
> >> +}
> >> +
> >> +do_configure[prefuncs] +=3D "copy_kselftest_source_from_kernel
> remove_clang_related"
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
> >> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d'
> ${S}/tools/testing/selftests/bpf/Makefile
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
>

