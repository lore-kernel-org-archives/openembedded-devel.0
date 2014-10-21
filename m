Return-Path: <net147@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9D30D60672
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 04:24:00 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id e89so289060qgf.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 21:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xnj00fTVWlwIN6QL4+2/9Tti6n4OriJ0ToJq91WZdgc=;
	b=fKp0NeTOkk0MDOgpF1adb8u5KN8qKB/g6aakDQ+MkpIou9J2dWMALIPhZb+2dZe2D1
	p0VdIdGHT0+g1dboGD7WdHR/LMx2797qoQbLv9sAWILAzgmPf4iDcE9EQQ0rFabkWJ4s
	9PkAELEpoCDK4fp8ReGh4Dkz9YoG+yUCjshw+Sgc8c7qNO/o2NBWuAx7Duia7M2ltvPa
	TdGvHkW5M1ecRA2klfQdPVDCl/PQH5SvNvh94Cc0DnvpETMvA8Zc9gqYw7wXyOhlQ1ok
	6lCYlN++mKzzOHLJnrPr4m/pXFWfWB5o84stWQEdxhhbR5MXcRirURjtP8ViZpWE3XO4
	MrOQ==
MIME-Version: 1.0
X-Received: by 10.224.75.7 with SMTP id w7mr42843686qaj.26.1413865440271; Mon,
	20 Oct 2014 21:24:00 -0700 (PDT)
Received: by 10.96.4.133 with HTTP; Mon, 20 Oct 2014 21:24:00 -0700 (PDT)
In-Reply-To: <1413826432-483-5-git-send-email-Martin.Jansa@gmail.com>
References: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
	<1413826432-483-5-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 21 Oct 2014 15:24:00 +1100
Message-ID: <CANwerB06tRTvSn_+_DiL7Q+ZSixRmpYvQGVgTQ=Ac+jSdg7UCQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][WIP][PATCH 5/5] qtwebengine: backport patches to fix ARM build failures
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
X-List-Received-Date: Tue, 21 Oct 2014 04:24:08 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On 21 October 2014 04:33, Martin Jansa <martin.jansa@gmail.com> wrote:
> diff --git a/recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch b/recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch
> new file mode 100644
> index 0000000..a3842ec
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch
> @@ -0,0 +1,34 @@
> +From c99aed6ef28c4ac9c00024a40222331c0e682d28 Mon Sep 17 00:00:00 2001
> +From: Andras Becsi <andras.becsi@digia.com>
> +Date: Thu, 18 Sep 2014 18:22:37 +0200
> +Subject: [PATCH 4/6] Set arm_tune to empty string if mtune flag is not set by
> + toolchain
> +
> +Since the default arm_tune option applied by chromium is not
> +recognized by our gcc toolchain set arm_tune to empty string
> +to prevent chromium from setting a default. Our toolchains
> +set the arm version which already implies the corresponding
> +mtune option anyway.
Missing Upstream-Status: Backport.

> +
> +Change-Id: I0291bd4f0e5706597d37f914e4eeefbd75397bbf
> +Reviewed-by: Jocelyn Turcotte <jocelyn.turcotte@digia.com>
Missing Signed-off-by.

> +---
> + src/core/gyp_run.pro | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/core/gyp_run.pro b/src/core/gyp_run.pro
> +index ed592e1..4845af2 100644
> +--- a/src/core/gyp_run.pro
> ++++ b/src/core/gyp_run.pro
> +@@ -47,7 +47,7 @@ cross_compile {
> +         !isEmpty(MARCH): GYP_ARGS += "-D arm_arch=\"$$MARCH\""
> +
> +         MTUNE = $$extractCFlag("-mtune=.*")
> +-        !isEmpty(MTUNE): GYP_ARGS += "-D arm_tune=\"$$MTUNE\""
> ++        GYP_ARGS += "-D arm_tune=\"$$MTUNE\""
> +
> +         MFLOAT = $$extractCFlag("-mfloat-abi=.*")
> +         !isEmpty(MFLOAT): GYP_ARGS += "-D arm_float_abi=\"$$MFLOAT\""
> +--
> +2.1.1
> +

Regards,
Jonathan

