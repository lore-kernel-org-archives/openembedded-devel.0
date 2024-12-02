Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD197D4979C
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 04:37:56 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.166230.1733114270958044970
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Dec 2024 20:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CdvT6Z+E;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5f1e573e65dso928204eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Dec 2024 20:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733114270; x=1733719070; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyND947hiaV3UFMOeIXvCqmylipmMJZ4OAKJjCT34pU=;
        b=CdvT6Z+EAJbrA4artxsU0jbthdtjDGkVE5LMMXarwGkqs7irisW2XbP9HsCfBwv82k
         R+WUVASni21apTkuJH6RTGwGfIK6CSLtvMotX/leS0VJOcNHm5+vXoWPsQktmdiGFZTO
         eV8sfNqiYT2JDKoSUTEczsClKw1+/97c7RfsklD1aNAEaNh/nSmPSMd7/2kcvXDZc3xr
         J0RcfTBn+/76l9zQilCAX5RG9gfmVmMdtiUQ14QdnW3s4LXXLJWJ4aOLWEVXFD9XaCCn
         rGyOyx503H1WZ5+DkAOqqZSNmH5N2DUB4nt+6g5Skceqh3RwoLbcKoy0NZIPIGBAhCbm
         oy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733114270; x=1733719070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyND947hiaV3UFMOeIXvCqmylipmMJZ4OAKJjCT34pU=;
        b=ncgaOrdcJePKspFkkVtGV+nZqjdVVAraQY5mtzm7wowIdgAxoBt4kNItqpMNqUWLDI
         q5WbAsXkiHGsdhR3Ve2OW+Z3WRbndy5DCIg4+tl9eHNNoG71Wi5VpU4r0K451bqDvgkb
         kI4UV9vcmxMUj+XIVOt5C6h+zl2nskVC03Ot9K3ZX3DyObl3IwKe8iwEfStXkdoKWj9J
         YyDXrPfn/3CQAxtgab5duZZ3dmd6RWeXIGUAwrqpEnMXEU/J7XtB9AePFwvWB98k6+CO
         Af60RwnQupV6nrSspY9O6whGP+HrVTGfv3HWSA74iLOyf5PGBx+9DFKEIQl1WjgzgOL9
         eFtA==
X-Gm-Message-State: AOJu0Ywdt5mM2G9BxXCl1vC9JS55lhsMiJdWsEvcZOee03+rH7/VwbFc
	l/7W/TuuUReO+2wGhU83ZtTdvMyhLyYK60J/FR65xgCsfZzWEJCkXKSkc/qSBU23sA7g6ka65TN
	bFPxDZQwd5PwuBSLks+h5uQeOABU=
X-Gm-Gg: ASbGncvaBLYmgio56CtqmFbzIxp4ZYqoQEapwSi27col94brCaeroCRNGSGe0Yq52bd
	7KxQ5U4wdQ/Doc9REEsimHJL3Zb4jbwkBOPhLknIS59c3KQ==
X-Google-Smtp-Source: AGHT+IHsS7MF3omoLm5gkksLbX6jBctOpFzVzWb+tRzXlh46DlhJdSR7PQ7dgyxbH1+4DGVLrvqn6xSFBdF1tInDA3M=
X-Received: by 2002:a05:6830:6504:b0:71d:5f1b:28c2 with SMTP id
 46e09a7af769-71d65c8b28fmr17954170a34.9.1733114270111; Sun, 01 Dec 2024
 20:37:50 -0800 (PST)
MIME-Version: 1.0
References: <f632f166-e22c-4dac-8bd2-2cd2538287bc@gmail.com>
In-Reply-To: <f632f166-e22c-4dac-8bd2-2cd2538287bc@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Dec 2024 20:37:24 -0800
Message-ID: <CAMKF1soUS+4x+8ZFOiOOKtV0QUa056ns8HQ05VM3rmXxb2eG3w@mail.gmail.com>
Subject: Re: scathgap merge request: Dec 1st
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 04:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114132

merged thanks Armin

On Sun, Dec 1, 2024 at 3:18=E2=80=AFPM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 2e3126c9c16bb3df0560f6b3896d01539a3bfa=
d7:
>
>    xmlrpc-c: update SRCREV (2024-10-15 16:59:45 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to b8d1a14f7f3b76457c36752202ea7ae5881b6654:
>
>    freeradius: upgrade 3.2.3 -> 3.2.5 (2024-11-24 17:38:31 -0500)
>
> ----------------------------------------------------------------
> Chen Qi (1):
>        graphviz: remove obsolete and problematic patch
>
> Haixiao Yan (2):
>        openvpn: fix CVE-2024-28882
>        openvpn: upgrade 2.6.10 -> 2.6.12
>
> J. S. (1):
>        nodejs: cleanup
>
> Jiaying Song (8):
>        debootstrap: fix do_fetch error
>        wireguard-tools: fix do_fetch error
>        vlock: fix do_fetch error
>        openipmi: upgrade 2.0.34->2.0.36
>        tcpreplay: fix CVE-2023-43279
>        xfce-dusk-gtk3: fix do_fetch error
>        eject: fix do_fetch error
>        libdev-checklib-perl: fix do_fetch error
>
> Justin Bronder (1):
>        python3-xmodem: replace hardcoded /usr with ${prefix}
>
> Peter Marko (3):
>        nss: patch CVE-2024-6602
>        nss: patch CVE-2024-6609
>        squid: conditionally set status of CVE-2024-45802
>
> Sana Kazi (1):
>        libp11: Treat all openssl-3.x releases the same
>
> Virendra Thakur (1):
>        opensc: Fix multiple cve CVE-2024-45615-45616-45617-45618-45619-45=
620
>
> Yi Zhao (2):
>        mbedtls: upgrade 3.6.1 -> 3.6.2
>        freeradius: upgrade 3.2.3 -> 3.2.5
>
>   .../freeradius/{freeradius_3.2.3.bb =3D> freeradius_3.2.5.bb} |    2 +-
>   .../mbedtls/{mbedtls_3.6.1.bb =3D> mbedtls_3.6.2.bb} |    2 +-
>   meta-networking/recipes-daemons/squid/squid_6.9.bb |    6 +
>   .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb |    2 +-
>   .../openipmi/{openipmi_2.0.34.bb =3D> openipmi_2.0.36.bb} |    2 +-
>   .../openvpn/{openvpn_2.6.10.bb =3D> openvpn_2.6.12.bb} |    2 +-
>   .../recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch    | 39 +
>   meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb |    1 +
>   meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb |    2 +-
>   .../nodejs/nodejs/0001-build-fix-build-with-Python-3.12.patch   | 55 --
>   .../nodejs/nodejs/0001-gyp-resolve-python-3.12-issues.patch     | 63 --
>   meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb |    2 +-
>   meta-oe/recipes-extended/vlock/vlock_2.2.3.bb |    2 +-
>   ...0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch | 33 -
>   meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb |    4 -
>   meta-oe/recipes-support/eject/eject_2.1.5.bb |    2 +-
>   .../libp11/files/0001-detect-correct-openssl-3.x.patch          | 28 +
>   meta-oe/recipes-support/libp11/libp11_0.4.12.bb |    5 +-
>   meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch             | 65 ++
>   meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch             | 30 +
>   meta-oe/recipes-support/nss/nss_3.98.bb |    2 +
>   .../files/0001-PR-Fixes-for-uninitialized-memory-issues.patch   | 1268
> +++++++++++++++++++++++++++
>   meta-oe/recipes-support/opensc/opensc_0.25.1.bb |    4 +-
>   meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb |    4 +-
>   meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb |    2 +-
>   25 files changed, 1458 insertions(+), 169 deletions(-)
>   rename
> meta-networking/recipes-connectivity/freeradius/{freeradius_3.2.3.bb =3D>
> freeradius_3.2.5.bb} (99%)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.1.bb
> =3D> mbedtls_3.6.2.bb} (98%)
>   rename meta-networking/recipes-support/openipmi/{openipmi_2.0.34.bb =3D=
>
> openipmi_2.0.36.bb} (98%)
>   rename meta-networking/recipes-support/openvpn/{openvpn_2.6.10.bb =3D>
> openvpn_2.6.12.bb} (97%)
>   create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
>   delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Python-3=
.12.patch
>   delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12-issue=
s.patch
>   delete mode 100644
> meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-s=
tring-if-tcl-is-disabled.patch
>   create mode 100644
> meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patc=
h
>   create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch
>   create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/0001-PR-Fixes-for-uninitialized-memo=
ry-issues.patch
>

