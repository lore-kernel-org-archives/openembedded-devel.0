Return-Path: <lewis.muhlenkamp@stryker.com>
X-Greylist: delayed 149437 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Jan 2019 13:29:48 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800083.outbound.protection.outlook.com [40.107.80.83])
	by mail.openembedded.org (Postfix) with ESMTP id 391B460273
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DXaXPNSFgilOulS/KErh0ylWJ1PAuLEVTIty+UBZUS4=;
	b=KdNzOXXpzTXOqb3rlzQrrS+3NRdSI6G5NvV+CIm4wyvHGzGdrXeZJQPB/dlhEaKXcdlNXpV9Pn/3TAiVhrMDuquHCUMWaKNAcafx8Y5A8DslrwBFFsE8rqSb0hOiGNIjdABSeB4pgvr9mAiADK16bt5f4fGieveuXvDAJhrxGP4=
Received: from DM6PR01MB4636.prod.exchangelabs.com (20.177.216.161) by
	DM6PR01MB4746.prod.exchangelabs.com (20.177.217.219) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.14; Wed, 16 Jan 2019 13:39:08 +0000
Received: from DM6PR01MB4636.prod.exchangelabs.com
	([fe80::9147:8c0b:ee2:6d33]) by DM6PR01MB4636.prod.exchangelabs.com
	([fe80::9147:8c0b:ee2:6d33%2]) with mapi id 15.20.1516.019;
	Wed, 16 Jan 2019 13:39:08 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Thread-Topic: [oe] Kernel modules being built, but not being included in image
Thread-Index: AdSo/YZJsbDelO6ySpe6eA6PkwapeADVnikAACLYtVAAEZR5AAAIRqUAABXghHA=
Date: Wed, 16 Jan 2019 13:39:08 +0000
Message-ID: <DM6PR01MB46363A1A50A4C063A2A59A788F820@DM6PR01MB4636.prod.exchangelabs.com>
References: <DM6PR01MB4636DE2DFD81ED5926A24F9F8F840@DM6PR01MB4636.prod.exchangelabs.com>
	<DM6PR01MB4636C8BD15F7EF3A4D121F7D8F810@DM6PR01MB4636.prod.exchangelabs.com>
	<12403577.rzAvi41Ldg@yow-masselst-lx1>
	<24204196.tQc3WnnfOQ@yow-masselst-lx1>
In-Reply-To: <24204196.tQc3WnnfOQ@yow-masselst-lx1>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [165.225.32.56]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4746;
	20:M7eDQa/Iwg4WgARYtBsEWPH2eq79c+b/gRCJFiV+UKyIeSfzVfogdtyFpnhKTYstyqGRM8pmih8neEmI7EkBoA9CKvWemVag4xploCMeKQTPubI0YA4AYOKNU5C0AOG52V7+Km2cvhT7sxjwuIaxAej93XlNRu0dTsmIMLxnjIyvuFetHj/Yq9G1I3rTUjOewPw8LPRa9DbfH3z8bqAdPYKr1thKBSI0NPPWMSAHqkkHSXAbsK3LjvZwXbKk4fIA;
	23:47LAjWPNhpR7134zUTr2p2QoX4fLxUOFlEIL2YcubRTw+oi8cNlm2EikJqJk2D+NmlulLxxZ96V2iC9n6/4bxxbwiQUOuiyi5QxHR8K5dA/FqmTRLsiJ7mEY1PRUGdMkz88VbnQPIniP2CSRXWnpwA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 6255d04c-bb11-4f6e-6682-08d67bb7fd7c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7167020)(7153060)(7193020);
	SRVR:DM6PR01MB4746; 
X-MS-TrafficTypeDiagnostic: DM6PR01MB4746:|DM6PR01MB4746:
x-microsoft-antispam-prvs: <DM6PR01MB4746C2D4F0648923EB1ED3D58F820@DM6PR01MB4746.prod.exchangelabs.com>
x-forefront-prvs: 091949432C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39860400002)(346002)(376002)(136003)(396003)(199004)(189003)(13464003)(316002)(105586002)(81166006)(2906002)(33656002)(9686003)(6246003)(53936002)(6306002)(53946003)(71200400001)(6916009)(6116002)(8936002)(106356001)(86362001)(3846002)(93886005)(8676002)(81156014)(76176011)(7736002)(99286004)(966005)(305945005)(71190400001)(4326008)(55016002)(55236004)(53546011)(256004)(478600001)(5660300001)(102836004)(7696005)(14444005)(74316002)(6506007)(68736007)(186003)(6436002)(14454004)(97736004)(30864003)(229853002)(476003)(66066001)(486006)(446003)(25786009)(11346002)(26005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR01MB4746;
	H:DM6PR01MB4636.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: trC7GdbUr7scq364VkznbSfcvRyJaD2NJHF6vSUH/lRtWyU/DNsYcQ/PS8ZbROUxjgZwWZxlYSbUymTeSf8ggSe//GKOrIB5EB7VDVVKAf5f1JDcHNYpJa1BYps0G8+uKEPkXB4MogSYBq8knV7YyX1EDn22zT3MsoQqeteLcTCclzaE3vaQTv7O+ChONhAYvmzzNPre01RJt4RmD53aoPk4heFydb3Gj7YN268vMifjSoMKUIbRbx3vo8YxbqbSbTMZPTi+UV0+W4ml8VKEx06i8TA8X00GhRtiLQ7FoQF0T4QAvPnZrZ8n73O6uxHhF3vIYZ7VjnKLMulacZjy1qdQH6v4R3GYvw949PpIDCOU56gcEe0czuHzselkJ+C4c4VuROiOM/9aZcUBaw9zM0aF9eRpOlWolfejX4FqiMI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6255d04c-bb11-4f6e-6682-08d67bb7fd7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2019 13:39:08.0586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4746
X-OriginatorOrg: stryker.com
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
X-List-Received-Date: Thu, 17 Jan 2019 13:29:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark,

I haven't changed my bblayers.conf file since my original post.  I have eve=
rything that you have, and then some.

My DISTRO_FEATURES_append for virtualization and system are on one line.  I=
 have the other systemd lines in my local.conf too.

I have CORE_IMAGE_EXTRA_INSTALL +=3D "kernel-modules docker" instead of IMA=
GE_INSTALL_append.  The two seem to be interchangeable to me.  If that is n=
ot the case, please let me know.

I do not have any KERNEL_MODULE_AUTOLOAD lines in my local.conf.  I'm not s=
ure I need to since the modules appear in the lsmod output.

I thought it might be virtualbox that was not allowing me to create these v=
irtual interfaces for some reason.  So, I installed on my target hardware. =
 I got the same issue.

Nothing appears in any log when I run the docker command.  There is no debu=
g output when I run docker -D.

It seems like my docker instance does not have permission to create new vir=
tual ethernet interfaces.  What is the best way to test this?

Thanks

Lewis Muhlenkamp

-----Original Message-----
From: Mark Asselstine <mark.asselstine@windriver.com>=20
Sent: Tuesday, January 15, 2019 9:55 PM
To: Muhlenkamp, Lewis <lewis.muhlenkamp@stryker.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Kernel modules being built, but not being included in ima=
ge

On Tuesday, January 15, 2019 5:57:34 PM EST Mark Asselstine wrote:
> On Tuesday, January 15, 2019 1:26:31 PM EST Muhlenkamp, Lewis wrote:
> > Mark,
> >=20
> > I got the docker daemon to start up.  I figured out what I needed to=20
> > put into my .../recipes-kernel/linux/linux-intel/docker.cfg file to=20
> > make sure all of the kernel modules were builts.  I also found that=20
> > just adding
> >=20
> >     CORE_IMAGE_EXTRA_INSTALL +=3D "kernel-modules docker"
> >=20
> > will add all of the kernel modules as well as the docker software.
> >=20
> > So, the docker daemon is running.  I can run docker commands like=20
> > "docker image ls"  I can build a docker image, but I cannot run the doc=
ker image.
> > For example, I created a simple dockerfile that just has the line=20
> > "FROM ubuntu".  I can successfully run "docker build ." in that=20
> > directory.  It creates an image.  I can run "docker image ls" and=20
> > see the image.  When I run
> >=20
> >     docker run -I -t ubuntu "/bin/bash"
> >=20
> > though, I get an error message
> >=20
> > docker: Error response from daemon: failed to create endpoint=20
> > elated_aryabhatadoc on network bridge; failed to add the host
> > (veth3befa72)
> > <+> sandbox (veth40a3e1c) pair interfaces: operation not supported.
>=20
> Not surprisingly a container failed to start because of networking :).=20
> I would guess that 90% of the time I have a container fail to start it=20
> is networking related.
>=20
> The veth pair should be independent from your network interface,=20
> either real on real hw or virtual in your case. Whenever you see a=20
> veth or a pair of veth interfaces just visualize the classic blue cat5=20
> cable with two ends to it, where each end is plugged into "something".=20
> This is essentially what the veth pair represents. By default, when=20
> you run docker as you have the one end becomes the interface inside of=20
> the container, the other end is 'plugged' into the docker bridge on=20
> the host. Based on the message I am guessing the veth which is=20
> supposed to be 'plugged' into the docker bridge has failed to do so.
>=20
> My day was a bit messed up so I only got a build put together now so=20
> unfortunately I won't be able to get anything more helpful put=20
> together until tomorrow sometime. In the mean time ensure the docker0=20
> bridge is up and available. And if not figure out why it is not.


I was able to validate things. First here are my changes after I source oe-=
 init-build-env.

bblayers.conf
---
  /home/masselst/git/poky/layers/meta-virtualization \
  /home/masselst/git/poky/layers/meta-openembedded/meta-oe \
  /home/masselst/git/poky/layers/meta-openembedded/meta-networking \
  /home/masselst/git/poky/layers/meta-openembedded/meta-filesystems \
  /home/masselst/git/poky/layers/meta-openembedded/meta-python \


local.conf
---
DISTRO_FEATURES_append =3D " virtualization"
IMAGE_INSTALL_append =3D "docker \
 kernel-module-xt-conntrack \
 kernel-module-nf-nat \
 kernel-module-xt-addrtype"

KERNEL_MODULE_AUTOLOAD +=3D "xt_conntrack"
KERNEL_MODULE_AUTOLOAD +=3D "xt_addrtype"

DISTRO_FEATURES_append =3D " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
VIRTUAL-RUNTIME_init_manager =3D "systemd"
VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"

I also set the machine to "qemux86-64".


After using 'docker pull hello-world' I run it
---
root@qemux86-64:~# docker run -it hello-world [  434.530556] docker0: port =
1(veth2c4037e) entered blocking state [  434.533810] docker0: port 1(veth2c=
4037e) entered disabled state [  434.538888] device veth2c4037e entered pro=
miscuous mode [  434.552937] IPv6: ADDRCONF(NETDEV_UP): veth2c4037e: link i=
s not ready [  435.645525] eth0: renamed from veth6909d78 [  435.648422] IP=
v6: ADDRCONF(NETDEV_CHANGE): veth2c4037e: link becomes ready [  435.649944]=
 docker0: port 1(veth2c4037e) entered blocking state [  435.651224] docker0=
: port 1(veth2c4037e) entered forwarding state [  435.654061] IPv6: ADDRCON=
F(NETDEV_CHANGE): docker0: link becomes ready

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs th=
e
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent=
 it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

[  435.899076] docker0: port 1(veth2c4037e) entered disabled state [  435.9=
04659] veth6909d78: renamed from eth0 [  435.960366] docker0: port 1(veth2c=
4037e) entered disabled state [  435.967155] device veth2c4037e left promis=
cuous mode [  435.970292] docker0: port 1(veth2c4037e) entered disabled sta=
te
---
I am running it from the console so you get the pollution of the veth being=
 created and torn down but in this case you might be interested in seeing t=
his so it is good that it is captured here.

Anyways, take a look at the above, see how it maps for you and if you conti=
nue to have issues I can try to assist more. You might want to run things s=
uch that you get more logs. I am pretty busy but possibly put your image so=
mewhere and if I get the chance I can have a look.

MarkA


>=20
> MarkA
>=20
> > I have been doing all of my testing on a VirtualBox VM.  I'm not=20
> > sure if there is something missing in VirtualBox that may be causing=20
> > this, or some VM setting that's not properly configured.  I'm going=20
> > to try on physical hardware as well to see if that fixes the issue.
> >=20
> > If there is something that I am missing though within my=20
> > openembedded build that will fix this, please let me know.
> >=20
> > Thank you
> >=20
> > Lewis Muhlenkamp
> >=20
> > -----Original Message-----
> > From: Mark Asselstine <mark.asselstine@windriver.com>
> > Sent: Monday, January 14, 2019 4:56 PM
> > To: Muhlenkamp, Lewis <lewis.muhlenkamp@stryker.com>
> > Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] Kernel modules being built, but not being included=20
> > in image
> >=20
> > This has been asked in the past and I did have a "mini" layer that=20
> > could be used in addition to meta-virt to allow you to get what you=20
> > need in an image fairly easily. We were going to do some work to=20
> > make this easier but I haven't looked in a while so I can't say=20
> > where things are at off the top of my head. At any rate I am just=20
> > back from some travel but I will try to take a look at this=20
> > tomorrow, after which I should be able to provide some better=20
> > guidance.
> >=20
> > Mark
> > On Fri, Jan 11, 2019 at 7:39 PM Muhlenkamp, Lewis
> >=20
> > <lewis.muhlenkamp@stryker.com> wrote:
> > > Hello,
> > >=20
> > >=20
> > >=20
> > > TLDR: How do I get docker fully functional in my openembedded=20
> > > linux image?
> > >=20
> > >=20
> > >=20
> > > I've been trying to get docker included into my image.  All of my=20
> > > attempts lead to the same error messages appearing in the log=20
> > > file, and docker not starting.
> > >=20
> > >=20
> > >=20
> > > The error messages are
> > >=20
> > >=20
> > >=20
> > > =3D=3D=3D Start docker messages =3D=3D=3D
> > > Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > > time=3D"2019-01-10T15:56:25.414778299Z" level=3Derror msg=3D"Failed t=
o=20
> > > built-in GetDriver graph btrfs /var/lib/docker"
>=20
>  Jan 10 15:56:25 intel-corei7-64
>=20
> > > dockerd[210]: time=3D"2019-01-10T15:56:25.460695720Z" level=3Dwarning=
=20
> > > msg=3D"Your kernel does not support cgroup cfs period" Jan 10=20
> > > 15:56:25
> > > intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.460795185Z"
> > > level=3Dwarning msg=3D"Your kernel does not support cgroup cfs quotas=
"=20
> > > Jan
> > > 10
> > > 15:56:25 intel-corei7-64 dockerd[210]:
> > > time=3D"2019-01-10T15:56:25.460896539Z" level=3Dwarning msg=3D"Your=20
> > > kernel does not support cgroup cfs blkio weight" Jan 10 15:56:25=20
> > > intel-corei7-64
> > > dockerd[210]: time=3D"2019-01-10T15:56:25.461255643Z" level=3Dwarning=
=20
> > > msg=3D"Your kernel does not support cgroup cfs blkio=20
> > > throttle.read_bps_device" Jan 10 15:56:25 intel-corei7-64 dockerd[210=
]:
> > > time=3D"2019-01-10T15:56:25.461381616Z" level=3Dwarning msg=3D"Your=20
> > > kernel does not support cgroup cfs blkio=20
> > > throttle.write_bps_device" Jan 10 15:56:25
> > > intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.461503746Z"
> > > level=3Dwarning msg=3D"Your kernel does not support cgroup cfs blkio=
=20
> > > throttle.read_iops_device" Jan 10 15:56:25 intel-corei7-64 dockerd[21=
0]:
> > > time=3D"2019-01-10T15:56:25.461601879Z" level=3Dwarning msg=3D"Your=20
> > > kernel does not support cgroup cfs blkio=20
> > > throttle.write_iops_device" Jan 10 15:56:25
> > > intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.475747665Z"
> > > level=3Dwarning msg=3D"Running modprobe bridge br_netfilter failed=20
> > > with
> > > message: modprobe: WARNING: Module br_netfilter not found in=20
> > > directory /lib/modules/4.14.78-intel-pk-standard\ninsmod
> > > /lib/modules/4.14.78-intel-pk-standard/kernel/net/llc.ko \ninsmod=20
> > > /lib/modules/4.14.78-intel-pk-standard/kernel/net/802/stp.ko=20
> > > \ninsmod=20
> > > /lib/modules/4.14.78-intel-pk-standard/kernel/net/bridge/bridge.ko=20
> > > \n,
> > > error: exit status 1" Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > > time=3D"2019-01-10T15:56:25.659844723Z" level=3Dwarning msg=3D"Could =
not=20
> > > load necessary modules for IPSEC rules: Running modprobe xfrm_user=20
> > > failed with
> > > message: `modprobe: WARNING: Module xfrm_user not found in=20
> > > directory /lib/modules/4.14.78-intel-pk-standard`, error: exit=20
> > > status 1" Jan 10
> > > 15:56:25 intel-corei7-64 dockerd[210]:
> > > time=3D"2019-01-10T15:56:25.662494167Z" level=3Dwarning msg=3D"Could =
not=20
> > > load necessary modules for Conntrack: Running modprobe=20
> > > nf_conntrack_netlink failed with message: `modprobe: WARNING:=20
> > > Module nf_conntrack_netlink not found in directory=20
> > > /lib/modules/4.14.78-intel-pk-standard`, error: exit status 1" Jan=20
> > > 10 15:56:25 intel-corei7-64 dockerd[210]: failed to start
> > > daemon: Error initializing network controller: Error creating=20
> > > default "bridge" network: Failed to program NAT chain: Failed to=20
> > > inject DOCKER in PREROUTING chain: iptables failed: iptables -wait=20
> > > -t nat -A PREROUTING -m addrtype -dst-type LOCAL -j DOCKER:=20
> > > iptables: No chain/target/match by that name. =3D=3D=3D End docker=20
> > > messages =3D=3D=3D
> > >=20
> > >=20
> > >=20
> > > I was using my own custom image type, but I got the same results=20
> > > when trying to build and use core-image-minimal.
> > >=20
> > >=20
> > >=20
> > > I tried including the
> > > meta-virtualization/recipes/kernel/linux/linux-yocto/docker.scc=20
> > > stuff in, but since I set MACHINE to intel-corei7-64, I copied the=20
> > > docker.scc and docker.cfg into my custom layer:
> > >=20
> > >=20
> > >=20
> > > meta-stryker/common/recipes-kernel/linux/linux-intel/docker.cfg
> > > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_baseli
> > > ne.s cc=20
> > > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend
> > >=20
> > >=20
> > >=20
> > > That didn't seem to work either.  The modules always got built. =20
> > > For example, br_netfilter.ko is built:
> > >=20
> > >=20
> > >=20
> > > lmuhlenkamp@c71703b3ba7d:~/build-20181213a/tmp-glibc$ find . -name=20
> > > br_netfilter.ko=20
> > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTO
> > > INC+=20
> > > 6a3254e7b3_56f15146cf-r0/image/lib/modules/4.14.78-intel-pk-standa
> > > rd/k
> > > ernel/net/bridge/br_netfilter.ko
> > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTO
> > > INC+
> > > 6a3254e7b3_56f15146cf-r0/packages-split/kernel-module-br-netfilter
> > > -4.1=20
> > > 4.78-intel-pk-standard/lib/modules/4.14.78-intel-pk-standard/kerne
> > > l/ne
> > > t/bridge/br_netfilter.ko
> > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTO
> > > INC+=20
> > > 6a3254e7b3_56f15146cf-r0/linux-corei7-64-intel-common-standard-bui
> > > ld/n
> > > et/bridge/br_netfilter.ko
> > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAUTO
> > > INC+=20
> > > 6a3254e7b3_56f15146cf-r0/package/lib/modules/4.14.78-intel-pk-stan
> > > dard /kernel/net/bridge/br_netfilter.ko
> > >=20
> > >=20
> > >=20
> > > But these modules are not included in my image.  For example, if I=20
> > > do "find / -name br_netfilter.ko" on my target install, nothing is=20
> > > returned.
> > >=20
> > >=20
> > >=20
> > > My bblayers.conf is as follows:
> > >=20
> > >=20
> > >=20
> > > =3D=3D=3D Start conf/bblayers.conf =3D=3D=3D
> > > # LAYER_CONF_VERSION is increased each time=20
> > > build/conf/bblayers.conf # changes incompatibly LCONF_VERSION =3D "7"
> > >=20
> > >=20
> > >=20
> > > BBPATH =3D "${TOPDIR}"
> > > BBFILES ?=3D ""
> > >=20
> > >=20
> > >=20
> > > BBLAYERS ?=3D " \
> > >=20
> > >   /home/lmuhlenkamp/oe-core/meta \
> > >   /home/lmuhlenkamp/meta-openembedded/meta-python \
> > >   /home/lmuhlenkamp/meta-openembedded/meta-gnome \
> > >   /home/lmuhlenkamp/meta-openembedded/meta-filesystems \
> > >   /home/lmuhlenkamp/meta-openembedded/meta-oe \
> > >   /home/lmuhlenkamp/meta-openembedded/meta-networking \
> > >   /home/lmuhlenkamp/meta-openembedded/meta-initramfs \
> > >   /home/lmuhlenkamp/meta-openembedded/meta-webserver \
> > >   /home/lmuhlenkamp/meta-intel \
> > >   /home/lmuhlenkamp/meta-virtualization \
> > >   /home/lmuhlenkamp/meta-cloud-services \
> > >   /home/lmuhlenkamp/meta-cloud-services/meta-openstack \
> > >   /home/lmuhlenkamp/meta-iot-cloud \
> > >   /home/lmuhlenkamp/meta-secure-core/meta-tpm \
> > >   /home/lmuhlenkamp/meta-stryker/common \
> > >   /home/lmuhlenkamp/meta-stryker/testing \
> > >   "
> > >=20
> > > =3D=3D=3D End conf/bblayers.conf =3D=3D=3D
> > >=20
> > >=20
> > >=20
> > > The customizations to my local.conf file are as follows:
> > >=20
> > >=20
> > >=20
> > > =3D=3D=3D Start local.conf excerpt =3D=3D=3D
> > > MACHINE ?=3D "intel-corei7-64"
> > > IMAGE_FSTYPES +=3D "live"
> > > NOISO =3D "0"
> > > IMAGE_INSTALL_append =3D " glibc-utils localedef"
> > > GLIBC_GENERATE_LOCALES =3D "el_GR.UTF-8 en_GB.UTF-8 en_US.UTF-8
> > > es_ES.UTF-8
> > > de_DE.UTF-8 fa_IR fr_FR.UTF-8 hr_HR.UTF-8 ja_JP.UTF-8 ja_JP.EUC-JP
> > > lt_LT.UTF-8 ru_RU.UTF-8 tr_TR.UTF-8"
>=20
>  IMAGE_LINGUAS =3D "el-gr en-gb en-us
>=20
> > > es-es de-de fa-ir fr-fr hr-hr ja-jp ja-jp.euc-jp lt-lt ru-ru tr-tr"
> > > DISTRO_FEATURES_append =3D " systemd virtualization"
> > > DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> > > VIRTUAL-RUNTIME_init_manager =3D "systemd"
> > > VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> > > DISTRO_FEATURES_append =3D " opengl"
> > > CORE_IMAGE_EXTRA_INSTALL +=3D "rpm python3 python3-pip python3-flask=
=20
> > > python3-requests python3-coverage python3-pylint"
> > > CORE_IMAGE_EXTRA_INSTALL +=3D "python-sphinx"
> > > CORE_IMAGE_EXTRA_INSTALL +=3D "python-flake8"
> > > CORE_IMAGE_EXTRA_INSTALL +=3D "python3-doxypypy"
> > > CORE_IMAGE_EXTRA_INSTALL +=3D "trousers tpm-tools openssl-tpm-engine"
> > > KERNEL_FEATURES_append =3D " features/netfilter/netfilter.scc=20
> > > features/overlayfs/overlayfs.scc"
>=20
>  KERNEL_ENABLE_CGROUPS =3D "1"
>=20
> > > CORE_IMAGE_EXTRA_INSTALL +=3D "docker"
> > > SERIAL_CONSOLES =3D "38400 tty1"
> > > CORE_IMAGE_EXTRA_INSTALL +=3D "flaskhello"
> > > =3D=3D=3D End local.conf excerpt =3D=3D=3D
> > >=20
> > >=20
> > >=20
> > > I did not have the KERNEL_FEATURES_append line in when using the=20
> > > recipes-kernel/linux/linux-intel stuff.  I didn't have the=20
> > > recipes-kernel/linux/linux-intel directory available when using=20
> > > the KERNEL_FEATURES_append line in local.conf.  Based on what I=20
> > > read, they were mutually exclusive.
> > >=20
> > >=20
> > >=20
> > > What am I missing?  Why are the kernel modules not being included=20
> > > in my image?
> > >=20
> > >=20
> > >=20
> > > I did try tweaking my docker.cfg file in my custom kernel recipe=20
> > > to include cgroups, but that did not seem to change anything. =20
> > > Here are the contents of my custom docker.cfg file
> > >=20
> > >=20
> > >=20
> > > =3D=3D=3D Start
> > > meta-stryker/common/recipes-kernel/linux/linux-intel/docker/docker
> > > .cfg
> > > =3D=3D=3D CONFIG_CGROUP_DEVICE=3Dy
> > >=20
> > >=20
> > >=20
> > > CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
> > > CONFIG_IP_NF_FILTER=3Dm
> > > CONFIG_NF_NAT=3Dm
> > > CONFIG_NF_CONNTRACK_IPV4=3Dy
> > > CONFIG_NF_CT_NETLINK=3Dy
> > >=20
> > >=20
> > >=20
> > > CONFIG_BRIDGE_NETFILTER=3Dm
> > > CONFIG_XFRM_USER=3Dm
> > >=20
> > >=20
> > >=20
> > > CONFIG_DM_THIN_PROVISIONING=3Dm
> > >=20
> > >=20
> > >=20
> > >=20
> > > CONFIG_IP_NF_NAT=3Dm
> > > CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> > >=20
> > >=20
> > >=20
> > > CONFIG_OVERLAY_FS=3Dy
> > > =3D=3D=3D End
> > > meta-stryker/common/recipes-kernel/linux/linux-intel/docker/docker
> > > .cfg
> > > =3D=3D=3D
> > >=20
> > >=20
> > >=20
> > > And for completeness, here are the contents of the other 2 files=20
> > > in that recipe
> > >=20
> > >=20
> > >=20
> > > =3D=3D=3D Start
> > > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend=20
> > > =3D=3D=3D FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
>  SRC_URI +=3D
>=20
> > > "file://kernel_baseline.scc"
> > > =3D=3D=3D End
> > > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend=20
> > > =3D=3D=3D
> > >=20
> > >=20
> > >=20
> > > =3D=3D=3D Start
> > > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_baseli
> > > ne.scc =3D=3D=3D define KFEATURE_DESCRIPTION "Enable Features needed =
by=20
> > > docker in addition to LXC features"
>=20
>  define KFEATURE_COMPATIBILITY board
>=20
> > > kconf non-hardware docker.cfg
> > > =3D=3D=3D End
> > > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_baseli
> > > ne.s
> > > cc =3D=3D=3D
> > >=20
> > >=20
> > >=20
> > > Any help that would allow me to get docker functionality working=20
> > > in my openembedded linux image would be greatly appreciated.
> > >=20
> > >=20
> > >=20
> > > Thank you
> > >=20
> > >=20
> > >=20
> > > Lewis Muhlenkamp
> > >=20
> > >=20
> > >=20
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel





