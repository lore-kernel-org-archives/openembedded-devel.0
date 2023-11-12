Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED776C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 23:03:24 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.25513.1699830201836587444
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 15:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DxEGxnOO;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1efabc436e4so2442015fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 15:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699830201; x=1700435001; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fYhrCB5TTjOTtid02dZqyCvpvcpSkFI5VRLPnt3EYI=;
        b=DxEGxnOOlZqGhbnay/HB6sF2L3DlTPR5mRHtPO9pVM+HWTwekAmzORddOeo3n+m+sG
         4zhkco0rwoaxdDmmq0nWYbpUzYQInkbttT745fkkt5iVyA5fDSr7KWsYaSL6FQZd9Xh8
         pXVpUbP2sUwXf4owADDwwdM+sboDjas47He3pDQoiQBx246RWYNV6DvK5UvP+Y7r9vKP
         ipDCZR0eDbiDL/2S2RFIhj6X1QjBQ3fCKu/Pg0g+mfrchZa1k+biRMWpFaMLOlrhXNeI
         P7MNcxy37OZNxOnqIW97MwSO5RAn1spzGBLF6JMTRGtHl00ROyGGZcTWIvI00zPIMimH
         +V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699830201; x=1700435001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fYhrCB5TTjOTtid02dZqyCvpvcpSkFI5VRLPnt3EYI=;
        b=uhpYHQmRQtBdtlbNaR6RuuMvZL1jklakBBZxHhogSX69OnDXQqWZkSmzhOX2hUTiTz
         Krm7Ed2IUmms9vdG671m4vsNd8UVElZ1ufWVtcsvGzO6siBdoWh+t1wlKwOT2NiGmTGi
         t5ZEzt9SRAfrW4hu20YptOcYKKtiAT8sZOYhR5ndLmv1KBwuCodrCvQkTmKBEkU2NsMy
         qG4dV+XvcT7dTHwa7yKRrlGoMl1eoTzEAGMLf4MWvvF4W8evfRtIgW8MeFmmEK0XtAB0
         qRM7a0bIS7njt+QbRx8AzTQd3E+u44CaGNeTcdvq3p8mAOiNglm701BNPbrWu9G6T5JE
         OEYA==
X-Gm-Message-State: AOJu0YzuWOP7t5skxKGORtDlFFD/yBR+fJJSef1pxfKaX7pgTuJgb2v5
	a/Qm0vQE06EmWN72Z3Gd6K6BLA+BLgbxCJEv20o=
X-Google-Smtp-Source: AGHT+IG6hB8VGf6IvZCh8WyAYqwE1HrDNXDgr7SMzxwyubv4J9/6Vn5+zvec81RJAPMA1Ee7tWuBeqq17N2KZMQK5Ow=
X-Received: by 2002:a05:6870:5b33:b0:1ef:aba0:1e34 with SMTP id
 ds51-20020a0568705b3300b001efaba01e34mr5177063oab.29.1699830200942; Sun, 12
 Nov 2023 15:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20231112081748.69354-1-alperyasinak1@gmail.com>
In-Reply-To: <20231112081748.69354-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 15:02:54 -0800
Message-ID: <CAMKF1so-Ri5kx6AC=NoMJwWFLcxSuLRbjEvNcyoF3+pK9XaJSg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libupnp: upgrade 1.14.6 -> 1.14.18
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106614

On Sun, Nov 12, 2023 at 12:18=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
>
> Changelog:
>
> github.com/pupnp/pupnp/blob/branch-1.14.x/ChangeLog
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  Conditional statements removed in the newer version so no need the patch=
 anymore.
>  1.14.18 -> github.com/pupnp/pupnp/blob/c540ce2431bdeac73359029d4592b4579=
0e1d154/upnp/inc/ithread.h
>  1.14.6 -> github.com/pupnp/pupnp/blob/cef2b23fb36baac091b0c7d41136b4c1d9=
549c6d/upnp/inc/ithread.h
>
>  ...ead_mutexattr_gettype-pthread_mutexa.patch | 42 -------------------
>  .../{libupnp_1.14.6.bb =3D> libupnp_1.14.18.bb} |  3 +-
>  2 files changed, 1 insertion(+), 44 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/=
0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
>  rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.6.bb =
=3D> libupnp_1.14.18.bb} (87%)
>
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-it=
hread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch b/meta-multimedia/=
recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_get=
type-pthread_mutexa.patch
> deleted file mode 100644
> index ee7819677..000000000
> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-U=
se-pthread_mutexattr_gettype-pthread_mutexa.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 343a3b724225d3c87af0b268da14d3acb7a5b9a1 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 9 May 2021 15:38:43 -0700
> -Subject: [PATCH] ithread: Use
> - pthread_mutexattr_gettype/pthread_mutexattr_settype on linux
> -
> -_np variants are not recommended anymore, and glibc 2.34+ will have
> -these removed
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - upnp/inc/ithread.h | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/upnp/inc/ithread.h b/upnp/inc/ithread.h
> -index f6800ea9..1d0f9dba 100644
> ---- a/upnp/inc/ithread.h
> -+++ b/upnp/inc/ithread.h
> -@@ -304,7 +304,8 @@ static UPNP_INLINE int ithread_cleanup_thread(void)
> -  *      Returns EINVAL if the kind is not supported.
> -  *      See man page for pthread_mutexattr_setkind_np
> -  **********************************************************************=
*******/
> --#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__)
> -+#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__) \
> -+    || defined (__linux__)
> -       #define ithread_mutexattr_setkind_np pthread_mutexattr_settype
> - #else
> -       #define ithread_mutexattr_setkind_np pthread_mutexattr_setkind_np
> -@@ -329,7 +330,8 @@ static UPNP_INLINE int ithread_cleanup_thread(void)
> -  *      Always returns 0.
> -  *      See man page for pthread_mutexattr_getkind_np
> -  **********************************************************************=
*******/
> --#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__)
> -+#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__) \
> -+    || defined (__linux__)
> -       #define ithread_mutexattr_getkind_np pthread_mutexattr_gettype
> - #else
> -       #define ithread_mutexattr_getkind_np pthread_mutexattr_getkind_np
> ---
> -2.31.1

This patch is needed to fix build on musl systems. Has this been taken
care of in this version ?
if so it would be good to mention that in the commit.

> -
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.=
bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
> similarity index 87%
> rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.b=
b
> rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
> index 81b42da41..5b15d1809 100644
> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
> @@ -8,9 +8,8 @@ HOMEPAGE =3D "http://pupnp.sourceforge.net/"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D394a0f17b97f33426275571e15920=
434"
>
> -SRCREV =3D "cef2b23fb36baac091b0c7d41136b4c1d9549c6d"
> +SRCREV =3D "c540ce2431bdeac73359029d4592b45790e1d154"
>  SRC_URI =3D "git://github.com/pupnp/pupnp.git;protocol=3Dhttps;branch=3D=
branch-1.14.x \
> -           file://0001-ithread-Use-pthread_mutexattr_gettype-pthread_mut=
exa.patch \
>            "
>
>  S=3D"${WORKDIR}/git"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106579): https://lists.openembedded.org/g/openembedde=
d-devel/message/106579
> Mute This Topic: https://lists.openembedded.org/mt/102539464/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

