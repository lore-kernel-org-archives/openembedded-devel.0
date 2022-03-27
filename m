Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB3CC433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 17:18:58 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.1143.1648401537069556302
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Mar 2022 10:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AcHZ1u7k;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id d65so6274146qke.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Mar 2022 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GBn/DU8X0vb3NA3z0U/FtFJfGzJlZwW3VXmVw9TJfW8=;
        b=AcHZ1u7kzcacHlkQew011D6yUSfK7z43l2Awx6gnhigUCI7eyBvPhcA0CKzBF9Dmwb
         LlajJnpj2VQx0bSmj9n5Eg+XPAthu6BhPn39La1Wu6Tc0jxlk/TBSTI+o7v19Ts6c2c6
         HnWCHZv6OWghBQwzBLRwmmRvI4Z0RejMeJNIPDoFzIjeh9UAeDEn92wDZd9SwRF6MBnY
         HxBaTa3zPBh+11GWNtkD/MB25squnZnSsZ55eSd8XWuhWmocpj2vs+AuOHElhmohyaje
         0LY1Yhvo5XT4PWCeueOeDMXzqWjMQXUB4h3rmA5JOQsddXLzUbdWjELvgzr9lJnug9tc
         na4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBn/DU8X0vb3NA3z0U/FtFJfGzJlZwW3VXmVw9TJfW8=;
        b=S4aR+69sqj/KlDF7smLB7yTgxph4eFw/X072qXCOA1zUHnXFrRqCrAgFiFId7Zvp/Y
         4dOaxxyftihYcJd3vjBzOFBE3pHaTR5ItxRtPDINQNjnD+E5QvJug8l2TbqQTk5ip71E
         2fNYdDd+lcp/uDBQhzVXVfoDVF+mvAJWFHZ8yWlJKx6cljnKMetK1P5q4QodfHzEWXyQ
         YaVYebFP5U6PWQ7efZJjqpHbaO0mQY+oMP1zF08OLX5g2vJs+hkHbk7NpZU/P+yS60MI
         jJi1I5j8lobtmp4TruEpf7gow+ElmvjXNuxxB+l9rrTPzumWYdbhpWPfkvzm0l+fkpGC
         ouOg==
X-Gm-Message-State: AOAM532ArYU64HHjcprcT/OrA/bmq7NoeOk7wrn7xZR4Kbs8YsM5Hia4
	PWSrg5vgvywMFcuIzqQk4v1VNvNxQBJZROwazJc=
X-Google-Smtp-Source: 
 ABdhPJxCnkskxMNRTtvZi7RnUe5NPDF+sfciThcKhZcRJ4DFnJcMiBSQdq47bt32nEHnCQRJ6p1vDxvOLFnETlDY+ls=
X-Received: by 2002:a05:620a:29ce:b0:67e:d7be:3491 with SMTP id
 s14-20020a05620a29ce00b0067ed7be3491mr13281651qkp.463.1648401536097; Sun, 27
 Mar 2022 10:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <c3cc247e-9cf9-6404-ddc6-0e2836ef0d76@gmail.com>
In-Reply-To: <c3cc247e-9cf9-6404-ddc6-0e2836ef0d76@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Mar 2022 10:18:30 -0700
Message-ID: 
 <CAMKF1srXEHPW1_f4952zNOzn3W-uPcqzQVGarK=_VH2jU_6nAA@mail.gmail.com>
Subject: Re: dunfell merge request: March 27th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Mar 2022 17:18:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96223

merged thank you

On Sun, Mar 27, 2022 at 8:21 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 0722ff6f021df91542b5efa1ff5b5f6269f66add:
>
>    protobuf: Fix CVE-2021-22570 (2022-02-23 15:48:18 -0800)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 86b864a4d8c28185a4a464583fb86f73aa22847a:
>
>    openjpeg: Fix multiple CVE (2022-03-27 08:18:20 -0700)
>
> ----------------------------------------------------------------
> Akash Hadke (1):
>        tcpreplay: Add fix for CVE-2020-24265 and CVE-2020-24266
>
> Armin Kuster (2):
>        pw-am.sh: update to new patcwork system
>        p7zip: refresh patches
>
> Mingli Yu (1):
>        polkit: fix CVE-2021-3560
>
> Nisha Parrakat (1):
>        p7zip: build and package lib7z.so needed for fastboot
>
> Peter Kjellerstedt (1):
>        googletest: Switch branch from master to main
>
> Ralph Siemsen (1):
>        nginx: backport fix for CVE-2019-20372
>
> Ranjitsinh Rathod (1):
>        polkit: Fix for CVE-2021-4115
>
> Ross Burton (1):
>        protobuf: fix patch fuzz
>
> Sana Kazi (1):
>        openjpeg: Fix multiple CVE
>
> Virendra Thakur (1):
>        p7zip: Fix for CVE-2016-9296
>
>   contrib/pw-am.sh                                                | 2 +-
>   .../tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch     | 37 +++++
>   meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb    | 3 +-
>   meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch | 25 ++-
>   meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch        | 27 ++++
>   meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch        | 72
> ++++-----
>   .../p7zip/files/change_numMethods_from_bool_to_unsigned.patch   | 27 ++++
>   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb                   | 22 ++-
>   ...1-GHSL-2021-074-authentication-bypass-vulnerability-in.patch | 32 ++++
>   meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch       | 87
> ++++++++++
>   meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch      | 33 ++++
>   meta-oe/recipes-extended/polkit/polkit_0.116.bb                 | 3 +
>   .../recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-1.patch   | 72
> +++++++++
>   .../recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-2.patch   | 86
> ++++++++++
>   meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch | 43 +++++
>   .../recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-1.patch   | 29 ++++
>   .../recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-2.patch   | 27 ++++
>   .../recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-3.patch   | 30 ++++
>   .../recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-4.patch   | 27 ++++
>   meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27823.patch | 29 ++++
>   meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27824.patch | 24 +++
>   meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27841.patch | 238
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27842.patch | 31 ++++
>   meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27843.patch | 31 ++++
>   meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27845.patch | 74
> +++++++++
>   meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb             | 13 ++
>   meta-oe/recipes-test/googletest/googletest_git.bb               | 2 +-
>   meta-webserver/recipes-httpd/nginx/files/CVE-2019-20372.patch   | 39 +++++
>   meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb              | 2 +
>   29 files changed, 1118 insertions(+), 49 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch
>   create mode 100644
> meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
>   create mode 100644
> meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
>   create mode 100644
> meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
>   create mode 100644
> meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch
>   create mode 100644
> meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-1.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-2.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-1.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-2.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-3.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-4.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27823.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27824.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27841.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27842.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27843.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27845.patch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2019-20372.patch
>

