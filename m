Return-Path: <ian.ray@ge.com>
X-Greylist: delayed 2369 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Oct 2015 11:54:07 UTC
Received: from mx0b-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6922375E2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 11:54:07 +0000 (UTC)
Received: from pps.filterd (m0048205.ppops.net [127.0.0.1])
	by m0048205.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	t9KBCW2M032121 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 07:14:38 -0400
Received: from alpmlip10.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.5.1] (may be forged))
	by m0048205.ppops.net-00176a03. with ESMTP id 1xkhk5ue0a-32
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 07:14:38 -0400
Received: from unknown (HELO CINMBHT01.e2k.ad.ge.com) ([3.159.212.194])
	by alpmlip10.e2k.ad.ge.com with ESMTP/TLS/AES128-SHA;
	20 Oct 2015 07:14:29 -0400
Received: from ALPURTP02.e2k.ad.ge.com (3.159.16.201) by
	CINMBHT01.e2k.ad.ge.com (3.159.212.194) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 20 Oct 2015 07:14:29 -0400
Received: from BUDURLND15.e2k.ad.ge.com (3.159.54.83) by
	ALPURTP02.e2k.ad.ge.com (3.159.16.201) with Microsoft SMTP Server (TLS)
	id 14.3.224.2; Tue, 20 Oct 2015 07:14:29 -0400
Received: from BUDURBPA11.e2k.ad.ge.com ([169.254.5.190]) by
	BUDURLND15.e2k.ad.ge.com ([169.254.9.171]) with mapi id 14.03.0224.002;
	Tue, 20 Oct 2015 13:14:27 +0200
From: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 1/4] rrdtool: fix useless-rpath QA issue
Thread-Index: AdELJ0aSHRf0k+SASrS2uH/GNykWdwAAA5qA
Date: Tue, 20 Oct 2015 11:14:26 +0000
Message-ID: <30E719D66AEA914CBB7DAB303B1C722D17E67F@BUDURBPA11.e2k.ad.ge.com>
References: <30E719D66AEA914CBB7DAB303B1C722D17E664@BUDURBPA11.e2k.ad.ge.com>
In-Reply-To: <30E719D66AEA914CBB7DAB303B1C722D17E664@BUDURBPA11.e2k.ad.ge.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [3.159.54.224]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-20_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310000
	definitions=main-1510200188
Subject: Re: [meta-oe][PATCH 1/4] rrdtool: fix useless-rpath QA issue
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
X-List-Received-Date: Tue, 20 Oct 2015 11:54:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

> Signed-off-by: Chen Qi <Qi.Chen at windriver.com>
> ---
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-
> oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> index 91a30cf..f2ded65 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> @@ -71,7 +71,6 @@ do_configure() {
>      PYTHON_INCLUDES=3D"-I=3D/usr/include/python${PYTHON_BASEVERSION}"'
> \
>          ${S}/m4/acinclude.m4
>      #remove the hardcoded $(libdir) rpath
> -    sed -i -e 's|--rpath=3D$(libdir)||g' ${S}/bindings/Makefile.am

I tested locally a simpler patch:

@@ -71,7 +71,7 @@ do_configure() {
     PYTHON_INCLUDES=3D"-I=3D/usr/include/python${PYTHON_BASEVERSION}"' \
         ${S}/m4/acinclude.m4
     #remove the hardcoded $(libdir) rpath
-    sed -i -e 's|--rpath=3D$(libdir)||g' ${S}/bindings/Makefile.am
+    sed -i -e 's|LD_RUN_PATH=3D$(libdir)||g' ${S}/bindings/Makefile.am


> @@ -100,6 +99,11 @@ do_configure() {
>          ${B}/examples/*.pl
>  }
>=20
> +do_compile_append() {
> +    # Remove useless rpath
> +    find ${B}/bindings/python/build -name "rrdtool.so" | xargs chrpath -=
d
> +}

This fails for me since chrpath is not built for multilib.



