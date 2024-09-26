Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3998FCDE033
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 19:27:59 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.52657.1727378877414970219
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 12:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOGz5Vwb;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5e1c65eb5bbso741723eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 12:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727378876; x=1727983676; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mg9oV0v5d/CdRQRbZw+olbhdsP9ZABpmCYULxiQqhr4=;
        b=mOGz5VwbF1veCV8OCHEp9oePdLwFge6C/S5WqlLB9T11bdoePlXIO4uiCwY33QKDuw
         dcVqivqk4KFBZKlq2RnzYxtcT7s3cpGvx8GUxHiY3KDVxU2VG6aKDpuWhl1AMipz6jCm
         LyfDT8gmOraZ01zbUTagqNTgF4XUl0JhRKR0SjID7U6VcEfoAI0yDJTf1ZGt7GcbaXgi
         z3LE4VwEERr/js2USXcuUAM2FKbNfKkWx5KqxbV6ZZRaJMEoFc+MGxtWbK31q+i4htLE
         uvTwRJRvR6bryJRYYbvgQC0N2m6kHJbwpfse4ytw7+TzJzPdpwXD1iu2KnAfOaffDRtL
         7NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727378876; x=1727983676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mg9oV0v5d/CdRQRbZw+olbhdsP9ZABpmCYULxiQqhr4=;
        b=OLWZwZKPw8YOZUKuyE9KIHU4QSrjyqpjD1kPAClRIdgfRWRLaXsPPFQl/4RxqQ826y
         480MfeSR5X11HxEJk9PvxvpSAiExiefQAJm+L6dkK+XGLVQfycpv5b3VJL7LR/rawcIb
         BmAlH+Dnk3Ay6BCwz9C+1ydOqBvZLFz5mIXHuNdnHKpP0YLOSWpFpzL4SbAOGIMamq6D
         9wfPyiZcGdRdJIe3x5Yo2SgdK5kC/Ha0EPNBNPLiLcnx2bfK1zXHDIHzvrmjn4h9O/uy
         erkY+nT+CnWgsT010J4xi7R7u4TqUvCFv4R3UAy/rKRcEfpJ19WgA3GZZL3u4g5xMIzK
         AQ2Q==
X-Gm-Message-State: AOJu0YyXEU2Q4S8nn5SzRnTneAPI2//vp7Uh+Hhs7t1CG5r1PT4lvrxQ
	nVqPYMOPoWEs0JMYdNyDKr7fy7wwaUAbc3+dbEm8hFPrcSUfEQXwfC38MuDAEeQdbkTGTqyVcra
	mPb4fEkAB6zhmo8z7z7hrmUhJob8=
X-Google-Smtp-Source: AGHT+IGLLqJ2QPxFswTOS+ylNJCiZE6NI5/4UXcR6Q/mOfbXPcV0+my+7gXZCpFLpX1ZtrsCim8KrZzD1hF7j/O6nQI=
X-Received: by 2002:a05:6870:2c96:b0:278:2c82:e056 with SMTP id
 586e51a60fabf-28710acf32emr1048572fac.23.1727378876569; Thu, 26 Sep 2024
 12:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <0afc49d1-c255-46ea-8cfd-c614d8909e21@gmail.com>
In-Reply-To: <0afc49d1-c255-46ea-8cfd-c614d8909e21@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Sep 2024 12:27:30 -0700
Message-ID: <CAMKF1sqT+iwbsCPOffqvhWg9T+QVRw=Gc5wn1gmjwJYLY06qYQ@mail.gmail.com>
Subject: Re: kirkstone merge request: Sept 26
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 19:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112524

Merged now
thanks Armin.

On Thu, Sep 26, 2024 at 11:38=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> Getting it out before the storm.
>
> The following changes since commit 9a24b7679810628b594cc5a9b52f77f53d3700=
4f:
>
>    python3-django: Upgrade 4.2.10 -> 4.2.15 (2024-08-25 18:12:52 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to dd3d2293ffdf2559f8a433f241765a8ab50cd085:
>
>    python3-smbus2: Fix LIC_FILES_CHKSUM (2024-09-22 10:16:22 -0400)
>
> ----------------------------------------------------------------
> Niko Mauno (14):
>        opensc: Fix LICENSE declaration
>        python3-pybind11: Fix LICENSE
>        python3-xlsxwriter: Fix LICENSE
>        python3-cbor2: Fix LICENSE and LIC_FILES_CHKSUM
>        python3-crc32c: Amend LICENSE declaration
>        python3-mock: Fix LICENSE
>        python3-parse-type: Fix LICENSE
>        python3-pillow: Fix LICENSE and change SUMMARY to DESCRIPTION
>        python3-colorama: Fix LICENSE
>        python3-fann2: Fix LICENSE
>        python3-pycurl: Fix LICENSE
>        python3-googleapis-common-protos: Fix LIC_FILES_CHKSUM
>        python3-haversine: Fix LIC_FILES_CHKSUM
>        python3-smbus2: Fix LIC_FILES_CHKSUM
>
> Peter Marko (1):
>        libndp: Patch CVE-2024-5564
>
> Vijay Anusuri (1):
>        squid: Security fix CVE-2023-5824
>
>   meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch | 4340
> +++++++++++++++++++++++++++++++++++
>   meta-networking/recipes-daemons/squid/squid_4.15.bb |    1 +
>   meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch |   48 +
>   meta-oe/recipes-connectivity/libndp/libndp_1.8.bb |    1 +
>   meta-oe/recipes-support/opensc/opensc_0.22.0.bb |    2 +-
>   meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb |    4 +-
>   meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb |    2 +-
>   meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb |    2 =
+-
>   meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb |    2 +-
>   .../recipes-devtools/python/python3-googleapis-common-protos_1.56.0.bb
> |    2 +-
>   meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb |    2 +=
-
>   meta-python/recipes-devtools/python/python3-mock_4.0.3.bb |    2 +-
>   meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb |    2 =
+-
>   meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb |    4 +-
>   meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb |    2 +-
>   meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb |    2 +-
>   meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb |    2 +-
>   meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb |    2 =
+-
>   18 files changed, 4406 insertions(+), 16 deletions(-)
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch
>   create mode 100644
> meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch
>

