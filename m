Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5086FF86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:47:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBI4lSPS018412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:47:28 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.84]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 17 Dec 2015 20:47:27 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH] openjdk-8-native: fix incorrect
	do_install
Thread-Index: AQHROUo9USb68k8MrkWBnUKPLThyLJ7QK6QA
Date: Fri, 18 Dec 2015 04:47:27 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C770C08@ALA-MBA.corp.ad.wrs.com>
References: <1450409989-3032-1-git-send-email-jackie.huang@windriver.com>
	<84CC13FA-C644-4A04-A188-2D66678C4329@gmail.com>
In-Reply-To: <84CC13FA-C644-4A04-A188-2D66678C4329@gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.144]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH] openjdk-8-native: fix incorrect	do_install
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
X-List-Received-Date: Fri, 18 Dec 2015 04:47:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Friday, December 18, 2015 12:11 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-java][PATCH] openjdk-8-native: fix incorrect do_i=
nstall
>=20
>=20
> > On Dec 17, 2015, at 7:39 PM, jackie.huang@windriver.com wrote:
> >
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > do_install should not install files directly into
> > staging dirs, or the ${D} and sstate is empty and
> > builds from sstate cache will fail.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> > recipes-core/openjdk/openjdk-8-native.inc | 12 +++++-------
> > 1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/o=
penjdk/openjdk-8-
> native.inc
> > index 7813ec2..a75f9e0 100644
> > --- a/recipes-core/openjdk/openjdk-8-native.inc
> > +++ b/recipes-core/openjdk/openjdk-8-native.inc
> > @@ -68,15 +68,13 @@ do_compile_append() {
> > }
> >
> > do_install() {
> > -    rm -rf ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
> > -    mkdir -p ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
> > -    cp -rp ${B}/images/j2sdk-image/* ${STAGING_LIBDIR_NATIVE}/jvm/${JD=
K_DIR}
> > +    mkdir -p ${D}/${libdir_jvm}/${JDK_DIR}
> > +    cp -rp ${B}/images/j2sdk-image/* ${D}/${libdir_jvm}/${JDK_DIR}
>=20
> slash between D and libdir_jvm is not needed. Also on line above this one=
 is same problem.

Ok, I will remove the slashes and re-send.

Thanks,
Jackie

>=20
> >
> > -# clean up the mess from bootstrap
> > +    # clean up the mess from bootstrap
> > +    mkdir -p ${D}/${bindir}
> >     for tool in jar java javac keytool pack200 unpack200
> >     do
> > -        rm -f ${STAGING_BINDIR_NATIVE}/$tool
> > -
> > -        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${STAGING_BINDIR_NATI=
VE}/$tool
> > +        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${D}/${bindir}/$tool
> >     done
> > }
> > --
> > 2.3.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel


