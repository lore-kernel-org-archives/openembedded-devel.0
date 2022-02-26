Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B29C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 19:50:24 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.2361.1645905023056309772
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 11:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kMn4BBMH;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id q10so5611666qtw.4
        for <Openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 11:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=dhYOoQ24Kvkjsrfhur4uVEqFXlGaSYgiyYIJLzzioSc=;
        b=kMn4BBMHb676HMc2GQqn8BLcBJpRGuLkcEN02TpUtzVEBQrasAPShanR++OSMPRgDm
         GaRUPzTeFsmwVwglFCeTb+u9vrGiFbN41nQ4Z05dGT8DvdFFP9ANmDgq1NRKlQ9a3lq3
         CASVqDJsw68LS9YADYyHVYN1ri4W2Luif0NXQutZeYiECE3dOlI18rCdpAb0b8E071yN
         nF/KjXrWnBUrx5uKqik22CuzyQNVKT5gB03i15SWwFNu5os2k2P0sMqihsMTfftfKnes
         qPXXKFEoKHY2PgZ/raIH9d8o5EJEYXAti6/MCPEZSarQqb2nLD9ONwLbJwbjwBca0NuK
         7DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dhYOoQ24Kvkjsrfhur4uVEqFXlGaSYgiyYIJLzzioSc=;
        b=oaJvEgsvcWqmN0+VUrP+Z0eIPhIc+9iQCeLqvB++B7RYSuTKOvScGMRFaRvmCDq51x
         tTIWYhN4XHN7xqerJ/aPsLZDmSVPL+c70whP7zoGsY6EoLW5mFNHlGWVJhjP53bJyxDX
         3P4lr+Q993qvQfwqz7InHdmc7ozTDwr63KTX7QfDrmFCjQItK1BZMJuw2+e09PWmZF9g
         sPGfFLMTqrvAJDaPq6UqpNok/VsOq8xPdgPgPbKONcPLQkRNs2qmECQKDXxoGtLFp2hO
         16JSRf/RWHzSRxZjFETYFobrsUcwYnhDeSpvsbNq9BGZhBMhknRvwfMQ+jY9Ij6iUQIU
         LcHw==
X-Gm-Message-State: AOAM531c/Q7U/TyZE/8Qc17wrs+L7nnX+McAcY6FDE6Zkg0X78se1D1P
	jsnqOKoacCvuzXYLhxKh9PAcJAm4/z3eqHoEzAcpjVIed4lzUQ==
X-Google-Smtp-Source: 
 ABdhPJzY8DJ8YJmL4g/ujtNhd83NRq0XcipvIr94OVxMxEEgWXKvkwMPUSvxl+DBfVrWkK/zB4+OHEqGz1xeInOV1Q8=
X-Received: by 2002:ac8:574e:0:b0:2df:f40a:8b79 with SMTP id
 14-20020ac8574e000000b002dff40a8b79mr3978080qtx.634.1645905021842; Sat, 26
 Feb 2022 11:50:21 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Feb 2022 11:49:56 -0800
Message-ID: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
Subject: PEP-517 packaging fixes needed in meta-openembedded
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 19:50:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95553

Hello All,

We have PEP-517 packaging related infra changes merged into oe-core,
which obviously
mean there are some failures on various python packages.

I am posting the latest results (qemux86-64/glibc)

https://errors.yoctoproject.org/Errors/Build/141804/

We have 57 recipes left, Tim has worked diligently on fixing the
PEP-517 issues but we would
need more hands. If you see any of
these recipes that you can help fixing, please send patches

Since upcoming release is an LTS release, I would like to have these
issues fixed for this
release.

Thank you for your help

-Khem

