Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF5CC3DA6E
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 01:56:32 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.33133.1702864582666498764
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Dec 2023 17:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TPrpysO0;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1eb39505ba4so1648481fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 17:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702864582; x=1703469382; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9h2NpBi0tVNQPJLnP6LMslk9yAP9BGpmBBRe7PQ+Ic=;
        b=TPrpysO0xmZGrVvXY0dQKSTC0niExWvdzjhsXL7soaq4d02uxLrHTFdl56LcIKt8U0
         bfn0NqfVMqEI/W9rELxnE3DTWW37NOFcgxT9Ob7fDLubj4P+HZoszTJKs1gg7cbj19+q
         Og6YAkLzlXQ/VokUmD0dqwqWygmGeVvf5pp8cu6itS+s1c8JNKw4zxjg738i2UuYnEjM
         xZPkbvEBfR1lE7Uxsr9x3KosIVzlRZXHogsi+JoofAo2uRZjd770NZzVo9VvuznYZZHe
         PuyG6yGvODmd8ML2ZegeEnFRidFfULE5ygo+QmSaWnkOyJKN1VpCuKaTZyInp05UnGGj
         yi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702864582; x=1703469382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9h2NpBi0tVNQPJLnP6LMslk9yAP9BGpmBBRe7PQ+Ic=;
        b=BIFkzgih8RUu3T1cC4OJD5XnPiEsVVnemSKB6IY7ywGFGEycd0OY5brtOEcybheUpk
         4Pf8CyCuR6yGjMLjIF8RyhUIsGyl4Ub4XJa1P9tywiw0EOwaM7dU28ffdYXNmw0ekbek
         ADziN0YU0xg2aDbPgEEP25eM0D/peaANQMGYC2ijzQ6GRqAHY2oadp9DrURujxJjJuHF
         AN/nmUB915LXLD9KUMK17za7bZQKf97466hCYfPWLkSKaq1Fhw0lzeN2tplXYg6U5/Fj
         SFCxvElOjjKcw6RCO3mlCoJ1yvjdiUgP0EUvzy0kR7t2DniPM+O+2ztqvP5R4nIEkD/p
         GBWA==
X-Gm-Message-State: AOJu0Yz3OIyocs2/2dTU2gv6ni+R8IaOKK9S7ejP3JPitYqk/zjf9NUv
	BiH6UwaEcafLGZv50NnpMaH/eekMfaFEJjvJLIg=
X-Google-Smtp-Source: AGHT+IGOn6k89PlhEQptR33n5hyEKdT5ktKBrBKfW4/SUk6tkoWMxTvvXN+vamqhwAzkEZMWdII5YabOCep+KaMHSro=
X-Received: by 2002:a05:6870:1711:b0:1fb:75b:99bb with SMTP id
 h17-20020a056870171100b001fb075b99bbmr17912997oae.106.1702864581878; Sun, 17
 Dec 2023 17:56:21 -0800 (PST)
MIME-Version: 1.0
References: <e1bc65d1-660e-4430-9adf-2d63989b2fe1@gmail.com>
In-Reply-To: <e1bc65d1-660e-4430-9adf-2d63989b2fe1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Dec 2023 17:55:55 -0800
Message-ID: <CAMKF1srf7iCR6mWdt2dEvfFAiGArvt+DezJ2qno7mmEtP79EMg@mail.gmail.com>
Subject: Re: dunfell merge request: Dec 17th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 01:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107540

merged thanks Armin

On Sun, Dec 17, 2023 at 12:45=E2=80=AFPM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 9135c7ea7350d5d241f4afc3b28087122ebe2d=
19:
>
>    glmark2: fix compatibility with python-3.11 (2023-11-12 10:42:03 -0500=
)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to fc632d5bb0936e91e4e0191547b9aa8ca47b4ffe:
>
>    wireshark: fix CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka
> protocol) dissector infinite loops (2023-12-17 15:36:42 -0500)
>
> ----------------------------------------------------------------
> Ashish Sharma (1):
>        apache2: Backport fix for CVE-2023-45802
>
> Bartosz Golaszewski (1):
>        python3-cson: fix run-time dependencies
>
> Davide Gardenal (2):
>        usrsctp: add CVE_VERSION to correctly check for CVEs
>        openflow: ignore CVE-2018-1078
>
> Frieder Schrempf (1):
>        spirv-tools: Use main branch for all repos
>
> Hitendra Prajapati (3):
>        wireshark: Fix CVE-2022-0585-CVE-2023-2879
>        php: CVE-2022-4900 fix potential buffer overflow
>        samba: fix CVE-2023-42669 denial of service
>
> Jasper Orschulko (1):
>        nginx: Mitigate HTTP/2 Stream Resets Flood impact
>
> Khem Raj (2):
>        emlog: Add PV
>        meta-python-image,meta-python-ptest-image: Use python3 packagegrou=
ps
>
> Richard Purdie (3):
>        meta-oe: Drop broken BBCLASSEXTEND variants
>        meta-perl: Drop broken BBCLASSEXTEND variants
>        meta-python: Drop broken BBCLASSEXTEND variants
>
> Vijay Anusuri (1):
>        traceroute: upgrade 2.1.0 -> 2.1.3
>
> Yoann Congal (2):
>        emlog: ignore inapplicable CVEs
>        libusbmuxd: Add PV
>
> vkumbhar (2):
>        squid: fix CVE-2023-46847 Denial of Service in HTTP Digest
> Authentication
>        wireshark: fix CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka
> protocol) dissector infinite loops
>
>   .../recipes-connectivity/samba/samba/CVE-2023-42669.patch       | 93
> ++++++++++++++++++
>   meta-networking/recipes-connectivity/samba/samba_4.10.18.bb     | 1 +
>   .../recipes-daemons/squid/files/CVE-2023-46847.patch            | 47
> ++++++++++
>   meta-networking/recipes-daemons/squid/squid_4.9.bb              | 1 +
>   meta-networking/recipes-protocols/openflow/openflow.inc         | 4 +
>   meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb        | 2 +
>   .../traceroute/{traceroute_2.1.0.bb =3D> traceroute_2.1.3.bb} |   3 +-
>   .../wireshark/files/CVE-2022-0585-CVE-2023-2879.patch           | 93
> ++++++++++++++++++
>   .../recipes-support/wireshark/files/CVE-2022-4345.patch         | 52
> ++++++++++
>   meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb   | 2 +
>   .../dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb | 2 -
>   meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb           | 2 -
>   meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb               | 3 -
>   meta-oe/recipes-core/emlog/emlog.inc                            | 2 +-
>   meta-oe/recipes-core/emlog/emlog_git.bb                         | 13 ++=
+
>   meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb                 | 2 +-
>   meta-oe/recipes-devtools/php/php/CVE-2022-4900.patch            | 48
> ++++++++++
>   meta-oe/recipes-devtools/php/php_7.4.33.bb                      | 1 +
>   meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb     | 1 +
>   meta-oe/recipes-graphics/spir/spirv-tools_git.bb                | 6 +-
>   meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb               | 2 -
>   meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb             | 2 -
>   meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb             | 1 -
>   meta-oe/recipes-printing/cups/cups-filters.inc                  | 8 --
>   .../recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb     | 2 +-
>   meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb     | 2 -
>   meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb           | 2 -
>   meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb          | 2 -
>   meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 2 -
>   meta-python/recipes-core/images/meta-python-image.bb            | 3 +-
>   meta-python/recipes-core/images/meta-python-ptest-image.bb      | 2 +-
>   meta-python/recipes-devtools/python/python-pint.inc             | 2 -
>   meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb      | 2 -
>   meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb | 2 -
>   meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb     | 2 -
>   meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb   | 2 -
>   .../python/python3-robotframework-seriallibrary_0.3.1.bb        | 2 -
>   meta-python/recipes-extended/python-cson/python3-cson_git.bb    | 3 +-
>   .../recipes-httpd/apache2/apache2/CVE-2023-45802.patch          | 141
> ++++++++++++++++++++++++++++
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb          | 1 +
>   .../files/0001-HTTP-2-per-iteration-stream-handling-limit.patch | 92
> ++++++++++++++++++
>   meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb              | 1 +
>   meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb              | 2 +
>   43 files changed, 605 insertions(+), 53 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch
>   rename meta-networking/recipes-support/traceroute/{traceroute_2.1.0.bb
> =3D> traceroute_2.1.3.bb} (92%)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2022-0585-CVE-2023-28=
79.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch
>   create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2022-4900.patch
>   create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-iteration-stream=
-handling-limit.patch
>

