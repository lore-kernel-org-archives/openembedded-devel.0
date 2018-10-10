Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52E3E762B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 00:06:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A063U2028330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Oct 2018 17:06:04 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 9 Oct 2018 17:06:03 -0700
To: Randy MacLeod <Randy.MacLeod@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20181008175050.8926-1-Randy.MacLeod@windriver.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <1e049125-6503-9361-d9d9-4ac0f6e43b3e@windriver.com>
Date: Wed, 10 Oct 2018 08:06:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181008175050.8926-1-Randy.MacLeod@windriver.com>
X-Originating-IP: [128.224.162.137]
Subject: Re: [meta-networking][PATCH] postfix: update to 3.3.1
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
X-List-Received-Date: Wed, 10 Oct 2018 00:06:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2018年10月09日 01:50, Randy MacLeod 写道:
> The patch:
>     0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch
> has ben integrated upstream.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   ...before-setting-CANT_USE_SEND_RECV_MS.patch | 26 -------------------
>   .../recipes-daemons/postfix/postfix_3.2.6.bb  | 11 --------
>   .../recipes-daemons/postfix/postfix_3.3.1.bb  | 11 ++++++++
>   3 files changed, 11 insertions(+), 37 deletions(-)
>   delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch
>   delete mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb
>   create mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
>
> diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch b/meta-networking/recipes-daemons/postfix/files/0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch
> deleted file mode 100644
> index 6b86e3925..000000000
> --- a/meta-networking/recipes-daemons/postfix/files/0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 63619acf25151d4dade6d65732722ec4a710a5ac Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 15 Jul 2017 09:54:25 -0700
> -Subject: [PATCH] Check for glibc before setting CANT_USE_SEND_RECV_MSG
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/util/sys_defs.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
> -index f720e2a..7314c63 100644
> ---- a/src/util/sys_defs.h
> -+++ b/src/util/sys_defs.h
> -@@ -813,7 +813,7 @@ extern int initgroups(const char *, int);
> - #define KERNEL_VERSION(a,b,c) (LINUX_VERSION_CODE + 1)
> - #endif
> - #if (LINUX_VERSION_CODE < KERNEL_VERSION(2,2,0)) \
> --	|| (__GLIBC__ < 2)
> -+	|| (defined(__GLIBC__) && (__GLIBC__ < 2))
> - #define CANT_USE_SEND_RECV_MSG
> - #define DEF_SMTP_CACHE_DEMAND	0
> - #else
> ---
> -2.13.3
> -
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb b/meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb
> deleted file mode 100644
> index 12144671b..000000000
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require postfix.inc
> -
> -SRC_URI += "file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch \
> -            file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
> -            file://postfix-install.patch \
> -            file://icu-config.patch \
> -           "
> -SRC_URI[md5sum] = "d10f1fb551be86f6e48c2908dd8a12ff"
> -SRC_URI[sha256sum] = "1df036380bae7c356bfa8989a87de58033b6aaa09b3bafcfa36c3694dd449039"
> -
> -UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.2(\.\d+)+).tar.gz"
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
> new file mode 100644
> index 000000000..7f00c3c19
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
> @@ -0,0 +1,11 @@
> +require postfix.inc
> +
> +SRC_URI += "file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
> +            file://postfix-install.patch \
> +            file://icu-config.patch \
> +           "
> +
> +SRC_URI[md5sum] = "4381c6492f415e4a69cf5099d4acea76"
> +SRC_URI[sha256sum] = "54f514dae42b5275cb4bc9c69283f16c06200b71813d0bb696568c4ba7ae7e3b"
> +
> +UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.2(\.\d+)+).tar.gz"

Please also update UPSTREAM_CHECK_REGEX from 3\.2 to 3\.3 to check 3.3 
series.

Thanks,
Yi



