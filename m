Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971B4C4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 02:14:12 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.1837.1671243243377304770
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Dec 2022 18:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aU6pxpSZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-12c8312131fso5432538fac.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Dec 2022 18:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0uQmZtGVJ06hcjvcWeZSXkPAL9NcQHD7DRh5MHWgmI=;
        b=aU6pxpSZWIhxUOJOgFs/a6CJUaDAFvk38rpRQcCJltCfEmDhZHcQZqCgNyNTUDyvYi
         szVBg6DHGnOzvafb+JHFEsHBgJ+t035JNjbIVuPYd/duWJtpQ99s0QG2qTXtn8F3wTft
         YP4hWXHXf9m+6XH32CP0oTZBvCsVb3jWLn5FiWqB7NnyDixs/NF42cjgXAe5sbUOVAp7
         dgekKbA6VQdVLaplERpSkHEDvhefMQ+ALJstVhL7tMJnld4vFw0I2Tb3NHtqhXQfpmMi
         HcJEz9v4EPDiG2jEHFigRz7HgRwdP3budezS8UkaDl8NnnTLTixXrqLFiziJvpRhLhZP
         YRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0uQmZtGVJ06hcjvcWeZSXkPAL9NcQHD7DRh5MHWgmI=;
        b=QzzdpNMyOhIz00FxTc5WFHurn6hNj519hMh/oF9hEeVXz880xgh02nVZQP7XhAP+Ns
         4Po9Yz57Q57BqM8mH36Bhf9WrkS/zmkQBrX6AePyOtDMFbwAqhP0sJ7A9Dd5EmHsOLHG
         dFEMrWJlOy+JjLW9zePjoBxFwhs/tN6rjLppvu4lJn43h/zPYdVGQFB+76PL1gH4lrmU
         VtwGJl/IRznCcckaFajSsaT1ZupYtVq8tMsvNXvemBL7G/bjJuj3GOqPdUssHlu1lWbt
         PIbLwUiuRIP84jppyxytnDuXLzEUNsm6w/RYMFd05KVoqjH2LVxASDeLuXUDtr0a+sPv
         IY+A==
X-Gm-Message-State: AFqh2kqCohMgAjceuak3ZrSjF5S+IVFP0kUHN32V4ML8vl/uaunk/E/0
	uNE2DXYTQClkNiPuHAck5fg5c5NGAlHkm1jEU0Q=
X-Google-Smtp-Source: AMrXdXs+XfXrMD+1cRJAfvKTRSYsBHOMh+DyqWJqGfg8fkygDLp7sQmxug1idBWSvE7X/aAqmZkyJxj8zQDIGFmO9uw=
X-Received: by 2002:a05:6870:98b1:b0:13b:1e05:a73d with SMTP id
 eg49-20020a05687098b100b0013b1e05a73dmr593799oab.55.1671243242567; Fri, 16
 Dec 2022 18:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20221216150348.19676-1-roger@norberthealth.com>
In-Reply-To: <20221216150348.19676-1-roger@norberthealth.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Dec 2022 18:13:36 -0800
Message-ID: <CAMKF1so09=dxnBJ9Dirn9hzfnh5eb-oJMLboQincHgAqQ92E8g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] dlib: new recipe
To: Roger Knecht <roger@norberthealth.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Dec 2022 02:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100085

thanks for the patch. Its failing on some machines

https://errors.yoctoproject.org/Errors/Details/683901/
https://errors.yoctoproject.org/Errors/Details/683900/

On Fri, Dec 16, 2022 at 7:04 AM Roger Knecht <roger@norberthealth.com> wrote:
>
> Add a recipe for the dlib C++ library.
>
> Dlib is a modern C++ toolkit containing machine learning algorithms and tools for
> creating complex software in C++ to solve real world problems. It is used in both
> industry and academia in a wide range of domains including robotics, embedded
> devices, mobile phones, and large high performance computing environments.
>
> Signed-off-by: Roger Knecht <roger@norberthealth.com>
> ---
>  meta-oe/recipes-devtools/dlib/dlib_19.24.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/dlib/dlib_19.24.bb
>
> diff --git a/meta-oe/recipes-devtools/dlib/dlib_19.24.bb b/meta-oe/recipes-devtools/dlib/dlib_19.24.bb
> new file mode 100644
> index 000000000..0b6bd3516
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dlib/dlib_19.24.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "A toolkit for making real world machine learning and data analysis applications in C++"
> +HOMEPAGE = "http://dlib.net"
> +
> +LICENSE = "BSL-1.0"
> +LIC_FILES_CHKSUM = "file://dlib/LICENSE.txt;md5=2c7a3fa82e66676005cd4ee2608fd7d2"
> +
> +SRC_URI = "git://github.com/davisking/dlib.git;protocol=https;branch=master"
> +SRCREV = "6097093ab329fcd19aed03a8fe67949f6971a65d"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += " -DBUILD_SHARED_LIBS=ON"
> --
> 2.17.1
>

