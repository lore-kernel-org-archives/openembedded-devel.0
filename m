Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 233AA782D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:34:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5D7YWqK008597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Jun 2017 00:34:32 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([fe80::d894:a649:cd4c:89b7]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Tue, 13 Jun 2017 00:34:31 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 4/4] microcode-ctl: add new recipe
Thread-Index: AQHS5BSunCBi8We3ekm2RVmx5GUOA6IiZYmw
Date: Tue, 13 Jun 2017 07:34:30 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B7E88DD@ALA-MBD.corp.ad.wrs.com>
References: <cover.1496990155.git.jackie.huang@windriver.com>
	<7a8affe1cd168ad90c80082ac0e063f90bc92a0d.1496990155.git.jackie.huang@windriver.com>
	<20170613051412.GA3088@jama>
In-Reply-To: <20170613051412.GA3088@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.93]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/4] microcode-ctl: add new recipe
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
X-List-Received-Date: Tue, 13 Jun 2017 07:34:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Tuesday, June 13, 2017 13:14
> To: Huang, Jie (Jackie)
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 4/4] microcode-ctl: add new recipe
>=20
> On Fri, Jun 09, 2017 at 02:40:33PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > The microcode_ctl utility is a companion to the
> > IA32 microcode driver.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../0001-add-support-for-other-distributions.patch | 27 ++++++++++
> >  .../files/0001-fix-the-help-return-code.patch      | 57 ++++++++++++++=
++++++
> >  .../files/fix-No-GNU_HASH-in-the-elf-binary.patch  | 30 +++++++++++
> >  .../microcode-ctl/files/microcode_ctl.service      | 11 ++++
> >  .../recipes-bsp/microcode-ctl/microcode-ctl_git.bb | 62
> ++++++++++++++++++++++
> >  5 files changed, 187 insertions(+)
> >  create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-add-
> support-for-other-distributions.patch
> >  create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-th=
e-
> help-return-code.patch
> >  create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/fix-No-
> GNU_HASH-in-the-elf-binary.patch
> >  create mode 100644 meta-oe/recipes-bsp/microcode-
> ctl/files/microcode_ctl.service
> >  create mode 100755 meta-oe/recipes-bsp/microcode-ctl/microcode-
> ctl_git.bb
> >
> > diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-f=
or-
> other-distributions.patch b/meta-oe/recipes-bsp/microcode-ctl/files/0001-=
add-
> support-for-other-distributions.patch
> > new file mode 100644
> > index 000000000..fe5428493
> > --- /dev/null
> > +++ b/meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for-othe=
r-
> distributions.patch
> > @@ -0,0 +1,27 @@
> > +Subject: [PATCH] add support for other distributions
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > +---
> > + microcode_ctl.start | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/microcode_ctl.start b/microcode_ctl.start
> > +index 6fa9d72..e9321d0 100755
> > +--- a/microcode_ctl.start
> > ++++ b/microcode_ctl.start
> > +@@ -47,8 +47,8 @@ elif [ -f /etc/slackware-version ]; then
> > + 		END=3Dslack_end
> > + 	fi
> > + else
> > +-	echo "$0: Can't guess distribution, aborting!"
> > +-	exit 1
> > ++	START=3D
> > ++	END=3D
> > + fi
> > +
> > + # Lets just be sure we have a device file...
> > +--
> > +2.11.0
> > +
> > diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-=
return-
> code.patch b/meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-
> return-code.patch
> > new file mode 100644
> > index 000000000..cbe7755e9
> > --- /dev/null
> > +++ b/meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-return-
> code.patch
> > @@ -0,0 +1,57 @@
> > +[PATCH] fix the help return code
> > +
> > +Upstream-Status: Pending
> > +
> > +not always return 1 when call usage(), differ the return code by user =
action;
> > +if a use wants to get help information, it is normal action, should be
> > +return 0;
> > +if input parameter is wrong, and microcode_ctl prompts the help inform=
ation,
> > +it should be return 1;
> > +
> > +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > +---
> > + microcode_ctl.c | 7 +++++--
> > + 1 file changed, 5 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/microcode_ctl.c b/microcode_ctl.c
> > +index 3f9c151..cdcdc10 100644
> > +--- a/microcode_ctl.c
> > ++++ b/microcode_ctl.c
> > +@@ -40,7 +40,6 @@ static void usage(void)
> > + 			"  -u	upload microcode (default filename:\"%s\"\n"
> > + 			"  -f	upload microcode from named Intel formatted
> file\n\n",
> > + 			progname, MICROCODE_FILE_DEFAULT);
> > +-	exit(1);
> > + }
> > +
> > + /*
> > +@@ -141,6 +140,7 @@ int main(int argc, char *argv[])
> > + 		switch(c) {
> > + 			case 'h':
> > + 				usage();
> > ++				return 0;
> > +
> > + 			case 'q':
> > + 				print_normal_messages=3D0;
> > +@@ -168,14 +168,17 @@ int main(int argc, char *argv[])
> > +
> > + 			case '?':
> > + 				usage();
> > ++				return 0;
> > + 		}
> > + 	}
> > +
> > + 	if (upload) {
> > + 		if((return_code =3D do_update(device, filename)))
> > + 			exit(return_code);
> > +-	} else
> > ++	} else {
> > + 		usage();
> > ++		return 1;
> > ++	}
> > +
> > + 	return 0;
> > + }
> > +--
> > +1.9.1
> > +
> > diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in=
-
> the-elf-binary.patch b/meta-oe/recipes-bsp/microcode-ctl/files/fix-No-
> GNU_HASH-in-the-elf-binary.patch
> > new file mode 100644
> > index 000000000..87d8f7dfe
> > --- /dev/null
> > +++ b/meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-the-el=
f-
> binary.patch
> > @@ -0,0 +1,30 @@
> > +From a5d4baf79ee332cf73e5259a2568958babcdbce2 Mon Sep 17 00:00:00
> 2001
> > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > +Date: Mon, 1 Aug 2016 07:00:35 -0400
> > +Subject: [PATCH] fix No GNU_HASH in the elf binary
> > +
> > +Let recipe's LDFLAGS work in Makefile.
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + Makefile | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 590ae7e..d4e0610 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -37,7 +37,7 @@ RCFILETO        =3D $(RCDIR)/$(RCHOMEDIR)
> > + all: microcode_ctl
> > +
> > + microcode_ctl: microcode_ctl.c
> > +-	$(CC) $(CFLAGS) -o $(PROGRAM) microcode_ctl.c
> > ++	$(CC) $(CFLAGS) -o $(PROGRAM) microcode_ctl.c $(LDFLAGS)
> > + 	mkdir intel-ucode amd-ucode
> > + 	tar xfz $(MICROCODE_INTEL) -C intel-ucode
> > + 	tar --strip-components 1 -xf $(MICROCODE_AMD) -C amd-ucode
> > +--
> > +2.8.1
> > +
> > diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.serv=
ice
> b/meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
> > new file mode 100644
> > index 000000000..0658ff378
> > --- /dev/null
> > +++ b/meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
> > @@ -0,0 +1,11 @@
> > +[Unit]
> > +Description=3DApply Cpu Microcode
> > +
> > +[Service]
> > +Type=3Dforking
> > +KillMode=3Dprocess
> > +RemainAfterExit=3Dyes
> > +ExecStart=3D@SBINDIR@/microcode_ctl -Qu
> > +
> > +[Install]
> > +WantedBy=3Dmulti-user.target
> > diff --git a/meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb b/m=
eta-
> oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb
> > new file mode 100755
> > index 000000000..12fa5f564
> > --- /dev/null
> > +++ b/meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb
> > @@ -0,0 +1,62 @@
> > +SUMMARY =3D "Microcode Control Tool"
> > +DESCRIPTION =3D "The microcode_ctl utility is a companion to the IA32
> microcode driver \
> > +  The utility has two uses: \
> > +  a) it decodes and sends new microcode to the kernel driver to be upl=
oaded \
> > +     to Intel IA32 family processors. (Pentium Pro, PII, Celeron, PIII=
, \
> > +     Xeon, Pentium 4 etc, x86_64) \
> > +  b) it signals the kernel driver to release any buffers it may hold \
> > +"
> > +HOMEPAGE =3D "https://pagure.io/microcode_ctl/"
> > +SECTION =3D "console/utils"
> > +
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-
> 2.0;md5=3D801f80980d171dd6425610833a22dbe6"
>=20
> There is no indication about the license in the repository?

Sorry I didn't check that when I moved it from our internal layer
and sent here. Yes, there is license info in the source repo, I will
fix it soon and send v2.

>=20
> > +SRC_URI =3D "git://pagure.io/microcode_ctl.git;protocol=3Dhttps \
> > +           file://0001-add-support-for-other-distributions.patch \
> > +           file://0001-fix-the-help-return-code.patch \
> > +           file://fix-No-GNU_HASH-in-the-elf-binary.patch \
> > +           file://microcode_ctl.service \
> > +          "
> > +
> > +SRCREV =3D "8c8ae77e661bdba298f256948867d5a619bf1588"
> > +
> > +# DO NOT use the v2.x which is in the obsolete branch
> > +PV =3D "v1.34+git${SRCREV}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit update-rc.d systemd
> > +
> > +INITSCRIPT_PACKAGES =3D "microcode-ctl"
> > +INITSCRIPT_NAME_microcode-ctl =3D "microcode_ctl"
> > +INITSCRIPT_PARAMS_microcode-ctl =3D "start 80 2 3 4 5 . stop 20 0 1 6 =
."
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "microcode_ctl.service"
> > +
> > +COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
> > +
> > +FIRMWARE_DIR =3D "${nonarch_base_libdir}/firmware"
> > +
> > +EXTRA_OEMAKE =3D "'CC=3D${CC}' \
> > +                'CFLAGS+=3D-Wall -I${STAGING_KERNEL_DIR}/include' \
> > +               "
>=20
> I don't see kernel in DEPENDS and this MACHINE specific variable causes:

Thanks for pointing this out, I will investigate and fix it in v2.

Thanks,
Jackie

>=20
>  =3D=3D=3D Comparing signatures for task do_configure.sigdata between qem=
ux86copy
> and qemux86 =3D=3D=3D
> ERROR: microcode-ctl different signature for task do_configure.sigdata
> between qemux86copy and qemux86
> basehash changed from 9d921f4621d8cd18acd74d559a452755 to
> 9d45e86d0e1b32712658581b752e0e8c
> Variable MACHINE value changed from 'qemux86copy' to 'qemux86'
>=20
> ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate=
-
> diff/1497333018/signatures.qemux86.do_configure.sigdata.log
>=20
>=20
>  =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betw=
een
> qemux86copy and qemux86 =3D=3D=3D
> ERROR: microcode-ctl different signature for task do_populate_sysroot.sig=
data
> between qemux86copy and qemux86
> runtaskdeps changed:
> microcode-ctl/microcode-ctl_git.bb.do_install with hash
> e21ec08f024dad0c8c16f78d5f3e7677
>  changed to
> microcode-ctl/microcode-ctl_git.bb.do_install with hash
> f86df62ab78761dcb0bbcb94c45c6872
> Hash for dependent task microcode-ctl/microcode-ctl_git.bb.do_install cha=
nged
> from e21ec08f024dad0c8c16f78d5f3e7677 to
> f86df62ab78761dcb0bbcb94c45c6872
>=20
> ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate=
-
> diff/1497333018/signatures.qemux86.do_populate_sysroot.sigdata.log
>=20
>=20
>  =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata bet=
ween
> qemux86copy and qemux86 =3D=3D=3D
> ERROR: microcode-ctl different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
> runtaskdeps changed:
> microcode-ctl/microcode-ctl_git.bb.do_package with hash
> 98d64d16e53c5f53e53299f55b5667ae
>  changed to
> microcode-ctl/microcode-ctl_git.bb.do_package with hash
> c3d694be45ffd4fdb8c5a617f4cdeb5d
> microcode-ctl/microcode-ctl_git.bb.do_packagedata with hash
> 57a09030b203208086363b7d4f88735e
>  changed to
> microcode-ctl/microcode-ctl_git.bb.do_packagedata with hash
> 87f202cce6bacbcf0c7128ab55d7c6c5
> Hash for dependent task microcode-ctl/microcode-ctl_git.bb.do_package
> changed from 98d64d16e53c5f53e53299f55b5667ae to
> c3d694be45ffd4fdb8c5a617f4cdeb5d
> Hash for dependent task microcode-ctl/microcode-ctl_git.bb.do_packagedata
> changed from 57a09030b203208086363b7d4f88735e to
> 87f202cce6bacbcf0c7128ab55d7c6c5
>=20
> ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate=
-
> diff/1497333018/signatures.qemux86.do_package_write_ipk.sigdata.log
>=20
> > +
> > +do_install() {
> > +    oe_runmake install DESTDIR=3D${D} PREFIX=3D${prefix}
> > +    rm -rf ${D}${FIRMWARE_DIR}/amd-ucode
> > +
> > +    install -d ${D}${systemd_system_unitdir}
> > +    install -D -m 0644 ${WORKDIR}/microcode_ctl.service
> ${D}${systemd_system_unitdir}/microcode_ctl.service
> > +    sed -i -e 's,@SBINDIR@,${sbindir},g'
> ${D}${systemd_system_unitdir}/microcode_ctl.service
> > +}
> > +
> > +# do_populate_sysroot is not needed for this package,
> > +# otherwise, it will conflict with the linux-firmware,
> > +do_populate_sysroot[noexec] =3D "1"
> > +
> > +PACKAGES +=3D "${PN}-firmware"
> > +
> > +FILES_${PN}-firmware =3D "${FIRMWARE_DIR}/microcode.dat"
> > +
> > +RDEPENDS_${PN} =3D "${PN}-firmware bash"
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

