Return-Path: <Zhiquan.Li@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id A7F6B755F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 09:54:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9R9s8d7013575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 27 Oct 2015 02:54:08 -0700
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.104]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Tue, 27 Oct 2015 02:54:08 -0700
From: "Li, Zhiquan" <Zhiquan.Li@windriver.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Thread-Topic: [oe] [PATCH 1/1] snort: fix m4 causes out of memory during
	configure [ LIN8-299 ]
Thread-Index: AQHRD9v8XatDemBBvECZ5HMpKeDOIZ5/GR0m
Date: Tue, 27 Oct 2015 09:54:07 +0000
Message-ID: <689881552969744788D482C9A8FAED214EBAA9@ALA-MBB.corp.ad.wrs.com>
References: <1445594855-39110-1-git-send-email-zhiquan.li@windriver.com>
	<1445594855-39110-2-git-send-email-zhiquan.li@windriver.com>,
	<20151026124914.2854e87e@adi-pc-linux>
In-Reply-To: <20151026124914.2854e87e@adi-pc-linux>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.228]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] snort: fix m4 causes out of memory during configure [ LIN8-299 ]
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
X-List-Received-Date: Tue, 27 Oct 2015 09:54:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I need to evaluate the possibility to upgrade the snort recipe to >2.9.7, b=
ecause upgrade to > 2.9.7, some patches will not work anymore and the daq r=
ecipe also need to be upgraded to 2.0.4 at least. The side-effect is uncert=
ainty.
________________________________________
From: Ioan-Adrian Ratiu [adrian.ratiu@ni.com]
Sent: Monday, October 26, 2015 6:49 PM
To: Li, Zhiquan
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH 1/1] snort: fix m4 causes out of memory during con=
figure [ LIN8-299 ]

On Fri, 23 Oct 2015 18:07:35 +0800
Zhiquan Li <zhiquan.li@windriver.com> wrote:

> Issue: LIN8-299
>
> There is an incorrect m4_define() in configure.in which will result in an
> infinite recursion, and it doesn't make sense, since snort 2.9.7 it has b=
een
> commented out. We follow this solution to fix it.
>
> Upstream-Status: Backport
>
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151023
>
> Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
> ---
>  .../snort/snort/m4-oom-during-configure.patch       | 21 +++++++++++++++=
++++++
>  .../recipes-connectivity/snort/snort_2.9.6.0.bb     | 16 +++------------=
-
>  2 files changed, 24 insertions(+), 13 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/snort/snort/m4-o=
om-during-configure.patch
>
> diff --git a/meta-networking/recipes-connectivity/snort/snort/m4-oom-duri=
ng-configure.patch b/meta-networking/recipes-connectivity/snort/snort/m4-oo=
m-during-configure.patch
> new file mode 100644
> index 0000000..2250611
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-conf=
igure.patch
> @@ -0,0 +1,21 @@
> +Upstream-Status: Backport
> +
> +There is an incorrect m4_define() in configure.in which will result in a=
n
> +infinite recursion, and it doesn't make sense, since snort 2.9.7 it has =
been
> +commented out. We follow this solution to fix it.
> +

Doesn't it make more sense to upgrade the snort recipe to >2.9.7 than
backporting this fix?

> +Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
> +
> +--- a/configure.in   2015-10-22 13:58:50.743367251 +0800
> ++++ b/configure.in   2015-10-22 13:59:13.855366117 +0800
> +@@ -1100,8 +1100,8 @@
> + # Define PKG_CHECK_MODULES if it doesnt already exist.
> + #file_ This prevents './configure' from erroring on machines that dont =
have
> + # 'pkgconfig' installed.
> +-m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES],
> +-     [echo "PKG_CHECK_MODULES not defined"])])
> ++#m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES],
> ++#     [echo "PKG_CHECK_MODULES not defined"])])
> +
> + if test "x$enable_rzb_saac" =3D "xyes"; then
> +     AC_CHECK_PROG(PKG_CONFIG,pkg-config,yes)
> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb =
b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> index 66653c6..65dc524 100644
> --- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> @@ -6,19 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D78fa8ef966b48=
fbf9095e13cc92377c5"
>
>  DEPENDS =3D "libpcap libpcre daq libdnet util-linux"
>
> -# Blacklist:
> -#
> -# http://errors.yoctoproject.org/Errors/Details/8936/
> -#
> -# snort failure is again very nasty, because it's m4 which eats all
> -# available memory and swap before it's killed by OOM killer.
> -#
> -# Luckily it always picked m4
> -#
> -# [Wed Feb 18 19:00:51 2015] Out of memory: Kill process 28522 (m4) scor=
e 961 or sacrifice child
> -# [Wed Feb 18 19:10:51 2015] Out of memory: Kill process 45228 (m4) scor=
e 958 or sacrifice child
> -# ...
> -PNBLACKLIST[snort] ?=3D "BROKEN: autotools processing causes OOM conditi=
on on configure"
>
>  SRC_URI =3D " ${GENTOO_MIRROR}/${BP}.tar.gz;name=3Dtarball \
>              file://snort.init \
> @@ -26,6 +13,7 @@ SRC_URI =3D " ${GENTOO_MIRROR}/${BP}.tar.gz;name=3Dtarb=
all \
>              file://disable-dap-address-space-id.patch \
>              file://0001-libpcap-search-sysroot-for-headers.patch \
>              file://not-hardcoded-libdir.patch \
> +            file://m4-oom-during-configure.patch \
>  "
>
>  SRC_URI[tarball.md5sum] =3D "18111f6de3989ca89add36077a7c2659"
> @@ -45,6 +33,8 @@ EXTRA_OECONF =3D " \
>       --disable-static-daq \
>       --with-dnet-includes=3D${STAGING_INCDIR} \
>       --with-dnet-libraries=3D${STAGING_LIBDIR} \
> +     --with-libpcre-includes=3D${STAGING_INCDIR} \
> +     --with-libpcre-libraries=3D${STAGING_INCDIR} \
>       "
>
>  # if you want to disable it, you need to patch configure.in first


