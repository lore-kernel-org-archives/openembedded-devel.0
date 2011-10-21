Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHINU-0001Ry-A6
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 18:55:28 +0200
Received: by pzk33 with SMTP id 33so10187429pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 09:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=vKf+eD3FngZmsAn8ADLsgHT6HBrXH5CihlZuAzjQ4B0=;
	b=hYhRouL202aopotfRnNLeS+sIAiy2EF4ClZRIor209ZaG0L9SD1K1wnE/8AC97MVfY
	+i9cFlc+fbh+FSY4/w3DmWn2zgJGjLtzcgSJMEdJkx3zPuqd9JBqFGe8RsmDd68SO8HQ
	L1vhbVPQSB/iZA6jFElQ3HCSS6GOFAeuCFwdY=
Received: by 10.68.23.6 with SMTP id i6mr29025518pbf.13.1319215774259; Fri, 21
	Oct 2011 09:49:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 21 Oct 2011 09:49:04 -0700 (PDT)
In-Reply-To: <1319210443657408500@rkmorris.us>
References: <1319210443657408500@rkmorris.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2011 09:49:04 -0700
Message-ID: <CAMKF1sqUsuZ5_rmcsq5o1FsYw42mz9VVC=QXxY13FkMxqA6jaA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Build Failure - signgp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 16:55:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 8:20 AM, Russell Morris
<openembedded@rkmorris.us> wrote:
> Hi,
>
> I am trying to build console-image for an am3517-evm (machine), but x-loa=
d fails due to issues with signgp. Has anyone else been able to build this =
successfully?
>

Please apply this patch
http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2011-October/005=
232.html

> Thanks!
>
> ... Russell
>
>
> PS: Here is the failure log,
>
> OE Build Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.13.3"
> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "am3517-evm"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
> DISTRO_VERSION =C2=A0 =C2=A0=3D "v2011.10-core"
> TUNE_FEATURES =C2=A0 =C2=A0 =3D "armv7a vfp neon cortexa8"
> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "vfp-neon"
> meta-angstrom =C2=A0 =C2=A0 =3D "master:3dc02ecc7ee7d9e03b03025ddf4436f9e=
e8029fb"
> meta-oe
> meta-efl
> meta-gpe
> meta-gnome
> meta-xfce =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:0368dfd5d8285fe31c85309=
7846e8a6822c7cda0"
> meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:fa296c64e42de57ac8=
df8fb7b9c30e393ed71ce9"
> meta-ettus =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:617506b5cfd2b8325d85f0d=
cba0232c3f796d044"
> meta-efikamx =C2=A0 =C2=A0 =C2=A0=3D "master:2ef47fdd4e8232d766c0c63d9427=
253ee56e31d0"
> meta-nslu2 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:9080394ae0a040dd7b05ac4=
9f9480e4d71631b55"
> meta-htc
> meta-nokia
> meta-openmoko
> meta-palm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:fbd6e9e8517e7ec58ad3647=
4bd7fa01275e159f1"
> meta-sugarbay
> meta-crownbay
> meta-emenlow
> meta-fishriver
> meta-jasperforest
> meta-n450 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:42fcbb128c5fe812068bb86=
934ab31ac92fd9f83"
> meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:99da9a4e=
65f9dffb04efc3ad60125194c476d6b3"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 944 of 957 (ID: 4, /mnt/oe/setup-scripts/sources/meta-=
ti/recipes-bsp/x-load/signgp.bb, do_fetch)
> NOTE: package signgp-1.0-r0: task do_fetch: Started
> NOTE: package signgp-1.0-r0: task do_fetch: Succeeded
> NOTE: Running task 945 of 957 (ID: 0, /mnt/oe/setup-scripts/sources/meta-=
ti/recipes-bsp/x-load/signgp.bb, do_unpack)
> NOTE: package signgp-1.0-r0: task do_unpack: Started
> NOTE: package signgp-1.0-r0: task do_unpack: Succeeded
> NOTE: Running task 946 of 957 (ID: 1, /mnt/oe/setup-scripts/sources/meta-=
ti/recipes-bsp/x-load/signgp.bb, do_patch)
> NOTE: package signgp-1.0-r0: task do_patch: Started
> NOTE: package signgp-1.0-r0: task do_patch: Succeeded
> NOTE: Running task 947 of 957 (ID: 6, /mnt/oe/setup-scripts/sources/meta-=
ti/recipes-bsp/x-load/signgp.bb, do_configure)
> NOTE: Running task 948 of 957 (ID: 12, /mnt/oe/setup-scripts/sources/meta=
-ti/recipes-bsp/x-load/signgp.bb, do_populate_lic)
> NOTE: package signgp-1.0-r0: task do_configure: Started
> ERROR: Function 'signgp: LIC_FILES_CHKSUM points to an invalid file: /mnt=
/oe/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-lin=
ux-gnueabi/signgp-1.0-r0/signgp-1.0/signGP.c' failed
> ERROR: Logfile of failure stored in: /mnt/oe/setup-scripts/build/tmp-angs=
trom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/signgp-1.0-r0/temp/lo=
g.do_configure.28702
> Log data follows:
> | + cd /mnt/oe/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a=
-angstrom-linux-gnueabi/signgp-1.0-r0/signgp-1.0
> | + do_configure
> | + base_do_configure
> | + :
> | NOTE: Checking autotools environment for common misconfiguration
> | ERROR: Function 'signgp: LIC_FILES_CHKSUM points to an invalid file: /m=
nt/oe/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-l=
inux-gnueabi/signgp-1.0-r0/signgp-1.0/signGP.c' failed
> NOTE: package signgp-1.0-r0: task do_configure: Failed
> NOTE: package signgp-1.0-r0: task do_populate_lic: Started
> ERROR: Task 6 (/mnt/oe/setup-scripts/sources/meta-ti/recipes-bsp/x-load/s=
igngp.bb, do_configure) failed with exit code '1'
> Waiting for 1 active tasks to finish:
> 0: signgp-1.0-r0 do_populate_lic (pid 28703)
> WARNING: /mnt/oe/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv=
7a-angstrom-linux-gnueabi/signgp-1.0-r0/signgp-1.0/signGP.c could not be co=
pied for some reason. It may not exist. WARN for now.
> WARNING: signgp: No generic license file exists for: NewBSD at /mnt/oe/se=
tup-scripts/sources/openembedded-core/meta/files/common-licenses
> WARNING: signgp: There is also no SPDXLICENSEMAP for this license type: N=
ewBSD at /mnt/oe/setup-scripts/sources/openembedded-core/meta/files/common-=
licenses
> NOTE: package signgp-1.0-r0: task do_populate_lic: Succeeded
> ERROR: '/mnt/oe/setup-scripts/sources/meta-ti/recipes-bsp/x-load/signgp.b=
b' failed
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


