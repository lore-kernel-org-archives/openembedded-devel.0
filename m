Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAE1EEF311
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 07:13:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38927.1772694770333845261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 23:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBul8vLD;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483770e0b25so65003125e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 23:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772694769; x=1773299569; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AsoNGPcKyyaD8Tb+iYICm60/A7YkEwxU7pNdN6vvkA=;
        b=iBul8vLDOb4DYjN9XNLTacnkkEk6mimo47i4g5eR7n4q7RBa6aGpr0mSy/U5piWkIm
         pR0sc6sPxyjsc4ahtxmy8tE4vQBKwawGmsMEKrVAKa3ItPn9vQGxRoeGtboVk0DRCcQE
         a/HbEy76P4gijP4Le256GmNxnhOOxeLZ+2nXKKpcDtZTHP+aXlujdkVTS8NgMOv6ZJbR
         udcYyKxTWuN1O7tURkfiOugSSR0VCN9lns71i9Q8RrW22brQLxc/uNKg6fg1byGcuBJ8
         wRF9hraMGQMu5qTi5bOQtZR0hPIIL+dx6K6yB/11chB9qxLFwMSlvQziMbSF9H8G/Not
         qkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772694769; x=1773299569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3AsoNGPcKyyaD8Tb+iYICm60/A7YkEwxU7pNdN6vvkA=;
        b=HOAv+rSNobNWnkyJ3zH83onsPLVCvO8592ev6+8J6jsO+aaUNi2s/GDvc3R02Bum8b
         zVoI525q+tg8sqFBYUMp49cJJP3D3e/Br+jmskkYTmdb5Zhux+z/nIlrs8Ag67Ua6VGy
         GKEeI1+81OcHraXTqgGH7IG2O1jYxiZiGF+5iCvPYMsp0xS5jJ3BcZ4dITZexYUT/6PD
         zbvAeKAZEKKxJU5TGUNHYvDqugDmHz03C2MDy/MkL1D0WmFnd1hGivEzinpA6KqVfUaQ
         m3y6rxveoevBTqRF/g/nBdfcu/qxu0/CMAirnzqmwBL87Gexh/9V25J3ZdhJCmD3tmwH
         FrxQ==
X-Gm-Message-State: AOJu0YzKJf1StUlPG7xOk4x1Rhkky4Mwwfwed5pgezd3xxAzk7dUpBP5
	IzE9yziJQmjvuLE0uYUWNZpKrdTcKym6KkSOYln+7cNRV0hrnIBeTaz7HzGAUA==
X-Gm-Gg: ATEYQzwFXjmnT3hWT6Xs0+cSFJGUB4q0gm59FxcYQxV3HaEdpq3Hu8K2qJ6qVFgOnVP
	QSs/AuzUBzBnZqJjk4hSpnarHCw+EV31gNYhWJEOjXoCHb8+sDZk9KEPeoCQKywvFrSPNQOWUDt
	rorIHxxqULjdrmsMLwG+4A41pqrBi+2kgGXC1sI6s+9ThYgPLwH8OQbBIuDgW3Y0J023Lk9vf+s
	eY3/ILtYbEe23FFSJDHF/it9vZz35SSbV4orozJGBF1cV0+X4IE8/Cjq+K1K6jPxo2vk1huzT2R
	74U9Of6Ebqu2hsHGMsomznSTN0ss5hy/Ly+EyhAHFff0dXg1FjFAc46EJBvlAzwkYEtnjv5FOkd
	Qrt1ffLdNjJqwodUfir+igoi0P+GThjZ0Esg/07vBoN79ZmLHLUxszJAzGVaUllexfNkEBDwWmD
	hs5IL+abXMj0STBWju5bi6C6nXF6j1DsA=
X-Received: by 2002:a05:600c:8b54:b0:47e:e20e:bbb4 with SMTP id 5b1f17b1804b1-485198a38b2mr74624345e9.26.1772694768451;
        Wed, 04 Mar 2026 23:12:48 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a13sm20908625e9.11.2026.03.04.23.12.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:12:47 -0800 (PST)
Message-ID: <97830174-d0ba-424d-960f-5305260071e0@gmail.com>
Date: Thu, 5 Mar 2026 08:12:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] freerdp: upgrade 2.11.7 ->
 2.11.8
To: openembedded-devel@lists.openembedded.org
References: <20260304202418.2346652-1-skandigraun@gmail.com>
 <1899BD1D962C61B6.971272@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1899BD1D962C61B6.971272@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 07:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124862

Please ignore this patch.

While porting it to master I found some newly introduced funky
incompatible pointer assignments that fail the build. I'd rather not
fall into that rabbit hole at this time.

On 3/4/26 21:24, Gyorgy Sarvari via lists.openembedded.org wrote:
> Drop patch that is included in this release.
>
> Changelog: https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.8
>
> Backported #12319 bugfixes from 3.x
> Fix incompatible pointer type issues
> X11: fix pointer/integer type mismatch
> Warn backport
> [core] eliminate rdpRdp::instance
> X11 client: ignore grab related LeaveNotify events
> [winpr,pubsub] add NULL parameter checks
> fix: correct server port assignment logic
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../0001-Fixed-compilation-warnings.patch     | 27 -------------------
>  .../{freerdp_2.11.7.bb => freerdp_2.11.8.bb}  |  3 +--
>  2 files changed, 1 insertion(+), 29 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
>  rename meta-oe/recipes-support/freerdp/{freerdp_2.11.7.bb => freerdp_2.11.8.bb} (97%)
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
> deleted file mode 100644
> index 7fae2703f8..0000000000
> --- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 75fa1fa5bd5ef2350390564245fd0984209ac092 Mon Sep 17 00:00:00 2001
> -From: akallabeth <akallabeth@posteo.net>
> -Date: Mon, 4 Jul 2022 14:34:46 +0200
> -Subject: [PATCH] Fixed compilation warnings
> -
> -Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2da280b8a1748052b70b3f5a1ef0d8e932c33adc]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - client/X11/xf_graphics.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
> -index 5aa1fd48b..fe81e0ed9 100644
> ---- a/client/X11/xf_graphics.c
> -+++ b/client/X11/xf_graphics.c
> -@@ -438,7 +438,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
> - 
> - #endif
> - fail:
> --	WLog_DBG(TAG, "%s: %ld", __func__, rc ? pointer : -1);
> -+	WLog_DBG(TAG, "%s: %p", __func__, rc ? pointer : NULL);
> - 	return rc;
> - }
> - 
> --- 
> -2.45.0
> -
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
> similarity index 97%
> rename from meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> rename to meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
> index d51700c81b..9c3d532438 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
> @@ -13,10 +13,9 @@ inherit pkgconfig cmake gitpkgv
>  PE = "1"
>  PKGV = "${GITPKGVTAG}"
>  
> -SRCREV = "7f6cc93c21d7f0faad6daacca06f494f29ce882c"
> +SRCREV = "9b678b6d5a40ce01607d8c3b1b1416437c8416c4"
>  SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
>             file://winpr-makecert-Build-with-install-RPATH.patch \
> -           file://0001-Fixed-compilation-warnings.patch \
>             file://0001-Fix-const-qualifier-error.patch \
>             file://0002-Do-not-install-tools-a-CMake-targets.patch \
>             file://CVE-2024-32661.patch \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124856): https://lists.openembedded.org/g/openembedded-devel/message/124856
> Mute This Topic: https://lists.openembedded.org/mt/118140143/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


