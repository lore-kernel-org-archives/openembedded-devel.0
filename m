Return-Path: <lewis.muhlenkamp@stryker.com>
X-Greylist: delayed 21688 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 12 Jan 2019 00:39:26 UTC
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr710041.outbound.protection.outlook.com [40.107.71.41])
	by mail.openembedded.org (Postfix) with ESMTP id 01E987C18C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 00:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PI9i7qyu1QsUZfFbsi9z0AfC9DcNQJTvSkutQ3RD9jg=;
	b=XqbNxChaUMYhjGjGUkO0605IpVoSwlxGw09PqxF5A43hfdtoKTMYph+MMDq64GxxCiz+Z3i+7EmbZGXAHniboLB9NETzAgwwLYYiIYYkCZ3SRC0T3OSacm0bIqiBdvIbq+o3XUrohkqf2ki8jzpuEgvj96mYkYYSGW842TTA5og=
Received: from DM6PR01MB4636.prod.exchangelabs.com (20.177.216.161) by
	DM6PR01MB4666.prod.exchangelabs.com (20.177.217.15) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.14; Thu, 10 Jan 2019 16:49:36 +0000
Received: from DM6PR01MB4636.prod.exchangelabs.com
	([fe80::6929:8adf:c078:334b]) by DM6PR01MB4636.prod.exchangelabs.com
	([fe80::6929:8adf:c078:334b%4]) with mapi id 15.20.1495.011;
	Thu, 10 Jan 2019 16:49:36 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Kernel modules being built, but not being included in image
Thread-Index: AdSo/YZJsbDelO6ySpe6eA6PkwapeA==
Date: Thu, 10 Jan 2019 16:49:36 +0000
Message-ID: <DM6PR01MB4636DE2DFD81ED5926A24F9F8F840@DM6PR01MB4636.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [165.225.32.65]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4666;
	20:7Kq+IZQmODUK7Tkt3xfo/pPVuaamOxynU7g4tSyDVV2FufYcueYB7VuA2zXPtUwhJnqES8s7iFtNIw8pj9c5WUJ9Bp8nunJZi7cMpxnrzTc98ubdnjpcGgDDYv8G1/Ywzj3DVzmFpLPsKxb3DOgF+ArIBMXNc8JfMbClWHFykHCOsfeeXdF8m5IDhTs8qBuomzqbVTLZZKDPkz/wmwXmebjTYrZk6e0zdLQP52U1U8gowrrRqfn/hNt76RYswHLq;
	23:ZLllAjqEqEFR2ths/9aKeysUSlZSf0LeA/9DWATQHxl1+cOBCIgftTeIaLwExLIp9PcENTNuqDOCw5MDX24VyiSXYcUUEvv/iveuHRftSh7MIMeme8z8qa2j/5M7mTO+lLyzMYAyhmlBKdtLQHLZWA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 01d44640-5e77-40ab-b5f8-08d6771b9aa7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7167020)(7153060)(7193020);
	SRVR:DM6PR01MB4666; 
X-MS-TrafficTypeDiagnostic: DM6PR01MB4666:|DM6PR01MB4666:
x-microsoft-antispam-prvs: <DM6PR01MB4666D3BE86814397A89916178F840@DM6PR01MB4666.prod.exchangelabs.com>
x-forefront-prvs: 0913EA1D60
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(366004)(346002)(136003)(396003)(199004)(189003)(8676002)(5640700003)(2501003)(476003)(2351001)(6116002)(790700001)(3846002)(9326002)(81156014)(14454004)(81166006)(5660300001)(6916009)(6436002)(66066001)(486006)(86362001)(55016002)(74316002)(567974002)(7736002)(14444005)(68736007)(256004)(2906002)(71200400001)(71190400001)(7696005)(106356001)(478600001)(97736004)(99286004)(8936002)(55236004)(316002)(9686003)(6306002)(54896002)(105586002)(6506007)(26005)(33656002)(53936002)(102836004)(25786009)(186003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR01MB4666;
	H:DM6PR01MB4636.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Qv1TiVDeSMFC7VojAupsaAEsi9MoAGvWC7hT2t2RiUGe8F0ncqsGO8VvzIHC8k50ekciVs2xgPBL3yTPmCALVfPQdmcSpudjE8Frt1d+acl3kdGfzYvaSIL9A7cmQIId+q87pabIsEFQMHgLo5L09iCd6z19tQcv5smgrNrEd6a4qmJXjsghmDeJNmAhIda0Q3ETGXsWyW2J8+KYjO49DTNhoCZpLG8ItjbOPb51gD6u4+Fd1u55MEQ+OHsePTDwYQQGE/4T+duT2LMENfmRvhE0FElSepGUB4XnxHdEikpCWuZEnlN5KXiD19Q75ZUODTLqoiioP8TQkSSxA7DUt00d/7LO36vxtJt+zl1w6QJJBU442r7hY0kOdJ/Go422/MU2c9rrvd1EWe/X7UBKdzdIz8Adsi10ZwUIjBWhb2zLjz7lXy05o6mWnqHKyVet/NoPxhcnj6ubZiWFxrihKQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d44640-5e77-40ab-b5f8-08d6771b9aa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2019 16:49:36.1358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4666
X-OriginatorOrg: stryker.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Kernel modules being built, but not being included in image
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
X-List-Received-Date: Sat, 12 Jan 2019 00:39:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

TLDR: How do I get docker fully functional in my openembedded linux image?

I've been trying to get docker included into my image.  All of my attempts =
lead to the same error messages appearing in the log file, and docker not s=
tarting.

The error messages are

=3D=3D=3D Start docker messages =3D=3D=3D
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.4=
14778299Z" level=3Derror msg=3D"Failed to built-in GetDriver graph btrfs /v=
ar/lib/docker"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.4=
60695720Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs p=
eriod"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.4=
60795185Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs q=
uotas"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.4=
60896539Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs b=
lkio weight"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.4=
61255643Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs b=
lkio throttle.read_bps_device"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.4=
61381616Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs b=
lkio throttle.write_bps_device"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.4=
61503746Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs b=
lkio throttle.read_iops_device"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.4=
61601879Z" level=3Dwarning msg=3D"Your kernel does not support cgroup cfs b=
lkio throttle.write_iops_device"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.4=
75747665Z" level=3Dwarning msg=3D"Running modprobe bridge br_netfilter fail=
ed with message: modprobe: WARNING: Module br_netfilter not found in direct=
ory /lib/modules/4.14.78-intel-pk-standard\ninsmod /lib/modules/4.14.78-int=
el-pk-standard/kernel/net/llc.ko \ninsmod /lib/modules/4.14.78-intel-pk-sta=
ndard/kernel/net/802/stp.ko \ninsmod /lib/modules/4.14.78-intel-pk-standard=
/kernel/net/bridge/bridge.ko \n, error: exit status 1"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.6=
59844723Z" level=3Dwarning msg=3D"Could not load necessary modules for IPSE=
C rules: Running modprobe xfrm_user failed with message: `modprobe: WARNING=
: Module xfrm_user not found in directory /lib/modules/4.14.78-intel-pk-sta=
ndard`, error: exit status 1"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.6=
62494167Z" level=3Dwarning msg=3D"Could not load necessary modules for Conn=
track: Running modprobe nf_conntrack_netlink failed with message: `modprobe=
: WARNING: Module nf_conntrack_netlink not found in directory /lib/modules/=
4.14.78-intel-pk-standard`, error: exit status 1"
Jan 10 15:56:25 intel-corei7-64 dockerd[210]: failed to start daemon: Error=
 initializing network controller: Error creating default "bridge" network: =
Failed to program NAT chain: Failed to inject DOCKER in PREROUTING chain: i=
ptables failed: iptables -wait -t nat -A PREROUTING -m addrtype -dst-type L=
OCAL -j DOCKER: iptables: No chain/target/match by that name.
=3D=3D=3D End docker messages =3D=3D=3D

I was using my own custom image type, but I got the same results when tryin=
g to build and use core-image-minimal.

I tried including the meta-virtualization/recipes/kernel/linux/linux-yocto/=
docker.scc stuff in, but since I set MACHINE to intel-corei7-64, I copied t=
he docker.scc and docker.cfg into my custom layer:

meta-stryker/common/recipes-kernel/linux/linux-intel/docker.cfg
meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_baseline.scc
meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend

That didn't seem to work either.  The modules always got built.  For exampl=
e, br_netfilter.ko is built:

lmuhlenkamp@c71703b3ba7d:~/build-20181213a/tmp-glibc$ find . -name br_netfi=
lter.ko
./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+6a325=
4e7b3_56f15146cf-r0/image/lib/modules/4.14.78-intel-pk-standard/kernel/net/=
bridge/br_netfilter.ko
./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+6a325=
4e7b3_56f15146cf-r0/packages-split/kernel-module-br-netfilter-4.14.78-intel=
-pk-standard/lib/modules/4.14.78-intel-pk-standard/kernel/net/bridge/br_net=
filter.ko
./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+6a325=
4e7b3_56f15146cf-r0/linux-corei7-64-intel-common-standard-build/net/bridge/=
br_netfilter.ko
./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTOINC+6a325=
4e7b3_56f15146cf-r0/package/lib/modules/4.14.78-intel-pk-standard/kernel/ne=
t/bridge/br_netfilter.ko

But these modules are not included in my image.  For example, if I do "find=
 / -name br_netfilter.ko" on my target install, nothing is returned.

My bblayers.conf is as follows:

=3D=3D=3D Start conf/bblayers.conf =3D=3D=3D
# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION =3D "7"

BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""

BBLAYERS ?=3D " \
  /home/lmuhlenkamp/oe-core/meta \
  /home/lmuhlenkamp/meta-openembedded/meta-python \
  /home/lmuhlenkamp/meta-openembedded/meta-gnome \
  /home/lmuhlenkamp/meta-openembedded/meta-filesystems \
  /home/lmuhlenkamp/meta-openembedded/meta-oe \
  /home/lmuhlenkamp/meta-openembedded/meta-networking \
  /home/lmuhlenkamp/meta-openembedded/meta-initramfs \
  /home/lmuhlenkamp/meta-openembedded/meta-webserver \
  /home/lmuhlenkamp/meta-intel \
  /home/lmuhlenkamp/meta-virtualization \
  /home/lmuhlenkamp/meta-cloud-services \
  /home/lmuhlenkamp/meta-cloud-services/meta-openstack \
  /home/lmuhlenkamp/meta-iot-cloud \
  /home/lmuhlenkamp/meta-secure-core/meta-tpm \
  /home/lmuhlenkamp/meta-stryker/common \
  /home/lmuhlenkamp/meta-stryker/testing \
  "
=3D=3D=3D End conf/bblayers.conf =3D=3D=3D

The customizations to my local.conf file are as follows:

=3D=3D=3D Start local.conf excerpt =3D=3D=3D
MACHINE ?=3D "intel-corei7-64"
IMAGE_FSTYPES +=3D "live"
NOISO =3D "0"
IMAGE_INSTALL_append =3D " glibc-utils localedef"
GLIBC_GENERATE_LOCALES =3D "el_GR.UTF-8 en_GB.UTF-8 en_US.UTF-8 es_ES.UTF-8=
 de_DE.UTF-8 fa_IR fr_FR.UTF-8 hr_HR.UTF-8 ja_JP.UTF-8 ja_JP.EUC-JP lt_LT.U=
TF-8 ru_RU.UTF-8 tr_TR.UTF-8"
IMAGE_LINGUAS =3D "el-gr en-gb en-us es-es de-de fa-ir fr-fr hr-hr ja-jp ja=
-jp.euc-jp lt-lt ru-ru tr-tr"
DISTRO_FEATURES_append =3D " systemd virtualization"
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
VIRTUAL-RUNTIME_init_manager =3D "systemd"
VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
DISTRO_FEATURES_append =3D " opengl"
CORE_IMAGE_EXTRA_INSTALL +=3D "rpm python3 python3-pip python3-flask python=
3-requests python3-coverage python3-pylint"
CORE_IMAGE_EXTRA_INSTALL +=3D "python-sphinx"
CORE_IMAGE_EXTRA_INSTALL +=3D "python-flake8"
CORE_IMAGE_EXTRA_INSTALL +=3D "python3-doxypypy"
CORE_IMAGE_EXTRA_INSTALL +=3D "trousers tpm-tools openssl-tpm-engine"
KERNEL_FEATURES_append =3D " features/netfilter/netfilter.scc features/over=
layfs/overlayfs.scc"
KERNEL_ENABLE_CGROUPS =3D "1"
CORE_IMAGE_EXTRA_INSTALL +=3D "docker"
SERIAL_CONSOLES =3D "38400 tty1"
CORE_IMAGE_EXTRA_INSTALL +=3D "flaskhello"
=3D=3D=3D End local.conf excerpt =3D=3D=3D

I did not have the KERNEL_FEATURES_append line in when using the recipes-ke=
rnel/linux/linux-intel stuff.  I didn't have the recipes-kernel/linux/linux=
-intel directory available when using the KERNEL_FEATURES_append line in lo=
cal.conf.  Based on what I read, they were mutually exclusive.

What am I missing?  Why are the kernel modules not being included in my ima=
ge?

I did try tweaking my docker.cfg file in my custom kernel recipe to include=
 cgroups, but that did not seem to change anything.  Here are the contents =
of my custom docker.cfg file

=3D=3D=3D Start meta-stryker/common/recipes-kernel/linux/linux-intel/docker=
/docker.cfg =3D=3D=3D
CONFIG_CGROUP_DEVICE=3Dy

CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
CONFIG_IP_NF_FILTER=3Dm
CONFIG_NF_NAT=3Dm
CONFIG_NF_CONNTRACK_IPV4=3Dy
CONFIG_NF_CT_NETLINK=3Dy

CONFIG_BRIDGE_NETFILTER=3Dm
CONFIG_XFRM_USER=3Dm

CONFIG_DM_THIN_PROVISIONING=3Dm


CONFIG_IP_NF_NAT=3Dm
CONFIG_IP_NF_TARGET_MASQUERADE=3Dm

CONFIG_OVERLAY_FS=3Dy
=3D=3D=3D End meta-stryker/common/recipes-kernel/linux/linux-intel/docker/d=
ocker.cfg =3D=3D=3D

And for completeness, here are the contents of the other 2 files in that re=
cipe

=3D=3D=3D Start meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbap=
pend =3D=3D=3D
FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
SRC_URI +=3D "file://kernel_baseline.scc"
=3D=3D=3D End meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappe=
nd =3D=3D=3D

=3D=3D=3D Start meta-stryker/common/recipes-kernel/linux/linux-intel/kernel=
_baseline.scc =3D=3D=3D
define KFEATURE_DESCRIPTION "Enable Features needed by docker in addition t=
o LXC features"
define KFEATURE_COMPATIBILITY board

kconf non-hardware docker.cfg
=3D=3D=3D End meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_b=
aseline.scc =3D=3D=3D

Any help that would allow me to get docker functionality working in my open=
embedded linux image would be greatly appreciated.

Thank you

Lewis Muhlenkamp


