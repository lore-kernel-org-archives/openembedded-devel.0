Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A8AC76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 15:01:46 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.160761.1680793295794725266
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Apr 2023 08:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QPoqIZ/4;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17aa62d0a4aso42627138fac.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680793295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAhTvFcj/AxGtye/vgLsS259bx8THlreJNQgaQX07Eg=;
        b=QPoqIZ/4XGytX9o7vChrV0TfPuKiuQOLORRw1kE9lFC8BEnrhH6XKgiwUWJLGhwn/i
         CxFlF74HYk6GQi+bfuxroo+GQ76nLIZzHS8RZHo6FfvZCdy30n/fxrRaSruthFDnZSLv
         CiO8wRu8l7fg0sPI4kp8i3s/hZX0UydfP8DUuCzlWd6EN+fGCc0RQltdx1yxRrClcPh5
         5PCS0iUTk/DZ6bdyUpgiaMkN5FaFoMv57Zqgb2v00ss6wyWHkoWqbA4eSbS1zl1jiltO
         Q38egC8ljgGwTz5ngD9n9HMMp5CbWu6Dq2tvPaqJJ6Yc5pBXVE2w+3u1Wh9f5l3ZXcS0
         daiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680793295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAhTvFcj/AxGtye/vgLsS259bx8THlreJNQgaQX07Eg=;
        b=OdOLLgYVFDrvVzYYL1awGgRWKUCijJmInvWpC0a+vnd5wupntji4kJsrY54BUAuBgN
         DSAN9SAMs3vyC+QVMj6Fy49qqvjqBnH+2WsSb7LYZcYK5fhZ99raRFdOcMG/kj7Zo/rS
         NVrtyIE120ILLOYasEcbQ6E5q+DzsupLcXbDsVEP3wEjumqhoTWXeZ3XVdg90EmrPXib
         3GNmHPoPHfxIxllCNyyKLblWmI+cBVbGmWyFEWadcnC7iyG1HCnPmIrHaXYeVlH8wbCr
         hYTFoSwXNTNrdicGYbU9tJrmcroPLsOSOO8njwlrIHvt+eKce3yxDkWhE6KcnpeD6DEz
         Sd3g==
X-Gm-Message-State: AAQBX9dOadB/s1iOgfaDsU/kHr/aPdrP2sE4RF1Q0ehdd0xRzUu4CXYx
	+vzJ2bT+GV8j1vvLyRuFA+iPl5CMRq7YYOWVkYk=
X-Google-Smtp-Source: AKy350auHdC3artbBBeC8RkOiTG7tmBbKKkf/nLnaoXsNEqZU2S3wRdF02UrgUcYdf2kiJsjhND6gp3oMOgV3z0cH5I=
X-Received: by 2002:a05:6870:3456:b0:17e:915c:84a2 with SMTP id
 i22-20020a056870345600b0017e915c84a2mr4781542oah.4.1680793294935; Thu, 06 Apr
 2023 08:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <b8064d86-fcba-4b03-8392-dc221492051f@gmail.com>
In-Reply-To: <b8064d86-fcba-4b03-8392-dc221492051f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Apr 2023 08:01:08 -0700
Message-ID: <CAMKF1so4MqZVo=sMgJBWzAXxfQ=dOg2X+tNwzrmoN1VjeGfq4Q@mail.gmail.com>
Subject: Re: [oe] dunfell merge request: April 6th
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 15:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101974

merged thanks.

On Thu, Apr 6, 2023 at 4:39=E2=80=AFAM Armin Kuster <akuster808@gmail.com> =
wrote:
>
> he following changes since commit 7ae42df58f2bcc730153715c3339a6875b0b249=
7:
>
>    xterm: Remove undeclared variables introduced by backport (2023-03-18
> 16:16:42 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 7007d14c2558f86a49c2e2acb6154432c2ba4092:
>
>    mariadb: Update to latest lts 10.4.28 (2023-04-06 07:32:45 -0400)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>        mariadb: Update to latest lts 10.4.28
>
> Hitendra Prajapati (2):
>        postgresql: CVE-2022-41862 Client memory disclosure when
> connecting with Kerberos to modified server
>        syslog-ng: CVE-2022-38725 An integer overflow in the RFC3164 parse=
r
>
> Virendra Thakur (1):
>        nss: Fix CVE CVE-2023-0767
>
> Wang Mingyu (1):
>        apache2: upgrade 2.4.55 -> 2.4.56
>
> vkumbhar (2):
>        dnsmasq: fix CVE-2023-28450 default maximum EDNS.0 UDP packet
> size was set to 4096 but should be 1232
>        mariadb: fix CVE-2022-47015 NULL pointer dereference in
> spider_db_mbase::print_warnings()
>
>   .../recipes-support/dnsmasq/dnsmasq/CVE-2023-28450.patch        | 63 ++=
+
>   meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb         | 1 +
>   .../{mariadb-native_10.4.25.bb =3D> mariadb-native_10.4.28.bb} |   0
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 3 +-
>   meta-oe/recipes-dbs/mysql/mariadb/CVE-2022-47015.patch          | 269
> ++++++++++++
>   .../mysql/{mariadb_10.4.25.bb =3D> mariadb_10.4.28.bb} |   0
>   meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch       | 48 ++=
+
>   meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 1 +
>   meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch             | 124
> ++++++
>   meta-oe/recipes-support/nss/nss_3.51.1.bb                       | 1 +
>   meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725.patch    | 629
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb           | 1 +
>   .../apache2/{apache2_2.4.55.bb =3D> apache2_2.4.56.bb} |   2 +-
>   13 files changed, 1140 insertions(+), 2 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2023-28450.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.25.bb =3D>
> mariadb-native_10.4.28.bb} (100%)
>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2022-47015.pat=
ch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.25.bb =3D>
> mariadb_10.4.28.bb} (100%)
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch
>   create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2023-0767.patch
>   create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb =3D>
> apache2_2.4.56.bb} (99%)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101972): https://lists.openembedded.org/g/openembedde=
d-devel/message/101972
> Mute This Topic: https://lists.openembedded.org/mt/98102807/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

