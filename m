Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75501793B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 13:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7BDD9184D9;
	Fri, 24 Aug 2018 15:43:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id upL9QiflWsEl; Fri, 24 Aug 2018 15:43:36 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 15DBB184A9;
	Fri, 24 Aug 2018 15:43:36 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F13581A06D;
	Fri, 24 Aug 2018 15:43:35 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E60C91A06B;
	Fri, 24 Aug 2018 15:43:35 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 24 Aug 2018 15:43:35 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id DA47A1F6D;
	Fri, 24 Aug 2018 15:43:35 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 24 Aug 2018 15:43:35 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 24 Aug 2018 15:43:35 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "mingli.yu@windriver.com" <mingli.yu@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] lmbench: fix usrmerge install path
Thread-Index: AQHUO4xT5ECkL6LwrUeDm1+WLFT/uqTO3y7Q
Date: Fri, 24 Aug 2018 13:43:35 +0000
Message-ID: <21952e8e816346f2b5604a2daa93c9ff@XBOX02.axis.com>
References: <1535102689-9093-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1535102689-9093-1-git-send-email-mingli.yu@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH] lmbench: fix usrmerge install path
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
X-List-Received-Date: Fri, 24 Aug 2018 13:43:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of
> mingli.yu@windriver.com
> Sent: den 24 augusti 2018 11:25
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] lmbench: fix usrmerge install path
>=20
> From: Mingli Yu <Mingli.Yu@windriver.com>
>=20
> Update $(base_libdir) to $(baselib) to fix
> the below do_install error when usrmerge
> enabled in DISTRO_FEATURES.
>=20
> | if [ ! -d /poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-
> a9-r2/image/usr/usr/lib64 ]; then mkdir
> /poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-a9-
> r2/image/usr/usr/lib64; fi
> | mkdir: cannot create directory /poky-build/tmp-glibc/work/core2-64-
> wrs-linux/lmbench/3.0-a9-r2/image/usr/usr/lib64 No such file or
> directory
> | Makefile:141: recipe for target 'install-target' failed
> | make[1]: *** [install-target] Error 1
>=20
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 593b62f..c78e7a8 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -51,8 +51,13 @@ do_compile () {
>      install -d ${S}/bin/${TARGET_SYS}
>      oe_runmake -C src
>  }
> +export baselib
>=20
>  do_install () {
> +    # fix the lib path when usrmerge enabled
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'fals=
e', d)}; then
> +        sed -i -e "s;\$(BASE)\$(base_libdir);\$(BASE)/\$(baselib);g" ${S=
}/src/Makefile

The use of $(base_libdir) in the src/Makefile is introduced via an=20
OE patch, "use-base_libdir-instead-of-hardcoded-lib.patch", and it=20
Would be better to change that directly instead. There you should=20
change "$(BASE)$(base_libdir)" to "$(DESTDIR)$(libdir)" while=20
adding DESTDIR=3D"${D}" to the oe_runmake install line in the=20
recipe and things should end up where we want them.

While at it you may as well correct the patch to install libmbench.a=20
with its correct name again (currently it is installed as lmbench.a=20
due to a mistake in the patch).

Oh, and the Upstream-Status tag in the patch is wrong as well (it is=20
missing the dash in Upstream-Status)...

As an alternative to the above, and this is what I would recommend,=20
you can drop the patch and instead add the following after the call=20
to oe_runmake in do_install:

    if [ "${prefix}/lib" !=3D "${libdir}" ]; then
        mv ${D}${prefix}/lib ${D}${libdir}
    fi

> +    fi
>      install -d ${D}${sysconfdir}/default/volatiles \
>             ${D}${bindir} ${D}${mandir} ${D}${libdir}/lmbench \
>             ${D}${datadir}/lmbench/scripts
> --
> 2.7.4

//Peter


