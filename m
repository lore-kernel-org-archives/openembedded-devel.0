Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Qj9WM-00081R-Cm
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 14:35:30 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p6JCVPFW032344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 19 Jul 2011 07:31:25 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p6JCVPZW003806;
	Tue, 19 Jul 2011 07:31:25 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p6JCVP3Q004881;
	Tue, 19 Jul 2011 07:31:25 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Tue, 19 Jul 2011 07:31:25 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Chase Maupin <chasemaupin03@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2011 07:31:20 -0500
Thread-Topic: [PATCH] nodejs: Add patch to compile with GCC 4.3.3
Thread-Index: AcxGD5lQPFHiGoOFRuORDKnLL9HJIQAAAJiA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034B676E6B@dlee06.ent.ti.com>
References: <1311078599-7474-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1311078599-7474-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] nodejs: Add patch to compile with GCC 4.3.3
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
X-List-Received-Date: Tue, 19 Jul 2011 12:35:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Just FYI, this patch is against the nodejs version in the maintenance branc=
h and was sent to the list so it could be picked up into Koen's staging tre=
e for his next pull request.  The previously sent version was for the OE de=
v mainline and has already been accepted.

> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Tuesday, July 19, 2011 7:30 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCH] nodejs: Add patch to compile with GCC 4.3.3
>=20
> * Add a patch to nodejs to allow compiling with GCC versions
>   less than or equal to 4.3.3.
> * Define the function nodejs_get_gcc_ver to allow applying the
>   patch conditionally based on compiler version.
> * Patch based on post at https://github.com/joyent/node/issues/883
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  ...01-Add-missing-compiler-flags-for-GCC-4.3.patch |   34
> ++++++++++++++++++++
>  recipes/nodejs/nodejs_0.4.0.bb                     |    9 +++++
>  2 files changed, 43 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/nodejs/files/0001-Add-missing-compiler-
> flags-for-GCC-4.3.patch
>=20
> diff --git a/recipes/nodejs/files/0001-Add-missing-compiler-flags-for-
> GCC-4.3.patch b/recipes/nodejs/files/0001-Add-missing-compiler-flags-
> for-GCC-4.3.patch
> new file mode 100644
> index 0000000..080b88f
> --- /dev/null
> +++ b/recipes/nodejs/files/0001-Add-missing-compiler-flags-for-GCC-
> 4.3.patch
> @@ -0,0 +1,34 @@
> +From 7cb51ed25b688be08825950ce3f5ce2ad38e3f95 Mon Sep 17 00:00:00 2001
> +From: Chase Maupin <Chase.Maupin@ti.com>
> +Date: Tue, 12 Jul 2011 11:00:48 -0500
> +Subject: [PATCH] Add missing compiler flags for GCC 4.3
> +
> +* When compiling nodejs for GCC 4.3.3 you need to also add the
> +  flag -fno-tree-sink.
> +* This patch was taken from the thread at:
> +    * https://github.com/joyent/node/issues/883
> +* Believe that no action is taken on this change upstream because
> +  it is GCC 4.3.3 specific and is not required for GCC 4.5
> +
> +Upstream-Status: Denied
> +
> +Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> +---
> + deps/v8/SConstruct |    1 +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git a/deps/v8/SConstruct b/deps/v8/SConstruct
> +index b2542fd..31c4c7b 100644
> +--- a/deps/v8/SConstruct
> ++++ b/deps/v8/SConstruct
> +@@ -210,6 +210,7 @@ LIBRARY_FLAGS =3D {
> +     },
> +     'arch:arm': {
> +       'CPPDEFINES':   ['V8_TARGET_ARCH_ARM'],
> ++      'CCFLAGS': ['-fno-tree-sink'],
> +       'unalignedaccesses:on' : {
> +         'CPPDEFINES' : ['CAN_USE_UNALIGNED_ACCESSES=3D1']
> +       },
> +--
> +1.7.0.4
> +
> diff --git a/recipes/nodejs/nodejs_0.4.0.bb
> b/recipes/nodejs/nodejs_0.4.0.bb
> index be3d23e..fe8a878 100644
> --- a/recipes/nodejs/nodejs_0.4.0.bb
> +++ b/recipes/nodejs/nodejs_0.4.0.bb
> @@ -4,11 +4,20 @@ LICENSE =3D "MIT"
>=20
>  DEPENDS =3D "openssl"
>=20
> +PR =3D "r1"
> +
> +def nodejs_get_gcc_version(d):
> +    import subprocess,os,bb
> +    if os.path.exists(bb.data.getVar('TOOLCHAIN_PATH', d,
> 1)+'/bin/'+bb.data.getVar('TARGET_PREFIX', d, 1)+'gcc'):
> +        return subprocess.Popen([bb.data.getVar('TOOLCHAIN_PATH', d,
> 1)+'/bin/'+bb.data.getVar('TARGET_PREFIX', d, 1)+'gcc', '-v'],
> stderr=3Dsubprocess.PIPE).communicate()[1].splitlines()[-1].split()[2]
> +
>  SRC_URI =3D " \
>    http://nodejs.org/dist/node-v${PV}.tar.gz \
>    file://libev-cross-cc_${PV}.patch \
>  "
>=20
> +SRC_URI +=3D "${@["", "file://0001-Add-missing-compiler-flags-for-GCC-
> 4.3.patch"][nodejs_get_gcc_version(d) <=3D "4.3.3"]}"
> +
>  SRC_URI[md5sum] =3D "18f89256751f9b8e27dee8494f508171"
>  SRC_URI[sha256sum] =3D
> "4a30bd9963373cb86a994479bdd451ab3b6f2124f0089493366315da79d3408e"
>=20
> --
> 1.7.0.4



