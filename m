Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A54DC5472E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 18:21:14 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.59054.1724696469087576703
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 11:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVy3k8ic;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5dca9cc71b2so3337413eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 11:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724696468; x=1725301268; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+kVYjKOQmhf1I1LMii2b9DXECu0iXEImZrsVsk2hsw=;
        b=IVy3k8icvuqMgq71XoNX5OmBY0PGPXz1ZiLUNskoBT2+skJHKCRGy75yM7lVP1G3sZ
         x/hPf9R4SXaH5RodaPk4J5wVp5pZjYqSYiLY+yVld3wGqvMioRQB5tpzB/+0uq0GwIVO
         3Oxjv7awp0+Ry1ToFbmwU7D03jYEf2l/XxuU266Mwbr2+RctePA2mxdHFaxCK3e8T47d
         IfIqvmmRvBS7FHqoJjvI6niFACBzkMPmDNXfG/Iw37VVrJa1Eq01WfKHzL5raXCi8CK6
         OlIvV8Kx2Fh76YTqpI8LcaXI2RWAMKL/mZTQ4oIbCnh6pauhWKaIuQrBkxVy3KpjzRrR
         Q4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724696468; x=1725301268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+kVYjKOQmhf1I1LMii2b9DXECu0iXEImZrsVsk2hsw=;
        b=Ffb9jUBDpWaFyCXyviBlrKlziVUrHPpc2BTIj9WZWFPaib4SIimMPIVqcPZ7cPxS7Q
         P7pyuMp6LB3Wie1fMjGYGd3t4zGnf5bvrtvD4F98mH+yuh1ebfFnHhYEFlfYT0pqVbhA
         wgIQz+d4V5z+qIZ6s/l7z+PZpTqKkEnyp/ZJFWIB9MKHluzgRetO2DwNl7yO4qv10VrY
         Lb13eY2JUkQszjTUYM7crhlW65jOE8W1deHW3yB9sAIlrLUtrCbYoUZxWbj38aRHcxv8
         3fP8dSfbZXRgkbBcFVrhcIA4JdyyqQxHzKSODyHjo3zbhO/qwSaYGbKlkTqxacbsmTGe
         ASWw==
X-Gm-Message-State: AOJu0YxTTQrbmNWFim+aYEqvfKJR8DtI5yOL2/ll7GuBxipQSWCIbgGf
	MbiAVdoHMuOpCkeF64wjdAyjapDTOJ46vsX8Z5TUVVoHGJGIFBZ9nkdazAybl5BGNJ+5YjL7rlC
	TrSnqwR8sLMRncUgWO5e2YtieelChWA==
X-Google-Smtp-Source: AGHT+IEE/II3s24cC4Q4tP3PLriqFTYg7rSy4gw0kswGtP0t4Dq1fRJCpd1BJSPQmmJI4yI1Sk/H7Yse4xHNgzpMALk=
X-Received: by 2002:a05:6820:20c:b0:5da:6795:a808 with SMTP id
 006d021491bc7-5dcc5e9ed53mr12382937eaf.2.1724696468219; Mon, 26 Aug 2024
 11:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <38e13100-d14c-4b90-87a9-e181e7d3690c@gmail.com>
In-Reply-To: <38e13100-d14c-4b90-87a9-e181e7d3690c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Aug 2024 11:20:41 -0700
Message-ID: <CAMKF1soE7pd4gmu-rORzn=OAPrsYG5yS-qLWNYqa0MD6avPFeg@mail.gmail.com>
Subject: Re: scarthgap merge request: Aug 25
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 18:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111968

This is merged, Thanks Armin

On Sun, Aug 25, 2024 at 1:52=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 64c481d017c1b5b5eae619a367a5e8fa00f1b1=
56:
>
>    libjs-jquery-icheck: Correct LIC_FILES_CHKSUM (2024-08-14 10:19:55 -04=
00)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 1235dd4ed4a57e67683c045ad76b6a0f9e896b45:
>
>    python3-twisted: Fix CVE-2024-41671 (2024-08-25 15:15:10 -0400)
>
> ----------------------------------------------------------------
> Adrian Freihofer (1):
>        networkmanager: remove modemmanager rdepends
>
> Ashish Sharma (1):
>        nginx: Backport fix for CVE-2024-7347
>
> Esben Haabendal (1):
>        netplan: add missing runtime dependencies
>
> Peter Marko (2):
>        libndp: Patch CVE-2024-5564
>        squid: patch CVE-2024-37894
>
> Soumya Sambu (2):
>        gtk+: Fix CVE-2024-6655
>        python3-twisted: Fix CVE-2024-41671
>
> Wang Mingyu (1):
>        cjson: upgrade 1.7.17 -> 1.7.18
>
> Yogita Urade (2):
>        poppler: CVE-2024-6239
>        krb5: fix CVE-2024-26458 and CVE-2024-26461
>
>   .../networkmanager/networkmanager_1.46.0.bb |    2 +-
>   .../recipes-daemons/squid/files/CVE-2024-37894.patch            | 36 +
>   meta-networking/recipes-daemons/squid/squid_6.9.bb |    1 +
>   .../meta-python/recipes-connectivity/netplan/netplan_1.0.bb |    1 +
>   .../krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch               | 207
> +++++
>   meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb |    1 +
>   meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch  | 48 +
>   meta-oe/recipes-connectivity/libndp/libndp_1.8.bb |    1 +
>   .../recipes-devtools/cjson/{cjson_1.7.17.bb =3D> cjson_1.7.18.bb} |    =
2 +-
>   meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch             | 40 +
>   meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb |    1 +
>   .../recipes-support/poppler/poppler/CVE-2024-6239-0001.patch    | 1275
> +++++++++++++++++++++++++++
>   .../recipes-support/poppler/poppler/CVE-2024-6239-0002.patch    | 111 +=
++
>   meta-oe/recipes-support/poppler/poppler_23.04.0.bb |    2 +
>   .../python/python3-twisted/CVE-2024-41671-0001.patch            | 89 ++
>   .../python/python3-twisted/CVE-2024-41671-0002.patch            | 251
> ++++++
>   meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb |    5 +
>   meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch  | 34 +
>   meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch  | 52 ++
>   meta-webserver/recipes-httpd/nginx/nginx.inc |    2 +
>   20 files changed, 2159 insertions(+), 2 deletions(-)
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2024-37894.patch
>   create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patc=
h
>   create mode 100644
> meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch
>   rename meta-oe/recipes-devtools/cjson/{cjson_1.7.17.bb =3D>
> cjson_1.7.18.bb} (97%)
>   create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0001.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0002.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.p=
atch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.p=
atch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch
>

