Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF0F7C704
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 01:22:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x261MEcB018464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Mar 2019 17:22:15 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.68]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0439.000;
	Tue, 5 Mar 2019 17:22:14 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 1/1] leveldb: restrict building for mips64
Thread-Index: AQHU0uUy3Rv/aJuOdEmvkYPVmSdzLqX82M2AgAD2t2Q=
Date: Wed, 6 Mar 2019 01:22:14 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F37689AF@ALA-MBD.corp.ad.wrs.com>
References: <20190304235132.188006-1-joe.slater@windriver.com>,
	<CAMKF1sprjLL91SRCRZTueo5WY6f1+qwJwyn_x8Y53oW0sgU_Vg@mail.gmail.com>
In-Reply-To: <CAMKF1sprjLL91SRCRZTueo5WY6f1+qwJwyn_x8Y53oW0sgU_Vg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.119.22]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] leveldb: restrict building for mips64
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
X-List-Received-Date: Wed, 06 Mar 2019 01:22:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, it only fails for multilib.  An unaupported instruction ("sync").  Kai=
 Kang is sending a different patch, that is, I assume it is different.=0A=
=0A=
Joe=0A=
________________________________________=0A=
From: Khem Raj [raj.khem@gmail.com]=0A=
Sent: Monday, March 04, 2019 6:36 PM=0A=
To: Slater, Joseph=0A=
Cc: openembeded-devel=0A=
Subject: Re: [oe] [meta-oe][PATCH 1/1] leveldb: restrict building for mips6=
4=0A=
=0A=
On Mon, Mar 4, 2019 at 3:51 PM Joe Slater <joe.slater@windriver.com> wrote:=
=0A=
>=0A=
> Do not try to build lib32-leveldb.  libn32-leveldb will build.=0A=
>=0A=
> Signed-off-by: Joe Slater <joe.slater@windriver.com>=0A=
> ---=0A=
>  meta-oe/recipes-dbs/leveldb/leveldb_git.bb | 4 ++++=0A=
>  1 file changed, 4 insertions(+)=0A=
>=0A=
> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb b/meta-oe/recipes=
-dbs/leveldb/leveldb_git.bb=0A=
> index 8fec89c..908ad3e 100644=0A=
> --- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb=0A=
> +++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb=0A=
> @@ -35,3 +35,7 @@ do_install() {=0A=
>=0A=
>  PACKAGES =3D+ "${PN}-ptest"=0A=
>  FILES_${PN}-ptest =3D "${bindir}"=0A=
> +=0A=
> +# Do not try to build lib32-leveldb for mips64, but allow libn32-leveldb=
.=0A=
> +#=0A=
> +COMPATIBLE_HOST_mipsarcho32_pn-lib32-leveldb =3D "null"=0A=
=0A=
does it fail just in multilib situation ?=0A=
=0A=
> --=0A=
> 2.7.4=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=

