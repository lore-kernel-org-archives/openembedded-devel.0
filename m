Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68CB57C052
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 14:22:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0HELrpI016046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jan 2019 06:22:03 -0800
Received: from yow-masselst-lx1.localnet (128.224.60.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 17 Jan 2019 06:21:42 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
Date: Thu, 17 Jan 2019 09:21:41 -0500
Message-ID: <2616184.Zvyinu7zct@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <DM6PR01MB46361376555460968223D3408F820@DM6PR01MB4636.prod.exchangelabs.com>
References: <DM6PR01MB4636DE2DFD81ED5926A24F9F8F840@DM6PR01MB4636.prod.exchangelabs.com>
	<1747961.HFadKpmvWh@yow-masselst-lx1>
	<DM6PR01MB46361376555460968223D3408F820@DM6PR01MB4636.prod.exchangelabs.com>
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
X-List-Received-Date: Thu, 17 Jan 2019 14:22:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, January 16, 2019 3:06:32 PM EST Muhlenkamp, Lewis wrote:
> Mark,
> 
> I found the issue.  The veth kernel parameter was not enabled.  Once I added
> CONFIG_VETH=y to my docker.cfg file, I was able to successfully run a
> docker container in my openembedded OS.
> 
> I found out about this missing kernel parameter by running a neat little
> script that checks if everything is ready on the OS for docker.  That
> script can be found at
> https://github.com/moby/moby/blob/master/contrib/check-config.sh.

This script is packaged in the docker-contrib package I believe.

> 
> Should I let the meta-virtualization mailing list know about my updates to
> the docker.cfg file so they can incorporate those changes into a future
> version of the official docker.cfg file?

I would still fire off an email to the meta-virtualization list. This will 
remind Bruce and myself to look at CONFIG_VETH as I think we only have it in 
the lxc.cfg fragment where we really should have it in a better location where 
lxc and docker can pick it up.

MarkA

> 
> Thank you for your help with this.
> 
> Lewis Muhlenkamp
> 
> -----Original Message-----
> From: Mark Asselstine <mark.asselstine@windriver.com>
> Sent: Wednesday, January 16, 2019 10:20 AM
> To: Muhlenkamp, Lewis <lewis.muhlenkamp@stryker.com>
> Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] Kernel modules being built, but not being included in
> image
> On Wednesday, January 16, 2019 8:39:08 AM EST Muhlenkamp, Lewis wrote:
> > Mark,
> > 
> > I haven't changed my bblayers.conf file since my original post.  I
> > have everything that you have, and then some.
> > 
> > My DISTRO_FEATURES_append for virtualization and system are on one
> > line.  I have the other systemd lines in my local.conf too.
> > 
> > I have CORE_IMAGE_EXTRA_INSTALL += "kernel-modules docker" instead of
> > IMAGE_INSTALL_append.  The two seem to be interchangeable to me.  If
> > that is not the case, please let me know.
> > 
> > I do not have any KERNEL_MODULE_AUTOLOAD lines in my local.conf.  I'm
> > not sure I need to since the modules appear in the lsmod output.
> > 
> > I thought it might be virtualbox that was not allowing me to create
> > these virtual interfaces for some reason.  So, I installed on my target
> > hardware.> 
> >  I got the same issue.
> > 
> > Nothing appears in any log when I run the docker command.  There is no
> > debug output when I run docker -D.
> > 
> > It seems like my docker instance does not have permission to create
> > new virtual ethernet interfaces.  What is the best way to test this?
> 
> I would recommend that you try to reproduce my findings in a second build,
> dropping your custom layer and using qemux86-64. You can never go wrong
> with having a working scenario next to your failing one.
> 
> Also since we have moved on from your initial issue regarding kernel modules
> we should move this conversation over to the meta-virtualization list
> instead of here. We are more likely to catch the eyes of others who are
> using docker there and might get additional suggestions as to the cause.
> 
> MarkA
> 
> > Thanks
> > 
> > Lewis Muhlenkamp
> > 
> > -----Original Message-----
> > From: Mark Asselstine <mark.asselstine@windriver.com>
> > Sent: Tuesday, January 15, 2019 9:55 PM
> > To: Muhlenkamp, Lewis <lewis.muhlenkamp@stryker.com>
> > Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] Kernel modules being built, but not being included
> > in image On Tuesday, January 15, 2019 5:57:34 PM EST Mark Asselstine
> > 
> > wrote:
> > > On Tuesday, January 15, 2019 1:26:31 PM EST Muhlenkamp, Lewis wrote:
> > > > Mark,
> > > > 
> > > > I got the docker daemon to start up.  I figured out what I needed
> > > > to put into my .../recipes-kernel/linux/linux-intel/docker.cfg
> > > > file to make sure all of the kernel modules were builts.  I also
> > > > found that just adding
> > > > 
> > > >     CORE_IMAGE_EXTRA_INSTALL += "kernel-modules docker"
> > > > 
> > > > will add all of the kernel modules as well as the docker software.
> > > > 
> > > > So, the docker daemon is running.  I can run docker commands like
> > > > "docker image ls"  I can build a docker image, but I cannot run
> > > > the docker image. For example, I created a simple dockerfile that
> > > > just has the line "FROM ubuntu".  I can successfully run "docker
> > > > build ." in that directory.  It creates an image.  I can run
> > > > "docker image ls" and see the image.  When I run
> > > > 
> > > >     docker run -I -t ubuntu "/bin/bash"
> > > > 
> > > > though, I get an error message
> > > > 
> > > > docker: Error response from daemon: failed to create endpoint
> > > > elated_aryabhatadoc on network bridge; failed to add the host
> > > > (veth3befa72)
> > > > <+> sandbox (veth40a3e1c) pair interfaces: operation not supported.
> > > 
> > > Not surprisingly a container failed to start because of networking :).
> > > I would guess that 90% of the time I have a container fail to start
> > > it is networking related.
> > > 
> > > The veth pair should be independent from your network interface,
> > > either real on real hw or virtual in your case. Whenever you see a
> > > veth or a pair of veth interfaces just visualize the classic blue
> > > cat5 cable with two ends to it, where each end is plugged into
> > > "something".
> > > This is essentially what the veth pair represents. By default, when
> > > you run docker as you have the one end becomes the interface inside
> > > of the container, the other end is 'plugged' into the docker bridge
> > > on the host. Based on the message I am guessing the veth which is
> > > supposed to be 'plugged' into the docker bridge has failed to do so.
> > > 
> > > My day was a bit messed up so I only got a build put together now so
> > > unfortunately I won't be able to get anything more helpful put
> > > together until tomorrow sometime. In the mean time ensure the
> > > docker0 bridge is up and available. And if not figure out why it is not.
> > 
> > I was able to validate things. First here are my changes after I
> > source oe- init-build-env.
> > 
> > bblayers.conf
> > ---
> > 
> >   /home/masselst/git/poky/layers/meta-virtualization \
> >   /home/masselst/git/poky/layers/meta-openembedded/meta-oe \
> >   /home/masselst/git/poky/layers/meta-openembedded/meta-networking \
> >   /home/masselst/git/poky/layers/meta-openembedded/meta-filesystems \
> >   /home/masselst/git/poky/layers/meta-openembedded/meta-python \
> > 
> > local.conf
> > ---
> > DISTRO_FEATURES_append = " virtualization"
> > IMAGE_INSTALL_append = "docker \
> > 
> >  kernel-module-xt-conntrack \
> >  kernel-module-nf-nat \
> >  kernel-module-xt-addrtype"
> > 
> > KERNEL_MODULE_AUTOLOAD += "xt_conntrack"
> > KERNEL_MODULE_AUTOLOAD += "xt_addrtype"
> > 
> > DISTRO_FEATURES_append = " systemd"
> > DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> > VIRTUAL-RUNTIME_init_manager = "systemd"
> > VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> > 
> > I also set the machine to "qemux86-64".
> > 
> > 
> > After using 'docker pull hello-world' I run it
> > ---
> > root@qemux86-64:~# docker run -it hello-world [  434.530556] docker0:
> > port
> > 1(veth2c4037e) entered blocking state [  434.533810] docker0: port
> > 1(veth2c4037e) entered disabled state [  434.538888] device
> > veth2c4037e entered promiscuous mode [  434.552937] IPv6:
> > ADDRCONF(NETDEV_UP): veth2c4037e: link is not ready [  435.645525] eth0:
> > renamed from
> > veth6909d78 [  435.648422] IPv6: ADDRCONF(NETDEV_CHANGE): veth2c4037e:
> > link becomes ready [  435.649944] docker0: port 1(veth2c4037e) entered
> > blocking state [  435.651224] docker0: port 1(veth2c4037e) entered
> > forwarding state [  435.654061] IPv6: ADDRCONF(NETDEV_CHANGE):
> > docker0: link becomes ready
> > 
> > Hello from Docker!
> > This message shows that your installation appears to be working correctly.
> > 
> > To generate this message, Docker took the following steps:
> >  1. The Docker client contacted the Docker daemon.
> >  2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
> >  
> >     (amd64)
> >  
> >  3. The Docker daemon created a new container from that image which
> > 
> > runs the executable that produces the output you are currently
> > reading. 4. The Docker daemon streamed that output to the Docker
> > client, which sent it to your terminal.
> > 
> > To try something more ambitious, you can run an Ubuntu container with:
> >  $ docker run -it ubuntu bash
> > 
> > Share images, automate workflows, and more with a free Docker ID:
> >  https://hub.docker.com/
> > 
> > For more examples and ideas, visit:
> >  https://docs.docker.com/get-started/
> > 
> > [  435.899076] docker0: port 1(veth2c4037e) entered disabled state [
> > 435.904659] veth6909d78: renamed from eth0 [  435.960366] docker0:
> > port
> > 1(veth2c4037e) entered disabled state [  435.967155] device
> > veth2c4037e left promiscuous mode [  435.970292] docker0: port
> > 1(veth2c4037e) entered disabled state --- I am running it from the
> > console so you get the pollution of the veth being created and torn
> > down but in this case you might be interested in seeing this so it is
> > good that it is captured here.
> > 
> > Anyways, take a look at the above, see how it maps for you and if you
> > continue to have issues I can try to assist more. You might want to
> > run things such that you get more logs. I am pretty busy but possibly
> > put your image somewhere and if I get the chance I can have a look.
> > 
> > MarkA
> > 
> > > MarkA
> > > 
> > > > I have been doing all of my testing on a VirtualBox VM.  I'm not
> > > > sure if there is something missing in VirtualBox that may be
> > > > causing this, or some VM setting that's not properly configured.
> > > > I'm going to try on physical hardware as well to see if that fixes the
> > > > issue.
> > > > 
> > > > If there is something that I am missing though within my
> > > > openembedded build that will fix this, please let me know.
> > > > 
> > > > Thank you
> > > > 
> > > > Lewis Muhlenkamp
> > > > 
> > > > -----Original Message-----
> > > > From: Mark Asselstine <mark.asselstine@windriver.com>
> > > > Sent: Monday, January 14, 2019 4:56 PM
> > > > To: Muhlenkamp, Lewis <lewis.muhlenkamp@stryker.com>
> > > > Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> > > > Subject: Re: [oe] Kernel modules being built, but not being
> > > > included in image
> > > > 
> > > > This has been asked in the past and I did have a "mini" layer that
> > > > could be used in addition to meta-virt to allow you to get what
> > > > you need in an image fairly easily. We were going to do some work
> > > > to make this easier but I haven't looked in a while so I can't say
> > > > where things are at off the top of my head. At any rate I am just
> > > > back from some travel but I will try to take a look at this
> > > > tomorrow, after which I should be able to provide some better
> > > > guidance.
> > > > 
> > > > Mark
> > > > On Fri, Jan 11, 2019 at 7:39 PM Muhlenkamp, Lewis
> > > > 
> > > > <lewis.muhlenkamp@stryker.com> wrote:
> > > > > Hello,
> > > > > 
> > > > > 
> > > > > 
> > > > > TLDR: How do I get docker fully functional in my openembedded
> > > > > linux image?
> > > > > 
> > > > > 
> > > > > 
> > > > > I've been trying to get docker included into my image.  All of
> > > > > my attempts lead to the same error messages appearing in the log
> > > > > file, and docker not starting.
> > > > > 
> > > > > 
> > > > > 
> > > > > The error messages are
> > > > > 
> > > > > 
> > > > > 
> > > > > === Start docker messages ===
> > > > > Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > > > > time="2019-01-10T15:56:25.414778299Z" level=error msg="Failed to
> > > > > built-in GetDriver graph btrfs /var/lib/docker"
> > >  
> > >  Jan 10 15:56:25 intel-corei7-64
> > >  
> > > > > dockerd[210]: time="2019-01-10T15:56:25.460695720Z"
> > > > > level=warning msg="Your kernel does not support cgroup cfs
> > > > > period" Jan 10
> > > > > 15:56:25
> > > > > intel-corei7-64 dockerd[210]: time="2019-01-10T15:56:25.460795185Z"
> > > > > level=warning msg="Your kernel does not support cgroup cfs quotas"
> > > > > Jan
> > > > > 10
> > > > > 15:56:25 intel-corei7-64 dockerd[210]:
> > > > > time="2019-01-10T15:56:25.460896539Z" level=warning msg="Your
> > > > > kernel does not support cgroup cfs blkio weight" Jan 10 15:56:25
> > > > > intel-corei7-64
> > > > > dockerd[210]: time="2019-01-10T15:56:25.461255643Z"
> > > > > level=warning msg="Your kernel does not support cgroup cfs blkio
> > > > > throttle.read_bps_device" Jan 10 15:56:25 intel-corei7-64
> > > > > dockerd[210]:
> > > > > time="2019-01-10T15:56:25.461381616Z" level=warning msg="Your
> > > > > kernel does not support cgroup cfs blkio
> > > > > throttle.write_bps_device" Jan 10 15:56:25
> > > > > intel-corei7-64 dockerd[210]: time="2019-01-10T15:56:25.461503746Z"
> > > > > level=warning msg="Your kernel does not support cgroup cfs blkio
> > > > > throttle.read_iops_device" Jan 10 15:56:25 intel-corei7-64
> > > > > dockerd[210]:
> > > > > time="2019-01-10T15:56:25.461601879Z" level=warning msg="Your
> > > > > kernel does not support cgroup cfs blkio
> > > > > throttle.write_iops_device" Jan 10 15:56:25
> > > > > intel-corei7-64 dockerd[210]: time="2019-01-10T15:56:25.475747665Z"
> > > > > level=warning msg="Running modprobe bridge br_netfilter failed
> > > > > with
> > > > > message: modprobe: WARNING: Module br_netfilter not found in
> > > > > directory /lib/modules/4.14.78-intel-pk-standard\ninsmod
> > > > > /lib/modules/4.14.78-intel-pk-standard/kernel/net/llc.ko
> > > > > \ninsmod
> > > > > /lib/modules/4.14.78-intel-pk-standard/kernel/net/802/stp.ko
> > > > > \ninsmod
> > > > > /lib/modules/4.14.78-intel-pk-standard/kernel/net/bridge/bridge.
> > > > > ko
> > > > > \n,
> > > > > error: exit status 1" Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > > > > time="2019-01-10T15:56:25.659844723Z" level=warning msg="Could
> > > > > not load necessary modules for IPSEC rules: Running modprobe
> > > > > xfrm_user failed with
> > > > > message: `modprobe: WARNING: Module xfrm_user not found in
> > > > > directory /lib/modules/4.14.78-intel-pk-standard`, error: exit
> > > > > status 1" Jan 10
> > > > > 15:56:25 intel-corei7-64 dockerd[210]:
> > > > > time="2019-01-10T15:56:25.662494167Z" level=warning msg="Could
> > > > > not load necessary modules for Conntrack: Running modprobe
> > > > > nf_conntrack_netlink failed with message: `modprobe: WARNING:
> > > > > Module nf_conntrack_netlink not found in directory
> > > > > /lib/modules/4.14.78-intel-pk-standard`, error: exit status 1"
> > > > > Jan
> > > > > 10 15:56:25 intel-corei7-64 dockerd[210]: failed to start
> > > > > daemon: Error initializing network controller: Error creating
> > > > > default "bridge" network: Failed to program NAT chain: Failed to
> > > > > inject DOCKER in PREROUTING chain: iptables failed: iptables
> > > > > -wait -t nat -A PREROUTING -m addrtype -dst-type LOCAL -j DOCKER:
> > > > > iptables: No chain/target/match by that name. === End docker
> > > > > messages ===
> > > > > 
> > > > > 
> > > > > 
> > > > > I was using my own custom image type, but I got the same results
> > > > > when trying to build and use core-image-minimal.
> > > > > 
> > > > > 
> > > > > 
> > > > > I tried including the
> > > > > meta-virtualization/recipes/kernel/linux/linux-yocto/docker.scc
> > > > > stuff in, but since I set MACHINE to intel-corei7-64, I copied
> > > > > the docker.scc and docker.cfg into my custom layer:
> > > > > 
> > > > > 
> > > > > 
> > > > > meta-stryker/common/recipes-kernel/linux/linux-intel/docker.cfg
> > > > > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_base
> > > > > li
> > > > > ne.s cc
> > > > > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend
> > > > > 
> > > > > 
> > > > > 
> > > > > That didn't seem to work either.  The modules always got built.
> > > > > For example, br_netfilter.ko is built:
> > > > > 
> > > > > 
> > > > > 
> > > > > lmuhlenkamp@c71703b3ba7d:~/build-20181213a/tmp-glibc$ find .
> > > > > -name br_netfilter.ko
> > > > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAU
> > > > > TO
> > > > > INC+
> > > > > 6a3254e7b3_56f15146cf-r0/image/lib/modules/4.14.78-intel-pk-stan
> > > > > da
> > > > > rd/k
> > > > > ernel/net/bridge/br_netfilter.ko
> > > > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAU
> > > > > TO
> > > > > INC+
> > > > > 6a3254e7b3_56f15146cf-r0/packages-split/kernel-module-br-netfilt
> > > > > er
> > > > > -4.1
> > > > > 4.78-intel-pk-standard/lib/modules/4.14.78-intel-pk-standard/ker
> > > > > ne
> > > > > l/ne
> > > > > t/bridge/br_netfilter.ko
> > > > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAU
> > > > > TO
> > > > > INC+
> > > > > 6a3254e7b3_56f15146cf-r0/linux-corei7-64-intel-common-standard-b
> > > > > ui
> > > > > ld/n
> > > > > et/bridge/br_netfilter.ko
> > > > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAU
> > > > > TO
> > > > > INC+
> > > > > 6a3254e7b3_56f15146cf-r0/package/lib/modules/4.14.78-intel-pk-st
> > > > > an dard /kernel/net/bridge/br_netfilter.ko
> > > > > 
> > > > > 
> > > > > 
> > > > > But these modules are not included in my image.  For example, if
> > > > > I do "find / -name br_netfilter.ko" on my target install,
> > > > > nothing is returned.
> > > > > 
> > > > > 
> > > > > 
> > > > > My bblayers.conf is as follows:
> > > > > 
> > > > > 
> > > > > 
> > > > > === Start conf/bblayers.conf === # LAYER_CONF_VERSION is
> > > > > increased each time build/conf/bblayers.conf # changes
> > > > > incompatibly LCONF_VERSION = "7"
> > > > > 
> > > > > 
> > > > > 
> > > > > BBPATH = "${TOPDIR}"
> > > > > BBFILES ?= ""
> > > > > 
> > > > > 
> > > > > 
> > > > > BBLAYERS ?= " \
> > > > > 
> > > > >   /home/lmuhlenkamp/oe-core/meta \
> > > > >   /home/lmuhlenkamp/meta-openembedded/meta-python \
> > > > >   /home/lmuhlenkamp/meta-openembedded/meta-gnome \
> > > > >   /home/lmuhlenkamp/meta-openembedded/meta-filesystems \
> > > > >   /home/lmuhlenkamp/meta-openembedded/meta-oe \
> > > > >   /home/lmuhlenkamp/meta-openembedded/meta-networking \
> > > > >   /home/lmuhlenkamp/meta-openembedded/meta-initramfs \
> > > > >   /home/lmuhlenkamp/meta-openembedded/meta-webserver \
> > > > >   /home/lmuhlenkamp/meta-intel \
> > > > >   /home/lmuhlenkamp/meta-virtualization \
> > > > >   /home/lmuhlenkamp/meta-cloud-services \
> > > > >   /home/lmuhlenkamp/meta-cloud-services/meta-openstack \
> > > > >   /home/lmuhlenkamp/meta-iot-cloud \
> > > > >   /home/lmuhlenkamp/meta-secure-core/meta-tpm \
> > > > >   /home/lmuhlenkamp/meta-stryker/common \
> > > > >   /home/lmuhlenkamp/meta-stryker/testing \
> > > > >   "
> > > > > 
> > > > > === End conf/bblayers.conf ===
> > > > > 
> > > > > 
> > > > > 
> > > > > The customizations to my local.conf file are as follows:
> > > > > 
> > > > > 
> > > > > 
> > > > > === Start local.conf excerpt === MACHINE ?= "intel-corei7-64"
> > > > > IMAGE_FSTYPES += "live"
> > > > > NOISO = "0"
> > > > > IMAGE_INSTALL_append = " glibc-utils localedef"
> > > > > GLIBC_GENERATE_LOCALES = "el_GR.UTF-8 en_GB.UTF-8 en_US.UTF-8
> > > > > es_ES.UTF-8
> > > > > de_DE.UTF-8 fa_IR fr_FR.UTF-8 hr_HR.UTF-8 ja_JP.UTF-8
> > > > > ja_JP.EUC-JP
> > > > > lt_LT.UTF-8 ru_RU.UTF-8 tr_TR.UTF-8"
> > >  
> > >  IMAGE_LINGUAS = "el-gr en-gb en-us
> > >  
> > > > > es-es de-de fa-ir fr-fr hr-hr ja-jp ja-jp.euc-jp lt-lt ru-ru tr-tr"
> > > > > DISTRO_FEATURES_append = " systemd virtualization"
> > > > > DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> > > > > VIRTUAL-RUNTIME_init_manager = "systemd"
> > > > > VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> > > > > DISTRO_FEATURES_append = " opengl"
> > > > > CORE_IMAGE_EXTRA_INSTALL += "rpm python3 python3-pip
> > > > > python3-flask python3-requests python3-coverage python3-pylint"
> > > > > CORE_IMAGE_EXTRA_INSTALL += "python-sphinx"
> > > > > CORE_IMAGE_EXTRA_INSTALL += "python-flake8"
> > > > > CORE_IMAGE_EXTRA_INSTALL += "python3-doxypypy"
> > > > > CORE_IMAGE_EXTRA_INSTALL += "trousers tpm-tools openssl-tpm-engine"
> > > > > KERNEL_FEATURES_append = " features/netfilter/netfilter.scc
> > > > > features/overlayfs/overlayfs.scc"
> > >  
> > >  KERNEL_ENABLE_CGROUPS = "1"
> > >  
> > > > > CORE_IMAGE_EXTRA_INSTALL += "docker"
> > > > > SERIAL_CONSOLES = "38400 tty1"
> > > > > CORE_IMAGE_EXTRA_INSTALL += "flaskhello"
> > > > > === End local.conf excerpt ===
> > > > > 
> > > > > 
> > > > > 
> > > > > I did not have the KERNEL_FEATURES_append line in when using the
> > > > > recipes-kernel/linux/linux-intel stuff.  I didn't have the
> > > > > recipes-kernel/linux/linux-intel directory available when using
> > > > > the KERNEL_FEATURES_append line in local.conf.  Based on what I
> > > > > read, they were mutually exclusive.
> > > > > 
> > > > > 
> > > > > 
> > > > > What am I missing?  Why are the kernel modules not being
> > > > > included in my image?
> > > > > 
> > > > > 
> > > > > 
> > > > > I did try tweaking my docker.cfg file in my custom kernel recipe
> > > > > to include cgroups, but that did not seem to change anything.
> > > > > Here are the contents of my custom docker.cfg file
> > > > > 
> > > > > 
> > > > > 
> > > > > === Start
> > > > > meta-stryker/common/recipes-kernel/linux/linux-intel/docker/dock
> > > > > er
> > > > > .cfg
> > > > > === CONFIG_CGROUP_DEVICE=y
> > > > > 
> > > > > 
> > > > > 
> > > > > CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
> > > > > CONFIG_IP_NF_FILTER=m
> > > > > CONFIG_NF_NAT=m
> > > > > CONFIG_NF_CONNTRACK_IPV4=y
> > > > > CONFIG_NF_CT_NETLINK=y
> > > > > 
> > > > > 
> > > > > 
> > > > > CONFIG_BRIDGE_NETFILTER=m
> > > > > CONFIG_XFRM_USER=m
> > > > > 
> > > > > 
> > > > > 
> > > > > CONFIG_DM_THIN_PROVISIONING=m
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > CONFIG_IP_NF_NAT=m
> > > > > CONFIG_IP_NF_TARGET_MASQUERADE=m
> > > > > 
> > > > > 
> > > > > 
> > > > > CONFIG_OVERLAY_FS=y
> > > > > === End
> > > > > meta-stryker/common/recipes-kernel/linux/linux-intel/docker/dock
> > > > > er
> > > > > .cfg
> > > > > ===
> > > > > 
> > > > > 
> > > > > 
> > > > > And for completeness, here are the contents of the other 2 files
> > > > > in that recipe
> > > > > 
> > > > > 
> > > > > 
> > > > > === Start
> > > > > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend
> > > > > === FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > >  
> > >  SRC_URI +=
> > >  
> > > > > "file://kernel_baseline.scc"
> > > > > === End
> > > > > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend
> > > > > ===
> > > > > 
> > > > > 
> > > > > 
> > > > > === Start
> > > > > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_base
> > > > > li ne.scc === define KFEATURE_DESCRIPTION "Enable Features
> > > > > needed by docker in addition to LXC features"
> > >  
> > >  define KFEATURE_COMPATIBILITY board
> > >  
> > > > > kconf non-hardware docker.cfg
> > > > > === End
> > > > > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_base
> > > > > li
> > > > > ne.s
> > > > > cc ===
> > > > > 
> > > > > 
> > > > > 
> > > > > Any help that would allow me to get docker functionality working
> > > > > in my openembedded linux image would be greatly appreciated.
> > > > > 
> > > > > 
> > > > > 
> > > > > Thank you
> > > > > 
> > > > > 
> > > > > 
> > > > > Lewis Muhlenkamp
> > > > > 
> > > > > 
> > > > > 
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-deve
> > > > > l





