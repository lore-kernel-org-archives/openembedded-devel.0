Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CBDC433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 21:54:49 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.2386.1666043679803416166
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 14:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hE4wElSv;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1324e7a1284so14825675fac.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 14:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HNnP4OSVELUPBIEX4DFismKZii775p7xcQy/W8JNMuc=;
        b=hE4wElSvBwQIsiZyCKGZEkdHAHZlJhBFFFcSqW39XsVbzskL9X7UefBo5Uv+cjprg0
         Uk9sczcOfgzY76B1RGyakystlcXmMddM/KgxqcFdRxBY1x+5uetFsbUZInUWIM08WZ1K
         RqAx9m0ZbYj06JD90GVdTeoeYw01cckP7XRjzelEI4MsdLSq2E89IGuzuClycan831bi
         t4z9JSrI9B/9ymYySBYMKmYInFMq6CLG6qnFk036i2IdzOOJABgZDSeFDSTx/zRAYI2z
         zUh9bxRU9o4EutO/JEL5yy2Upgd4rkIT6zYfRuTuuuaGTzP3bh99cFj2x1alqPYs7mHJ
         eh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNnP4OSVELUPBIEX4DFismKZii775p7xcQy/W8JNMuc=;
        b=JaMsXQY2UjdQpM41fOIc603/E4mqupz4U35yvoiDxw1yHus2C1qjWNCGsWBJKa+XsL
         XZeBU/KruyQqheci9FIPXxf8WA0LVQsjZZdHN7cmczqdpy+Zke9j7D/8PyzNSGE1XY2o
         GeqLEZJbJmKFRbOt1+B7hfOlHBD7A8mRRmzJAJTKXHkK09PIJ/5dMkHFD0Mp4zJum34k
         kANkUQk5K588WznZRldYxlBspR+ihdRcFJehEt+dBrZIIJ0TcbooNDG/ka3Oiea4whjw
         tyIZYOPllWF29MCtL8XzkTHU6OtZKeWfDLwT9ApUSHkqMy92exHknaux7ZatoZmTu1C7
         1/5g==
X-Gm-Message-State: ACrzQf1o6Thft2s5Alcaw3no1Wd1rrBKCJusl2Oo1CBLrCmrNx/6DP+V
	T603GvaDbNOYZ7O2dY4QRLmRPHMYlbZR6NHU/Ac=
X-Google-Smtp-Source: AMsMyM4Zm5am9LN4Rg6fsueyrKuvOh5z5G5gvr97uD9q4+KfYH0vVN9uON8lphUtyADbvQ4OMUYQ5YSteb5/3wjJxj8=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr15845264oae.262.1666043678885; Mon, 17
 Oct 2022 14:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221017170057.1694699-1-ovidiu.panait@windriver.com>
In-Reply-To: <20221017170057.1694699-1-ovidiu.panait@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Oct 2022 14:54:12 -0700
Message-ID: <CAMKF1spmgzkdqVvmz=V4yayMfk8484H109yCD-Ec_kFDr6EU9A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] syzkaller: add recipe and selftest for
 syzkaller fuzzing
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 21:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99206

seeing these failures

https://errors.yoctoproject.org/Errors/Details/673021/

On Mon, Oct 17, 2022 at 10:02 AM Ovidiu Panait
<ovidiu.panait@windriver.com> wrote:
>
> Syzkaller is a coverage-guided fuzzer that is widely used to find bugs in
> the Linux kernel:
> https://github.com/google/syzkaller
>
> Add the recipe and a selftest for running the fuzzer in a qemux86-64
> kvm environment. The following steps can be used to start the test:
> """
> cat >> conf/local.conf <<EOF
> SYZ_WORKDIR="<path>"
> SYZ_FUZZTIME="30"
> SYZ_QEMU_VM_COUNT="2"
> SYZ_QEMU_MEM="2048"
> SYZ_QEMU_CPUS="2"
> EOF
>
> oe-selftest -r syzkaller
> ...
> loading corpus...
> serving http on http://127.0.0.1:49605
> serving rpc on tcp://[::]:46475
> booting test machines...
> wait for the connection from test machine...
> vm-0: crash: KCSAN: data-race in poll_schedule_timeout.constprop.NUM / pollwake
> vm-1: crash: KCSAN: data-race in mutex_spin_on_owner
> machine check:
> syscalls                : 2227/4223
> code coverage           : enabled
> comparison tracing      : enabled
> extra coverage          : enabled
> delay kcov mmap         : mmap returned an invalid pointer
> setuid sandbox          : enabled
> namespace sandbox       : enabled
> Android sandbox         : /sys/fs/selinux/policy does not exist
> fault injection         : enabled
> leak checking           : enabled
> net packet injection    : enabled
> net device setup        : enabled
> concurrency sanitizer   : enabled
> devlink PCI setup       : PCI device 0000:00:10.0 is not available
> USB emulation           : enabled
> hci packet injection    : enabled
> wifi device emulation   : enabled
> 802.15.4 emulation      : enabled
> corpus                  : 0 (deleted 0 broken)
> seeds                   : 0/0
> VMs 2, executed 1, cover 0, signal 0/0, crashes 2, repro 0
> vm-1: crash: KCSAN: data-race in mutex_spin_on_owner
> """
>
> This will fuzz the yocto kernel for 30 minutes using 2 qemu VMs, each VM
> getting 2048MB of memory and 2 CPUs.
>
> The path in SYZ_WORKDIR must be an absolute path that is persistent across
> oe-selftest runs, so that fuzzing does not start all over again on each
> invocation. Syzkaller will save the corpus database in that directory and will
> use the database to keep track of the interfaces already fuzzed.
>
> After the test is done, <workdir>/crashes directory will contain the report
> files for all the bugs found.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta-oe/lib/oeqa/selftest/cases/syzkaller.py  | 124 ++++++++++++++++++
>  ...ets.go-allow-users-to-override-hardc.patch |  67 ++++++++++
>  .../recipes-test/syzkaller/syzkaller_git.bb   |  85 ++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 meta-oe/lib/oeqa/selftest/cases/syzkaller.py
>  create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
>  create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller_git.bb
>
> diff --git a/meta-oe/lib/oeqa/selftest/cases/syzkaller.py b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
> new file mode 100644
> index 000000000..64fc864bf
> --- /dev/null
> +++ b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
> @@ -0,0 +1,124 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
> +from oeqa.utils.network import get_free_port
> +
> +class TestSyzkaller(OESelftestTestCase):
> +    def setUpSyzkallerConfig(self, os_arch, qemu_postfix):
> +        syz_target_sysroot = get_bb_var('PKGD', 'syzkaller')
> +        syz_target = os.path.join(syz_target_sysroot, 'usr')
> +
> +        qemu_native_bin = os.path.join(self.syz_native_sysroot, 'usr/bin/qemu-system-' + qemu_postfix)
> +        kernel_cmdline = "ip=dhcp rootfs=/dev/sda dummy_hcd.num=%s" % (self.dummy_hcd_num)
> +        kernel_objdir = self.deploy_dir_image
> +        port = get_free_port()
> +
> +        if not os.path.exists(self.syz_workdir):
> +            os.mkdir(self.syz_workdir)
> +
> +        with open(self.syz_cfg, 'w') as f:
> +            f.write(
> +"""
> +{
> +       "target": "%s",
> +       "http": "127.0.0.1:%s",
> +       "workdir": "%s",
> +       "kernel_obj": "%s",
> +       "kernel_src": "%s",
> +       "image": "%s",
> +       "syzkaller": "%s",
> +       "type": "qemu",
> +       "reproduce" : false,
> +       "sandbox": "none",
> +       "vm": {
> +               "count": %s,
> +               "kernel": "%s",
> +               "cmdline": "%s",
> +               "cpu": %s,
> +               "mem": %s,
> +               "qemu": "%s",
> +               "qemu_args": "-device virtio-scsi-pci,id=scsi -device scsi-hd,drive=rootfs -enable-kvm -cpu host,migratable=off",
> +               "image_device": "drive index=0,id=rootfs,if=none,media=disk,file="
> +       }
> +}
> +"""
> +% (os_arch, port, self.syz_workdir, kernel_objdir, self.kernel_src,
> +   self.rootfs, syz_target, self.syz_qemu_vms, self.kernel, kernel_cmdline,
> +   self.syz_qemu_cpus, self.syz_qemu_mem, qemu_native_bin))
> +
> +    def test_syzkallerFuzzingQemux86_64(self):
> +        self.image = 'core-image-minimal'
> +        self.machine = 'qemux86-64'
> +        self.fstype = "ext4"
> +
> +        self.write_config(
> +"""
> +MACHINE = "%s"
> +IMAGE_FSTYPES = "%s"
> +KERNEL_IMAGETYPES += "vmlinux"
> +EXTRA_IMAGE_FEATURES += " ssh-server-openssh"
> +IMAGE_ROOTFS_EXTRA_SPACE = "512000"
> +KERNEL_EXTRA_FEATURES += " \
> +    cfg/debug/syzkaller/debug-syzkaller.scc \
> +"
> +IMAGE_INSTALL:append = " syzkaller"
> +"""
> +% (self.machine, self.fstype))
> +
> +        build_vars = ['TOPDIR', 'DEPLOY_DIR_IMAGE', 'STAGING_KERNEL_DIR']
> +        syz_fuzz_vars = ['SYZ_WORKDIR', 'SYZ_FUZZTIME', 'SYZ_QEMU_MEM', 'SYZ_QEMU_CPUS', 'SYZ_QEMU_VM_COUNT']
> +        syz_aux_vars = ['SYZ_DUMMY_HCD_NUM']
> +
> +        needed_vars = build_vars + syz_fuzz_vars + syz_aux_vars
> +        bb_vars = get_bb_vars(needed_vars)
> +
> +        for var in syz_fuzz_vars:
> +                if not bb_vars[var]:
> +                    self.skipTest(
> +"""
> +%s variable not set.
> +Please configure %s fuzzing parameters to run this test.
> +
> +Example local.conf config:
> +SYZ_WORKDIR="<path>"  # syzkaller workdir location (must be persistent across os-selftest runs)
> +SYZ_FUZZTIME="30"     # fuzzing time in minutes
> +SYZ_QEMU_VM_COUNT="1" # number of qemu VMs to be used for fuzzing
> +SYZ_QEMU_MEM="2048"'  # memory used by each qemu VM
> +SYZ_QEMU_CPUS="2"'    # number of cpus used by each qemu VM
> +"""
> +% (var, ', '.join(syz_fuzz_vars)))
> +
> +        self.topdir = bb_vars['TOPDIR']
> +        self.deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
> +        self.kernel_src = bb_vars['STAGING_KERNEL_DIR']
> +
> +        """
> +        SYZ_WORKDIR must be set to an absolute path where syzkaller will store
> +        the corpus database, config, runtime and crash data generated during
> +        fuzzing. It must be persistent between oe-selftest runs, so the fuzzer
> +        does not start over again on each run.
> +        """
> +        self.syz_workdir = bb_vars['SYZ_WORKDIR']
> +        self.syz_fuzztime = int(bb_vars['SYZ_FUZZTIME']) * 60
> +        self.syz_qemu_mem = int(bb_vars['SYZ_QEMU_MEM'])
> +        self.syz_qemu_cpus = int(bb_vars['SYZ_QEMU_CPUS'])
> +        self.syz_qemu_vms = int(bb_vars['SYZ_QEMU_VM_COUNT'])
> +        self.dummy_hcd_num = int(bb_vars['SYZ_DUMMY_HCD_NUM'] or 8)
> +
> +        self.syz_cfg = os.path.join(self.syz_workdir, 'syzkaller.cfg')
> +        self.kernel = os.path.join(self.deploy_dir_image, 'bzImage')
> +        self.rootfs = os.path.join(self.deploy_dir_image, '%s-%s.%s' % (self.image, self.machine, self.fstype))
> +
> +        self.syz_native_sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'syzkaller-native')
> +
> +        self.setUpSyzkallerConfig("linux/amd64", "x86_64")
> +
> +        bitbake(self.image)
> +        bitbake('syzkaller')
> +        bitbake('syzkaller-native -c addto_recipe_sysroot')
> +
> +        cmd = "syz-manager -config %s" % self.syz_cfg
> +        runCmd(cmd, native_sysroot = self.syz_native_sysroot, timeout=self.syz_fuzztime, output_log=self.logger, ignore_status=True, shell=True)
> diff --git a/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch b/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
> new file mode 100644
> index 000000000..d647b8d4a
> --- /dev/null
> +++ b/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
> @@ -0,0 +1,67 @@
> +From aca1030d29f627314d13884ebc7b2c313d718df7 Mon Sep 17 00:00:00 2001
> +From: Ovidiu Panait <ovidiu.panait@windriver.com>
> +Date: Wed, 13 Apr 2022 17:17:54 +0300
> +Subject: [PATCH] sys/targets/targets.go: allow users to override hardcoded
> + cross-compilers
> +
> +Currently, cross compiler names are hardcoded for each os/arch combo. However,
> +toolchain tuples differ, especially when using vendor provided toolchains.
> +Allow users to specify the cross compiler for an os/arch combo using
> +SYZ_CC_<os>_<arch> environment variables.
> +
> +Also, remove hardcoded "-march=armv6" flag to fix compilation on arm.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + sys/targets/targets.go | 19 +++++++++++--------
> + 1 file changed, 11 insertions(+), 8 deletions(-)
> +
> +diff --git a/sys/targets/targets.go b/sys/targets/targets.go
> +index f3be708f3..19a8bb681 100644
> +--- a/sys/targets/targets.go
> ++++ b/sys/targets/targets.go
> +@@ -258,7 +258,6 @@ var List = map[string]map[string]*Target{
> +                       PtrSize:          4,
> +                       PageSize:         4 << 10,
> +                       LittleEndian:     true,
> +-                      CFlags:           []string{"-D__LINUX_ARM_ARCH__=6", "-march=armv6"},
> +                       Triple:           "arm-linux-gnueabi",
> +                       KernelArch:       "arm",
> +                       KernelHeaderArch: "arm",
> +@@ -670,12 +669,16 @@ func initTarget(target *Target, OS, arch string) {
> +       for i := range target.CFlags {
> +               target.replaceSourceDir(&target.CFlags[i], sourceDir)
> +       }
> +-      if OS == Linux && arch == runtime.GOARCH {
> +-              // Don't use cross-compiler for native compilation, there are cases when this does not work:
> +-              // https://github.com/google/syzkaller/pull/619
> +-              // https://github.com/google/syzkaller/issues/387
> +-              // https://github.com/google/syzkaller/commit/06db3cec94c54e1cf720cdd5db72761514569d56
> +-              target.Triple = ""
> ++      if OS == Linux {
> ++              if cc := os.Getenv("SYZ_CC_" + OS + "_" + arch); cc != "" {
> ++                      target.CCompiler = cc
> ++              } else if arch == runtime.GOARCH {
> ++                      // Don't use cross-compiler for native compilation, there are cases when this does not work:
> ++                      // https://github.com/google/syzkaller/pull/619
> ++                      // https://github.com/google/syzkaller/issues/387
> ++                      // https://github.com/google/syzkaller/commit/06db3cec94c54e1cf720cdd5db72761514569d56
> ++                      target.Triple = ""
> ++              }
> +       }
> +       if target.CCompiler == "" {
> +               target.setCompiler(useClang)
> +@@ -803,7 +806,7 @@ func (target *Target) lazyInit() {
> +       // On CI we want to fail loudly if cross-compilation breaks.
> +       // Also fail if SOURCEDIR_GOOS is set b/c in that case user probably assumes it will work.
> +       if (target.OS != runtime.GOOS || !runningOnCI) && os.Getenv("SOURCEDIR_"+strings.ToUpper(target.OS)) == "" {
> +-              if _, err := exec.LookPath(target.CCompiler); err != nil {
> ++              if _, err := exec.LookPath(strings.Fields(target.CCompiler)[0]); err != nil {
> +                       target.BrokenCompiler = fmt.Sprintf("%v is missing (%v)", target.CCompiler, err)
> +                       return
> +               }
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> new file mode 100644
> index 000000000..ffa472426
> --- /dev/null
> +++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> @@ -0,0 +1,85 @@
> +DESCRIPTION = "syzkaller is an unsupervised coverage-guided kernel fuzzer"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=5335066555b14d832335aa4660d6c376"
> +
> +inherit go-mod
> +
> +GO_IMPORT = "github.com/google/syzkaller"
> +
> +SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${BPN}-${PV}/src/${GO_IMPORT};branch=master \
> +           file://0001-sys-targets-targets.go-allow-users-to-override-hardc.patch;patchdir=src/${GO_IMPORT} \
> +           "
> +SRCREV = "67cb024cd1a3c95e311263a5c95e957f9abfd8ca"
> +
> +COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64).*-linux"
> +
> +B = "${S}/src/${GO_IMPORT}/bin"
> +
> +GO_EXTRA_LDFLAGS += ' -X ${GO_IMPORT}/prog.GitRevision=${SRCREV}'
> +
> +export GOHOSTFLAGS="${GO_LINKSHARED} ${GOBUILDFLAGS}"
> +export GOTARGETFLAGS="${GO_LINKSHARED} ${GOBUILDFLAGS}"
> +export TARGETOS = '${GOOS}'
> +export TARGETARCH = '${GOARCH}'
> +export TARGETVMARCH = '${GOARCH}'
> +
> +CGO_ENABLED = "0"
> +
> +DEPENDS:class-native += "qemu-system-native"
> +
> +do_compile:class-native() {
> +    export HOSTOS="${GOHOSTOS}"
> +    export HOSTARCH="${GOHOSTARCH}"
> +
> +    oe_runmake HOSTGO="${GO}" host
> +}
> +
> +do_compile:class-target() {
> +    export HOSTOS="${GOOS}"
> +    export HOSTARCH="${GOARCH}"
> +    export SYZ_CC_${TARGETOS}_${TARGETARCH}="${CC}"
> +
> +    # Unset GOOS and GOARCH so that the correct syz-sysgen binary can be
> +    # generated. Fixes:
> +    # go install: cannot install cross-compiled binaries when GOBIN is set
> +    unset GOOS
> +    unset GOARCH
> +
> +    oe_runmake GO="${GO}" CC="${CC}" CFLAGS="${CFLAGS} ${LDFLAGS}" REV=${SRCREV} target
> +}
> +
> +do_install:class-native() {
> +    SYZ_BINS_NATIVE="\
> +        syz-manager \
> +        syz-runtest \
> +        syz-repro \
> +        syz-mutate \
> +        syz-prog2c \
> +        syz-db \
> +        syz-upgrade \
> +    "
> +
> +    install -d ${D}${bindir}
> +
> +    for i in ${SYZ_BINS_NATIVE}; do
> +        install -m 0755 ${B}/${i} ${D}${bindir}
> +    done
> +}
> +
> +do_install:class-target() {
> +    SYZ_TARGET_DIR="${TARGETOS}_${TARGETARCH}"
> +    SYZ_BINS_TARGET=" \
> +        syz-fuzzer \
> +        syz-execprog \
> +        syz-stress \
> +        syz-executor \
> +    "
> +
> +    install -d ${D}${bindir}/${SYZ_TARGET_DIR}
> +
> +    for i in ${SYZ_BINS_TARGET}; do
> +        install -m 0755 ${B}/${SYZ_TARGET_DIR}/${i} ${D}${bindir}/${SYZ_TARGET_DIR}
> +    done
> +}
> +
> +BBCLASSEXTEND += "native"
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99201): https://lists.openembedded.org/g/openembedded-devel/message/99201
> Mute This Topic: https://lists.openembedded.org/mt/94389493/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

