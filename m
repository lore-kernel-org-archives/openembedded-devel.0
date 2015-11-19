Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32FD46011F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 03:20:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAJ3KGmo027866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 19:20:16 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.247]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Wed, 18 Nov 2015 19:20:15 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] netmap-modules: make deterministic builds for
	drivers
Thread-Index: AQHRIeuVRs7nNkfIHECQaxVvoCqyo56irGVw
Date: Thu, 19 Nov 2015 03:20:14 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C73228B@ALA-MBA.corp.ad.wrs.com>
References: <1447840941-29496-1-git-send-email-jackie.huang@windriver.com>
	<20151118102555.GB2213@jama>
In-Reply-To: <20151118102555.GB2213@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.163.132]
MIME-Version: 1.0
Subject: Re: [PATCH] netmap-modules: make deterministic builds for drivers
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
X-List-Received-Date: Thu, 19 Nov 2015 03:20:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Wednesday, November 18, 2015 6:26 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] netmap-modules: make deterministic builds for d=
rivers
>=20
> On Wed, Nov 18, 2015 at 06:02:21PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > The driver builds are optional, but for deterministic builds,
> > we should should be able to explicitly enable/disable the
> > builds for them in a proper place (maybe in BSP).
> > But we can't use PACKAGECONFIG since there is no option for
> > each driver, and the options are:
> >  --no-drivers    do not compile any driver
> >  --no-drivers=3D   do not compile the given drivers (comma sep.)
> >  --drivers=3D      only compile the given drivers (comma sep.)
> >
> > So use NETMAP_DRIVERS to list the needed drivers and add proper
> > configs to EXTRA_OECONF, the default is no drivers, and all
> > supported drivers are listed in NETMAP_ALL_DRIVERS.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../recipes-kernel/netmap/netmap-modules_git.bb    | 31 ++++++++++++++=
+++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.b=
b b/meta-
> networking/recipes-kernel/netmap/netmap-modules_git.bb
> > index 6365fee..cfe5ce9 100644
> > --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> > +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> > @@ -15,7 +15,36 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BU=
ILDDIR} \
> >                  --driver-suffix=3D"-netmap" \
> >                  "
> >
> > -EXTRA_OECONF +=3D "--no-drivers=3Dixgbe --no-drivers=3Dvirtio_net.c"
> > +# The driver builds are optional, but for deterministic builds,
> > +# we should be able to explicitly enable/disable the builds
> > +# for them in a proper place (maybe in BSP).
> > +# But we can't use PACKAGECONFIG since there is no option for
> > +# each driver, and the options are:
> > +#  --no-drivers    do not compile any driver
> > +#  --no-drivers=3D   do not compile the given drivers (comma sep.)
> > +#  --drivers=3D      only compile the given drivers (comma sep.)
> > +#
> > +# So use NETMAP_DRIVERS and the following python code to add proper
> > +# configs to EXTRA_OECONF and skip arch test for kernel modules.
> > +#
> > +# The default is no-drivers, and all supported drivers are listed
> > +# in NETMAP_ALL_DRIVERS.
> > +NETMAP_DRIVERS ??=3D ""
> > +NETMAP_ALL_DRIVERS =3D "ixgbe igb e1000e e1000 veth.c forcedeth.c virt=
io_net.c r8169.c"
> > +
> > +python __anonymous () {
> > +    drivers_list =3D d.getVar("NETMAP_DRIVERS", True).split()
> > +    all_drivers_list =3D d.getVar("NETMAP_ALL_DRIVERS", True).split()
> > +    config_drivers =3D "--drivers=3D" + ",".join(drivers_list)
> > +
> > +    extra_oeconf_drivers =3D bb.utils.contains_any('NETMAP_DRIVERS', a=
ll_drivers_list, config_drivers,
> '--no-drivers', d)
> > +    d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
>=20
> This part looks good to me, thanks for fixing virtio_net.c change (I've
> merged that one by accident).
>=20
> > +
> > +    # skip the arch test for kernel modules
> > +    if drivers_list:
> > +        for driver in drivers_list:
> > +            d.setVar("INSANE_SKIP_kernel-module-%s-netmap" % driver, "=
arch")
>=20
> Why is this needed? Shouldn't the kernel modules build with correct

My previous patch explains this:
"[meta-networking][PATCH] netmap-modules: skip the arch check for kernel mo=
dule"

# When building on a multilib capable BSP, it's possible for the
# kernel bit size to be different then the userspace. Avoid the QA test
# when building modules
INSANE_SKIP_kernel-module-netmap =3D "arch"

And we have BSP allowing a 64 bit kernel + modules to be packaged against a
32 bit userspace.

> architecture? And e.g. r8169.c creates kernel-module-r8169.c-netmap packa=
ge?
> I hope the .c is stripped somewhere in the build.

Sorry, I didn't test all the drivers, I will check if this is stripped and =
changed accordingly.

Thanks,
Jackie

>=20
>=20
> > +}
> >
> >  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
> >  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

