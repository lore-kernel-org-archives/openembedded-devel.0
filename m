Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B14C02181
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 01:42:27 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.1814.1737596544455484433
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 17:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0ofEh1O;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-724d172629eso220465a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 17:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737596544; x=1738201344; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxXIpGXfQbRMJ7sysJfvvnN14Fh2pmfy9vUrvNe5llg=;
        b=I0ofEh1Ou6iSzkLqsaNpurITq3MzCvJd4v8+QHzqsbdO4YGXAGOjS11CLpApIYOHxK
         rSIOFPpFIT7FoxECmoNwu8UC1vW8HRT5hP3UBgge6vR1VPuoaoUbbUTeN5GJyJhwU4TN
         YU8waAbHkAJL9ZQMIelWYjzHT0ak1hInFxipy6EgxT/q4T1z9ArCn7NRiCtOLAKulXNr
         LP48kj+vFE1GJmkSYBOYbmMGK43g1qsa0RJnlKwqUiMsSk7rJ53BiwRuEm9x+E3iDA4p
         w0cpDPBqvW8MSCAYg4Z1GsaoRaBLV/YYFrHf4KDMS4/ESNh7i84w+fQTQ3TqAtVp8rqc
         B+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737596544; x=1738201344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxXIpGXfQbRMJ7sysJfvvnN14Fh2pmfy9vUrvNe5llg=;
        b=cOeFx3BL9pQI415WL5483iszxMOkPgATQOSVCThshiKrz2LOyIdm6X3fefwhP3h6F8
         uhvoUsdhwaBw+pmPJcYBXTKxcKwJnIBlEwjUDMnzZHuYEUsGxq+vJf2AQCK/QPloK2sM
         rbbOTLKf7XJVC6kVKfHsDOZEgqSDjF7aeMMcZYlgNh9u0Rs8uGao4EV1Hw2Iv7Q/5DMp
         w+Yr3ZcNdGwOogk/3OzcpvsEpvWqkkw1mREUoagiffzHPNz0PB7mxFYsJykCdNSl3c1r
         T0ViSr60QIRT3MoIlt8TZFr4R7cSCHXOT39Kzp7ti56SSC4iwnbPTPY5dDzJgzlDzR8n
         UJVw==
X-Gm-Message-State: AOJu0YwgFptUIR5JNpzp9CCW3ji8Nugwx+Xv4PCaJKBrNkd64apHyoAl
	Jv328opgNIBfiEO0VW6LWUJH51Gf3+tGkV/SPlnCa7sRO5A20CnO4fzXI1xKu9c3nuDwCd9J122
	DdEE4LBYbQ6S2xuZwDS/dOmpjDlY=
X-Gm-Gg: ASbGncthHk3L81xhBlni0UlJWQlPQSs6AJuV8zRj4/ujuy7hSsyFaflMSk843jxWCFD
	pJRGQmycA5xIqslJ0Wg/P8D/2EuvP7t2cAxL5V9Z66bSBaE4o3ZlOLyvDPLB3
X-Google-Smtp-Source: AGHT+IGAx4IVGClMmCE4xkfVRRbx4Cmb6lXiOuKOsVKW4QenzbWbQKE9bbGUl5YulCgaaiUQxbpY/p91+53s/y3RFV4=
X-Received: by 2002:a05:6870:ad92:b0:29e:509c:3711 with SMTP id
 586e51a60fabf-2b1c0a27580mr13455646fac.15.1737596543662; Wed, 22 Jan 2025
 17:42:23 -0800 (PST)
MIME-Version: 1.0
References: <8b54fb24-08dd-432c-ae1e-7a10f23eaa3a@gmail.com>
In-Reply-To: <8b54fb24-08dd-432c-ae1e-7a10f23eaa3a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2025 17:41:57 -0800
X-Gm-Features: AbW1kvYfyoDfiPmoGdB1Wv2hkc2mSEb6LRtzyGa5brADceXuL0cDZ4f-Lf6_MRk
Message-ID: <CAMKF1sp40gHgD=7uZZGh4gS30KuaPnG7mdJeFXvDqiRpcibQzw@mail.gmail.com>
Subject: Re: scarthgap merge request: Jan 22nd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 01:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115026

merged thanks Armin.

On Wed, Jan 22, 2025 at 4:07=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 5f9f741193f55bb4bb3c974e913d169dd23e40=
d3:
>
>    ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native
> (2025-01-05 16:46:47 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to dda0d53326017d6758ec6bdfdaf2f484c089d13f:
>
>    gphoto2: Fix contains reference to TMPDIR [buildpaths] warning
> (2025-01-20 19:46:16 -0500)
>
> ----------------------------------------------------------------
> Divya Chellam (1):
>        nginx: upgrade 1.25.3 -> 1.25.4
>
> Hieu Van Nguyen (1):
>        gphoto2: Fix contains reference to TMPDIR [buildpaths] warning
>
> Jiaying Song (1):
>        chrony: fix do_fetch error
>
> Mingli Yu (2):
>        asio: Add ptest support
>        ptest-packagelists-meta-oe.inc: Add asio
>
> Peter Marko (2):
>        thrift: fix c++ generated code compilation with clang
>        grpc: patch CVE-2024-11407
>
> Preeti Sachan (1):
>        bpftool: fix libelf.h not found error
>
> Robert Yang (1):
>        hostapd: Add CVE id to CVE-2024-3596_00.patch
>
> Shubham Pushpkar (1):
>        wireshark 4.2.7: Fix CVE-2024-9781
>
> Soumya Sambu (2):
>        python3-django: upgrade 4.2.16 -> 4.2.17
>        python3-django: upgrade 5.0.9 -> 5.0.10
>
> Vijay Anusuri (1):
>        php: upgrade 8.2.24 -> 8.2.26
>
> Xiangyu Chen (1):
>        crash: fix crash cannot work with kaslr
>
> Zhang Peng (2):
>        glade: fix CVE-2020-36774
>        opensc: fix CVE-2024-8443
>
> gudnimar (1):
>        pipewire: upgrade 1.0.5 -> 1.0.9
>
>   .../pipewire/{pipewire_1.0.5.bb =3D> pipewire_1.0.9.bb} |   2 +-
>   meta-networking/recipes-support/chrony/chrony_4.5.bb            | 2 +-
>   .../recipes-support/wireshark/files/CVE-2024-9781.patch         | 133
> ++++++
>   meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb    | 1 +
>   meta-oe/conf/include/ptest-packagelists-meta-oe.inc             | 1 +
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch | 1 +
>   .../recipes-connectivity/thrift/thrift/0001-thrift-pr2755.patch | 599
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb            | 4 +-
>   meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch       | 54 ++=
+
>   meta-oe/recipes-devtools/glade/glade_3.22.2.bb                  | 1 +
>   meta-oe/recipes-devtools/grpc/grpc/CVE-2024-11407.patch         | 32 ++
>   meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb                    | 1 +
>   meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.bb} |   2 +=
-
>   meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb              | 3 +
>   meta-oe/recipes-kernel/bpftool/bpftool.bb                       | 2 +-
>   meta-oe/recipes-kernel/crash/crash.inc                          | 1 +
>   .../0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch    | 89 ++=
+++
>   .../asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch   | 37 ++
>   meta-oe/recipes-support/asio/asio/run-ptest                     | 19 +
>   meta-oe/recipes-support/asio/asio_1.30.2.bb                     | 19 +-
>   meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch   | 60 ++=
+
>   meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch   | 55 ++=
+
>   meta-oe/recipes-support/opensc/opensc_0.25.1.bb                 | 2 +
>   .../{python3-django_4.2.16.bb =3D> python3-django_4.2.17.bb} |   4 +-
>   .../{python3-django_5.0.9.bb =3D> python3-django_5.0.10.bb} |   2 +-
>   .../recipes-httpd/nginx/{nginx_1.25.3.bb =3D> nginx_1.25.4.bb} |   2 +-
>   26 files changed, 1117 insertions(+), 11 deletions(-)
>   rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.5.bb
> =3D> pipewire_1.0.9.bb} (99%)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
>   create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/0001-thrift-pr2755.patch
>   create mode 100644
> meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
>   create mode 100644 meta-oe/recipes-devtools/grpc/grpc/CVE-2024-11407.pa=
tch
>   rename meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.bb} =
(99%)
>   create mode 100644
> meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kas=
lr-detection.patch
>   create mode 100644
> meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.c=
pp.patch
>   create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch
>   rename meta-python/recipes-devtools/python/{python3-django_4.2.16.bb
> =3D> python3-django_4.2.17.bb} (63%)
>   rename meta-python/recipes-devtools/python/{python3-django_5.0.9.bb =3D=
>
> python3-django_5.0.10.bb} (56%)
>   rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.3.bb =3D>
> nginx_1.25.4.bb} (74%)

