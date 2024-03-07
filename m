Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353CDC54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 00:11:56 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.11662.1709770309669487183
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 16:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WEj0mJts;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5a11b781a79so155919eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 16:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709770309; x=1710375109; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PuQmvqHWGU3KwPyZ+twkBUfdet9pykZmDhaCq5WeRI=;
        b=WEj0mJtsgDrb0PDnhXdFkpaxR6qh5aOwj1Ej5EmIej+1FEmlU7hI/jK+wpyLU9ET4w
         NBrouARaYa1RsSvoQoIZDiZm2g05LuU9+3pYmJH3FprRUE3W41/sxuxTypD0LfYzCfLR
         h9V6brNlwv7uleb4Fc9gW5AcOU65b8igY50APcFT4KR7uyVVSF//re2A3nCtFADE2vJ+
         QTB/CsRyhhljoYGbwKUwKuN5zlpEG01/wBky+i77y5mEtaTXYJ+vTUaupDFtDzzv22k6
         cVY9ecbP1nkvwVCASXwxq1zRQgXxHPd5XjBDCySt6XKEXAfqDfNEHZk7XaUCZgakCRBn
         yp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709770309; x=1710375109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PuQmvqHWGU3KwPyZ+twkBUfdet9pykZmDhaCq5WeRI=;
        b=cYibEyJ7TXI61L6FRnq83LGj2Yv5VjEzhj322Q/nwdEHjKimEJ3bRMkZ53QMW8H57v
         GEvY7NKgf9sR97EptI2vAImYoc6yMFCu3iyGfYAMgUX7j34bw4p4x1Z3RrKecvxykKws
         zsvErFqx4Inmd6ffr1I36p84cqG217rq3Yrooo/6uHRIOCA8rtQP2Ei27VxENs3Y5Clo
         XBYEpeHdsdY7VrTnq9OC9HKYN22S7+Hm/4xlENe1KjHUWB5V9FPmG2cJv0QUDhghtM1y
         7r6EsaDWhsyuwfaa7NEi5pbCn+x02HC8qSWgaRkFYycxLFShDx1JaAJCaYLiACx53vEG
         Pqbw==
X-Gm-Message-State: AOJu0YwnBrVm4yaQqjuFcCC2EPSXJnM/w+W9oG+XTNNzgsKLephQcUG/
	Q5UC8V+F8sOHemQZ+Ktl0ExAYTUKWFH8p5HgIUw3nLCdiUVgOJPnZpqDXHRVcsQwvikuaiBB3gq
	P88MgH/O/0iFInmMdKREKvtyt1eQ=
X-Google-Smtp-Source: AGHT+IGt+rspxWLzAGpf9hBHooVj8y2OztycGx4vrkNiIC+l/pjZ6NwfqvhOBcBZ79Botlqr2u6tolYDBGujLFxZa8s=
X-Received: by 2002:a05:6870:461b:b0:21e:4a2a:f060 with SMTP id
 z27-20020a056870461b00b0021e4a2af060mr7177485oao.13.1709770308722; Wed, 06
 Mar 2024 16:11:48 -0800 (PST)
MIME-Version: 1.0
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 16:11:22 -0800
Message-ID: <CAMKF1srDE-sYhh0Mgi+tWm7GF=yvuNB5JEQO55OqHgTZtqcJEA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 01/26] abseil-cpp: upgrade 20230802.1 -> 20240116.1
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 00:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109182

I am seeing below error. How do you test your patches ?

stdio: ERROR: abseil-cpp-native-20240116.1-r0 do_patch: Applying patch
'0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch' on
target directory
'/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/abs=
eil-cpp-native/20240116.1/git'
stdio: ERROR: abseil-cpp-20240116.1-r0 do_patch: Applying patch
'0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch' on
target directory
'/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-li=
nux/abseil-cpp/20240116.1/git'

On Wed, Mar 6, 2024 at 12:43=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Added absl::NoDestructor<T> to simplify defining static types that do no=
t need
>  to be destructed upon program exit.
> -Added configurable verbose logging (also known as VLOG).
> -Added absl::Overload(), which returns a functor that provides overloads =
based
>  on the functors passed to it.
> -Bzlmod is now officially supported (previously it was supported by the c=
ommunity).
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{abseil-cpp_20230802.1.bb =3D> abseil-cpp_20240116.1.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20230802.1.bb =3D=
> abseil-cpp_20240116.1.bb} (94%)
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb=
 b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
> similarity index 94%
> rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
> index 1ce6ff3fc..9f44d6790 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
> @@ -7,8 +7,8 @@ SECTION =3D "libs"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddf52c6edb7adc22e533b2bacc3bd3=
915"
>
> -SRCREV =3D "fb3621f4f897824c0dbe0615fa94543df6192f30"
> -BRANCH =3D "lts_2023_08_02"
> +SRCREV =3D "2f9e432cce407ce0ae50676696666f33a77d42ac"
> +BRANCH =3D "lts_2024_01_16"
>  SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH};proto=
col=3Dhttps \
>             file://0001-absl-always-use-asm-sgidefs.h.patch             \
>             file://0002-Remove-maes-option-from-cross-compilation.patch \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109141): https://lists.openembedded.org/g/openembedde=
d-devel/message/109141
> Mute This Topic: https://lists.openembedded.org/mt/104762423/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

