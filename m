Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE582F94CDF
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 07:57:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75176.1776844627822324394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 00:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LOXW1wtn;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso55212015e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776844626; x=1777449426; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2/DFXIzZERbxQuVx0VJB5p9RUV0CdHrLQMuJ1hWkVg=;
        b=LOXW1wtnRvs5bSE7rYIH4jMCv5p0c5Dqfq49Do+uPMLlLZANB0SFvyLxKqjDj82b7w
         XidlO8+5dYGhNoDqDPCpA5UU/ryaKWpmbNUvfw8rzSJFY9CFiC8rE5mjmcHU1/1or41w
         4kSLJlOZchPAbE1zqmgJy+6qW1iS9MG68RRXBeMT3Tx7bv7Q9yC+/0Av0P/azRDgw1y6
         XzP7WK8Rm2V71JomgFR4mmqjpj+hRyKvOCOqvWglG1dl63Dq+YfEqvShpaXGrRtgRMqX
         CDLWDIBoHpTeJ0PG9Ayl+UYSmbIGDsgzYZZ0AYdzl/TPmuq1p36gRD4Ay7CKe8R9k0e/
         +8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776844626; x=1777449426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2/DFXIzZERbxQuVx0VJB5p9RUV0CdHrLQMuJ1hWkVg=;
        b=SYr6DXKscVtNyZEMuFLNFZ+8CJVcQdFk/iRiK2WsPzh3XdmdCOokajIenfi2lmx0TP
         8mIvAWC+hJ6VrNrEVWIX0pGZhOi9mRZshvJ0I/ATmgftKUPPouMhDFnAxImZjm5eGoaP
         B3kLx1oSMfg+NEWECsiFxwtRhmGAJGMKmonX+e5JD8GwJWv2yOOBlVApEreZWbVaD/b5
         IWEqfUmq1R8oECnlmujXAr2A9xCwvC3MRJLVwIYrgEciyyD+eezw/beje9mvnD2V5zNv
         hWu/wwP99ZnwpOlhx6muMg6F54L3jbP9pnjK+aADzTGyEoUUE3PllFO7bVcSNcSq6Ct8
         U5HA==
X-Forwarded-Encrypted: i=1; AFNElJ96IDuVYNx98nMrzElqFM2pcMvICpGmX9SvvebEDoBuBk2mjEiqoyDDJLTLTYZz1zTCSWhLYbLjt0e8lmj0aCRl3kU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwnzCzlq3GWhWQOtkhONeIC/pidgDz0oMvSeCOOsSU85eM2sCr+
	JTox2QM0SQkxKlXjYyOHciJeV4FEPzanyC9LGGySLFB5MjgoWfq5VaY/
X-Gm-Gg: AeBDietIzZKnVIFK+5cRKlZ+Kdopw6qKwibJ4cjJagY+d1SPh/9lyCI71dG597fSOii
	fPgYwtsV+0CnuNHEKjT9CbtwvzEHSYNBow3sZWhVHfqN/4/IS+TaEeH8kVfxdlGBeS1h0Xd+WQV
	0yUKlccvwpTg6RQdMan42kAPsJKrESZ2fVAwAHGpwojnzvixFOfY2EUcUpREijow+GS8i/LXfE4
	RUWodLHLMaU1MNRRxARBoWsDmqbLFsjEJ1Hp5XBJsIrK79Ic4fpxsRM9Iofw7BPOI15UjmLUIiO
	qFxPupcnyqeqp4OgNxc0J+jf1rgn46498nA2yH1aYbNc2Em3aN+wp/0tc54FtlM5fZoldBR8CZI
	YcrYoUnLPvcAlbWTuFBfINs5ieIE0jYRxrkB60ls9Q7OXtdr/HLOc/eBzm5shyHs3UMyaX9FYoR
	21bA02YijQzYOTmpdsORYphvVn1szKlXItB2os5UIYEw==
X-Received: by 2002:a05:600c:1d05:b0:489:1baf:8c03 with SMTP id 5b1f17b1804b1-4891baf8d2cmr160818755e9.11.1776844625937;
        Wed, 22 Apr 2026 00:57:05 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm719900985e9.3.2026.04.22.00.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:57:05 -0700 (PDT)
Message-ID: <ab02ec5f-3569-41d4-b846-93a51c8002db@gmail.com>
Date: Wed, 22 Apr 2026 09:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gphoto2: Fix build with clang-22
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
References: <20260422013925.1791148-1-khem.raj@oss.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260422013925.1791148-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 07:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126542

On 4/22/26 03:39, Khem Raj via lists.openembedded.org wrote:
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>  ...hoto2-fix-const-qualifier-violations.patch | 73 +++++++++++++++++++
>  .../gphoto2/gphoto2_2.5.32.bb                 |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier-violations.patch
> 
> diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier-violations.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier-violations.patch
> new file mode 100644
> index 0000000000..a8f85d034c
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-fix-const-qualifier-violations.patch
> @@ -0,0 +1,73 @@
> +From 55edc241e9b61b14153c61fd0baaefac927ad89f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <khem.raj@oss.qualcomm.com>
> +Date: Tue, 21 Apr 2026 17:39:43 -0700
> +Subject: [PATCH] gphoto2: fix const qualifier violations
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +No logic is changed. The patch is a pure
> +type-correctness fix that makes the variable
> +declarations match the actual semantics —
> +const char * for pointers into string literals
> +or function parameters that must not be mutated,
> +and char * only for owned heap memory. This
> +satisfies Clang's strict qualifier checking without
> +needing any casts or warning suppressions.
> +
> +Fixes errors seen on clang with
> +  -Werror,-Wincompatible-pointer-types-discards-qualifiers
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> +---
> + gphoto2/main.c | 14 ++++++++------
> + 1 file changed, 8 insertions(+), 6 deletions(-)
> +
> +diff --git a/gphoto2/main.c b/gphoto2/main.c
> +index 5a3c5c1..086f9df 100644
> +--- a/gphoto2/main.c
> ++++ b/gphoto2/main.c
> +@@ -146,7 +146,8 @@ static int
> + get_path_for_file (const char *folder, const char *name, CameraFileType type, CameraFile *file, char **path)
> + {
> + 	unsigned int i, l;
> +-	char *s = NULL, b[1024];
> ++	const char *s = NULL;
> ++	char *p = NULL; char b[1024];
> + 	time_t t = 0;
> + 	struct tm *tm;
> + 	int hour12;
> +@@ -339,18 +340,18 @@ get_path_for_file (const char *folder, const char *name, CameraFileType type, Ca
> + 			b[1] = '\0';
> + 		}
> +
> +-		s = *path ? realloc (*path, strlen (*path) + strlen (b) + 1) :
> ++		p = *path ? realloc (*path, strlen (*path) + strlen (b) + 1) :
> + 			    malloc (strlen (b) + 1);
> +-		if (!s) {
> ++		if (!p) {
> + 			free (*path);
> + 			*path = NULL;
> + 			return (GP_ERROR_NO_MEMORY);
> + 		}
> + 		if (*path) {
> +-			*path = s;
> ++			*path = p;
> + 			strcat (*path, b);
> + 		} else {
> +-			*path = s;
> ++			*path = p;
> + 			strcpy (*path, b);
> + 		}
> + 	}


Is this enough? Variable s is still used a few lines later as an input
parameter, but now it has a different value than before this patch.
(Admittedly haven't looked deep enough to check if the difference is
significant)


> +@@ -696,7 +697,8 @@ dissolve_filename (
> + 	const char *folder, const char *filename,
> + 	char **newfolder, char **newfilename
> + ) {
> +-	char *nfolder, *s;
> ++	char *nfolder;
> ++	const char *s;
> +
> + 	s = strrchr (filename, '/');
> + 	if (!s) {
> diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
> index e5e7c6926f..dbd2b0e748 100644
> --- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
> +++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
> @@ -9,6 +9,7 @@ RDEPENDS:gphoto2 = "libgphoto2"
>  SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.bz2;name=gphoto2 \
>             file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
>             file://0001-configure-Filter-out-buildpaths-from-CC.patch \
> +           file://0001-gphoto2-fix-const-qualifier-violations.patch \
>  "
>  SRC_URI[gphoto2.sha256sum] = "4e379a0f12f72b49ee5ee2283ffd806b5d12d099939d75197a3f4bbc7f27a1a1"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126539): https://lists.openembedded.org/g/openembedded-devel/message/126539
> Mute This Topic: https://lists.openembedded.org/mt/118948760/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


