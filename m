Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F89CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 03:02:51 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.web11.237.1761102167222132763
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 20:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uwnx+Ov/;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63b710f276fso6707706d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 20:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761102166; x=1761706966; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0jPAQhP0n3jRNW/DHxZlWNJqf5XjiLg5RQi3Y9b8fk=;
        b=Uwnx+Ov/v5JhZjkVJcihJLVjwOs3SNvPvdHw/qHxOzvR8SyH/K1tz+bdrTjp3643Ez
         BQ5p18QVCRUxRGZSHNvqmzCQf6s370ztfF5yvkjScDyPyqAO9oeM704jJf/sdjf8WIEj
         1F3IYTcuGKqT2CIsdKP8+VisZ7Uf0Aj5jr5Jr5lYMVDIO5wP+SAsBsXD2zep1RBBOUGR
         YFRhJOQpGD/nlzquvMUukClblp6zWVq0OEn66rxcVwL6zC3+zWIEYjuzJR7ZbDF0lycX
         UhL48gLz32nE+Bug3rhgx1hPKzrKsQ8HGDYGzovzYpvQUeevzGD12IrTu+AkqPmWCEzO
         YcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761102166; x=1761706966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0jPAQhP0n3jRNW/DHxZlWNJqf5XjiLg5RQi3Y9b8fk=;
        b=cW26nzbxq0OBxSRKRxq4hdkj5YKyiQnw+LsHcg3GRvRdhxp/tvMuykgLtCxem2ihoT
         jW8dGk5K4zP8gvbSrDs4J3vq2zDaKcsHRyq8aT0IoXSIFG6jbnu/7YpJenwnLuS2dkM1
         3MB8jn+uAB7OCgEp8KNgTXtZZRdeQYDRd1TDyw4O6FbywqVD4oHlMxVvtCF+vxRfPacE
         ZCCpgAXbsgt/JhVwJYNtj6H8Phfevj+yGGujqvsfmmN3mTfv2rH09gW4IVRx979yKbj8
         3ajIwTWFTs3rLQtQ3iPQtDCXJTCAZ0pAZXlEqyZn+9xI/BtOKT99idxmp+BLPOWwFwtW
         KqDg==
X-Gm-Message-State: AOJu0Yx9/IEpA19oujGq4EcJDIJ0HouSBUR+0cTQOJYjMBV63hlFZrpe
	wb8DuTVnY/cumA9tMT3HItaiSOgCkkDa8LWcNAsTeCRKnITahcCcXbSAiZRtROSbUwj6jdhnFH7
	O6PEyLv4haH29gV1NrDS8XMAmqCHd5mbhcf4r
X-Gm-Gg: ASbGncvR+ALwS+7AQj4u79UAnWfPGYFzPjDZARxkTlpXGt2W3o94iLxMST/ThqGX2tg
	Ruyt4Mi7bJ5GRcOaCgnWcRVFZTj2Nbc8W4blirmdzKGfO4srgsf3bURSDq0Sj+xv/3zVRqV9pJ2
	GR4NdBx/uG6gcrvqyce6DTYo86GxO7Jvm3ZxVDvkGN5k9A7fq1FTOdTsnzR8Ekvf+CQavsjB5wx
	df/W2bdTC3lIzqjIewNQ9rJytXHAlpdiA/JCX4wQrqIiNOE0aXmf29REr1rP6smDgllD7c0ZXyM
	+JnC3NN0bt4vAxxdtc9YXRPnibzUdX3Utx1dRfeSvnZwZnHANZabwV9X/C9I1rPToYwXVYvuojb
	2hPI=
X-Google-Smtp-Source: AGHT+IEAlF9QH0PwADr0rykNSwEtCX+cjASuloeq7Cg5qwVn5hi3O+V+fUG3smspRv7qMq0aFx8vWtSK2LipVgmpsWQ=
X-Received: by 2002:a05:690e:4182:b0:632:5ba8:1bb5 with SMTP id
 956f58d0204a3-63e161395c5mr15456609d50.21.1761102166251; Tue, 21 Oct 2025
 20:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <1870AFA4856349AB.25855@lists.openembedded.org> <20251022025948.3520973-1-hongxu.jia@windriver.com>
In-Reply-To: <20251022025948.3520973-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Oct 2025 20:02:20 -0700
X-Gm-Features: AS18NWDEAUzY24H1reByccrjcKiF8ilHg-Q4FrdRSO77cd7UgRzmLyQYJZOUlvw
Message-ID: <CAMKF1sqpMDSt8J6MuzRGWKAQjZcHMSxqJ3sxqzztYpwkahfTfg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] poppler: fix racing build issue
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 03:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120879

what changed in v2 and then v3 ? and it does not seem to be rebased on
master branch, it helps if the changes between
versions are clearly documented and feedback is addressed.

On Tue, Oct 21, 2025 at 7:59=E2=80=AFPM hongxu via lists.openembedded.org
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
> The issue has reported to upstream [1] and upstream tried to fix it [2],
> but the issue still existed. The catalan translation of pdfsig is not
> vital for poppler. So revert upstream commit "pdfsig: Catalan translation=
"
> to workaround
>
> [1] https://gitlab.freedesktop.org/poppler/poppler/-/issues/1551
> [2] https://gitlab.freedesktop.org/poppler/poppler/-/commit/053acd5d2b310=
c696993dc97072d1f2b3b1dd7ac
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
> View/Reply Online (#120878): https://lists.openembedded.org/g/openembedde=
d-devel/message/120878
> Mute This Topic: https://lists.openembedded.org/mt/115886629/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

