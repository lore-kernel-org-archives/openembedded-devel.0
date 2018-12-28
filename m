Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id A8D296C4AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 06:51:33 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id v11so22596672qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 22:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DpK79lyBYMapIpHcsvMBjzmyApAT9YRqjDViW6NOHaA=;
	b=OyoTd4zEDXifp8TYyK/EqgY5cIqTIXzlwUZApYFSBTE6rjAe0tfDxy2bERd8ah3wfO
	MVJZpDnmKjuiJsdMyvul1I6UlIIcw6grLb+jVO8xXAL6bj4AySjoRfjhU+WJSdwzVHD9
	nCr3xtBs7dz3wf8sOwt2F5QhSZZHVw1BXLcQLvgoziRshyxmhI+xxY7WNt6Q6Dnw58Uj
	uz95jkrAcXKF8C+IHc75FoNtAL/Di6OdgYIBHJFD3qcN2tnlhROhGYd4b3679ePgMS9N
	AR0wAGEj9sn1k2SLUSu1LTpQFGm3E3+terCI0pcwXwKa5q4NsJIvkXYfzNoRewK7BJja
	zDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DpK79lyBYMapIpHcsvMBjzmyApAT9YRqjDViW6NOHaA=;
	b=S1FCIHxAyLVscMATdITgFrTeFkrjxcegSteb2dk/z9uAGKYu0OiFs5fUNENrgQ3on9
	FB+6nYUeaQSL+gqc2TrhdJlTQFvRTDZizQ2+Pvtsn7QGNPq+oXDlJHcwARPA2mRzeoO7
	bp8K8i56bORWX92gvjEExAtBt+D6N0Z5JKbp2G+T6OWM4DYgKfNhYK+lo94DnVrLchFg
	DP1x+xT828enUYSE9HSdKnsO3EPDryLnJu/EffRT1PccWbS9WO550hhUVbDu4ibO+/Gh
	+QxV6zjiBKL4enL+d0qMHBOIfq/LruznYsESUahtaQ3Xi3WxctwmntOrY8OLsQF1Zaik
	2/lQ==
X-Gm-Message-State: AJcUuke2oQye0f1YiiPiOLnsHtGw3m9oyuss8zZ0iEPGvJenN0K8Wyur
	B/d98BoDdqgDZjI95y3dnabUGPHX+hqaSNkekU8=
X-Google-Smtp-Source: AFSGD/VJYKaDCPZ3g4zS+O+UvEJDI4o5BEamkK2tIRqfKISysuAih4tSxOJmIO+8cD+3iVIFLYo/MTgLonzICm1m+ZU=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr24804321qtf.196.1545979894211;
	Thu, 27 Dec 2018 22:51:34 -0800 (PST)
MIME-Version: 1.0
References: <1545978520-30261-1-git-send-email-athoik@gmail.com>
In-Reply-To: <1545978520-30261-1-git-send-email-athoik@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Dec 2018 22:51:08 -0800
Message-ID: <CAMKF1spWKvTezgKLyEs6m=tY_GcXA6fz_E-LN6fvQCZc0evtOg@mail.gmail.com>
To: Athanasios Oikonomou <athoik@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] faac: update 1.29 -> 1.29.9.2
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
X-List-Received-Date: Fri, 28 Dec 2018 06:51:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 27, 2018 at 10:32 PM Athanasios Oikonomou <athoik@gmail.com> wrote:
>
> Remove not required patch and extra EXTRA_OECONF "--without-mp4v2".

have you build tested this patch on a musl platform ?
if not please try one and report back.

> Previously not required mp4v2 library was dropped on 1.29.9.2.
>
> While being there also fix issue with multilib build on aarch64
> using FILES_lib${BPN} instead of FILES_lib${PN}.
>
> WARNING: lib32-faac-1.29.9.2-r0 do_package: QA Issue: lib32-faac: Files/directories were installed but not shipped in any package:
>   /usr/lib/libfaac.so.0
>   /usr/lib/libfaac.so.0.0.0
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> lib32-faac: 2 installed and not shipped files. [installed-vs-shipped]
>
> Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
> ---
>  .../faac/{faac_1.29.bb => faac_1.29.9.2.bb}        | 14 ++++-------
>  ...Define-__STRING-if-cdefs.h-does-not-exist.patch | 28 ----------------------
>  2 files changed, 4 insertions(+), 38 deletions(-)
>  rename meta-multimedia/recipes-multimedia/faac/{faac_1.29.bb => faac_1.29.9.2.bb} (56%)
>  delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> similarity index 56%
> rename from meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> rename to meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> index d36f2f4..4fc1121 100644
> --- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
> +++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
> @@ -1,29 +1,23 @@
>  SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
>  SECTION = "libs"
>  LICENSE = "LGPLv2+"
> -HOMEPAGE = "http://www.audiocoding.com/faac.html"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>                      file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
>
> -LICENSE_FLAGS = "commercial"
> -
>  inherit autotools
>
>  SRC_URI = " \
>      ${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
> -    file://0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch \
>  "
>
> -SRC_URI[md5sum] = "78603720f655180059d6970c582a3005"
> -SRC_URI[sha256sum] = "8cc7b03ceb2722223a6457e95d4c994731d80214a03ba33d1af76ba53f4b3197"
> -
> -EXTRA_OECONF += "--without-mp4v2"
> +SRC_URI[md5sum] = "2b58d621fad8fda879f07b7cad8bfe10"
> +SRC_URI[sha256sum] = "d45f209d837c49dae6deebcdd87b8cc3b04ea290880358faecf5e7737740c771"
>
>  PACKAGES =+ "lib${BPN} lib${BPN}-dev"
>
>  FILES_${PN} = " ${bindir}/faac "
> -FILES_lib${PN} = " ${libdir}/*.so.*"
> -FILES_lib${PN}-dev = " \
> +FILES_lib${BPN} = " ${libdir}/*.so.*"
> +FILES_lib${BPN}-dev = " \
>      ${includedir} \
>      ${libdir}/*.so \
>      ${libdir}/*.la \
> diff --git a/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch b/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
> deleted file mode 100644
> index d845ddf..0000000
> --- a/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 46cc9298c38b9dd735fec3f39aa2d6e56a362410 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 28 Mar 2017 21:33:36 -0700
> -Subject: [PATCH 2/2] mp4v2: Define __STRING if cdefs.h does not exist
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - common/mp4v2/mp4util.h | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/common/mp4v2/mp4util.h b/common/mp4v2/mp4util.h
> -index 1f9cb64..1e7aced 100644
> ---- a/common/mp4v2/mp4util.h
> -+++ b/common/mp4v2/mp4util.h
> -@@ -23,6 +23,10 @@
> - #define __MP4_UTIL_INCLUDED__
> - #include <assert.h>
> -
> -+#ifndef __STRING
> -+#define __STRING(x)     #x
> -+#endif
> -+
> - #ifndef ASSERT
> - #define ASSERT(expr) \
> -       if (!(expr)) { \
> ---
> -2.12.1
> -
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

