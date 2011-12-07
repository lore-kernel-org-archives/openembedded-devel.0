Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RYEb7-0006yr-2l
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 11:19:33 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pB7ACdJX022784
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Dec 2011 11:12:44 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 7 Dec 2011 11:12:40 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] libpam_1.1.1: remove directory preventing
	/var/run from being volatile
Thread-Index: Acy0w0B26OdOmEKpQIGJ4GsOHCYL5P//9iwAgAARyyQ=
Date: Wed, 7 Dec 2011 10:12:39 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A5084@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C401A5055@post.tritech.se>,
	<1323251888.4065.3.camel@mattotaupa>
In-Reply-To: <1323251888.4065.3.camel@mattotaupa>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: Re: [PATCH] libpam_1.1.1: remove directory preventing /var/run from being volatile
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
X-List-Received-Date: Wed, 07 Dec 2011 10:19:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Paul Menzel [paulepanter@us=
ers.sourceforge.net]=0A=
> Sent: Wednesday, December 07, 2011 10:58 AM=0A=
> To: openembedded-devel@lists.openembedded.org=0A=
> Subject: Re: [oe] [PATCH] libpam_1.1.1: remove directory preventing /var/=
run from being volatile=0A=
> =0A=
> Dear Mats,=0A=
> =0A=
> =0A=
> thank you for sending the patch for OE-classic master.=0A=
> =0A=
> Am Mittwoch, den 07.12.2011, 09:37 +0000 schrieb Mats K=E4rrman:=0A=
> > The libpam make install creates a /var/run/sepermit folder that prevent=
s=0A=
> > the later creation of a sym-link /var/run --> /var/volatile/run. This i=
s=0A=
> > a problem because it causes additional wear to FLASH file systems.=0A=
> >=0A=
> > The solution is ~equivalent to the solution applied in libpam recipes o=
f=0A=
> =0A=
> Does the ~ have any meaning or is it just a typo?=0A=
=0A=
~ =3D roughly, more-or-less, approximately (like 05 !=3D 99...)=0A=
=0A=
> =0A=
> > oe-core but v1.1.1 does not exist there and the corresponding fix was a=
=0A=
> > part of the original recipes for later versions.=0A=
> >=0A=
> > Signed-off-by: Mats K=E4rrman <mats.karrman@tritech.se>=0A=
> >=0A=
> > ------=0A=
> >=0A=
> > diff --git a/recipes/pam/files/05_libpam b/recipes/pam/files/05_libpam=
=0A=
> > new file mode 100644=0A=
> > index 0000000..5ae0c8e=0A=
> > --- /dev/null=0A=
> > +++ b/recipes/pam/files/05_libpam=0A=
> > @@ -0,0 +1,3 @@=0A=
> > +# Create sepermit folder in volatile fs=0A=
> > +d root root 0755 /var/run/sepermit none=0A=
> > +=0A=
> =0A=
> In OE-core the file name is `99_pam` [1]. Why did the leading number=0A=
> needed to be changed? Should that be also `05` in OE-core?=0A=
=0A=
Number sets the order that files are parsed to create volatile directories.=
 I fixed and tested my build without looking at oe-core and thought that 05=
 was a good number as there were only a 00 file to begin with. Only later I=
 decided to contribute back and then I found that the problem was already s=
olved in oe-core but I didn't bother to change my fix to match oe-core beca=
use I didn't think it matter, sorry...=0A=
=0A=
> =0A=
> > diff --git a/recipes/pam/libpam_1.1.1.bb b/recipes/pam/libpam_1.1.1.bb=
=0A=
> > index 09bc554..ba35d0c 100644=0A=
> > --- a/recipes/pam/libpam_1.1.1.bb=0A=
> > +++ b/recipes/pam/libpam_1.1.1.bb=0A=
> > @@ -15,7 +15,7 @@ DEPENDS =3D "flex flex-native"=0A=
> >  # PAM is not a lot of use without configuration files and the plugins=
=0A=
> >  RRECOMMENDS_${PN} =3D "libpam-meta libpam-base-files"=0A=
> >=0A=
> > -PR =3D "r2"=0A=
> > +PR =3D "r3"=0A=
> >=0A=
> >  # The project is actually called Linux-PAM but that gives=0A=
> >  # a bad OE package name because of the upper case characters=0A=
> > @@ -26,6 +26,7 @@ S =3D "${WORKDIR}/${p}"=0A=
> >  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/pam/library/${p}.tar.b=
z2 \=0A=
> >             file://pam-nodocs.patch \=0A=
> >             file://define-HAVE_DBM.patch \=0A=
> > +           file://05_libpam \=0A=
> >            "=0A=
> >=0A=
> >  UCLIBC_PATCHES =3D " file://Linux-PAM-1.1.0-uclibc.patch \=0A=
> > @@ -71,6 +72,17 @@ python populate_packages_prepend () {=0A=
> >         packages.append(metapkg)=0A=
> >         bb.data.setVar('PACKAGES', ' '.join(packages), d)=0A=
> >  }=0A=
> > +=0A=
> > +do_install_append () {=0A=
> > +    # Remove erroneously created /var/run dir=0A=
> > +    rm -rf ${D}${localstatedir}/run=0A=
> > +=0A=
> > +    # Install volatiles specification to make sure dir is created in r=
un-time=0A=
> > +    install -d ${D}${sysconfdir}/default=0A=
> > +    install -d ${D}${sysconfdir}/default/volatiles=0A=
> > +    install -m 0644  ${WORKDIR}/05_libpam  ${D}${sysconfdir}/default/v=
olatiles/=0A=
> > +}=0A=
> > +=0A=
> >  SRC_URI[md5sum] =3D "9b3d952b173d5b9836cbc7e8de108bee"=0A=
> >  SRC_URI[sha256sum] =3D "608d3eb9d7a5e1a7505fff62e6a583fdb6e52dc05bf54d=
c9661c5f395=0A=
> =0A=
> =0A=
> Thanks,=0A=
> =0A=
> Paul=0A=
> =0A=
> =0A=
> [1] http://git.openembedded.org/openembedded-core/commit/meta/recipes-ext=
ended/pam/libpam/99_pam?id=3D698cef8322e5a5f18e50ce62f6c9d1f1f846677a=0A=
> =0A=
=0A=
I'll send a new patch shortly.=0A=
=0A=
// Mats=0A=


