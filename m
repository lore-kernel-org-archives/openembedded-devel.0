Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id A28707FA38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:24:11 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u184so435353qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 14:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TDjJt2DOj+TZL8mqaOSD2l+S8/SIA+Pf7IMuf5ZWZd4=;
	b=MGbvJRHH7CL89lC+Nvf4+wPmazvX4EKWwh4L6TDXTiWt9wc422KlKgwynUcY03F6He
	DZW4EQYeZFGDRsM4HiJgY7lO3pn3AfaMTwJH8Oqt7/qnf5PsfIY7S/2NSbJcVlDP4Ruf
	8XfqaKifthjEM+KriAl+OIDn7WVnoXhSAIoNVy5FU7VGhihATLat7yNdC54eynV9KvKC
	uCwpb/Nu4NYd5JHlav9hEkdkke4/0MvatVj3DSF4MtqAN2JTIX3Fz7cHEiYAJVOim1Jm
	pJOOB4Isk6POdNltUqsQczuiBud9CqAHJbomQKFjG9mTysYYUlz5DYoDr8tuwCRn+PQ/
	VREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TDjJt2DOj+TZL8mqaOSD2l+S8/SIA+Pf7IMuf5ZWZd4=;
	b=dtKAkS9cUcGq6dLksdcb0UYbTrgEOUsrua4F7J3nvwshu7chu87wD08Y/2P33uIRTV
	4C35zpeRyEx8O/Afqv3Yrs2DUVO8j/rDt0kyirwWz4t3oxK2vTDD6+rmzcv/NLB8nnDZ
	zAlzPglpSWPSMv0XnD+AtIAJkOH7pDD9OmTYWnBYAXdRn15DutXdCHHpYD2MrjPHLi2t
	rFzlSXGlNx/pXmymSxg/LIriJXfP2qt/8hsA6GgtfLLrziWyoOgFdSQqEVRdasEL1jZV
	P9IBFZMdIvqOnGhDXn7FQI0ib1oCou1ogy7VUWb+VNv5ks0fqXVTXW0MuOn19Lh+dGPa
	BFig==
X-Gm-Message-State: APjAAAWKGqWhOufR51lBO2eTPH6Q7It8xE1Iv1N7BlGyKvPgkFwXGMIg
	5kbngdQtT5Er/ffErURCaGeuKUvmkq1Gq17t1YW1Dch3m0pA/g==
X-Google-Smtp-Source: APXvYqx6DqlD2o2pdsj5SceU4IKAJ+GRf6wQ4M5/TARRcjKTGlP86o95sUclZdMav3LBVgKborUiwEYVr7I1GtjgjdA=
X-Received: by 2002:a37:6554:: with SMTP id z81mr24320339qkb.9.1572384252282; 
	Tue, 29 Oct 2019 14:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191029090657.30771-3-bunk@stusta.de>
In-Reply-To: <20191029090657.30771-3-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2019 22:23:46 +0100
Message-ID: <CAMKF1sqRRmqEaLMcYDrO-Ae8XcuDNqVJKVnutG4K4rfUp57GuA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] mdns: Mark as incompatible with musl
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
X-List-Received-Date: Tue, 29 Oct 2019 21:24:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 29, 2019 at 10:07 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> musl does not support mDNS or NSS plugins.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  ...Do-not-include-nss.h-when-libc-glibc.patch | 42 -------------------
>  .../recipes-protocols/mdns/mdns_878.200.35.bb |  3 +-
>  2 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch
>
> diff --git a/meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch b/meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch
> deleted file mode 100644
> index 863866d18..000000000
> --- a/meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From d3082d2c606c810aa0a39378bf1e02575af3a301 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 2 Feb 2018 21:54:11 -0800
> -Subject: [PATCH] nss_mdns: Do not include nss.h when libc != glibc
> -
> -Provide nss_status macro instead for non-glibc case
> -where nss.h is absent
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - mDNSPosix/nss_mdns.c | 13 ++++++++++++-
> - 1 file changed, 12 insertions(+), 1 deletion(-)
> -
> -diff --git a/mDNSPosix/nss_mdns.c b/mDNSPosix/nss_mdns.c
> -index afadb3c..c469584 100755
> ---- a/mDNSPosix/nss_mdns.c
> -+++ b/mDNSPosix/nss_mdns.c
> -@@ -378,8 +378,19 @@ init_config ();
> -
> - #define ENTNAME  hostent
> - #define DATABASE "hosts"
> --
> -+#ifdef __GLIBC__
> - #include <nss.h>
> -+#else
> -+enum nss_status
> -+{
> -+    NSS_STATUS_TRYAGAIN = -2,
> -+    NSS_STATUS_UNAVAIL,
> -+    NSS_STATUS_NOTFOUND,
> -+    NSS_STATUS_SUCCESS,
> -+    NSS_STATUS_RETURN
> -+};
> -+#define NETDB_INTERNAL NULL
> -+#endif
> - // For nss_status
> - #include <netdb.h>
> - // For hostent
> ---
> -2.16.1
> -
> diff --git a/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb b/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
> index 1bd17031a..1353b2bed 100644
> --- a/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
> +++ b/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
> @@ -4,12 +4,13 @@ HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://../LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
>
> +COMPATIBLE_HOST_libc-musl = 'null'
> +

this is fine but please adjust
meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
accordingly as well.

secondly, ntp also has a packageconfig for mdns its disabled by
default so not a big problem, but it will be good to error out if user
enabled it when using musl.

>  RPROVIDES_${PN} += "libdns_sd.so"
>
>  SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
>             file://build.patch;patchdir=.. \
>             file://mdns.service \
> -           file://0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch;patchdir=.. \
>             "
>  SRC_URI[md5sum] = "e773f290a7d29f1072247985d6add2ff"
>  SRC_URI[sha256sum] = "e777b4d7dbf5eb1552cb80090ad1ede319067ab6e45e3990d68aabf6e8b3f5a0"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

