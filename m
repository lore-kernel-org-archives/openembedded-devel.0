Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8787602E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 20:00:06 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id b14-v6so15090981vke.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yXwG+O/xfpkxfXW7XnvHtiKGiBNHmteZtMlCU9fbnBg=;
	b=lg/9m+tEvRWhb0mxVwhDf3eGLL1iJnpRUEN2AfriDoqY6slvQ2Iyw0AVdrFOxYP5v9
	f3N92virz68gOSw7dUHetlOdGKwZeeeeZJ8JIqG9paInqzVdBJv80zA7u6BhNHdzqTq/
	WLiPq8tOmydKeTfTq5LBPeuWocWA+BEwXOF/bAq2YiQQhdf7kscg0tuMBHwGaglo2hGT
	Fk6YChADUSbSN/iH+fMsAKwl1MvbTGFKqNZKaa8ZQ66l55o0YdzJBIdA2eeP1v1zx4Yr
	3iKeqw4/WkGsOJSjCGm/SztNQ+VEdU676VyRC1qCjgQrwwHpCFYrzOF0pHZLdY2xmmvS
	49+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yXwG+O/xfpkxfXW7XnvHtiKGiBNHmteZtMlCU9fbnBg=;
	b=PuCEk7skOGNhFezM6BJ6AjuIphYFdx5UZ/syJBFE0P1/CGpYbqO/2X7F29DwS8V78J
	SrJuOfqghGaoqrWXlafC9qCrkYfvYSpxsbdta26Q4bGq8yRT/pRaBox670zJawF0wZzs
	0HGYwRBvSjKSt+T7ywuKI1AJqXE2HoaWeCQ4WosLTyee8itfxf3Kdli5aMdBdpLjaQ0+
	XwIGdaYk5s9JPNhz2NpMwYiXJAXa74rKGuS3bOfYDMZz8D4sQJNSjmjrJ0lOYKqurEv5
	itK5qkZvUyYlq5fh9itWioH62CeF8qWSQ759F1BywVNz18wBmscVtH8iODfL7gJMRDgy
	Y51w==
X-Gm-Message-State: AOUpUlGw/nMdU0FlvsXqj69slEYgwWyE7BE8PK3OBn919UKkX+A9xeBP
	UMEa+ouLhD8EEuy/m9dzUZBqCJ7Xm8si8vUf7fo=
X-Google-Smtp-Source: AAOMgpfCbBKu8gz5+plPisfc5rmKTsEMHyhHUZMjYl9Of+BqzBeGhFUv0SA/tlqFPqPCnJZuRsUlRrcbO+H4l0EBRZo=
X-Received: by 2002:a1f:a2cc:: with SMTP id l195-v6mr17315vke.95.1531339207610;
	Wed, 11 Jul 2018 13:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <1531029841-6475-1-git-send-email-hongzhi.song@windriver.com>
	<CAMKF1srOBABtnM6hE7jnM0xWK5SYqDBerEL_Wc4Ys+Bbuy1jQg@mail.gmail.com>
	<3410d266-209f-a545-56e2-62cf57226609@windriver.com>
	<CAMKF1sqrrvEWBXiZ24Tb_4rD4FZmVpr9Zo6n_SnbNGHT0BfqRw@mail.gmail.com>
	<c53c5df8-88e9-60f4-6180-a984c2ac5884@windriver.com>
In-Reply-To: <c53c5df8-88e9-60f4-6180-a984c2ac5884@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jul 2018 13:59:41 -0600
Message-ID: <CAMKF1sr6aXVo9uksqkaC6YU6m09NzNc9o4U8M1eSUnos47Xxow@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 20:00:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

bec is my distro config its not a whole different than oe-core nodistro.
The issue is not related to libc, since its happening on glibc or musl alik=
e.
It could be related to parallel compile race, you might want to explore it =
from
that angle.

On Wed, Jul 11, 2018 at 4:40 AM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> Sorry, I didn't reproduce the problem by appending your auto.conf to
>
> my local.conf. It just prompted some error because of using musl-lib
>
> instead of the error about Makefile your encountered.
>
>
> Then I commented off the statement of "TCLIBC_qemux86 =3D "musl"" and
>
> rebuild the image, it passed.
>
>
> 1. What else can I do to reproduce your case?
>
> 2. What is "bec" in your cross-compiler?
>
>     How can I get it?
>
> 3. Could the meta-oe accept it with only glibc support in the bb file.
>
>     We can add the support with musl in the future.
>
>
> --Hongzhi
>
>
>
> On 2018=E5=B9=B407=E6=9C=8810=E6=97=A5 15:43, Khem Raj wrote:
>
> Look at the report I sent to oe Devel earlier it should have link to full=
 logs
>
> On Mon, Jul 9, 2018 at 10:51 PM Hongzhi, Song <hongzhi.song@windriver.com=
> wrote:
>>
>> Could you attach building arguments, conf/local.conf, log.do_compile for=
 me?
>>
>> The text you pasted is not enough.
>>
>> -- Hongzhi
>>
>>
>> On 2018=E5=B9=B407=E6=9C=8810=E6=97=A5 12:11, Khem Raj wrote:
>> > This is failing to build here
>> >
>> > | DEBUG: Executing shell function do_compile
>> > | NOTE: make -j 16 CROSS_COMPILE=3Dx86_64-bec-linux- ARCH=3Dx86
>> > CC=3Dx86_64-bec-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
>> > -mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wforma=
t
>> > -Wformat-security -Werror=3Dformat-security
>> > --sysroot=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selft=
est/1.0-r0/recipe-sysroot
>> > AR=3Dx86_64-bec-linux-ar LD=3Dx86_64-bec-linux-ld
>> > --sysroot=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selft=
est/1.0-r0/recipe-sysroot
>> >    DESTDIR=3D/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-self=
test/1.0-r0/image
>> > -C /mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r=
0/kernel-selftest-1.0/tools/testing/selftests/bpf
>> > | make: Entering directory
>> > '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/=
kernel-selftest-1.0/tools/testing/selftests/bpf'
>> > | Makefile:19: *** recipe commences before first target.  Stop.
>> > | make: Leaving directory
>> > '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/=
kernel-selftest-1.0/tools/testing/selftests/bpf'
>> > | ERROR: oe_runmake failed
>> > On Sat, Jul 7, 2018 at 11:05 PM Hongzhi.Song <hongzhi.song@windriver.c=
om> wrote:
>> >> The recipe builds the framework for kernel-selftest. Now, it just
>> >> contains two sets of testcase, bpf and vm. We are appending others
>> >> to the recipe.
>> >>
>> >> It needs some features which will be written into relevant recipe.
>> >> But now, you should add them to conf/local.conf manually.
>> >> KERNEL_FEATURES_append +=3D "features/bpf/bpf.scc"
>> >>
>> >> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> >> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> >> ---
>> >>   .../recipes-kernel/kselftest/kernel-selftest.bb    | 94 +++++++++++=
+++++++++++
>> >>   1 file changed, 94 insertions(+)
>> >>   create mode 100644 meta-oe/recipes-kernel/kselftest/kernel-selftest=
.bb
>> >>
>> >> diff --git a/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb b/me=
ta-oe/recipes-kernel/kselftest/kernel-selftest.bb
>> >> new file mode 100644
>> >> index 0000000..6f20bd3
>> >> --- /dev/null
>> >> +++ b/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
>> >> @@ -0,0 +1,94 @@
>> >> +SUMMARY =3D "Kernel selftest for Linux"
>> >> +DESCRIPTION =3D "Kernel selftest for Linux"
>> >> +LICENSE =3D "GPLv2"
>> >> +
>> >> +# for bpf and vm
>> >> +DEPENDS =3D " \
>> >> +    elfutils \
>> >> +    libcap \
>> >> +    libcap-ng \
>> >> +    fuse \
>> >> +    util-linux \
>> >> +    rsync-native \
>> >> +"
>> >> +# for vm
>> >> +RDEPENDS_${PN} +=3D "libgcc \
>> >> +                   bash \
>> >> +"
>> >> +
>> >> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
>> >> +
>> >> +inherit linux-kernel-base kernel-arch
>> >> +
>> >> +do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
>> >> +
>> >> +S =3D "${WORKDIR}/${BP}"
>> >> +
>> >> +# now we just test bpf and vm
>> >> +# we will append other kernel selftest in the future
>> >> +TEST_LIST =3D "bpf \
>> >> +             vm \
>> >> +"
>> >> +
>> >> +EXTRA_OEMAKE =3D '\
>> >> +    CROSS_COMPILE=3D${TARGET_PREFIX} \
>> >> +    ARCH=3D${ARCH} \
>> >> +    CC=3D"${CC}" \
>> >> +    AR=3D"${AR}" \
>> >> +    LD=3D"${LD}" \
>> >> +'
>> >> +
>> >> +EXTRA_OEMAKE +=3D "\
>> >> +    'DESTDIR=3D${D}' \
>> >> +"
>> >> +
>> >> +KERNEL_SELFTEST_SRC ?=3D "Makefile \
>> >> +                        include \
>> >> +                        tools \
>> >> +                        scripts \
>> >> +                        arch \
>> >> +"
>> >> +
>> >> +do_compile() {
>> >> +    for i in ${TEST_LIST}
>> >> +    do
>> >> +        oe_runmake -C ${S}/tools/testing/selftests/${i}
>> >> +    done
>> >> +}
>> >> +
>> >> +do_install() {
>> >> +    for i in ${TEST_LIST}
>> >> +    do
>> >> +        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=
=3D${D}/opt/kselftest/${i} install
>> >> +    done
>> >> +
>> >> +    chown root:root  -R ${D}/opt/kselftest
>> >> +}
>> >> +
>> >> +do_configure() {
>> >> +    :
>> >> +}
>> >> +
>> >> +do_configure[prefuncs] +=3D "copy_kselftest_source_from_kernel remov=
e_clang_related"
>> >> +python copy_kselftest_source_from_kernel() {
>> >> +    sources =3D (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
>> >> +    src_dir =3D d.getVar("STAGING_KERNEL_DIR")
>> >> +    dest_dir =3D d.getVar("S")
>> >> +    bb.utils.mkdirhier(dest_dir)
>> >> +    for s in sources:
>> >> +        src =3D oe.path.join(src_dir, s)
>> >> +        dest =3D oe.path.join(dest_dir, s)
>> >> +        if os.path.isdir(src):
>> >> +            oe.path.copytree(src, dest)
>> >> +        else:
>> >> +            bb.utils.copyfile(src, dest)
>> >> +}
>> >> +
>> >> +remove_clang_related() {
>> >> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' ${S=
}/tools/testing/selftests/bpf/Makefile
>> >> +}
>> >> +
>> >> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> >> +
>> >> +INHIBIT_PACKAGE_DEBUG_SPLIT=3D"1"
>> >> +FILES_${PN} +=3D "/opt/kselftest/"
>> >> --
>> >> 2.8.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

