Return-Path: <asselsm@gmail.com>
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
	[209.85.219.179])
	by mail.openembedded.org (Postfix) with ESMTP id C6AB379ECE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 21:56:36 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id a190so259603ybg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 13:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=7H+jkF3sBJFtw7hkQyXNs207jqwFrosk/qagQ/A9pFA=;
	b=Iyv1CVzZJSLCxKtMrwP3TlOjwUrg+ouzFoX22CmCRoq3dJ8o/fvXkinfAIyCtB8AbB
	u31DzKFWaXk2iOG5wupn217rRY8SO1C3fxY11z3xd+G2n4KWs6AMiOsVnEB31gY5rC3x
	Pk8q9bD6vquQyrRu5bK4WgspsspE13/Hr7OmdS479gKkhXWRmDEC+EABRB6/7ErEhcap
	NbtFKh5cOq/FV0phiVcSPJB7DOYdlXwkxFliy5zGDhYFcX5qjOWQfZnbvEIQBI6btXpQ
	sjHjQJeT/6DzFP+iaEBPyYmHkWM5QrY++Hb18WW19ZgLW8wxLnGtSMOoz8R+blckKZSo
	ZTNg==
X-Gm-Message-State: AJcUukfCdfq87fL/IJn2RJJKYnrscQwVUbSdmWWcLwdbFY3x3E7b3A9e
	zgrfu1cXCnHTd5su/2icE1Thu6HLTpAE7O712No=
X-Google-Smtp-Source: ALg8bN5H3MfIEBnOL8O0ztrQUqjpREo+HCl2mDtbR32ZpcheViMoHOiRkdfCP1OAXqwpKwFjGy/iNA8XMwSCpywar0Q=
X-Received: by 2002:a25:5a05:: with SMTP id o5mr494439ybb.510.1547502997498;
	Mon, 14 Jan 2019 13:56:37 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR01MB4636DE2DFD81ED5926A24F9F8F840@DM6PR01MB4636.prod.exchangelabs.com>
In-Reply-To: <DM6PR01MB4636DE2DFD81ED5926A24F9F8F840@DM6PR01MB4636.prod.exchangelabs.com>
Reply-To: mark.asselstine@windriver.com
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 14 Jan 2019 16:56:26 -0500
Message-ID: <CAPuovEJS2oTwaNGpD3th3efTwx2DufdyT_E5gUfa3S7bh9azOw@mail.gmail.com>
To: lewis.muhlenkamp@stryker.com
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
X-List-Received-Date: Mon, 14 Jan 2019 21:56:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This has been asked in the past and I did have a "mini" layer that
could be used in addition to meta-virt to allow you to get what you
need in an image fairly easily. We were going to do some work to make
this easier but I haven't looked in a while so I can't say where
things are at off the top of my head. At any rate I am just back from
some travel but I will try to take a look at this tomorrow, after
which I should be able to provide some better guidance.

Mark
On Fri, Jan 11, 2019 at 7:39 PM Muhlenkamp, Lewis
<lewis.muhlenkamp@stryker.com> wrote:
>
> Hello,
>
> TLDR: How do I get docker fully functional in my openembedded linux image=
?
>
> I've been trying to get docker included into my image.  All of my attempt=
s lead to the same error messages appearing in the log file, and docker not=
 starting.
>
> The error messages are
>
> =3D=3D=3D Start docker messages =3D=3D=3D
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.414778299Z" level=3Derror msg=3D"Failed to built-in GetDriver graph btrfs =
/var/lib/docker"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.460695720Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs=
 period"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.460795185Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs=
 quotas"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.460896539Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs=
 blkio weight"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.461255643Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs=
 blkio throttle.read_bps_device"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.461381616Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs=
 blkio throttle.write_bps_device"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.461503746Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs=
 blkio throttle.read_iops_device"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.461601879Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs=
 blkio throttle.write_iops_device"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.475747665Z" level=3Dwarning msg=3D"Running modprobe bridge br_netfilter fa=
iled with message: modprobe: WARNING: Module br_netfilter not found in dire=
ctory /lib/modules/4.14.78-intel-pk-standard\ninsmod /lib/modules/4.14.78-i=
ntel-pk-standard/kernel/net/llc.ko \ninsmod /lib/modules/4.14.78-intel-pk-s=
tandard/kernel/net/802/stp.ko \ninsmod /lib/modules/4.14.78-intel-pk-standa=
rd/kernel/net/bridge/bridge.ko \n, error: exit status 1"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.659844723Z" level=3Dwarning msg=3D"Could not load necessary modules for IP=
SEC rules: Running modprobe xfrm_user failed with message: `modprobe: WARNI=
NG: Module xfrm_user not found in directory /lib/modules/4.14.78-intel-pk-s=
tandard`, error: exit status 1"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25=
.662494167Z" level=3Dwarning msg=3D"Could not load necessary modules for Co=
nntrack: Running modprobe nf_conntrack_netlink failed with message: `modpro=
be: WARNING: Module nf_conntrack_netlink not found in directory /lib/module=
s/4.14.78-intel-pk-standard`, error: exit status 1"
> Jan 10 15:56:25 intel-corei7-64 dockerd[210]: failed to start daemon: Err=
or initializing network controller: Error creating default "bridge" network=
: Failed to program NAT chain: Failed to inject DOCKER in PREROUTING chain:=
 iptables failed: iptables -wait -t nat -A PREROUTING -m addrtype -dst-type=
 LOCAL -j DOCKER: iptables: No chain/target/match by that name.
> =3D=3D=3D End docker messages =3D=3D=3D
>
> I was using my own custom image type, but I got the same results when try=
ing to build and use core-image-minimal.
>
> I tried including the meta-virtualization/recipes/kernel/linux/linux-yoct=
o/docker.scc stuff in, but since I set MACHINE to intel-corei7-64, I copied=
 the docker.scc and docker.cfg into my custom layer:
>
> meta-stryker/common/recipes-kernel/linux/linux-intel/docker.cfg
> meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_baseline.scc
> meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend
>
> That didn't seem to work either.  The modules always got built.  For exam=
ple, br_netfilter.ko is built:
>
> lmuhlenkamp@c71703b3ba7d:~/build-20181213a/tmp-glibc$ find . -name br_net=
filter.ko
> ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+6a3=
254e7b3_56f15146cf-r0/image/lib/modules/4.14.78-intel-pk-standard/kernel/ne=
t/bridge/br_netfilter.ko
> ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+6a3=
254e7b3_56f15146cf-r0/packages-split/kernel-module-br-netfilter-4.14.78-int=
el-pk-standard/lib/modules/4.14.78-intel-pk-standard/kernel/net/bridge/br_n=
etfilter.ko
> ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+6a3=
254e7b3_56f15146cf-r0/linux-corei7-64-intel-common-standard-build/net/bridg=
e/br_netfilter.ko
> ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+6a3=
254e7b3_56f15146cf-r0/package/lib/modules/4.14.78-intel-pk-standard/kernel/=
net/bridge/br_netfilter.ko
>
> But these modules are not included in my image.  For example, if I do "fi=
nd / -name br_netfilter.ko" on my target install, nothing is returned.
>
> My bblayers.conf is as follows:
>
> =3D=3D=3D Start conf/bblayers.conf =3D=3D=3D
> # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> # changes incompatibly
> LCONF_VERSION =3D "7"
>
> BBPATH =3D "${TOPDIR}"
> BBFILES ?=3D ""
>
> BBLAYERS ?=3D " \
>   /home/lmuhlenkamp/oe-core/meta \
>   /home/lmuhlenkamp/meta-openembedded/meta-python \
>   /home/lmuhlenkamp/meta-openembedded/meta-gnome \
>   /home/lmuhlenkamp/meta-openembedded/meta-filesystems \
>   /home/lmuhlenkamp/meta-openembedded/meta-oe \
>   /home/lmuhlenkamp/meta-openembedded/meta-networking \
>   /home/lmuhlenkamp/meta-openembedded/meta-initramfs \
>   /home/lmuhlenkamp/meta-openembedded/meta-webserver \
>   /home/lmuhlenkamp/meta-intel \
>   /home/lmuhlenkamp/meta-virtualization \
>   /home/lmuhlenkamp/meta-cloud-services \
>   /home/lmuhlenkamp/meta-cloud-services/meta-openstack \
>   /home/lmuhlenkamp/meta-iot-cloud \
>   /home/lmuhlenkamp/meta-secure-core/meta-tpm \
>   /home/lmuhlenkamp/meta-stryker/common \
>   /home/lmuhlenkamp/meta-stryker/testing \
>   "
> =3D=3D=3D End conf/bblayers.conf =3D=3D=3D
>
> The customizations to my local.conf file are as follows:
>
> =3D=3D=3D Start local.conf excerpt =3D=3D=3D
> MACHINE ?=3D "intel-corei7-64"
> IMAGE_FSTYPES +=3D "live"
> NOISO =3D "0"
> IMAGE_INSTALL_append =3D " glibc-utils localedef"
> GLIBC_GENERATE_LOCALES =3D "el_GR.UTF-8 en_GB.UTF-8 en_US.UTF-8 es_ES.UTF=
-8 de_DE.UTF-8 fa_IR fr_FR.UTF-8 hr_HR.UTF-8 ja_JP.UTF-8 ja_JP.EUC-JP lt_LT=
.UTF-8 ru_RU.UTF-8 tr_TR.UTF-8"
> IMAGE_LINGUAS =3D "el-gr en-gb en-us es-es de-de fa-ir fr-fr hr-hr ja-jp =
ja-jp.euc-jp lt-lt ru-ru tr-tr"
> DISTRO_FEATURES_append =3D " systemd virtualization"
> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> VIRTUAL-RUNTIME_init_manager =3D "systemd"
> VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> DISTRO_FEATURES_append =3D " opengl"
> CORE_IMAGE_EXTRA_INSTALL +=3D "rpm python3 python3-pip python3-flask pyth=
on3-requests python3-coverage python3-pylint"
> CORE_IMAGE_EXTRA_INSTALL +=3D "python-sphinx"
> CORE_IMAGE_EXTRA_INSTALL +=3D "python-flake8"
> CORE_IMAGE_EXTRA_INSTALL +=3D "python3-doxypypy"
> CORE_IMAGE_EXTRA_INSTALL +=3D "trousers tpm-tools openssl-tpm-engine"
> KERNEL_FEATURES_append =3D " features/netfilter/netfilter.scc features/ov=
erlayfs/overlayfs.scc"
> KERNEL_ENABLE_CGROUPS =3D "1"
> CORE_IMAGE_EXTRA_INSTALL +=3D "docker"
> SERIAL_CONSOLES =3D "38400 tty1"
> CORE_IMAGE_EXTRA_INSTALL +=3D "flaskhello"
> =3D=3D=3D End local.conf excerpt =3D=3D=3D
>
> I did not have the KERNEL_FEATURES_append line in when using the recipes-=
kernel/linux/linux-intel stuff.  I didn't have the recipes-kernel/linux/lin=
ux-intel directory available when using the KERNEL_FEATURES_append line in =
local.conf.  Based on what I read, they were mutually exclusive.
>
> What am I missing?  Why are the kernel modules not being included in my i=
mage?
>
> I did try tweaking my docker.cfg file in my custom kernel recipe to inclu=
de cgroups, but that did not seem to change anything.  Here are the content=
s of my custom docker.cfg file
>
> =3D=3D=3D Start meta-stryker/common/recipes-kernel/linux/linux-intel/dock=
er/docker.cfg =3D=3D=3D
> CONFIG_CGROUP_DEVICE=3Dy
>
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
> CONFIG_IP_NF_FILTER=3Dm
> CONFIG_NF_NAT=3Dm
> CONFIG_NF_CONNTRACK_IPV4=3Dy
> CONFIG_NF_CT_NETLINK=3Dy
>
> CONFIG_BRIDGE_NETFILTER=3Dm
> CONFIG_XFRM_USER=3Dm
>
> CONFIG_DM_THIN_PROVISIONING=3Dm
>
>
> CONFIG_IP_NF_NAT=3Dm
> CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
>
> CONFIG_OVERLAY_FS=3Dy
> =3D=3D=3D End meta-stryker/common/recipes-kernel/linux/linux-intel/docker=
/docker.cfg =3D=3D=3D
>
> And for completeness, here are the contents of the other 2 files in that =
recipe
>
> =3D=3D=3D Start meta-stryker/common/recipes-kernel/linux/linux-intel_%.bb=
append =3D=3D=3D
> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> SRC_URI +=3D "file://kernel_baseline.scc"
> =3D=3D=3D End meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbap=
pend =3D=3D=3D
>
> =3D=3D=3D Start meta-stryker/common/recipes-kernel/linux/linux-intel/kern=
el_baseline.scc =3D=3D=3D
> define KFEATURE_DESCRIPTION "Enable Features needed by docker in addition=
 to LXC features"
> define KFEATURE_COMPATIBILITY board
>
> kconf non-hardware docker.cfg
> =3D=3D=3D End meta-stryker/common/recipes-kernel/linux/linux-intel/kernel=
_baseline.scc =3D=3D=3D
>
> Any help that would allow me to get docker functionality working in my op=
enembedded linux image would be greatly appreciated.
>
> Thank you
>
> Lewis Muhlenkamp
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

