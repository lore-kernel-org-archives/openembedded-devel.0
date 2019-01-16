Return-Path: <lewis.muhlenkamp@stryker.com>
X-Greylist: delayed 88038 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Jan 2019 07:41:28 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820075.outbound.protection.outlook.com [40.107.82.75])
	by mail.openembedded.org (Postfix) with ESMTP id C4F5A7C1D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zUlUQ4y0J9vrVDE2V7Zp0k1z6uJzMEdbxOpESHqUVxI=;
	b=OtgvJFaermsmcr7sfrbLCQPiMwCB1mU4wf42t3N9V9PV6BaSsgJKB9Yp3iV2HnvXhZs17EsUHyoMUl2krRITNjBQ+YgSFFcxY4Z64b3ee5S24dto3gIwqkhpXyibhx5UEdU9QKjcD0LsrSjgpx6PeCPXiQ7l7DxxS7jB/anhLs0=
Received: from DM6PR01MB4636.prod.exchangelabs.com (20.177.216.161) by
	DM6PR01MB3785.prod.exchangelabs.com (20.176.65.26) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.24; Wed, 16 Jan 2019 20:06:32 +0000
Received: from DM6PR01MB4636.prod.exchangelabs.com
	([fe80::9147:8c0b:ee2:6d33]) by DM6PR01MB4636.prod.exchangelabs.com
	([fe80::9147:8c0b:ee2:6d33%2]) with mapi id 15.20.1516.019;
	Wed, 16 Jan 2019 20:06:32 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Thread-Topic: [oe] Kernel modules being built, but not being included in image
Thread-Index: AdSo/YZJsbDelO6ySpe6eA6PkwapeADVnikAACLYtVAAEZR5AAAIRqUAABXghHAABCYYAAAJ2j+g
Date: Wed, 16 Jan 2019 20:06:32 +0000
Message-ID: <DM6PR01MB46361376555460968223D3408F820@DM6PR01MB4636.prod.exchangelabs.com>
References: <DM6PR01MB4636DE2DFD81ED5926A24F9F8F840@DM6PR01MB4636.prod.exchangelabs.com>
	<24204196.tQc3WnnfOQ@yow-masselst-lx1>
	<DM6PR01MB46363A1A50A4C063A2A59A788F820@DM6PR01MB4636.prod.exchangelabs.com>
	<1747961.HFadKpmvWh@yow-masselst-lx1>
In-Reply-To: <1747961.HFadKpmvWh@yow-masselst-lx1>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [165.225.32.56]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB3785;
	20:6NamJnRS+CiI2yKwgdDYUu6JpwxbN1fApzc6libtmMKt/LV+I24o3qXCwreB6wGrKl155IyTIBF7J4tmZax2BnEEE7QyGGKnN3fcee9XzH+WXQfTzHvPWcW1m1Jhm85uCil+pzJdqDIdL/JMQ5eUeToswSiyOkC3uRrM/yqJjy9sPydqKA/6kyQuKy7W38UTXZtYNZPFSLHSo1pVEbeulMMfOPpC/ad+4NJZRZensiCA4+83XSA6MS4bZASg+aOR
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: aaa2f721-8eac-4b26-676e-08d67bee1c3e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7167020)(7153060)(7193020);
	SRVR:DM6PR01MB3785; 
x-ms-traffictypediagnostic: DM6PR01MB3785:
x-microsoft-antispam-prvs: <DM6PR01MB3785B8CAB77E29BC169607688F820@DM6PR01MB3785.prod.exchangelabs.com>
x-forefront-prvs: 091949432C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(376002)(366004)(136003)(396003)(39860400002)(189003)(13464003)(199004)(40764003)(53946003)(93886005)(9686003)(6306002)(53936002)(99286004)(8676002)(486006)(25786009)(8936002)(256004)(6116002)(3846002)(14444005)(97736004)(81166006)(81156014)(2906002)(4326008)(68736007)(86362001)(6246003)(345774005)(316002)(55016002)(6436002)(74316002)(5660300001)(229853002)(476003)(33656002)(7736002)(53546011)(6916009)(305945005)(55236004)(446003)(11346002)(66066001)(102836004)(478600001)(7696005)(966005)(106356001)(105586002)(186003)(30864003)(76176011)(6506007)(14454004)(26005)(71190400001)(71200400001)(579004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR01MB3785;
	H:DM6PR01MB4636.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZRj1dml9jpuYF6l/2bEmYrtQ94302LGsz+9i2pjIQMqjXHebWa+Z9dMKnc7E6SYPcebKXEgkSDhsukS8CblliOGDVZ2gGXCmBxY/rltGgWvbsnSQXmKk/i5j26xMSafwXTc058beUmlZxtRY1+SjhblIDD6wVqO1mH1/D4Rxfad0oj/NE24PG2FXOPSYhXCwjip5DXcbcWg/s6fyBUrqR/8b0XNr2bz1Kf/Vt79uhiIXHXL8f7Qv9HNWOWT8dI7ohp4c9lDmzLsR3mHfDIW4rv5H+D22QM+glcusrMvq08rzjRBp0eoT2sklhr/3Y0zoDsYV/RVeg/RXIB1lr/CX1xtPbnEMI1M0kqLGtdC5D0PpHqiTprcmByOJXgahnXKpsvRfQ4xqCKkyihkYMm2fnwp3QgiDMvT++mjlEkekjcg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa2f721-8eac-4b26-676e-08d67bee1c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2019 20:06:32.4382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3785
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
X-List-Received-Date: Thu, 17 Jan 2019 07:41:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark,

I found the issue.  The veth kernel parameter was not enabled.  Once I adde=
d CONFIG_VETH=3Dy to my docker.cfg file, I was able to successfully run a d=
ocker container in my openembedded OS.

I found out about this missing kernel parameter by running a neat little sc=
ript that checks if everything is ready on the OS for docker.  That script =
can be found at https://github.com/moby/moby/blob/master/contrib/check-conf=
ig.sh.

Should I let the meta-virtualization mailing list know about my updates to =
the docker.cfg file so they can incorporate those changes into a future ver=
sion of the official docker.cfg file?

Thank you for your help with this.

Lewis Muhlenkamp

-----Original Message-----
From: Mark Asselstine <mark.asselstine@windriver.com>=20
Sent: Wednesday, January 16, 2019 10:20 AM
To: Muhlenkamp, Lewis <lewis.muhlenkamp@stryker.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Kernel modules being built, but not being included in ima=
ge

On Wednesday, January 16, 2019 8:39:08 AM EST Muhlenkamp, Lewis wrote:
> Mark,
>=20
> I haven't changed my bblayers.conf file since my original post.  I=20
> have everything that you have, and then some.
>=20
> My DISTRO_FEATURES_append for virtualization and system are on one=20
> line.  I have the other systemd lines in my local.conf too.
>=20
> I have CORE_IMAGE_EXTRA_INSTALL +=3D "kernel-modules docker" instead of=20
> IMAGE_INSTALL_append.  The two seem to be interchangeable to me.  If=20
> that is not the case, please let me know.
>=20
> I do not have any KERNEL_MODULE_AUTOLOAD lines in my local.conf.  I'm=20
> not sure I need to since the modules appear in the lsmod output.
>=20
> I thought it might be virtualbox that was not allowing me to create=20
> these virtual interfaces for some reason.  So, I installed on my target h=
ardware.
>  I got the same issue.
>=20
> Nothing appears in any log when I run the docker command.  There is no=20
> debug output when I run docker -D.
>=20
> It seems like my docker instance does not have permission to create=20
> new virtual ethernet interfaces.  What is the best way to test this?

I would recommend that you try to reproduce my findings in a second build, =
dropping your custom layer and using qemux86-64. You can never go wrong wit=
h having a working scenario next to your failing one.

Also since we have moved on from your initial issue regarding kernel module=
s we should move this conversation over to the meta-virtualization list ins=
tead of here. We are more likely to catch the eyes of others who are using =
docker there and might get additional suggestions as to the cause.

MarkA

>=20
> Thanks
>=20
> Lewis Muhlenkamp
>=20
> -----Original Message-----
> From: Mark Asselstine <mark.asselstine@windriver.com>
> Sent: Tuesday, January 15, 2019 9:55 PM
> To: Muhlenkamp, Lewis <lewis.muhlenkamp@stryker.com>
> Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] Kernel modules being built, but not being included=20
> in image On Tuesday, January 15, 2019 5:57:34 PM EST Mark Asselstine=20
> wrote:
> > On Tuesday, January 15, 2019 1:26:31 PM EST Muhlenkamp, Lewis wrote:
> > > Mark,
> > >=20
> > > I got the docker daemon to start up.  I figured out what I needed=20
> > > to put into my .../recipes-kernel/linux/linux-intel/docker.cfg=20
> > > file to make sure all of the kernel modules were builts.  I also=20
> > > found that just adding
> > >=20
> > >     CORE_IMAGE_EXTRA_INSTALL +=3D "kernel-modules docker"
> > >=20
> > > will add all of the kernel modules as well as the docker software.
> > >=20
> > > So, the docker daemon is running.  I can run docker commands like=20
> > > "docker image ls"  I can build a docker image, but I cannot run=20
> > > the docker image. For example, I created a simple dockerfile that=20
> > > just has the line "FROM ubuntu".  I can successfully run "docker=20
> > > build ." in that directory.  It creates an image.  I can run=20
> > > "docker image ls" and see the image.  When I run
> > >=20
> > >     docker run -I -t ubuntu "/bin/bash"
> > >=20
> > > though, I get an error message
> > >=20
> > > docker: Error response from daemon: failed to create endpoint=20
> > > elated_aryabhatadoc on network bridge; failed to add the host
> > > (veth3befa72)
> > > <+> sandbox (veth40a3e1c) pair interfaces: operation not supported.
> >=20
> > Not surprisingly a container failed to start because of networking :).
> > I would guess that 90% of the time I have a container fail to start=20
> > it is networking related.
> >=20
> > The veth pair should be independent from your network interface,=20
> > either real on real hw or virtual in your case. Whenever you see a=20
> > veth or a pair of veth interfaces just visualize the classic blue=20
> > cat5 cable with two ends to it, where each end is plugged into "somethi=
ng".
> > This is essentially what the veth pair represents. By default, when=20
> > you run docker as you have the one end becomes the interface inside=20
> > of the container, the other end is 'plugged' into the docker bridge=20
> > on the host. Based on the message I am guessing the veth which is=20
> > supposed to be 'plugged' into the docker bridge has failed to do so.
> >=20
> > My day was a bit messed up so I only got a build put together now so=20
> > unfortunately I won't be able to get anything more helpful put=20
> > together until tomorrow sometime. In the mean time ensure the=20
> > docker0 bridge is up and available. And if not figure out why it is not=
.
>=20
> I was able to validate things. First here are my changes after I=20
> source oe- init-build-env.
>=20
> bblayers.conf
> ---
>   /home/masselst/git/poky/layers/meta-virtualization \
>   /home/masselst/git/poky/layers/meta-openembedded/meta-oe \
>   /home/masselst/git/poky/layers/meta-openembedded/meta-networking \
>   /home/masselst/git/poky/layers/meta-openembedded/meta-filesystems \
>   /home/masselst/git/poky/layers/meta-openembedded/meta-python \
>=20
>=20
> local.conf
> ---
> DISTRO_FEATURES_append =3D " virtualization"
> IMAGE_INSTALL_append =3D "docker \
>  kernel-module-xt-conntrack \
>  kernel-module-nf-nat \
>  kernel-module-xt-addrtype"
>=20
> KERNEL_MODULE_AUTOLOAD +=3D "xt_conntrack"
> KERNEL_MODULE_AUTOLOAD +=3D "xt_addrtype"
>=20
> DISTRO_FEATURES_append =3D " systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> VIRTUAL-RUNTIME_init_manager =3D "systemd"
> VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
>=20
> I also set the machine to "qemux86-64".
>=20
>=20
> After using 'docker pull hello-world' I run it
> ---
> root@qemux86-64:~# docker run -it hello-world [  434.530556] docker0:=20
> port
> 1(veth2c4037e) entered blocking state [  434.533810] docker0: port
> 1(veth2c4037e) entered disabled state [  434.538888] device=20
> veth2c4037e entered promiscuous mode [  434.552937] IPv6: ADDRCONF(NETDEV=
_UP):
> veth2c4037e: link is not ready [  435.645525] eth0: renamed from
> veth6909d78 [  435.648422] IPv6: ADDRCONF(NETDEV_CHANGE): veth2c4037e:=20
> link becomes ready [  435.649944] docker0: port 1(veth2c4037e) entered=20
> blocking state [  435.651224] docker0: port 1(veth2c4037e) entered=20
> forwarding state [  435.654061] IPv6: ADDRCONF(NETDEV_CHANGE):=20
> docker0: link becomes ready
>=20
> Hello from Docker!
> This message shows that your installation appears to be working correctly=
.
>=20
> To generate this message, Docker took the following steps:
>  1. The Docker client contacted the Docker daemon.
>  2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
>     (amd64)
>  3. The Docker daemon created a new container from that image which=20
> runs the executable that produces the output you are currently=20
> reading. 4. The Docker daemon streamed that output to the Docker=20
> client, which sent it to your terminal.
>=20
> To try something more ambitious, you can run an Ubuntu container with:
>  $ docker run -it ubuntu bash
>=20
> Share images, automate workflows, and more with a free Docker ID:
>  https://hub.docker.com/
>=20
> For more examples and ideas, visit:
>  https://docs.docker.com/get-started/
>=20
> [  435.899076] docker0: port 1(veth2c4037e) entered disabled state [=20
> 435.904659] veth6909d78: renamed from eth0 [  435.960366] docker0:=20
> port
> 1(veth2c4037e) entered disabled state [  435.967155] device=20
> veth2c4037e left promiscuous mode [  435.970292] docker0: port=20
> 1(veth2c4037e) entered disabled state --- I am running it from the=20
> console so you get the pollution of the veth being created and torn=20
> down but in this case you might be interested in seeing this so it is=20
> good that it is captured here.
>=20
> Anyways, take a look at the above, see how it maps for you and if you=20
> continue to have issues I can try to assist more. You might want to=20
> run things such that you get more logs. I am pretty busy but possibly=20
> put your image somewhere and if I get the chance I can have a look.
>=20
> MarkA
>=20
> > MarkA
> >=20
> > > I have been doing all of my testing on a VirtualBox VM.  I'm not=20
> > > sure if there is something missing in VirtualBox that may be=20
> > > causing this, or some VM setting that's not properly configured. =20
> > > I'm going to try on physical hardware as well to see if that fixes th=
e issue.
> > >=20
> > > If there is something that I am missing though within my=20
> > > openembedded build that will fix this, please let me know.
> > >=20
> > > Thank you
> > >=20
> > > Lewis Muhlenkamp
> > >=20
> > > -----Original Message-----
> > > From: Mark Asselstine <mark.asselstine@windriver.com>
> > > Sent: Monday, January 14, 2019 4:56 PM
> > > To: Muhlenkamp, Lewis <lewis.muhlenkamp@stryker.com>
> > > Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> > > Subject: Re: [oe] Kernel modules being built, but not being=20
> > > included in image
> > >=20
> > > This has been asked in the past and I did have a "mini" layer that=20
> > > could be used in addition to meta-virt to allow you to get what=20
> > > you need in an image fairly easily. We were going to do some work=20
> > > to make this easier but I haven't looked in a while so I can't say=20
> > > where things are at off the top of my head. At any rate I am just=20
> > > back from some travel but I will try to take a look at this=20
> > > tomorrow, after which I should be able to provide some better=20
> > > guidance.
> > >=20
> > > Mark
> > > On Fri, Jan 11, 2019 at 7:39 PM Muhlenkamp, Lewis
> > >=20
> > > <lewis.muhlenkamp@stryker.com> wrote:
> > > > Hello,
> > > >=20
> > > >=20
> > > >=20
> > > > TLDR: How do I get docker fully functional in my openembedded=20
> > > > linux image?
> > > >=20
> > > >=20
> > > >=20
> > > > I've been trying to get docker included into my image.  All of=20
> > > > my attempts lead to the same error messages appearing in the log=20
> > > > file, and docker not starting.
> > > >=20
> > > >=20
> > > >=20
> > > > The error messages are
> > > >=20
> > > >=20
> > > >=20
> > > > =3D=3D=3D Start docker messages =3D=3D=3D
> > > > Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > > > time=3D"2019-01-10T15:56:25.414778299Z" level=3Derror msg=3D"Failed=
 to=20
> > > > built-in GetDriver graph btrfs /var/lib/docker"
> > =20
> >  Jan 10 15:56:25 intel-corei7-64
> > =20
> > > > dockerd[210]: time=3D"2019-01-10T15:56:25.460695720Z"=20
> > > > level=3Dwarning msg=3D"Your kernel does not support cgroup cfs=20
> > > > period" Jan 10
> > > > 15:56:25
> > > > intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.460795185=
Z"
> > > > level=3Dwarning msg=3D"Your kernel does not support cgroup cfs quot=
as"
> > > > Jan
> > > > 10
> > > > 15:56:25 intel-corei7-64 dockerd[210]:
> > > > time=3D"2019-01-10T15:56:25.460896539Z" level=3Dwarning msg=3D"Your=
=20
> > > > kernel does not support cgroup cfs blkio weight" Jan 10 15:56:25
> > > > intel-corei7-64
> > > > dockerd[210]: time=3D"2019-01-10T15:56:25.461255643Z"=20
> > > > level=3Dwarning msg=3D"Your kernel does not support cgroup cfs blki=
o=20
> > > > throttle.read_bps_device" Jan 10 15:56:25 intel-corei7-64
> > > > dockerd[210]:
> > > > time=3D"2019-01-10T15:56:25.461381616Z" level=3Dwarning msg=3D"Your=
=20
> > > > kernel does not support cgroup cfs blkio=20
> > > > throttle.write_bps_device" Jan 10 15:56:25
> > > > intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.461503746=
Z"
> > > > level=3Dwarning msg=3D"Your kernel does not support cgroup cfs blki=
o=20
> > > > throttle.read_iops_device" Jan 10 15:56:25 intel-corei7-64
> > > > dockerd[210]:
> > > > time=3D"2019-01-10T15:56:25.461601879Z" level=3Dwarning msg=3D"Your=
=20
> > > > kernel does not support cgroup cfs blkio=20
> > > > throttle.write_iops_device" Jan 10 15:56:25
> > > > intel-corei7-64 dockerd[210]: time=3D"2019-01-10T15:56:25.475747665=
Z"
> > > > level=3Dwarning msg=3D"Running modprobe bridge br_netfilter failed=
=20
> > > > with
> > > > message: modprobe: WARNING: Module br_netfilter not found in=20
> > > > directory /lib/modules/4.14.78-intel-pk-standard\ninsmod
> > > > /lib/modules/4.14.78-intel-pk-standard/kernel/net/llc.ko=20
> > > > \ninsmod=20
> > > > /lib/modules/4.14.78-intel-pk-standard/kernel/net/802/stp.ko
> > > > \ninsmod
> > > > /lib/modules/4.14.78-intel-pk-standard/kernel/net/bridge/bridge.
> > > > ko
> > > > \n,
> > > > error: exit status 1" Jan 10 15:56:25 intel-corei7-64 dockerd[210]:
> > > > time=3D"2019-01-10T15:56:25.659844723Z" level=3Dwarning msg=3D"Coul=
d=20
> > > > not load necessary modules for IPSEC rules: Running modprobe=20
> > > > xfrm_user failed with
> > > > message: `modprobe: WARNING: Module xfrm_user not found in=20
> > > > directory /lib/modules/4.14.78-intel-pk-standard`, error: exit=20
> > > > status 1" Jan 10
> > > > 15:56:25 intel-corei7-64 dockerd[210]:
> > > > time=3D"2019-01-10T15:56:25.662494167Z" level=3Dwarning msg=3D"Coul=
d=20
> > > > not load necessary modules for Conntrack: Running modprobe=20
> > > > nf_conntrack_netlink failed with message: `modprobe: WARNING:
> > > > Module nf_conntrack_netlink not found in directory=20
> > > > /lib/modules/4.14.78-intel-pk-standard`, error: exit status 1"=20
> > > > Jan
> > > > 10 15:56:25 intel-corei7-64 dockerd[210]: failed to start
> > > > daemon: Error initializing network controller: Error creating=20
> > > > default "bridge" network: Failed to program NAT chain: Failed to=20
> > > > inject DOCKER in PREROUTING chain: iptables failed: iptables=20
> > > > -wait -t nat -A PREROUTING -m addrtype -dst-type LOCAL -j DOCKER:
> > > > iptables: No chain/target/match by that name. =3D=3D=3D End docker=
=20
> > > > messages =3D=3D=3D
> > > >=20
> > > >=20
> > > >=20
> > > > I was using my own custom image type, but I got the same results=20
> > > > when trying to build and use core-image-minimal.
> > > >=20
> > > >=20
> > > >=20
> > > > I tried including the
> > > > meta-virtualization/recipes/kernel/linux/linux-yocto/docker.scc
> > > > stuff in, but since I set MACHINE to intel-corei7-64, I copied=20
> > > > the docker.scc and docker.cfg into my custom layer:
> > > >=20
> > > >=20
> > > >=20
> > > > meta-stryker/common/recipes-kernel/linux/linux-intel/docker.cfg
> > > > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_base
> > > > li
> > > > ne.s cc
> > > > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend
> > > >=20
> > > >=20
> > > >=20
> > > > That didn't seem to work either.  The modules always got built.
> > > > For example, br_netfilter.ko is built:
> > > >=20
> > > >=20
> > > >=20
> > > > lmuhlenkamp@c71703b3ba7d:~/build-20181213a/tmp-glibc$ find .=20
> > > > -name br_netfilter.ko=20
> > > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAU
> > > > TO
> > > > INC+
> > > > 6a3254e7b3_56f15146cf-r0/image/lib/modules/4.14.78-intel-pk-stan
> > > > da
> > > > rd/k
> > > > ernel/net/bridge/br_netfilter.ko=20
> > > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAU
> > > > TO
> > > > INC+
> > > > 6a3254e7b3_56f15146cf-r0/packages-split/kernel-module-br-netfilt
> > > > er
> > > > -4.1
> > > > 4.78-intel-pk-standard/lib/modules/4.14.78-intel-pk-standard/ker
> > > > ne
> > > > l/ne
> > > > t/bridge/br_netfilter.ko
> > > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAU
> > > > TO
> > > > INC+
> > > > 6a3254e7b3_56f15146cf-r0/linux-corei7-64-intel-common-standard-b
> > > > ui
> > > > ld/n
> > > > et/bridge/br_netfilter.ko
> > > > ./work/corei7-64-intel-common-oe-linux/linux-intel/4.14.78+gitAU
> > > > TO
> > > > INC+
> > > > 6a3254e7b3_56f15146cf-r0/package/lib/modules/4.14.78-intel-pk-st
> > > > an dard /kernel/net/bridge/br_netfilter.ko
> > > >=20
> > > >=20
> > > >=20
> > > > But these modules are not included in my image.  For example, if=20
> > > > I do "find / -name br_netfilter.ko" on my target install,=20
> > > > nothing is returned.
> > > >=20
> > > >=20
> > > >=20
> > > > My bblayers.conf is as follows:
> > > >=20
> > > >=20
> > > >=20
> > > > =3D=3D=3D Start conf/bblayers.conf =3D=3D=3D # LAYER_CONF_VERSION i=
s=20
> > > > increased each time build/conf/bblayers.conf # changes=20
> > > > incompatibly LCONF_VERSION =3D "7"
> > > >=20
> > > >=20
> > > >=20
> > > > BBPATH =3D "${TOPDIR}"
> > > > BBFILES ?=3D ""
> > > >=20
> > > >=20
> > > >=20
> > > > BBLAYERS ?=3D " \
> > > >=20
> > > >   /home/lmuhlenkamp/oe-core/meta \
> > > >   /home/lmuhlenkamp/meta-openembedded/meta-python \
> > > >   /home/lmuhlenkamp/meta-openembedded/meta-gnome \
> > > >   /home/lmuhlenkamp/meta-openembedded/meta-filesystems \
> > > >   /home/lmuhlenkamp/meta-openembedded/meta-oe \
> > > >   /home/lmuhlenkamp/meta-openembedded/meta-networking \
> > > >   /home/lmuhlenkamp/meta-openembedded/meta-initramfs \
> > > >   /home/lmuhlenkamp/meta-openembedded/meta-webserver \
> > > >   /home/lmuhlenkamp/meta-intel \
> > > >   /home/lmuhlenkamp/meta-virtualization \
> > > >   /home/lmuhlenkamp/meta-cloud-services \
> > > >   /home/lmuhlenkamp/meta-cloud-services/meta-openstack \
> > > >   /home/lmuhlenkamp/meta-iot-cloud \
> > > >   /home/lmuhlenkamp/meta-secure-core/meta-tpm \
> > > >   /home/lmuhlenkamp/meta-stryker/common \
> > > >   /home/lmuhlenkamp/meta-stryker/testing \
> > > >   "
> > > >=20
> > > > =3D=3D=3D End conf/bblayers.conf =3D=3D=3D
> > > >=20
> > > >=20
> > > >=20
> > > > The customizations to my local.conf file are as follows:
> > > >=20
> > > >=20
> > > >=20
> > > > =3D=3D=3D Start local.conf excerpt =3D=3D=3D MACHINE ?=3D "intel-co=
rei7-64"
> > > > IMAGE_FSTYPES +=3D "live"
> > > > NOISO =3D "0"
> > > > IMAGE_INSTALL_append =3D " glibc-utils localedef"
> > > > GLIBC_GENERATE_LOCALES =3D "el_GR.UTF-8 en_GB.UTF-8 en_US.UTF-8
> > > > es_ES.UTF-8
> > > > de_DE.UTF-8 fa_IR fr_FR.UTF-8 hr_HR.UTF-8 ja_JP.UTF-8=20
> > > > ja_JP.EUC-JP
> > > > lt_LT.UTF-8 ru_RU.UTF-8 tr_TR.UTF-8"
> > =20
> >  IMAGE_LINGUAS =3D "el-gr en-gb en-us
> > =20
> > > > es-es de-de fa-ir fr-fr hr-hr ja-jp ja-jp.euc-jp lt-lt ru-ru tr-tr"
> > > > DISTRO_FEATURES_append =3D " systemd virtualization"
> > > > DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> > > > VIRTUAL-RUNTIME_init_manager =3D "systemd"
> > > > VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> > > > DISTRO_FEATURES_append =3D " opengl"
> > > > CORE_IMAGE_EXTRA_INSTALL +=3D "rpm python3 python3-pip=20
> > > > python3-flask python3-requests python3-coverage python3-pylint"
> > > > CORE_IMAGE_EXTRA_INSTALL +=3D "python-sphinx"
> > > > CORE_IMAGE_EXTRA_INSTALL +=3D "python-flake8"
> > > > CORE_IMAGE_EXTRA_INSTALL +=3D "python3-doxypypy"
> > > > CORE_IMAGE_EXTRA_INSTALL +=3D "trousers tpm-tools openssl-tpm-engin=
e"
> > > > KERNEL_FEATURES_append =3D " features/netfilter/netfilter.scc=20
> > > > features/overlayfs/overlayfs.scc"
> > =20
> >  KERNEL_ENABLE_CGROUPS =3D "1"
> > =20
> > > > CORE_IMAGE_EXTRA_INSTALL +=3D "docker"
> > > > SERIAL_CONSOLES =3D "38400 tty1"
> > > > CORE_IMAGE_EXTRA_INSTALL +=3D "flaskhello"
> > > > =3D=3D=3D End local.conf excerpt =3D=3D=3D
> > > >=20
> > > >=20
> > > >=20
> > > > I did not have the KERNEL_FEATURES_append line in when using the=20
> > > > recipes-kernel/linux/linux-intel stuff.  I didn't have the=20
> > > > recipes-kernel/linux/linux-intel directory available when using=20
> > > > the KERNEL_FEATURES_append line in local.conf.  Based on what I=20
> > > > read, they were mutually exclusive.
> > > >=20
> > > >=20
> > > >=20
> > > > What am I missing?  Why are the kernel modules not being=20
> > > > included in my image?
> > > >=20
> > > >=20
> > > >=20
> > > > I did try tweaking my docker.cfg file in my custom kernel recipe=20
> > > > to include cgroups, but that did not seem to change anything.
> > > > Here are the contents of my custom docker.cfg file
> > > >=20
> > > >=20
> > > >=20
> > > > =3D=3D=3D Start
> > > > meta-stryker/common/recipes-kernel/linux/linux-intel/docker/dock
> > > > er
> > > > .cfg
> > > > =3D=3D=3D CONFIG_CGROUP_DEVICE=3Dy
> > > >=20
> > > >=20
> > > >=20
> > > > CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
> > > > CONFIG_IP_NF_FILTER=3Dm
> > > > CONFIG_NF_NAT=3Dm
> > > > CONFIG_NF_CONNTRACK_IPV4=3Dy
> > > > CONFIG_NF_CT_NETLINK=3Dy
> > > >=20
> > > >=20
> > > >=20
> > > > CONFIG_BRIDGE_NETFILTER=3Dm
> > > > CONFIG_XFRM_USER=3Dm
> > > >=20
> > > >=20
> > > >=20
> > > > CONFIG_DM_THIN_PROVISIONING=3Dm
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > > CONFIG_IP_NF_NAT=3Dm
> > > > CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> > > >=20
> > > >=20
> > > >=20
> > > > CONFIG_OVERLAY_FS=3Dy
> > > > =3D=3D=3D End
> > > > meta-stryker/common/recipes-kernel/linux/linux-intel/docker/dock
> > > > er
> > > > .cfg
> > > > =3D=3D=3D
> > > >=20
> > > >=20
> > > >=20
> > > > And for completeness, here are the contents of the other 2 files=20
> > > > in that recipe
> > > >=20
> > > >=20
> > > >=20
> > > > =3D=3D=3D Start
> > > > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend
> > > > =3D=3D=3D FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> > =20
> >  SRC_URI +=3D
> > =20
> > > > "file://kernel_baseline.scc"
> > > > =3D=3D=3D End
> > > > meta-stryker/common/recipes-kernel/linux/linux-intel_%.bbappend
> > > > =3D=3D=3D
> > > >=20
> > > >=20
> > > >=20
> > > > =3D=3D=3D Start
> > > > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_base
> > > > li ne.scc =3D=3D=3D define KFEATURE_DESCRIPTION "Enable Features=20
> > > > needed by docker in addition to LXC features"
> > =20
> >  define KFEATURE_COMPATIBILITY board
> > =20
> > > > kconf non-hardware docker.cfg
> > > > =3D=3D=3D End
> > > > meta-stryker/common/recipes-kernel/linux/linux-intel/kernel_base
> > > > li
> > > > ne.s
> > > > cc =3D=3D=3D
> > > >=20
> > > >=20
> > > >=20
> > > > Any help that would allow me to get docker functionality working=20
> > > > in my openembedded linux image would be greatly appreciated.
> > > >=20
> > > >=20
> > > >=20
> > > > Thank you
> > > >=20
> > > >=20
> > > >=20
> > > > Lewis Muhlenkamp
> > > >=20
> > > >=20
> > > >=20
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-deve
> > > > l





