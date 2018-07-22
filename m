Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD62600B3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2018 07:06:08 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 126-v6so6856820qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2018 00:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+/QSIxLS4ZHMEGqXyl7Xi8ONjt7dRSeJh744eZoLW5w=;
	b=E/aRipNAzA3JGr2wp4cdabeyirUr7hxRIHdS3YDF2ijcywjtLGFxH3jTMYN1gEDNAr
	sBq4UJDSiehBGCE1V3VZ6P1QLxsclPeMHzVc9MqHqyx89dkdGRh0AkZ9TV3Nn1yXluwv
	JSMjhRJcr/9Zo2usx9bGxsMgj03SuXZUEFQG/F3sMIUCRNQviJMhZorVWtq8W7/c6xOi
	F6EGoyNBTpLtlWVG19tFf8mIaCct8+nS4C0qc6blcN6ylHfA0fBXUpLi9OW7+1L7cvd1
	NMV2IqoMFV7LVLLzAh1dAs2WZUNImD5n0IsDgcHYZegEqmgoiXeFYt+o8USNFqqt+VIZ
	cjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+/QSIxLS4ZHMEGqXyl7Xi8ONjt7dRSeJh744eZoLW5w=;
	b=RTjHzaTCaox4FXnEgSU5HfMQ9NsBjDxKsxiVYrfFrf5DpYuG/0BchEfn/GxjhLk/73
	RwqV3fDUQOfUysbb0Q3yy5/CuIZzJR87n4xwTiDKvsthlxjh+Wzn1h6Zu7tZJb0hR5c6
	jvqLxCa47+/yJ59gn7AeXyelZQQ5ShzMhHDzlajUYp/qP8iKf4+6ZlHlq0s4RHJ9gHJi
	YqP4qDl+xfO6sNOMOo0FoEv439+obwESp60lVRau9QTSsIIe2lTxDc41YJOKHv+oupr0
	KiDlc7SgNecvhOIjD8QUqZWgHngQmQqAF0rI0hO59bz7fIYn5DzXp7h49l9SvjaqGEsC
	9Jzw==
X-Gm-Message-State: AOUpUlEN4CaygZB4ujiRT5F+lL6aJzIulPIcGIkSSlEwvxXXsVs4hbd/
	LY3Zc9+/zQlKOxBFrv3GnrBfoXCniBsD6r9b3Z+VvrPZ
X-Google-Smtp-Source: AAOMgpfsRprsN/D5B9Gi0XbI05Xd5N7hzgP2LM1bYdH+AzhdxX+zwGqW/rujRBNUdNHc1RLHh6fMXUzxFrN2tEyIijI=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr7005010qke.12.1532243168776; 
	Sun, 22 Jul 2018 00:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <1531029841-6475-1-git-send-email-hongzhi.song@windriver.com>
	<CAMKF1srOBABtnM6hE7jnM0xWK5SYqDBerEL_Wc4Ys+Bbuy1jQg@mail.gmail.com>
	<ce227b25-5e4b-4948-e4e8-df9e800694b6@windriver.com>
	<CAMKF1sqrzToZ3DM+_sJAKGguUaqv+qwReddDLMn8uiA+mWm3FQ@mail.gmail.com>
	<7dc56cfc-bba1-1707-b25d-c2f6e7821464@windriver.com>
In-Reply-To: <7dc56cfc-bba1-1707-b25d-c2f6e7821464@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Jul 2018 00:05:42 -0700
Message-ID: <CAMKF1spSNDdPt82++p7P5o5nkATS2DT9j4mPzZobYgNMi+Gu3A@mail.gmail.com>
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
X-List-Received-Date: Sun, 22 Jul 2018 07:06:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It fails for rpi3 for both musl and glibc

glibc

| Auto-detecting system features:
| ...                        libelf: [ ^[[31mOFF^[[m ]
| ...                           bpf: [ ^[[31mOFF^[[m ]
|
| No libelf found
| make[1]: *** [Makefile:216: elfdep] Error 255
| make[1]: *** Waiting for unfinished jobs....
| BPF API too old
| make[1]: *** [Makefile:219: bpfdep] Error 255

musl

|                  from test_progs.c:19:
| /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/kernel-selftest/=
1.0-r0/recipe-sysroot/usr/include/linux/swab.h:161:8:
error: unknown type name '__always_inline'
|  static __always_inline __u16 __swab16p(const __u16 *p)
|         ^~~~~~~~~~~~~~~
| /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/kernel-selftest/=
1.0-r0/recipe-sysroot/usr/include/linux/swab.h:161:30:
error: expected '=3D', ',', ';', 'asm' or '__attribute__' before
'__swab16p'
|  static __always_inline __u16 __swab16p(const __u16 *p)
|                               ^~~~~~~~~
| /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/kernel-selftest/=
1.0-r0/recipe-sysroot/usr/include/linux/swab.h:174:8:
error: unknown type name '__always_inline'
|  static __always_inline __u32 __swab32p(const __u32 *p)
|         ^~~~~~~~~~~~~~~
| /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/kernel-selftest/=
1.0-r0/recipe-sysroot/usr/include/linux/swab.h:174:30:
error: expected '=3D', ',', ';', 'asm' or '__attribute__' before
'__swab32p'
|  static __always_inline __u32 __swab32p(const __u32 *p)
|                               ^~~~~~~~~
| /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/kernel-selftest/=
1.0-r0/recipe-sysroot/usr/include/linux/swab.h:187:8:
error: unknown type name '__always_inline'
|  static __always_inline __u64 __swab64p(const __u64 *p)
|         ^~~~~~~~~~~~~~~
| /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/kernel-selftest/=
1.0-r0/recipe-sysroot/usr/include/linux/swab.h:187:30:
error: expected '=3D', ',', ';', 'asm' or '__attribute__' before
'__swab64p'
|  static __always_inline __u64 __swab64p(const __u64 *p)
|                               ^~~~~~~~~
| /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/kernel-selftest/=
1.0-r0/recipe-sysroot/usr/include/linux/swab.h:242:23:
error: expected ';' before 'void'
|  static __always_inline void __swab32s(__u32 *p)
|                        ^~~~~
|                        ;
| /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/kernel-selftest/=
1.0-r0/recipe-sysroot/usr/include/linux/swab.h:255:23:
error: expected ';' before 'void'
|  static __always_inline void __swab64s(__u64 *p)
|                        ^~~~~
|                        ;
On Thu, Jul 19, 2018 at 11:04 PM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> Hi Raj,
>
> Even if enable ptest, the error can't be reproduced. In fact, the recipe
>
> doesn't inherit ptest, it just compiles programs and output them, which
>
> will be used by other oe modules(oe-selftest or ptest), to a custom
> directory.
>
>
> I know that you are busy with your job. And my request will add your
> workload
>
> , which is not my intention. But it is really hard for me to reproduce
> your error.~_~
>
>
> So I sincerely hope that could I get your whole environment, including
> your metadata
>
> and other files? I think docker would be an easy way.
>
>
> Could you help me again? If I get your image, I think I will be
> confident to fix the error.
>
>
> --Hongzhi
>
>
> On 2018=E5=B9=B407=E6=9C=8820=E6=97=A5 00:21, Khem Raj wrote:
> > can you try with ptest enabled in DISTRO_FEATURES
> > On Wed, Jul 18, 2018 at 12:57 AM Hongzhi, Song
> > <hongzhi.song@windriver.com> wrote:
> >> Hi Raj,
> >>
> >> I have try my best to reproduce your error, but I failed.
> >>
> >> Could you help me to do the build in docker and share the dock image
> >> with us. Or maybe you have a better method.
> >>
> >>
> >> Thanks,
> >>
> >> Hongzhi
> >>
> >>
> >> On 2018=E5=B9=B407=E6=9C=8810=E6=97=A5 12:11, Khem Raj wrote:
> >>> This is failing to build here
> >>>
> >>> | DEBUG: Executing shell function do_compile
> >>> | NOTE: make -j 16 CROSS_COMPILE=3Dx86_64-bec-linux- ARCH=3Dx86
> >>> CC=3Dx86_64-bec-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> >>> -mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wform=
at
> >>> -Wformat-security -Werror=3Dformat-security
> >>> --sysroot=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-self=
test/1.0-r0/recipe-sysroot
> >>> AR=3Dx86_64-bec-linux-ar LD=3Dx86_64-bec-linux-ld
> >>> --sysroot=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-self=
test/1.0-r0/recipe-sysroot
> >>>     DESTDIR=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-se=
lftest/1.0-r0/image
> >>> -C /mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-=
r0/kernel-selftest-1.0/tools/testing/selftests/bpf
> >>> | make: Entering directory
> >>> '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0=
/kernel-selftest-1.0/tools/testing/selftests/bpf'
> >>> | Makefile:19: *** recipe commences before first target.  Stop.
> >>> | make: Leaving directory
> >>> '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0=
/kernel-selftest-1.0/tools/testing/selftests/bpf'
> >>> | ERROR: oe_runmake failed
> >>> On Sat, Jul 7, 2018 at 11:05 PM Hongzhi.Song <hongzhi.song@windriver.=
com> wrote:
> >>>> The recipe builds the framework for kernel-selftest. Now, it just
> >>>> contains two sets of testcase, bpf and vm. We are appending others
> >>>> to the recipe.
> >>>>
> >>>> It needs some features which will be written into relevant recipe.
> >>>> But now, you should add them to conf/local.conf manually.
> >>>> KERNEL_FEATURES_append +=3D "features/bpf/bpf.scc"
> >>>>
> >>>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> >>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> >>>> ---
> >>>>    .../recipes-kernel/kselftest/kernel-selftest.bb    | 94 +++++++++=
+++++++++++++
> >>>>    1 file changed, 94 insertions(+)
> >>>>    create mode 100644 meta-oe/recipes-kernel/kselftest/kernel-selfte=
st.bb
> >>>>
> >>>> diff --git a/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb b/m=
eta-oe/recipes-kernel/kselftest/kernel-selftest.bb
> >>>> new file mode 100644
> >>>> index 0000000..6f20bd3
> >>>> --- /dev/null
> >>>> +++ b/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
> >>>> @@ -0,0 +1,94 @@
> >>>> +SUMMARY =3D "Kernel selftest for Linux"
> >>>> +DESCRIPTION =3D "Kernel selftest for Linux"
> >>>> +LICENSE =3D "GPLv2"
> >>>> +
> >>>> +# for bpf and vm
> >>>> +DEPENDS =3D " \
> >>>> +    elfutils \
> >>>> +    libcap \
> >>>> +    libcap-ng \
> >>>> +    fuse \
> >>>> +    util-linux \
> >>>> +    rsync-native \
> >>>> +"
> >>>> +# for vm
> >>>> +RDEPENDS_${PN} +=3D "libgcc \
> >>>> +                   bash \
> >>>> +"
> >>>> +
> >>>> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> >>>> +
> >>>> +inherit linux-kernel-base kernel-arch
> >>>> +
> >>>> +do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
> >>>> +
> >>>> +S =3D "${WORKDIR}/${BP}"
> >>>> +
> >>>> +# now we just test bpf and vm
> >>>> +# we will append other kernel selftest in the future
> >>>> +TEST_LIST =3D "bpf \
> >>>> +             vm \
> >>>> +"
> >>>> +
> >>>> +EXTRA_OEMAKE =3D '\
> >>>> +    CROSS_COMPILE=3D${TARGET_PREFIX} \
> >>>> +    ARCH=3D${ARCH} \
> >>>> +    CC=3D"${CC}" \
> >>>> +    AR=3D"${AR}" \
> >>>> +    LD=3D"${LD}" \
> >>>> +'
> >>>> +
> >>>> +EXTRA_OEMAKE +=3D "\
> >>>> +    'DESTDIR=3D${D}' \
> >>>> +"
> >>>> +
> >>>> +KERNEL_SELFTEST_SRC ?=3D "Makefile \
> >>>> +                        include \
> >>>> +                        tools \
> >>>> +                        scripts \
> >>>> +                        arch \
> >>>> +"
> >>>> +
> >>>> +do_compile() {
> >>>> +    for i in ${TEST_LIST}
> >>>> +    do
> >>>> +        oe_runmake -C ${S}/tools/testing/selftests/${i}
> >>>> +    done
> >>>> +}
> >>>> +
> >>>> +do_install() {
> >>>> +    for i in ${TEST_LIST}
> >>>> +    do
> >>>> +        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PAT=
H=3D${D}/opt/kselftest/${i} install
> >>>> +    done
> >>>> +
> >>>> +    chown root:root  -R ${D}/opt/kselftest
> >>>> +}
> >>>> +
> >>>> +do_configure() {
> >>>> +    :
> >>>> +}
> >>>> +
> >>>> +do_configure[prefuncs] +=3D "copy_kselftest_source_from_kernel remo=
ve_clang_related"
> >>>> +python copy_kselftest_source_from_kernel() {
> >>>> +    sources =3D (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
> >>>> +    src_dir =3D d.getVar("STAGING_KERNEL_DIR")
> >>>> +    dest_dir =3D d.getVar("S")
> >>>> +    bb.utils.mkdirhier(dest_dir)
> >>>> +    for s in sources:
> >>>> +        src =3D oe.path.join(src_dir, s)
> >>>> +        dest =3D oe.path.join(dest_dir, s)
> >>>> +        if os.path.isdir(src):
> >>>> +            oe.path.copytree(src, dest)
> >>>> +        else:
> >>>> +            bb.utils.copyfile(src, dest)
> >>>> +}
> >>>> +
> >>>> +remove_clang_related() {
> >>>> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' ${=
S}/tools/testing/selftests/bpf/Makefile
> >>>> +}
> >>>> +
> >>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>> +
> >>>> +INHIBIT_PACKAGE_DEBUG_SPLIT=3D"1"
> >>>> +FILES_${PN} +=3D "/opt/kselftest/"
> >>>> --
> >>>> 2.8.1
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

