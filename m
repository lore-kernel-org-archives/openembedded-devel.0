Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 731B976FF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 06:56:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8O6u4Fa005625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Sep 2015 23:56:04 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.69]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0235.001;
	Wed, 23 Sep 2015 23:56:04 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 1/5] waf-samba: add new class
Thread-Index: AQHQ3miAxhogSGTEkUqu3rR8fvYcjJ5LbFdA
Date: Thu, 24 Sep 2015 06:56:03 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010BCD0DA0@ALA-MBB.corp.ad.wrs.com>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
	<1440086369-3321-2-git-send-email-koen@dominion.thruhere.net>
	<30DC4EDFD798C94083F3E083754532CC011C1F94CC@G08CNEXMBPEKD03.g08.fujitsu.local>
	<20150824122848.GB2446@jama>
In-Reply-To: <20150824122848.GB2446@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.147]
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 1/5] waf-samba: add new class
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Sep 2015 06:56:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Monday, August 24, 2015 8:29 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Koen Kooi
> Subject: Re: [oe] [meta-oe][PATCH 1/5] waf-samba: add new class
>=20
> On Fri, Aug 21, 2015 at 01:11:03AM +0000, Bian, Naimeng wrote:
> > > -----Original Message-----
> > > From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> > > Sent: Thursday, August 20, 2015 11:59 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Bian, Naimeng; Koen Kooi
> > > Subject: [meta-oe][PATCH 1/5] waf-samba: add new class
> > >
> > > From: Bian Naimeng <biannm@cn.fujitsu.com>
>=20
> I've merged Bian's implementation, because it was passing jenkins builds =
now, can one of you please
> send rebased version of these patches?

Any new progress for this? talloc do_configure  fails with current implemen=
tation:

| Checking for program gcc or cc           : ['powerpc-wrs-linux-gcc', '-m3=
2', '-mhard-float', '-mcpu=3D7400', '--sysroot=3D/buildarea/raid0/jhuang0/b=
uilds/d_samba_150914/p_ppc_150923/bitbake_build/tmp/sysroots/qemuppc']
| Checking for program ar                  : powerpc-wrs-linux-ar
| Checking for program ranlib              : powerpc-wrs-linux-ranlib
| Checking for gcc                         : ok
| Checking for program git                 : /buildarea/raid0/jhuang0/build=
s/d_samba_150914/p_ppc_150923/bitbake_build/buildtools/sysroots/x86_64-wrli=
nuxsdk-linux/usr/bin/git
| Check for -MD                            : yes
| Checking for program gdb                 : /buildarea/raid0/jhuang0/build=
s/d_samba_150914/p_ppc_150923/scripts/gdb
| Checking build system                    : Linux pek-lpggp1 3.13.0-61-gen=
eric #100-Ubuntu SMP Wed Jul 29 11:21:34 UTC 2015 x86_64 x86_64 x86_64 GNU/=
Linux
| Checking for header sys/utsname.h        : yes
| Checking uname sysname type              : not found
| Checking uname machine type              : not found
| Checking uname release type              : not found
| Checking uname version type              : not found
| Checking for header stdio.h              : yes
| Checking simple C program                : /buildarea/raid0/jhuang0/build=
s/d_samba_150914/p_ppc_150923/bitbake_build/tmp/work/ppc7400-wrs-linux/tall=
oc/2.1.1-r0/talloc-2.1.1/lib/replace/../../buildtools/wafsamba/wscript:296:=
 error: the configuration failed (see '/buildarea/raid0/jhuang0/builds/d_sa=
mba_150914/p_ppc_150923/bitbake_build/tmp/work/ppc7400-wrs-linux/talloc/2.1=
.1-r0/talloc-2.1.1/bin/config.log')
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /buildarea/r=
aid0/jhuang0/builds/d_samba_150914/p_ppc_150923/bitbake_build/tmp/work/ppc7=
400-wrs-linux/talloc/2.1.1-r0/temp/do_configure/log.do_configure.79871)
NOTE: recipe talloc-2.1.1-r0: task do_configure: Failed

Thanks,
Jackie

>=20
> > >
> > > waf-samba is a build system used by samba related software
> > >
> > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > > ---
> > >  meta-oe/classes/waf-samba.bbclass | 51
> > > +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 51 insertions(+)
> > >  create mode 100644 meta-oe/classes/waf-samba.bbclass
> > >
> > > diff --git a/meta-oe/classes/waf-samba.bbclass
> > > b/meta-oe/classes/waf-samba.bbclass
> > > new file mode 100644
> > > index 0000000..b8e010a
> > > --- /dev/null
> > > +++ b/meta-oe/classes/waf-samba.bbclass
> > > @@ -0,0 +1,51 @@
> > > +# waf is a build system which is used by samba related project.
> > > +# Obtain details from https://wiki.samba.org/index.php/Waf
> > > +#
> > > +inherit qemu pythonnative
> > > +
> > > +DEPENDS +=3D "qemu-native libxslt-native
> > > +docbook-xsl-stylesheets-native
> > > python"
> > > +
> > > +CONFIGUREOPTS =3D " --prefix=3D${prefix} \
> > > +                  --bindir=3D${bindir} \
> > > +                  --sbindir=3D${sbindir} \
> > > +                  --libexecdir=3D${libexecdir} \
> > > +                  --datadir=3D${datadir} \
> > > +                  --sysconfdir=3D${sysconfdir} \
> > > +                  --sharedstatedir=3D${sharedstatedir} \
> > > +                  --localstatedir=3D${localstatedir} \
> > > +                  --libdir=3D${libdir} \
> > > +                  --includedir=3D${includedir} \
> > > +                  --oldincludedir=3D${oldincludedir} \
> > > +                  --infodir=3D${infodir} \
> > > +                  --mandir=3D${mandir} \
> > > +                "
> > > +
> > > +do_configure() {
> > > +    qemu_binary=3D"${@qemu_target_binary(d)}"
> > > +    if [ ${qemu_binary} =3D=3D "qemu-allarch" ]; then
> > > +        qemu_binary=3D"qemuwrapper"
> > > +    fi
> > > +
> > > +    libdir_qemu=3D"${STAGING_DIR_HOST}/${libdir}"
> > > +    base_libdir_qemu=3D"${STAGING_DIR_HOST}/${base_libdir}"
> > > +    oldest_kernel_qemu=3D${OLDEST_KERNEL}
> > > +
> > > +    CROSS_EXEC=3D"${qemu_binary} \
> > > +                -r ${oldest_kernel_qemu} \
> > > +                -L ${STAGING_DIR_HOST} \
> > > +                -E LD_LIBRARY_PATH=3D${libdir_qemu}:${base_libdir_qe=
mu}"
> > > +
> > > +    export BUILD_SYS=3D${BUILD_SYS}
> > > +    export HOST_SYS=3D${HOST_SYS}
> > > +    export BUILD_ARCH=3D${BUILD_ARCH}
> > > +    export HOST_ARCH=3D${HOST_ARCH}
> > > +    export STAGING_LIBDIR=3D${STAGING_LIBDIR}
> > > +    export STAGING_INCDIR=3D${STAGING_INCDIR}
> > > +    export PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR=
}
> > > +
> > > +    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile
> > > --cross-execute=3D"${CROSS_EXEC}"
> > > --cross-answers=3D${B}/cross-answers-${TARGET_ARCH}.txt
> >
> > Thanks for your update.
> >
> > Would you tell me why both --cross-execute and --cross-answer are requi=
red.
> > If the --cross-answers is not be required, IMO, we do not need support =
it.
> > Because it will be not an easy job to maintain
> > cross-answers-${TARGET_ARCH}.txt for each waf-samba.bbclass based recip=
e.
> >
> > Thanks
> >  Bian
> >
> > > +}
> > > +
> > > +do_install() {
> > > +    oe_runmake install DESTDIR=3D${D} }
> > > --
> > > 2.0.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

