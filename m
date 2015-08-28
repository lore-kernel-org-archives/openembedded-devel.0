Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B94476420
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:35:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="100121381"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2015 15:38:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7S7YpuC023002;
	Fri, 28 Aug 2015 15:34:52 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Fri, 28 Aug 2015 15:34:58 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-networking][PATCH] postfix: Add Linux 4.0 Support
Thread-Index: AQHQ3+jmwNov1aoEQ0q9rXPCjNtDz54hBmhA
Date: Fri, 28 Aug 2015 07:34:58 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8011BCBE1C2@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1440584445-1731-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1440584445-1731-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] postfix: Add Linux 4.0 Support
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
X-List-Received-Date: Fri, 28 Aug 2015 07:35:10 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, Martin,

Please remove this commit from master-next http://cgit.openembedded.org/met=
a-openembedded/commit/?h=3Dmaster-next&id=3D0de0c33eb5233f6aa673664570bd40c=
57c10d826 ,
Since I will upgrade postfix to 3.0.2, and this patch is not needed anymore=
.

Regards,
Li

>-----Original Message-----
>From: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
>Sent: Wednesday, August 26, 2015 6:21 PM
>To: openembedded-devel@lists.openembedded.org
>Cc: gyurco@freemail.hu; Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
>Subject: [oe][meta-networking][PATCH] postfix: Add Linux 4.0 Support
>
>Modify makedefs.patch to make it compilable on 4.0 kernel.
>
>Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>---
> .../recipes-daemons/postfix/files/makedefs.patch          | 15 ++++++++++=
-----
> 1 file changed, 10 insertions(+), 5 deletions(-)
>
>diff --git a/meta-networking/recipes-daemons/postfix/files/makedefs.patch
>b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
>index 98d5f7e..c537441 100644
>--- a/meta-networking/recipes-daemons/postfix/files/makedefs.patch
>+++ b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
>@@ -1,4 +1,4 @@
>-From 4f49e2ce420fb3c17415937530493158ef312733 Mon Sep 17 00:00:00 2001
>+From 44cb626e218bf68647994e94b598d5f45d473411 Mon Sep 17 00:00:00 2001
> From: Li xin <lixin.fnst@cn.fujitsu.com>
> Date: Fri, 19 Jun 2015 16:45:54 +0900
> Subject: [PATCH] 1)remove RANLIB, SYSLIBS, AR and get them from env.
>@@ -14,11 +14,11 @@ Upstreamstatus: Inappropriate [embedded specific]
>
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>- makedefs | 27 +++++++++++----------------
>- 1 file changed, 11 insertions(+), 16 deletions(-)
>+ makedefs | 29 ++++++++++++-----------------
>+ 1 file changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/makedefs b/makedefs
>-index 8b84e47..893fb0d 100644
>+index 8b84e47..5c12206 100644
> --- a/makedefs
> +++ b/makedefs
> @@ -170,9 +170,6 @@ echo "# pie=3D$pie"
>@@ -80,7 +80,12 @@ index 8b84e47..893fb0d 100644
>  			   rm -f makedefs.test makedefs.test.[co]
>  		       fi;;
>  		esac
>-@@ -504,12 +499,12 @@ EOF
>+@@ -500,16 +495,16 @@ EOF
>+ 		: ${SHLIB_ENV=3D"LD_LIBRARY_PATH=3D`pwd`/lib"}
>+ 		: ${PLUGIN_LD=3D"${CC-gcc} -shared"}
>+ 		;;
>+-    Linux.3*)	SYSTYPE=3DLINUX3
>++    Linux.3*|Linux.4*) SYSTYPE=3DLINUX3
>  		case "$CCARGS" in
>  		 *-DNO_DB*) ;;
>  		 *-DHAS_DB*) ;;
>--
>1.8.4.2


