Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5AECCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 15:59:45 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.web10.16146.1761062382461091881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 08:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NP21rIOt;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63b710f276fso6140342d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761062381; x=1761667181; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yS6+iK8hIMsR0B8cEMlAQaH8dpmbasYuMvPkaBJ2/A=;
        b=NP21rIOtvdQc3si5FxuNGYCCTQ85Qw1vF6BSuTkpHJ+yDOAac03I2ZMtl/GFVgyRTb
         8Kl5TRllCrdmjJHFes9VqrSdlDKAeNrdeOQXYVdf71eGtuwXBNZU7/DZd5H5ldUHPBPv
         X26fCCHQCf7MYr2BPRJDa9ZdstcRCqlelA3MVoQ1rLyiYTFQgGdaKjxxwFN6RxCAbHLf
         0qTikmp1bw+rgCWG6b2lPiVzxJxXNjGviRR86tfHLkUiPP48sAsjcrBbaO+gfJHr7NBK
         +VSygWL2p5DcKYiWR8RMJlby036PvBmRh4RuVsyyHERQOSECZLCkwZTBhU7Lamh8q+6x
         vVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761062381; x=1761667181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yS6+iK8hIMsR0B8cEMlAQaH8dpmbasYuMvPkaBJ2/A=;
        b=SZKJZf/ZJGTy2zPSIwdUzGIIX4EHT4PTR/ThWlLLA1braXKORQuA1gohR0txedDIHc
         m5VEhrPBoCrr0SzSW61KAIwpShrTlQNjcGE7FACslm5NaBqtrI/5Pz85MgKo8Wq4zYHu
         w0Id8IBEVsWbf7JV1taqwMkA54Fkbj/9wPRlJq6ejl0o/db82m/ZISdTJH4X00i+sNLF
         QoXCVXYgO1GMF6IidKaIa9PCzJfFr3EvR2OE82a4g3yUptojNlB+UEw9+b5neKvJ61nu
         ZM5H6hoyx4q6/b8nvBgsgVMM/m66GL03KXkWcwXcJaKAgaUfZSBkq4ZXH0Tgr94SqRyl
         ajcw==
X-Gm-Message-State: AOJu0Ywcy6Islrt7oQ8CsdHYm73WaDCdGO66oQEixr5EAEHBdKgSRmpB
	1pIvmc1qevY4pp6d0N1f2ASxUH8KaOAjnO8XQMn5MaBHNuikXGms6dYJjnS/oeeGVMViU2MyWF8
	giyQlhBqNJDKIuAu8p6sZbJ3I+ExWijU=
X-Gm-Gg: ASbGncvw0fQ8CNrZSU/bq+FimGKL+EoOQTp2EejOKMi7hGtc5GkiMc0yY2HYZKibWf8
	owFRHTCjXqhc9GfhOkhJYXGwrBns2GU7s/j/bNftq5MwenoFD50ucE/4FsA2maG2qzfWszAj/i+
	7bYiEYzX5OLBAxJgml0Uyp01VllocpdDPEly6iaAvlzVTZvmCT72M9jNT7EATK2CVSQyGUa92G1
	fy4jwciCj9djsF9GvsWJGMpMhC/CNpXhgn8QeDCbppZlTMPC3L1ruk6CHItU020jG2Na5mEX2n9
	P0q22Yi3/zopsN3qWwzOefP50yVOyGU5aFB1iKIf/4Bty3gPowtS35RtWCSL4QLlhEdHThIY212
	7s5lSOzkh9gH/uA==
X-Google-Smtp-Source: AGHT+IFlzIz+2Z4vpEslm9J2MNh2rVTgsE+2g+sCqRc/7HJbwIZkSJ0Us4nWOwMR44IXDTuv25Ia45rnQYTF/lJwgow=
X-Received: by 2002:a05:690e:4182:b0:632:5ba8:1bb5 with SMTP id
 956f58d0204a3-63e161395c5mr14049963d50.21.1761062381242; Tue, 21 Oct 2025
 08:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251021102233.706528-1-hongxu.jia@windriver.com>
In-Reply-To: <20251021102233.706528-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Oct 2025 08:59:14 -0700
X-Gm-Features: AS18NWBRzEabRGBTld1PYcUPGbWj774Qc2f8R-tAQz4_LyjBB2_XsBh_TjDAe1k
Message-ID: <CAMKF1spaw64Rmu44rrPmPYAav1DOyXAbyeARR6nzzDPC0XfHyA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] poppler: fix racing build issue
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 15:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120839

if it is meant for master branch then please make sure to rebase on
top of latest master always. If it is for a release then tag the
subject with branch name.

On Tue, Oct 21, 2025 at 3:22=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> There is a racing issue in world build while multilib enabled:
>
> ...log.do_install...
> CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
>   file INSTALL cannot find
>   "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/ca/p=
dfsig.gmo":
>   No such file or directory.
> Call Stack (most recent call first):
>   utils/po/cmake_install.cmake:47 (include)
>   utils/cmake_install.cmake:243 (include)
>   cmake_install.cmake:229 (include)
> ...log.do_install...
>
> It seems gettext_process_po_files has racing issue [1], but
> not sure, and the catalan translation of pdfsig is not vital
> for poppler. So revert upstream commit "pdfsig: Catalan translation"
> to workaround
>
> [1] https://public.kitware.com/Bug/view.php?id=3D14904
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../0001-workaround-build-racing.patch        | 43 +++++++++++++++++++
>  .../poppler/poppler_25.08.0.bb                |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-workarou=
nd-build-racing.patch
>
> diff --git a/meta-oe/recipes-support/poppler/poppler/0001-workaround-buil=
d-racing.patch b/meta-oe/recipes-support/poppler/poppler/0001-workaround-bu=
ild-racing.patch
> new file mode 100644
> index 0000000000..fdf4f7ff70
> --- /dev/null
> +++ b/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-racin=
g.patch
> @@ -0,0 +1,43 @@
> +From 83ad73024c69d41fda302f39acf50c381684890e Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 21 Oct 2025 02:39:36 -0700
> +Subject: [PATCH] workaround build racing
> +
> +There is a racing issue in world build while multilib enabled:
> +
> +...log.do_install...
> +CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
> +  file INSTALL cannot find
> +  "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/ca/=
pdfsig.gmo":
> +  No such file or directory.
> +Call Stack (most recent call first):
> +  utils/po/cmake_install.cmake:47 (include)
> +  utils/cmake_install.cmake:243 (include)
> +  cmake_install.cmake:229 (include)
> +...log.do_install...
> +
> +Revert "pdfsig: Catalan translation" to workaround
> +
> +This reverts commit 99f5416d9bfb6a34bbc5cbcb368e258b98fd3f08.
> +
> +Upstream-Status: Inappropriate [Yocto specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + utils/po/ca/CMakeLists.txt | 4 ----
> + 1 file changed, 4 deletions(-)
> + delete mode 100644 utils/po/ca/CMakeLists.txt
> +
> +diff --git a/utils/po/ca/CMakeLists.txt b/utils/po/ca/CMakeLists.txt
> +deleted file mode 100644
> +index 3225131c..00000000
> +--- a/utils/po/ca/CMakeLists.txt
> ++++ /dev/null
> +@@ -1,4 +0,0 @@
> +-get_filename_component(_lang ${CMAKE_CURRENT_SOURCE_DIR} NAME)
> +-gettext_process_po_files(${_lang} ALL INSTALL_DESTINATION ${CMAKE_INSTA=
LL_LOCALEDIR} PO_FILES
> +-  pdfsig.po
> +-)
> +--
> +2.49.0
> +
> diff --git a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb b/meta-oe=
/recipes-support/poppler/poppler_25.08.0.bb
> index 45f94b0ae7..3b0b4b0e99 100644
> --- a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
> @@ -7,6 +7,7 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.tar.xz =
\
>             file://0001-Do-not-overwrite-all-our-build-flags.patch \
>             file://basename-include.patch \
>             file://0001-cmake-Do-not-use-isystem.patch \
> +           file://0001-workaround-build-racing.patch \
>             "
>  SRC_URI[sha256sum] =3D "425ed4d4515a093bdcdbbaac6876f20617451edc710df6a4=
fd6c45dd67eb418d"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120834): https://lists.openembedded.org/g/openembedde=
d-devel/message/120834
> Mute This Topic: https://lists.openembedded.org/mt/115870675/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

