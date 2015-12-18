Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4F0F605FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 06:25:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBI6PJf7019489
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 22:25:19 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.162]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Thu, 17 Dec 2015 22:25:18 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH v2] openjdk-8-native: fix incorrect
	do_install
Thread-Index: AQHROVM7JFSPME3DmkeZipkaF7iUp57QRUuA
Date: Fri, 18 Dec 2015 06:25:18 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C770D50@ALA-MBA.corp.ad.wrs.com>
References: <1450415741-3793-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1450415741-3793-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.144]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH v2] openjdk-8-native: fix incorrect	do_install
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
X-List-Received-Date: Fri, 18 Dec 2015 06:25:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this, it will conflict with ecj-bootstrap-native and fastjar-=
native:

ERROR: The recipe openjdk-8-native is trying to install files into a shared=
 area when those files already exist. Those files and their manifest locati=
on are:
   /p_arm-jre7_151218/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/jar
 Matched in manifest-x86_64-fastjar-native.populate_sysroot
 /p_arm-jre7_151218/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/java
 Matched in manifest-x86_64-ecj-bootstrap-native.populate_sysroot

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Friday, December 18, 2015 1:16 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-java][PATCH v2] openjdk-8-native: fix incorrect do_in=
stall
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> do_install should not install files directly into
> staging dirs, or the ${D} and sstate is empty and
> builds from sstate cache will fail.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  recipes-core/openjdk/openjdk-8-native.inc | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/ope=
njdk/openjdk-8-native.inc
> index 7813ec2..450228a 100644
> --- a/recipes-core/openjdk/openjdk-8-native.inc
> +++ b/recipes-core/openjdk/openjdk-8-native.inc
> @@ -68,15 +68,13 @@ do_compile_append() {
>  }
>=20
>  do_install() {
> -    rm -rf ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
> -    mkdir -p ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
> -    cp -rp ${B}/images/j2sdk-image/* ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_=
DIR}
> +    mkdir -p ${D}${libdir_jvm}/${JDK_DIR}
> +    cp -rp ${B}/images/j2sdk-image/* ${D}${libdir_jvm}/${JDK_DIR}
>=20
> -# clean up the mess from bootstrap
> +    # clean up the mess from bootstrap
> +    mkdir -p ${D}${bindir}
>      for tool in jar java javac keytool pack200 unpack200
>      do
> -        rm -f ${STAGING_BINDIR_NATIVE}/$tool
> -
> -        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${STAGING_BINDIR_NATIVE=
}/$tool
> +        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${D}${bindir}/$tool
>      done
>  }
> --
> 2.3.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

