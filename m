Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86A0175577
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 03:07:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6B37xmO001086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2018 20:07:59 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 10 Jul 2018 20:07:58 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1531029841-6475-1-git-send-email-hongzhi.song@windriver.com>
	<CAMKF1srOBABtnM6hE7jnM0xWK5SYqDBerEL_Wc4Ys+Bbuy1jQg@mail.gmail.com>
	<3410d266-209f-a545-56e2-62cf57226609@windriver.com>
	<CAMKF1sqrrvEWBXiZ24Tb_4rD4FZmVpr9Zo6n_SnbNGHT0BfqRw@mail.gmail.com>
	<86721d02-c754-193f-489c-fccc02b5ffed@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <318985a2-b5b8-943f-f78f-f6eaf85c5479@windriver.com>
Date: Wed, 11 Jul 2018 11:09:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <86721d02-c754-193f-489c-fccc02b5ffed@windriver.com>
X-Originating-IP: [128.224.162.198]
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
X-List-Received-Date: Wed, 11 Jul 2018 03:07:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore this.


On 2018年07月11日 10:50, Hongzhi, Song wrote:
> Is this the report you sent ?
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119308.html 
>
>
>
> Sorry, I don't find accurate link. Could you give me a more clear 
> direction?
>
>
> -- Hongzhi
>
>
> On 2018年07月10日 15:43, Khem Raj wrote:
>> Look at the report I sent to oe Devel earlier it should have link to 
>> full logs
>>
>> On Mon, Jul 9, 2018 at 10:51 PM Hongzhi, Song 
>> <hongzhi.song@windriver.com <mailto:hongzhi.song@windriver.com>> wrote:
>>
>>     Could you attach building arguments, conf/local.conf,
>>     log.do_compile for me?
>>
>>     The text you pasted is not enough.
>>
>>     -- Hongzhi
>>
>>
>>     On 2018年07月10日 12:11, Khem Raj wrote:
>>     > This is failing to build here
>>     >
>>     > | DEBUG: Executing shell function do_compile
>>     > | NOTE: make -j 16 CROSS_COMPILE=x86_64-bec-linux- ARCH=x86
>>     > CC=x86_64-bec-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
>>     > -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
>>     > -Wformat-security -Werror=format-security
>>     >
>> --sysroot=/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/recipe-sysroot
>>     > AR=x86_64-bec-linux-ar LD=x86_64-bec-linux-ld
>>     >
>> --sysroot=/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/recipe-sysroot
>>     >
>> DESTDIR=/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/image
>>     > -C
>> /mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf
>>     > | make: Entering directory
>>     >
>> '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf'
>>     > | Makefile:19: *** recipe commences before first target.  Stop.
>>     > | make: Leaving directory
>>     >
>> '/mnt/a/oe/build/tmp/work/qemux86_64-bec-linux/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf'
>>     > | ERROR: oe_runmake failed
>>     > On Sat, Jul 7, 2018 at 11:05 PM Hongzhi.Song
>>     <hongzhi.song@windriver.com <mailto:hongzhi.song@windriver.com>>
>>     wrote:
>>     >> The recipe builds the framework for kernel-selftest. Now, it just
>>     >> contains two sets of testcase, bpf and vm. We are appending 
>> others
>>     >> to the recipe.
>>     >>
>>     >> It needs some features which will be written into relevant 
>> recipe.
>>     >> But now, you should add them to conf/local.conf manually.
>>     >> KERNEL_FEATURES_append += "features/bpf/bpf.scc"
>>     >>
>>     >> Signed-off-by: Dengke Du <dengke.du@windriver.com
>>     <mailto:dengke.du@windriver.com>>
>>     >> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com
>>     <mailto:hongzhi.song@windriver.com>>
>>     >> ---
>>     >>   .../recipes-kernel/kselftest/kernel-selftest.bb
>>     <http://kernel-selftest.bb>   | 94 ++++++++++++++++++++++
>>     >>   1 file changed, 94 insertions(+)
>>     >>   create mode 100644
>>     meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
>>     <http://kernel-selftest.bb>
>>     >>
>>     >> diff --git
>>     a/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
>>     <http://kernel-selftest.bb>
>>     b/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
>>     <http://kernel-selftest.bb>
>>     >> new file mode 100644
>>     >> index 0000000..6f20bd3
>>     >> --- /dev/null
>>     >> +++ b/meta-oe/recipes-kernel/kselftest/kernel-selftest.bb
>>     <http://kernel-selftest.bb>
>>     >> @@ -0,0 +1,94 @@
>>     >> +SUMMARY = "Kernel selftest for Linux"
>>     >> +DESCRIPTION = "Kernel selftest for Linux"
>>     >> +LICENSE = "GPLv2"
>>     >> +
>>     >> +# for bpf and vm
>>     >> +DEPENDS = " \
>>     >> +    elfutils \
>>     >> +    libcap \
>>     >> +    libcap-ng \
>>     >> +    fuse \
>>     >> +    util-linux \
>>     >> +    rsync-native \
>>     >> +"
>>     >> +# for vm
>>     >> +RDEPENDS_${PN} += "libgcc \
>>     >> +                   bash \
>>     >> +"
>>     >> +
>>     >> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
>>     >> +
>>     >> +inherit linux-kernel-base kernel-arch
>>     >> +
>>     >> +do_populate_lic[depends] += "virtual/kernel:do_patch"
>>     >> +
>>     >> +S = "${WORKDIR}/${BP}"
>>     >> +
>>     >> +# now we just test bpf and vm
>>     >> +# we will append other kernel selftest in the future
>>     >> +TEST_LIST = "bpf \
>>     >> +             vm \
>>     >> +"
>>     >> +
>>     >> +EXTRA_OEMAKE = '\
>>     >> +    CROSS_COMPILE=${TARGET_PREFIX} \
>>     >> +    ARCH=${ARCH} \
>>     >> +    CC="${CC}" \
>>     >> +    AR="${AR}" \
>>     >> +    LD="${LD}" \
>>     >> +'
>>     >> +
>>     >> +EXTRA_OEMAKE += "\
>>     >> +    'DESTDIR=${D}' \
>>     >> +"
>>     >> +
>>     >> +KERNEL_SELFTEST_SRC ?= "Makefile \
>>     >> +                        include \
>>     >> +                        tools \
>>     >> +                        scripts \
>>     >> +                        arch \
>>     >> +"
>>     >> +
>>     >> +do_compile() {
>>     >> +    for i in ${TEST_LIST}
>>     >> +    do
>>     >> +        oe_runmake -C ${S}/tools/testing/selftests/${i}
>>     >> +    done
>>     >> +}
>>     >> +
>>     >> +do_install() {
>>     >> +    for i in ${TEST_LIST}
>>     >> +    do
>>     >> +        oe_runmake -C ${S}/tools/testing/selftests/${i}
>>     INSTALL_PATH=${D}/opt/kselftest/${i} install
>>     >> +    done
>>     >> +
>>     >> +    chown root:root  -R ${D}/opt/kselftest
>>     >> +}
>>     >> +
>>     >> +do_configure() {
>>     >> +    :
>>     >> +}
>>     >> +
>>     >> +do_configure[prefuncs] += "copy_kselftest_source_from_kernel
>>     remove_clang_related"
>>     >> +python copy_kselftest_source_from_kernel() {
>>     >> +    sources = (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
>>     >> +    src_dir = d.getVar("STAGING_KERNEL_DIR")
>>     >> +    dest_dir = d.getVar("S")
>>     >> +    bb.utils.mkdirhier(dest_dir)
>>     >> +    for s in sources:
>>     >> +        src = oe.path.join(src_dir, s)
>>     >> +        dest = oe.path.join(dest_dir, s)
>>     >> +        if os.path.isdir(src):
>>     >> +            oe.path.copytree(src, dest)
>>     >> +        else:
>>     >> +            bb.utils.copyfile(src, dest)
>>     >> +}
>>     >> +
>>     >> +remove_clang_related() {
>>     >> +       sed -i -e '/test_pkt_access/d' -e
>>     '/test_pkt_md_access/d' ${S}/tools/testing/selftests/bpf/Makefile
>>     >> +}
>>     >> +
>>     >> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>     >> +
>>     >> +INHIBIT_PACKAGE_DEBUG_SPLIT="1"
>>     >> +FILES_${PN} += "/opt/kselftest/"
>>     >> --
>>     >> 2.8.1
>>     >>
>>     >> --
>>     >> _______________________________________________
>>     >> Openembedded-devel mailing list
>>     >> Openembedded-devel@lists.openembedded.org
>>     <mailto:Openembedded-devel@lists.openembedded.org>
>>     >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>


