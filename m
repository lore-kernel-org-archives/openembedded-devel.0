Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AFAEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:00:00 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.26276.1688655594132971709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 07:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Kyfg8jJK;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-56344354e2cso584638eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688655593; x=1691247593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzsBfiaUAfVEQalq30krxi6yWfglGX+bSCI+ZD28xpM=;
        b=Kyfg8jJKDzk8Umnd1DrIEohX4pc4ysoD6CknycXemjwV99Z1CSfEDftj/YzSvkPW4T
         guAWSBVRQsfyZBnqhjEQATV0uSfdPA53DpNwML+7/Ht4NFV5gmVlvcJqk1ltvc+G4+JV
         DhNvqC8VOteQTLVMA98NAjXEDQ/Dg4fYSGSKIDx6xqR2d0aUk1vl2yNqd3fa1Jz18VH1
         IkFk8+9nEBeTurCRxCV4/tNayovrbEwIagV4QgHi7NiqtWgW0RWPMBO6NqLOMYjM60IJ
         +FCI9J2/LgTQ0eFTUpt2rCLW56VxQtTnUyjKVvwMRD5ixCY8XwtbwWN8m6eAqaVYFQR7
         iX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688655593; x=1691247593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzsBfiaUAfVEQalq30krxi6yWfglGX+bSCI+ZD28xpM=;
        b=fLVOyFVJ01S6W+M5Ssckfe75QW9JRvnZ7C4KkDbAHtb9qwsu/tfIZ9xWj3scOFc66p
         Aez2ONSTWvRSKUIjqUJTgHSSRvqtXAB9UCbsRo20r938Ggz1i8nAyuhMWAqddD2lK8n8
         Ojp1CX7SbtqoOhSxzElq2/QwwFwoLHxVcgKvbcuR0dn4iIhVrsY7t9TioFAR8Ggtr9i/
         YdsDaj7j9L+Yt/zu8+PGRGqZHjAHxFG0RSIhi/2850xAnYIkdZ5AiMllL882/pvKe0Ut
         4A8ZoN/saWis/sk+Ti0lhc+jJVfHh4zmcnMxJPx7QueTSyCFt2TadG682ZquDGa+AnCU
         sqyw==
X-Gm-Message-State: ABy/qLZwHCcMR8NjlAJocNe40sgjl6heZVVPEmhnnhcthYkKwO+Romh7
	eD4oYRUsbOnNmcIZmuFNlxHDBog6I1Yk6d+WB3k=
X-Google-Smtp-Source: APBJJlEf7dPBxBJ9aSYo4X+cvIVAiSmcaZXJ71BneM4zt9Ozv+obu+g5vvQX51Q+C03Kbdj67HWF69p6q4k4XDz56i4=
X-Received: by 2002:a4a:4591:0:b0:565:af46:6d28 with SMTP id
 y139-20020a4a4591000000b00565af466d28mr1797693ooa.7.1688655593262; Thu, 06
 Jul 2023 07:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <1623b1e1-d1cb-25a2-f1f1-7c665e766957@gmail.com>
In-Reply-To: <1623b1e1-d1cb-25a2-f1f1-7c665e766957@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jul 2023 07:59:26 -0700
Message-ID: <CAMKF1so3ujbfwb3TxvFkoYo5_gzPbBkKEp-EO_f1BW1f5v9RrQ@mail.gmail.com>
Subject: Re: kirkstone merge request: July 6th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 15:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103682

merged thanks Armin

On Thu, Jul 6, 2023 at 4:23=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit a82d92c8a6525da01524bf8f4a60bf6b35dcbb=
3d:
>
>    ExprTk: Update package to release/0.0.2 (2023-06-19 09:17:01 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 346753705e49a2486867dc150181a1c7f4d69377:
>
>    webserver: nginx: Add stream Signed-off-by: Luke Schaefer
> <lukeschafer17@gmail.com> (2023-07-04 10:20:46 -0400)
>
> ----------------------------------------------------------------
> Beniamin Sandu (1):
>        mbedtls: add support for v3.x
>
> Hitendra Prajapati (3):
>        wireshark: Fix Multiple CVEs
>        libssh: CVE-2020-16135 Fix NULL pointer dereference in sftpserver.=
c
>        yajl: CVE-2023-33460 memory leak in yajl_tree_parse function
>
> Luke Schaefer (1):
>        webserver: nginx: Add stream Signed-off-by: Luke Schaefer
> <lukeschafer17@gmail.com>
>
> Narpat Mali (3):
>        opencv: fix for CVE-2023-2618
>        frr: fix for CVE-2023-31489
>        python3-werkzeug: fix for patch-fuzz
>
> Peter Marko (3):
>        c-ares: backport patch for CVE-2023-31147
>        grpc: ignore CVE-2023-32732
>        ntp: backport patch for 5 CVEs CVE-2023-26551/2/3/4/5
>
> Polampalli, Archana (1):
>        tcpreplay: upgrade 4.4.2 -> 4.4.4
>
> Soumya (1):
>        opensc: Fix CVE-2023-2977
>
> vkumbhar (1):
>        postgresql: fix CVE-2023-2454 & CVE-2023-2455
>
>   ...1-aesce-do-not-specify-an-arch-version-when-enabling-c.patch | 33 ++
>   ...2-aesce-use-correct-target-attribute-when-building-wit.patch | 34 ++
>   meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest  | 17 +
>   meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb   | 83 ++=
++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-31489.patch  | 52 ++
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
>   meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch    | 323
> +++++++++++++
>   meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb             | 9 +
>   .../tcpreplay/{tcpreplay_4.4.2.bb =3D> tcpreplay_4.4.4.bb} |   2 +-
>   .../recipes-support/wireshark/files/CVE-2023-0666.patch         | 122
> +++++
>   .../recipes-support/wireshark/files/CVE-2023-0667.patch         | 66 ++=
+
>   .../recipes-support/wireshark/files/CVE-2023-0668.patch         | 33 ++
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 3 +
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch        | 235
> +++++++++
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch        | 118
> +++++
>   meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb               | 2 +
>   meta-oe/recipes-devtools/grpc/grpc_1.46.7.bb                    | 3 +
>   meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch         | 29 ++
>   meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                     | 4 +-
>   meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31147.patch      | 717
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 1 +
>   meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch      | 44 ++
>   meta-oe/recipes-support/libssh/libssh_0.8.9.bb                  | 4 +-
>   meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch       | 32 ++
>   meta-oe/recipes-support/opencv/opencv_4.5.5.bb                  | 1 +
>   meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch        | 53 ++
>   meta-oe/recipes-support/opensc/opensc_0.22.0.bb                 | 1 +
>   .../python/python3-werkzeug/CVE-2023-23934.patch                | 35 +-
>   meta-webserver/recipes-httpd/nginx/nginx.inc                    | 1 +
>   29 files changed, 2038 insertions(+), 20 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-sp=
ecify-an-arch-version-when-enabling-c.patch
>   create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-corre=
ct-target-attribute-when-building-wit.patch
>   create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
>   create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-31489.patch
>   create mode 100755
> meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch
>   rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.2.bb
> =3D> tcpreplay_4.4.4.bb} (85%)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-0666.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
>   create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.pa=
tch
>   create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31147.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
>   create mode 100644
> meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
>

