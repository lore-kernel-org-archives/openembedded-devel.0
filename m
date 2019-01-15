Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 64E7879CCB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:57:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0FMvZMg027297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jan 2019 14:57:36 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.20.207) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 15 Jan 2019 14:57:35 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
Date: Tue, 15 Jan 2019 17:57:34 -0500
Message-ID: <12403577.rzAvi41Ldg@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <DM6PR01MB4636C8BD15F7EF3A4D121F7D8F810@DM6PR01MB4636.prod.exchangelabs.com>
References: <DM6PR01MB4636DE2DFD81ED5926A24F9F8F840@DM6PR01MB4636.prod.exchangelabs.com>
	<CAPuovEJS2oTwaNGpD3th3efTwx2DufdyT_E5gUfa3S7bh9azOw@mail.gmail.com>
	<DM6PR01MB4636C8BD15F7EF3A4D121F7D8F810@DM6PR01MB4636.prod.exchangelabs.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Kernel modules being built, but not being included in image
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
X-List-Received-Date: Tue, 15 Jan 2019 22:57:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, January 15, 2019 1:26:31 PM EST Muhlenkamp, Lewis wrote:
> Mark,
> 
> I got the docker daemon to start up.  I figured out what I needed to put
> into my .../recipes-kernel/linux/linux-intel/docker.cfg file to make sure
> all of the kernel modules were builts.  I also found that just adding
 
>     CORE_IMAGE_EXTRA_INSTALL += "kernel-modules docker"
> 
> will add all of the kernel modules as well as the docker software.
> 
> So, the docker daemon is running.  I can run docker commands like "docker
> image ls"  I can build a docker image, but I cannot run the docker image. 
> For example, I created a simple dockerfile that just has the line "FROM
> ubuntu".  I can successfully run "docker build ." in that directory.  It
> creates an image.  I can run "docker image ls" and see the image.  When I
> run
 
>     docker run -I -t ubuntu "/bin/bash"
> 
> though, I get an error message
> 
> docker: Error response from daemon: failed to create endpoint
> elated_aryabhatadoc on network bridge; failed to add the host (veth3befa72)
> <+> sandbox (veth40a3e1c) pair interfaces: operation not supported.

Not surprisingly a container failed to start because of networking :). I would 
guess that 90% of the time I have a container fail to start it is networking 
related.

The veth pair should be independent from your network interface, either real 
on real hw or virtual in your case. Whenever you see a veth or a pair of veth 
interfaces just visualize the classic blue cat5 cable with two ends to it, 
where each end is plugged into "something". This is essentially what the veth 
pair represents. By default, when you run docker as you have the one end 
becomes the interface inside of the container, the other end is 'plugged' into 
the docker bridge on the host. Based on the message I am guessing the veth 
which is supposed to be 'plugged' into the docker bridge has failed to do so.

My day was a bit messed up so I only got a build put together now so 
unfortunately I won't be able to get anything more helpful put together until 
tomorrow sometime. In the mean time ensure the docker0 bridge is up and 
available. And if not figure out why it is not.

MarkA

 
> 
> I have been doing all of my testing on a VirtualBox VM.  I'm not sure if
> there is something missing in VirtualBox that may be causing this, or some
> VM setting that's not properly configured.  I'm going to try on physical
> hardware as well to see if that fixes the issue.
 
> If there is something that I am missing though within my openembedded build
> that will fix this, please let me know.
 
> Thank you
> 
> Lewis Muhlenkamp
> 
> -----Original Message-----
> From: Mark Asselstine <mark.asselstine@windriver.com> 
> Sent: Monday, January 14, 2019 4:56 PM
> To: Muhlenkamp, Lewis <lewis.muhlenkamp@stryker.com>
> Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] Kernel modules being built, but not being included in
> image
 
> This has been asked in the past and I did have a "mini" layer that could be
> used in addition to meta-virt to allow you to get what you need in an image
> fairly easily. We were going to do some work to make this easier but I
> haven't looked in a while so I can't say where things are at off the top of
> my head. At any rate I am just back from some travel but I will try to take
> a look at this tomorrow, after which I should be able to provide some
> better guidance.
 
> Mark
> On Fri, Jan 11, 2019 at 7:39 PM Muhlenkamp, Lewis
> <lewis.muhlenkamp@stryker.com> wrote:
> >
> >
> > Hello,
> >
> >
> >
> > TLDR: How do I get docker fully functional in my openembedded linux
> > image?
> >
> >
> >
> > I've been trying to get docker included into my image.  All of my attempts
> > lead to the same error messages appearing in the log file, and docker not
> > starting.
>
> >
> >
> > The error messages are
> >
> >
> >
> > === Start docker messages ===
> > Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > time="2019-01-10T15:56:25.414778299Z" level=error msg="Failed to built-in
> > GetDriver graph btrfs /var/lib/docker"
 Jan 10 15:56:25 intel-corei7-64
> > dockerd[210]: time="2019-01-10T15:56:25.460695720Z" level=warning
> > msg="Your kernel does not support cgroup cfs period" Jan 10 15:56:25
> > intel-corei7-64 dockerd[210]: time="2019-01-10T15:56:25.460795185Z"
> > level=warning msg="Your kernel does not support cgroup cfs quotas" Jan 10
> > 15:56:25 intel-corei7-64 dockerd[210]:
> > time="2019-01-10T15:56:25.460896539Z" level=warning msg="Your kernel does
> > not support cgroup cfs blkio weight" Jan 10 15:56:25 intel-corei7-64
> > dockerd[210]: time="2019-01-10T15:56:25.461255643Z" level=warning
> > msg="Your kernel does not support cgroup cfs blkio
> > throttle.read_bps_device" Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > time="2019-01-10T15:56:25.461381616Z" level=warning msg="Your kernel does
> > not support cgroup cfs blkio throttle.write_bps_device" Jan 10 15:56:25
> > intel-corei7-64 dockerd[210]: time="2019-01-10T15:56:25.461503746Z"
> > level=warning msg="Your kernel does not support cgroup cfs blkio
> > throttle.read_iops_device" Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > time="2019-01-10T15:56:25.461601879Z" level=warning msg="Your kernel does
> > not support cgroup cfs blkio throttle.write_iops_device" Jan 10 15:56:25
> > intel-corei7-64 dockerd[210]: time="2019-01-10T15:56:25.475747665Z"
> > level=warning msg="Running modprobe bridge br_netfilter failed with
> > message: modprobe: WARNING: Module br_netfilter not found in directory
> > /lib/modules/4.14.78-intel-pk-standard\ninsmod
> > /lib/modules/4.14.78-intel-pk-standard/kernel/net/llc.ko \ninsmod
> > /lib/modules/4.14.78-intel-pk-standard/kernel/net/802/stp.ko \ninsmod
> > /lib/modules/4.14.78-intel-pk-standard/kernel/net/bridge/bridge.ko \n,
> > error: exit status 1" Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > time="2019-01-10T15:56:25.659844723Z" level=warning msg="Could not load
> > necessary modules for IPSEC rules: Running modprobe xfrm_user failed with
> > message: `modprobe: WARNING: Module xfrm_user not found in directory
> > /lib/modules/4.14.78-intel-pk-standard`, error: exit status 1" Jan 10
> > 15:56:25 intel-corei7-64 dockerd[210]:
> > time="2019-01-10T15:56:25.662494167Z" level=warning msg="Could not load
> > necessary modules for Conntrack: Running modprobe nf_conntrack_netlink
> > failed with message: `modprobe: WARNING: Module nf_conntrack_netlink not
> > found in directory /lib/modules/4.14.78-intel-pk-standard`, error: exit
> > status 1" Jan 10 15:56:25 intel-corei7-64 dockerd[210]: failed to start
> > daemon: Error initializing network controller: Error creating default
> > "bridge" network: Failed to program NAT chain: Failed to inject DOCKER in
> > PREROUTING chain: iptables failed: iptables -wait -t nat -A PREROUTING -m
> > addrtype -dst-type LOCAL -j DOCKER: iptables: No chain/target/match by
> > that name. === End docker messages ===
> >
> >
> >
> > I was using my own custom image type, but I got the same results when
> > trying to build and use core-image-minimal.
>
> >
> >
> > I tried including the
> > meta-virtualization/recipes/kernel/linux/linux-yocto/docker.scc stuff in,
> > but since I set MACHINE to intel-corei7-64, I copied the docker.scc and
> > docker.cfg into my custom layer:
>
> >
> >
> > meta-stryker/common/recipes-kernel/linux/linux-intel/docker.cfg
> > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_baseline.s
> > cc meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend
> >
> >
> >
> > That didn't seem to work either.  The modules always got built.  For
> > example, br_netfilter.ko is built:
>
> >
> >
> > lmuhlenkamp@c71703b3ba7d:~/build-20181213a/tmp-glibc$ find . -name 
> > br_netfilter.ko 
> > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+
> > 6a3254e7b3_56f15146cf-r0/image/lib/modules/4.14.78-intel-pk-standard/k
> > ernel/net/bridge/br_netfilter.ko 
> > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+
> > 6a3254e7b3_56f15146cf-r0/packages-split/kernel-module-br-netfilter-4.1
> > 4.78-intel-pk-standard/lib/modules/4.14.78-intel-pk-standard/kernel/ne
> > t/bridge/br_netfilter.ko 
> > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+
> > 6a3254e7b3_56f15146cf-r0/linux-corei7-64-intel-common-standard-build/n
> > et/bridge/br_netfilter.ko 
> > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+
> > 6a3254e7b3_56f15146cf-r0/package/lib/modules/4.14.78-intel-pk-standard
> > /kernel/net/bridge/br_netfilter.ko
> >
> >
> >
> > But these modules are not included in my image.  For example, if I do
> > "find / -name br_netfilter.ko" on my target install, nothing is
> > returned.
>
> >
> >
> > My bblayers.conf is as follows:
> >
> >
> >
> > === Start conf/bblayers.conf ===
> > # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf # 
> > changes incompatibly LCONF_VERSION = "7"
> >
> >
> >
> > BBPATH = "${TOPDIR}"
> > BBFILES ?= ""
> >
> >
> >
> > BBLAYERS ?= " \
> > 
> >   /home/lmuhlenkamp/oe-core/meta \
> >   /home/lmuhlenkamp/meta-openembedded/meta-python \
> >   /home/lmuhlenkamp/meta-openembedded/meta-gnome \
> >   /home/lmuhlenkamp/meta-openembedded/meta-filesystems \
> >   /home/lmuhlenkamp/meta-openembedded/meta-oe \
> >   /home/lmuhlenkamp/meta-openembedded/meta-networking \
> >   /home/lmuhlenkamp/meta-openembedded/meta-initramfs \
> >   /home/lmuhlenkamp/meta-openembedded/meta-webserver \
> >   /home/lmuhlenkamp/meta-intel \
> >   /home/lmuhlenkamp/meta-virtualization \
> >   /home/lmuhlenkamp/meta-cloud-services \
> >   /home/lmuhlenkamp/meta-cloud-services/meta-openstack \
> >   /home/lmuhlenkamp/meta-iot-cloud \
> >   /home/lmuhlenkamp/meta-secure-core/meta-tpm \
> >   /home/lmuhlenkamp/meta-stryker/common \
> >   /home/lmuhlenkamp/meta-stryker/testing \
> >   "
> > 
> > === End conf/bblayers.conf ===
> >
> >
> >
> > The customizations to my local.conf file are as follows:
> >
> >
> >
> > === Start local.conf excerpt ===
> > MACHINE ?= "intel-corei7-64"
> > IMAGE_FSTYPES += "live"
> > NOISO = "0"
> > IMAGE_INSTALL_append = " glibc-utils localedef"
> > GLIBC_GENERATE_LOCALES = "el_GR.UTF-8 en_GB.UTF-8 en_US.UTF-8 es_ES.UTF-8
> > de_DE.UTF-8 fa_IR fr_FR.UTF-8 hr_HR.UTF-8 ja_JP.UTF-8 ja_JP.EUC-JP
> > lt_LT.UTF-8 ru_RU.UTF-8 tr_TR.UTF-8"
 IMAGE_LINGUAS = "el-gr en-gb en-us
> > es-es de-de fa-ir fr-fr hr-hr ja-jp ja-jp.euc-jp lt-lt ru-ru tr-tr"
> > DISTRO_FEATURES_append = " systemd virtualization"
> > DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> > VIRTUAL-RUNTIME_init_manager = "systemd"
> > VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> > DISTRO_FEATURES_append = " opengl"
> > CORE_IMAGE_EXTRA_INSTALL += "rpm python3 python3-pip python3-flask
> > python3-requests python3-coverage python3-pylint"
> > CORE_IMAGE_EXTRA_INSTALL += "python-sphinx"
> > CORE_IMAGE_EXTRA_INSTALL += "python-flake8"
> > CORE_IMAGE_EXTRA_INSTALL += "python3-doxypypy"
> > CORE_IMAGE_EXTRA_INSTALL += "trousers tpm-tools openssl-tpm-engine"
> > KERNEL_FEATURES_append = " features/netfilter/netfilter.scc
> > features/overlayfs/overlayfs.scc"
 KERNEL_ENABLE_CGROUPS = "1"
> > CORE_IMAGE_EXTRA_INSTALL += "docker"
> > SERIAL_CONSOLES = "38400 tty1"
> > CORE_IMAGE_EXTRA_INSTALL += "flaskhello"
> > === End local.conf excerpt ===
> >
> >
> >
> > I did not have the KERNEL_FEATURES_append line in when using the
> > recipes-kernel/linux/linux-intel stuff.  I didn't have the
> > recipes-kernel/linux/linux-intel directory available when using the
> > KERNEL_FEATURES_append line in local.conf.  Based on what I read, they
> > were mutually exclusive.
>
> >
> >
> > What am I missing?  Why are the kernel modules not being included in my
> > image?
>
> >
> >
> > I did try tweaking my docker.cfg file in my custom kernel recipe to 
> > include cgroups, but that did not seem to change anything.  Here are 
> > the contents of my custom docker.cfg file
> >
> >
> >
> > === Start 
> > meta-stryker/common/recipes-kernel/linux/linux-intel/docker/docker.cfg 
> > === CONFIG_CGROUP_DEVICE=y
> >
> >
> >
> > CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
> > CONFIG_IP_NF_FILTER=m
> > CONFIG_NF_NAT=m
> > CONFIG_NF_CONNTRACK_IPV4=y
> > CONFIG_NF_CT_NETLINK=y
> >
> >
> >
> > CONFIG_BRIDGE_NETFILTER=m
> > CONFIG_XFRM_USER=m
> >
> >
> >
> > CONFIG_DM_THIN_PROVISIONING=m
> >
> >
> >
> >
> > CONFIG_IP_NF_NAT=m
> > CONFIG_IP_NF_TARGET_MASQUERADE=m
> >
> >
> >
> > CONFIG_OVERLAY_FS=y
> > === End 
> > meta-stryker/common/recipes-kernel/linux/linux-intel/docker/docker.cfg 
> > ===
> >
> >
> >
> > And for completeness, here are the contents of the other 2 files in 
> > that recipe
> >
> >
> >
> > === Start 
> > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend ===
> > FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI +=
> > "file://kernel_baseline.scc"
> > === End 
> > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend ===
> >
> >
> >
> > === Start 
> > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_baseline.scc
> > === define KFEATURE_DESCRIPTION "Enable Features needed by docker in
> > addition to LXC features"
 define KFEATURE_COMPATIBILITY board
> >
> >
> >
> > kconf non-hardware docker.cfg
> > === End 
> > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_baseline.s
> > cc ===
> >
> >
> >
> > Any help that would allow me to get docker functionality working in my
> > openembedded linux image would be greatly appreciated.
>
> >
> >
> > Thank you
> >
> >
> >
> > Lewis Muhlenkamp
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel





