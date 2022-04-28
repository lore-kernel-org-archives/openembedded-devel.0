Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0619BC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 20:48:01 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.2281.1651178878890141822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 13:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WQqwXzhh;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id js10so4098726qvb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 13:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ggLamYop99iMgwJhrGUzRIkM0zuI9aeDQb0E4Ipzzn0=;
        b=WQqwXzhhKxp2Jzf9k8skIlDWUT80sfMLkMmsby6rxjuWRf1J2fepXsKKqJdC/rJ5c1
         Ua/jy6nEn0Xpx0hWzVhonrC95Hqlc2qd3dSUQbVeUPlb8PyLMAwz+kTQq8D1ykBzabvD
         M+4dVqjS8nLvoLg7PUJR+b17byqh3SQDBb+ebir5ECmFWDorxLkU9TqDXXRSPioys0+o
         ydtxDAQKbOM1UfqeaqYybFh8tvIO3+UgwuOGuDuiekk1tewxOKna8JH603iGgSWLw7+b
         pXPM9VHKe8LJSxGSVtplSjxONeYGBaQ4QzPGIBprquTosUjPsIHkNBbUVhcd5Pg+sB2C
         r7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ggLamYop99iMgwJhrGUzRIkM0zuI9aeDQb0E4Ipzzn0=;
        b=eIpxMR0urg8G19gxsis2RIe442IUdLkRfmWD6xHrV6BZ7DG9+aF6TfLYcKEiPQkRTA
         f2MMQWQGKouH/PF9ToPIW915Fc3bCW5fi2g78ypNqx3YBJ3Xe9MHmVzXT5+5epFzPGN4
         AhaojxUCSJb4eIgoMGTtjjNOweKrh1MNfWPiL8QneljLPxHrtKbUlTg2OyZkw0fc13EL
         zWFRnpZwaU5kmnY+5jjpDmionn1rST/F++/mo7Y8nnX67Y6kWvp+x615+CU6izoGyWVA
         9MXTNXKynUtRSilb5nLroDNTWRfrRdS4IKPw7IsIoXuNrOTnPw08yF32rwEDJT8l/bbE
         trMQ==
X-Gm-Message-State: AOAM531f9RdDihRuR7nT4NAQX/Eog0AmIQstO7OFwVW/95j+P+pciRsB
	UFAF/Qi9vyvugMDmq7bJAGjDyUlqSJ9Jm/ThVc6TxgXmNIIBJg==
X-Google-Smtp-Source: 
 ABdhPJwXRMRxa2ZiZJIY8eBzGoz4Qj3dSYFwVDAJ1ARunfCufoMTLA79oDfos6NEB//gtO1Fj3ZgoIfB5+Na6PWMOFQ=
X-Received: by 2002:a05:6214:519b:b0:456:47e8:f04e with SMTP id
 kl27-20020a056214519b00b0045647e8f04emr10627859qvb.110.1651178877687; Thu, 28
 Apr 2022 13:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <16E5CE6BC5F9CE8C.8845@lists.openembedded.org>
 <a78420fc-3797-6fad-c48e-4a281c7d67d2@windriver.com>
In-Reply-To: <a78420fc-3797-6fad-c48e-4a281c7d67d2@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2022 13:47:31 -0700
Message-ID: 
 <CAMKF1soCxiGCKeSXX4H_gRr0R3rEA49wuEtQuZ+aX1DxWJT0yA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] syzkaller: add recipe and selftest for
 syzkaller fuzzer
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 20:48:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96847

I thought I replied to it earlier that it fails to build here is latest link

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1692/steps/15/logs/stdio

On Thu, Apr 28, 2022 at 4:07 AM Ovidiu Panait
<ovidiu.panait@windriver.com> wrote:
>
> Hi Khem,
>
> Any feedback for this patch?
>
> Thanks!
> Ovidiu
>
> On 14.04.2022 18:56, Ovidiu Panait wrote:
> > Syzkaller is a coverage-guided fuzzer that is widely used to find bugs in
> > the Linux kernel:
> > https://github.com/google/syzkaller
> >
> > Add the recipe and a selftest for running the fuzzer in a qemux86-64
> > kvm environment. The following steps can be used to start the test:
> > """
> > cat >> conf/local.conf <<EOF
> > SYZ_WORKDIR="<path>"
> > SYZ_FUZZTIME="30"
> > SYZ_QEMU_VM_COUNT="2"
> > SYZ_QEMU_MEM="2048"
> > SYZ_QEMU_CPUS="2"
> > EOF
> >
> > oe-selftest -r syzkaller
> > ...
> > loading corpus...
> > serving http on http://127.0.0.1:49605
> > serving rpc on tcp://[::]:46475
> > booting test machines...
> > wait for the connection from test machine...
> > vm-0: crash: KCSAN: data-race in poll_schedule_timeout.constprop.NUM / pollwake
> > vm-1: crash: KCSAN: data-race in mutex_spin_on_owner
> > machine check:
> > syscalls                : 2227/4223
> > code coverage           : enabled
> > comparison tracing      : enabled
> > extra coverage          : enabled
> > delay kcov mmap         : mmap returned an invalid pointer
> > setuid sandbox          : enabled
> > namespace sandbox       : enabled
> > Android sandbox         : /sys/fs/selinux/policy does not exist
> > fault injection         : enabled
> > leak checking           : enabled
> > net packet injection    : enabled
> > net device setup        : enabled
> > concurrency sanitizer   : enabled
> > devlink PCI setup       : PCI device 0000:00:10.0 is not available
> > USB emulation           : enabled
> > hci packet injection    : enabled
> > wifi device emulation   : enabled
> > 802.15.4 emulation      : enabled
> > corpus                  : 0 (deleted 0 broken)
> > seeds                   : 0/0
> > VMs 2, executed 1, cover 0, signal 0/0, crashes 2, repro 0
> > vm-1: crash: KCSAN: data-race in mutex_spin_on_owner
> > """
> >
> > This will fuzz the yocto kernel for 30 minutes using 2 qemu VMs, each VM
> > getting 2048MB of memory and 2 CPUs.
> >
> > The path in SYZ_WORKDIR must be an absolute path that is persistent across
> > oe-selftest runs, so that fuzzing does not start all over again on each
> > invocation. Syzkaller will save the corpus database in that directory and will
> > use the database to keep track of the interfaces already fuzzed.
> >
> > After the test is done, <workdir>/crashes directory will contain the report
> > files for all the bugs found.
> >
> > Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> > ---
> >   meta-oe/lib/oeqa/selftest/cases/syzkaller.py  | 123 ++++++++++++++++++
> >   ...ets.go-allow-users-to-override-hardc.patch |  67 ++++++++++
> >   .../recipes-test/syzkaller/syzkaller_git.bb   |  85 ++++++++++++
> >   3 files changed, 275 insertions(+)
> >   create mode 100644 meta-oe/lib/oeqa/selftest/cases/syzkaller.py
> >   create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
> >   create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> >
> > diff --git a/meta-oe/lib/oeqa/selftest/cases/syzkaller.py b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
> > new file mode 100644
> > index 000000000..c11cadddb
> > --- /dev/null
> > +++ b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
> > @@ -0,0 +1,123 @@
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +from oeqa.selftest.case import OESelftestTestCase
> > +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
> > +from oeqa.utils.network import get_free_port
> > +
> > +class TestSyzkaller(OESelftestTestCase):
> > +    def setUpSyzkallerConfig(self, os_arch, qemu_postfix):
> > +        syz_target_sysroot = get_bb_var('PKGD', 'syzkaller')
> > +        syz_target = os.path.join(syz_target_sysroot, 'usr')
> > +
> > +        qemu_native_bin = os.path.join(self.syz_native_sysroot, 'usr/bin/qemu-system-' + qemu_postfix)
> > +        kernel_cmdline = "ip=dhcp rootfs=/dev/sda dummy_hcd.num=%s" % (self.dummy_hcd_num)
> > +        kernel_objdir = self.deploy_dir_image
> > +        port = get_free_port()
> > +
> > +        if not os.path.exists(self.syz_workdir):
> > +            os.mkdir(self.syz_workdir)
> > +
> > +        with open(self.syz_cfg, 'w') as f:
> > +            f.write(
> > +"""
> > +{
> > +     "target": "%s",
> > +     "http": "127.0.0.1:%s",
> > +     "workdir": "%s",
> > +     "kernel_obj": "%s",
> > +     "kernel_src": "%s",
> > +     "image": "%s",
> > +     "syzkaller": "%s",
> > +     "type": "qemu",
> > +     "reproduce" : false,
> > +     "sandbox": "none",
> > +     "vm": {
> > +             "count": %s,
> > +             "kernel": "%s",
> > +             "cmdline": "%s",
> > +             "cpu": %s,
> > +             "mem": %s,
> > +             "qemu": "%s",
> > +             "qemu_args": "-device virtio-scsi-pci,id=scsi -device scsi-hd,drive=rootfs -enable-kvm -cpu host,migratable=off",
> > +             "image_device": "drive index=0,id=rootfs,if=none,media=disk,file="
> > +     }
> > +}
> > +"""
> > +% (os_arch, port, self.syz_workdir, kernel_objdir, self.kernel_src,
> > +   self.rootfs, syz_target, self.syz_qemu_vms, self.kernel, kernel_cmdline,
> > +   self.syz_qemu_cpus, self.syz_qemu_mem, qemu_native_bin))
> > +
> > +    def test_syzkallerFuzzingQemux86_64(self):
> > +        self.image = 'core-image-minimal'
> > +        self.machine = 'qemux86-64'
> > +        self.fstype = "ext4"
> > +
> > +        self.write_config(
> > +"""
> > +MACHINE = "%s"
> > +IMAGE_FSTYPES = "%s"
> > +KERNEL_IMAGETYPES += "vmlinux"
> > +EXTRA_IMAGE_FEATURES += " ssh-server-openssh"
> > +IMAGE_ROOTFS_EXTRA_SPACE = "512000"
> > +KERNEL_EXTRA_FEATURES += " \
> > +    cfg/debug/syzkaller/debug-syzkaller.scc \
> > +"
> > +"""
> > +% (self.machine, self.fstype))
> > +
> > +        build_vars = ['TOPDIR', 'DEPLOY_DIR_IMAGE', 'STAGING_KERNEL_DIR']
> > +        syz_fuzz_vars = ['SYZ_WORKDIR', 'SYZ_FUZZTIME', 'SYZ_QEMU_MEM', 'SYZ_QEMU_CPUS', 'SYZ_QEMU_VM_COUNT']
> > +        syz_aux_vars = ['SYZ_DUMMY_HCD_NUM']
> > +
> > +        needed_vars = build_vars + syz_fuzz_vars + syz_aux_vars
> > +        bb_vars = get_bb_vars(needed_vars)
> > +
> > +        for var in syz_fuzz_vars:
> > +                if not bb_vars[var]:
> > +                    self.skipTest(
> > +"""
> > +%s variable not set.
> > +Please configure %s fuzzing parameters to run this test.
> > +
> > +Example local.conf config:
> > +SYZ_WORKDIR="<path>"  # syzkaller workdir location (must be persistent across os-selftest runs)
> > +SYZ_FUZZTIME="30"     # fuzzing time in minutes
> > +SYZ_QEMU_VM_COUNT="1" # number of qemu VMs to be used for fuzzing
> > +SYZ_QEMU_MEM="2048"'  # memory used by each qemu VM
> > +SYZ_QEMU_CPUS="2"'    # number of cpus used by each qemu VM
> > +"""
> > +% (var, ', '.join(syz_fuzz_vars)))
> > +
> > +        self.topdir = bb_vars['TOPDIR']
> > +        self.deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
> > +        self.kernel_src = bb_vars['STAGING_KERNEL_DIR']
> > +
> > +        """
> > +        SYZ_WORKDIR must be set to an absolute path where syzkaller will store
> > +        the corpus database, config, runtime and crash data generated during
> > +        fuzzing. It must be persistent between oe-selftest runs, so the fuzzer
> > +        does not start over again on each run.
> > +        """
> > +        self.syz_workdir = bb_vars['SYZ_WORKDIR']
> > +        self.syz_fuzztime = int(bb_vars['SYZ_FUZZTIME']) * 60
> > +        self.syz_qemu_mem = int(bb_vars['SYZ_QEMU_MEM'])
> > +        self.syz_qemu_cpus = int(bb_vars['SYZ_QEMU_CPUS'])
> > +        self.syz_qemu_vms = int(bb_vars['SYZ_QEMU_VM_COUNT'])
> > +        self.dummy_hcd_num = int(bb_vars['SYZ_DUMMY_HCD_NUM'] or 8)
> > +
> > +        self.syz_cfg = os.path.join(self.syz_workdir, 'syzkaller.cfg')
> > +        self.kernel = os.path.join(self.deploy_dir_image, 'bzImage')
> > +        self.rootfs = os.path.join(self.deploy_dir_image, '%s-%s.%s' % (self.image, self.machine, self.fstype))
> > +
> > +        self.syz_native_sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'syzkaller-native')
> > +
> > +        self.setUpSyzkallerConfig("linux/amd64", "x86_64")
> > +
> > +        bitbake(self.image)
> > +        bitbake('syzkaller')
> > +        bitbake('syzkaller-native -c addto_recipe_sysroot')
> > +
> > +        cmd = "syz-manager -config %s" % self.syz_cfg
> > +        runCmd(cmd, native_sysroot = self.syz_native_sysroot, timeout=self.syz_fuzztime, output_log=self.logger, ignore_status=True, shell=True)
> > diff --git a/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch b/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
> > new file mode 100644
> > index 000000000..d647b8d4a
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
> > @@ -0,0 +1,67 @@
> > +From aca1030d29f627314d13884ebc7b2c313d718df7 Mon Sep 17 00:00:00 2001
> > +From: Ovidiu Panait <ovidiu.panait@windriver.com>
> > +Date: Wed, 13 Apr 2022 17:17:54 +0300
> > +Subject: [PATCH] sys/targets/targets.go: allow users to override hardcoded
> > + cross-compilers
> > +
> > +Currently, cross compiler names are hardcoded for each os/arch combo. However,
> > +toolchain tuples differ, especially when using vendor provided toolchains.
> > +Allow users to specify the cross compiler for an os/arch combo using
> > +SYZ_CC_<os>_<arch> environment variables.
> > +
> > +Also, remove hardcoded "-march=armv6" flag to fix compilation on arm.
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> > +---
> > + sys/targets/targets.go | 19 +++++++++++--------
> > + 1 file changed, 11 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/sys/targets/targets.go b/sys/targets/targets.go
> > +index f3be708f3..19a8bb681 100644
> > +--- a/sys/targets/targets.go
> > ++++ b/sys/targets/targets.go
> > +@@ -258,7 +258,6 @@ var List = map[string]map[string]*Target{
> > +                     PtrSize:          4,
> > +                     PageSize:         4 << 10,
> > +                     LittleEndian:     true,
> > +-                    CFlags:           []string{"-D__LINUX_ARM_ARCH__=6", "-march=armv6"},
> > +                     Triple:           "arm-linux-gnueabi",
> > +                     KernelArch:       "arm",
> > +                     KernelHeaderArch: "arm",
> > +@@ -670,12 +669,16 @@ func initTarget(target *Target, OS, arch string) {
> > +     for i := range target.CFlags {
> > +             target.replaceSourceDir(&target.CFlags[i], sourceDir)
> > +     }
> > +-    if OS == Linux && arch == runtime.GOARCH {
> > +-            // Don't use cross-compiler for native compilation, there are cases when this does not work:
> > +-            // https://github.com/google/syzkaller/pull/619
> > +-            // https://github.com/google/syzkaller/issues/387
> > +-            // https://github.com/google/syzkaller/commit/06db3cec94c54e1cf720cdd5db72761514569d56
> > +-            target.Triple = ""
> > ++    if OS == Linux {
> > ++            if cc := os.Getenv("SYZ_CC_" + OS + "_" + arch); cc != "" {
> > ++                    target.CCompiler = cc
> > ++            } else if arch == runtime.GOARCH {
> > ++                    // Don't use cross-compiler for native compilation, there are cases when this does not work:
> > ++                    // https://github.com/google/syzkaller/pull/619
> > ++                    // https://github.com/google/syzkaller/issues/387
> > ++                    // https://github.com/google/syzkaller/commit/06db3cec94c54e1cf720cdd5db72761514569d56
> > ++                    target.Triple = ""
> > ++            }
> > +     }
> > +     if target.CCompiler == "" {
> > +             target.setCompiler(useClang)
> > +@@ -803,7 +806,7 @@ func (target *Target) lazyInit() {
> > +     // On CI we want to fail loudly if cross-compilation breaks.
> > +     // Also fail if SOURCEDIR_GOOS is set b/c in that case user probably assumes it will work.
> > +     if (target.OS != runtime.GOOS || !runningOnCI) && os.Getenv("SOURCEDIR_"+strings.ToUpper(target.OS)) == "" {
> > +-            if _, err := exec.LookPath(target.CCompiler); err != nil {
> > ++            if _, err := exec.LookPath(strings.Fields(target.CCompiler)[0]); err != nil {
> > +                     target.BrokenCompiler = fmt.Sprintf("%v is missing (%v)", target.CCompiler, err)
> > +                     return
> > +             }
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> > new file mode 100644
> > index 000000000..240e8f7cd
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> > @@ -0,0 +1,85 @@
> > +DESCRIPTION = "syzkaller is an unsupervised coverage-guided kernel fuzzer"
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=5335066555b14d832335aa4660d6c376"
> > +
> > +inherit go-mod
> > +
> > +GO_IMPORT = "github.com/google/syzkaller"
> > +
> > +SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${BPN}-${PV}/src/${GO_IMPORT};branch=master \
> > +           file://0001-sys-targets-targets.go-allow-users-to-override-hardc.patch;patchdir=src/${GO_IMPORT} \
> > +           "
> > +SRCREV = "af01ee7dda3c1b644f43230ae466b6dc7ceb97c3"
> > +
> > +COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64).*-linux"
> > +
> > +B = "${S}/src/${GO_IMPORT}/bin"
> > +
> > +GO_EXTRA_LDFLAGS += ' -X ${GO_IMPORT}/prog.GitRevision=${SRCREV}'
> > +
> > +export GOHOSTFLAGS="${GO_LINKSHARED} ${GOBUILDFLAGS}"
> > +export GOTARGETFLAGS="${GO_LINKSHARED} ${GOBUILDFLAGS}"
> > +export TARGETOS = '${GOOS}'
> > +export TARGETARCH = '${GOARCH}'
> > +export TARGETVMARCH = '${GOARCH}'
> > +
> > +CGO_ENABLED = "0"
> > +
> > +DEPENDS:class-native += "qemu-system-native"
> > +
> > +do_compile:class-native() {
> > +    export HOSTOS="${GOHOSTOS}"
> > +    export HOSTARCH="${GOHOSTARCH}"
> > +
> > +    oe_runmake host
> > +}
> > +
> > +do_compile:class-target() {
> > +    export HOSTOS="${GOOS}"
> > +    export HOSTARCH="${GOARCH}"
> > +    export SYZ_CC_${TARGETOS}_${TARGETARCH}="${CC}"
> > +
> > +    # Unset GOOS and GOARCH so that the correct syz-sysgen binary can be
> > +    # generated. Fixes:
> > +    # go install: cannot install cross-compiled binaries when GOBIN is set
> > +    unset GOOS
> > +    unset GOARCH
> > +
> > +    oe_runmake CC="${CC}" CFLAGS="${CFLAGS} ${LDFLAGS}" REV=${SRCREV} target
> > +}
> > +
> > +do_install:class-native() {
> > +    SYZ_BINS_NATIVE="\
> > +        syz-manager \
> > +        syz-runtest \
> > +        syz-repro \
> > +        syz-mutate \
> > +        syz-prog2c \
> > +        syz-db \
> > +        syz-upgrade \
> > +    "
> > +
> > +    install -d ${D}${bindir}
> > +
> > +    for i in ${SYZ_BINS_NATIVE}; do
> > +        install -m 0755 ${B}/${i} ${D}${bindir}
> > +    done
> > +}
> > +
> > +do_install:class-target() {
> > +    SYZ_TARGET_DIR="${TARGETOS}_${TARGETARCH}"
> > +    SYZ_BINS_TARGET=" \
> > +        syz-fuzzer \
> > +        syz-execprog \
> > +        syz-stress \
> > +        syz-executor \
> > +    "
> > +
> > +    install -d ${D}${bindir}/${SYZ_TARGET_DIR}
> > +
> > +    for i in ${SYZ_BINS_TARGET}; do
> > +        install -m 0755 ${B}/${SYZ_TARGET_DIR}/${i} ${D}${bindir}/${SYZ_TARGET_DIR}
> > +    done
> > +}
> > +
> > +BBCLASSEXTEND += "native"
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#96653): https://lists.openembedded.org/g/openembedded-devel/message/96653
> > Mute This Topic: https://lists.openembedded.org/mt/90467655/3616968
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ovidiu.panait@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

