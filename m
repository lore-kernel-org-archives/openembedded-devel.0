Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3B4EEF30A
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 06:16:00 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38328.1772691353499159292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 22:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A4cyw0nj;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ca1ba0089so6796744d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 22:15:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772691352; cv=none;
        d=google.com; s=arc-20240605;
        b=UCcNiyWDwS9GGb5+5zv+ni50TaKUOVk4PJQO0f7OTr2FHS58lZGdAoHS8IpEJNweNa
         UsgslhfskQyv7CMUJgGrNsFfSOP+GEQkaFdd0opaQhqszPrecMOIY54jQW7Zze3oqHS7
         e4oUX78/H3PL21l6bbC//APzf72DHihvhJtf1x5+9c2de3PfnBwepVNbIxtuhkqjSKjm
         4pQcFrh3XGTpbAxLQ+E6s7POhsaxDnBEQ9W6wowDUR8tR+uP8y9XKS6dvYwjwk6YmCOC
         dcDCj9Y/sDHZydInodPkEVsxtzpXylZ7+pn+fhkYZg/HtmYK7DgoHBBc3PicFNYmDVRz
         SXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cJmnGD5mYJTAEPS67N0BQovIBtmmF2UhQrT2jThqeTg=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=HOzvzzWg4S5/yBAdinN8xEGBH7zUhDK/G6nd8YkEFT4vNseVruzqv4hvRg9Y+PTsFA
         2mpX4pvSMeTI/PCnYr0Ihrs6xExwu1QnXVTnJCZt7Losbob8rO03UdXqveV7r0BclJbi
         KXXkzkLMs1jVgyZM+fd66CV/iPRBL7gNhZr1zLF5jAjImDC7gRprGyPpDhqSsyyjR6yN
         o5XmZiF7EMDk1/X0RC3ByAw+2wJ45qHngLchzvpDPjRq0gwOVwefHoO6bpAubOeovQ1n
         CydhA3Z3k6KeFfvtIAVHH7sgYzCYeUEU5Oc52RGwwAzshjsK3vI7w5dGVZ5uUX4haKf8
         sBTQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772691352; x=1773296152; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cJmnGD5mYJTAEPS67N0BQovIBtmmF2UhQrT2jThqeTg=;
        b=A4cyw0njJxpKamiKJ7L5ym2h2TqLyIcGTuTEp6UhdKouGlzXaNbO87KO3SOI8bwiyQ
         ek7OBQbx5/7q07M3IbTVuJXE5xD4uaz5Lml40UKon3Ie5xzrzTrLXogvUO7PUUnmq2hb
         Bw0pb/kqJPdyiA5cnxmcDlnVC7UjfHwRfNsCaZ1cSCLy4cVE2uh0A5q9fH+VsYsjQy0Z
         6mD7It95uQWVQ7P9HOsG/bh9gdbD6s+p+0KEWIA4dbYD8r4Kqh+yr1AsYbJ1ansv1VyJ
         gd3b/jykbcdiRBMEPn/eri4yqtNVnSxpeHqBRAJVjfEIU7MUdR5xdsI6K+a21iNYdW89
         O5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691352; x=1773296152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJmnGD5mYJTAEPS67N0BQovIBtmmF2UhQrT2jThqeTg=;
        b=D6kWXfwldLb9Ned2Y90ahgcRA62j8H76mFDEf+ArKoYBRhXflWz6+UpeReHiSOgksV
         ECFt6Ojgu5EQamcs15uA1itwBNi7+TUu+P6+476Ph3gAsz98jwlgoAHMXJhvYmH1EjuM
         wri4nE1gSVZJDPjZBVwH5g8z8vFz71FmSlhH8YRfISHnaMFT0NgMU6SzfwdmYgFaEoxu
         3bGjC6u3TviPDt/DMHXxjTgmr/bRySN52S91cNZcUgloReBpxEJO+yrjyn+HhYDfPhU/
         zYWRvBIg9hNj4jbW9NkagbjPyeIPJEhM1gOeOk2OnNEVYrBhqCYpujkL6qeQQSTtWL2T
         iS2w==
X-Gm-Message-State: AOJu0Ywf0yWseH/8G23SrAja/zl95a+a3f0CRNMyAMAByR1TK/ksrdqT
	dPTYHyJkAAzXrEI2CbJOkTeoetu9Rq1HhiJBWTaxYeMKdV8bRo9RjTkDkAR0BuASMjvUUKb7txt
	pUjnsY7agz/6JoeeWITlu7sY1fIQevYk=
X-Gm-Gg: ATEYQzzmZu9J1hgDLRyMYTYHdJjdf7VX/ja8FZS3q3mcWmUbJhaXxYeQzSrZczDVp2x
	nDKsnC/thv/umf2JrO5ztGveNQ/UHeNkv0N6aKoiLh8oOPdoWPq8KQe4VeO/liop8lR1fUDv0U3
	OEe51jv3bGyjHdHFl6/LFOhUYBpmUWPnuGqIRYKMcO1NSykXTBk+E4+hvgJL/oZxUHxkxY2e5+L
	IDRY0ue/y7osvX2wR8+AhGYpC9vf5ogCh61vKAHgM5EvuRrrCkb282ndoABnCfFa5X83BF7x1GU
	gY0l6DfFq+pdkkqH9Yng9stIjMcnpE7ZNk+8S0TqnJMtN3qWM+FpF4TWywrlIoflrRLytL7iQ+Q
	gFyFEeyxreqgHNuXVhIzE5ZZM
X-Received: by 2002:a05:690e:134b:b0:64c:ed5a:d1bc with SMTP id
 956f58d0204a3-64cf9ba362dmr3388361d50.45.1772691352467; Wed, 04 Mar 2026
 22:15:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772625156.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1772625156.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Mar 2026 22:15:25 -0800
X-Gm-Features: AaiRm53W5uNj34NSrWKajltNAob_x_Oc27OjTsMaM3cnF62UkVhGKcAddr3ZTA4
Message-ID: <CAMKF1srODGU-bO3cfRCX2G-vJJvJnKuOUP1_tdS+GPMro7jqDA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/12] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c3c58064c40dea5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124860

--0000000000005c3c58064c40dea5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Anuj, looks good. Installed.

On Wed, Mar 4, 2026 at 4:39=E2=80=AFAM Anuj Mittal via lists.openembedded.o=
rg
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested locally with
> qemuarm/qemux86-64/qemuarm64 and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1333
>
>
> The following changes since commit
> ec0469748be4159fb83fb0fa0148d786484c88cf:
>
>   nodejs: fix gcc compile failed for 32 bit arm target (2026-02-12
> 15:59:04 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> Alexandre Truong (1):
>   source-han-sans-*-fonts: rename downloaded files in SRC_URI
>
> Anil Dongare (1):
>   wireshark 4.2.14: Fix CVE-2026-0962
>
> Ankur Tyagi (1):
>   dovecot: ignore CVE-2025-30189
>
> Anuj Mittal (1):
>   README: update listed maintainer
>
> Daniel Klauer (1):
>   nbench-byte: Fix sysinfo generation in parallel build
>
> Geoff Parker (1):
>   python3-m2crypto: fix python3-m2crypto-native do_configure:prepend()
>
> Gyorgy Sarvari (1):
>   nginx: patch CVE-2026-1642
>
> Martin Jansa (1):
>   nodejs: add missing Upstream-Status
>
> Peter Marko (1):
>   fcgi: add follow-up patch for CVE-2025-23016
>
> Tafil Avdyli (1):
>   python3-pybind11-json: fix Targets.cmake trying to reference host
>
> Vijay Anusuri (1):
>   postgresql: upgrade 16.11 -> 16.12
>
> Yoann Congal (1):
>   polkit: Switch PAM files to common-*
>
>  README.md                                     |   2 +-
>  meta-filesystems/README.md                    |   2 +-
>  meta-gnome/README.md                          |   2 +-
>  meta-initramfs/README.md                      |   2 +-
>  meta-multimedia/README.md                     |   2 +-
>  meta-networking/MAINTAINERS                   |   2 +-
>  meta-networking/README.md                     |   2 +-
>  .../dovecot/dovecot_2.3.21.1.bb               |   1 +
>  .../wireshark/files/CVE-2026-0962.patch       | 152 ++++++++++++++++++
>  .../wireshark/wireshark_4.2.14.bb             |   1 +
>  meta-oe/README.md                             |   2 +-
>  ...sysinfo-generation-in-parallel-build.patch |  69 ++++++++
>  .../sysinfo.sh-Fix-typo-in-rm-command.patch   |  27 ++++
>  .../nbench-byte/nbench-byte_2.2.3.bb          |   4 +-
>  ...c-bypass-autoconf-2.69-version-check.patch |   2 +-
>  ...ostgresql_16.11.bb =3D> postgresql_16.12.bb} |   4 +-
>  ...ert-stop-using-deprecated-ares_query.patch |   1 +
>  ...pport-openembedded-OS-for-PAM-config.patch |  48 ++++++
>  meta-oe/recipes-extended/polkit/polkit_124.bb |   5 +
>  .../source-han-sans-cn-fonts_2.004.bb         |   2 +-
>  .../source-han-sans-jp-fonts_2.004.bb         |   2 +-
>  .../source-han-sans-kr-fonts_2.004.bb         |   2 +-
>  .../source-han-sans-tw-fonts_2.004.bb         |   2 +-
>  meta-perl/README.md                           |   2 +-
>  meta-python/README.md                         |   2 +-
>  .../python/python3-m2crypto_0.40.1.bb         |   2 +-
>  ...p-PYTHON_INCLUDE_DIRS-from-interface.patch |  34 ++++
>  .../python/python3-pybind11-json_0.2.13.bb    |   3 +-
>  meta-webserver/README.md                      |   2 +-
>  .../nginx/files/CVE-2026-1642.patch           |  46 ++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
>  ...25-23016.patch =3D> CVE-2025-23016-01.patch} |   0
>  .../fcgi/fcgi/CVE-2025-23016-02.patch         |  83 ++++++++++
>  .../recipes-support/fcgi/fcgi_git.bb          |   3 +-
>  meta-xfce/README.md                           |   2 +-
>  35 files changed, 495 insertions(+), 23 deletions(-)
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch
>  create mode 100644
> meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-ge=
neration-in-parallel-build.patch
>  create mode 100644
> meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-=
rm-command.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.11.bb =3D>
> postgresql_16.12.bb} (75%)
>  create mode 100644
> meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS=
-for-PAM-config.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pybind11-json/0001-CMakeLists=
-drop-PYTHON_INCLUDE_DIRS-from-interface.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
>  rename meta-webserver/recipes-support/fcgi/fcgi/{CVE-2025-23016.patch =
=3D>
> CVE-2025-23016-01.patch} (100%)
>  create mode 100644
> meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-02.patch
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124849):
> https://lists.openembedded.org/g/openembedded-devel/message/124849
> Mute This Topic: https://lists.openembedded.org/mt/118131078/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005c3c58064c40dea5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Anuj, looks good. Installed.</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Mar 4, 2026 at 4:39=E2=80=AFAM Anuj Mittal via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=
=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Please merge these changes in scarthgap. Tested locally wit=
h<br>
qemuarm/qemux86-64/qemuarm64 and on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1333" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1333</a><br>
<br>
<br>
The following changes since commit ec0469748be4159fb83fb0fa0148d786484c88cf=
:<br>
<br>
=C2=A0 nodejs: fix gcc compile failed for 32 bit arm target (2026-02-12 15:=
59:04 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
Alexandre Truong (1):<br>
=C2=A0 source-han-sans-*-fonts: rename downloaded files in SRC_URI<br>
<br>
Anil Dongare (1):<br>
=C2=A0 wireshark 4.2.14: Fix CVE-2026-0962<br>
<br>
Ankur Tyagi (1):<br>
=C2=A0 dovecot: ignore CVE-2025-30189<br>
<br>
Anuj Mittal (1):<br>
=C2=A0 README: update listed maintainer<br>
<br>
Daniel Klauer (1):<br>
=C2=A0 nbench-byte: Fix sysinfo generation in parallel build<br>
<br>
Geoff Parker (1):<br>
=C2=A0 python3-m2crypto: fix python3-m2crypto-native do_configure:prepend()=
<br>
<br>
Gyorgy Sarvari (1):<br>
=C2=A0 nginx: patch CVE-2026-1642<br>
<br>
Martin Jansa (1):<br>
=C2=A0 nodejs: add missing Upstream-Status<br>
<br>
Peter Marko (1):<br>
=C2=A0 fcgi: add follow-up patch for CVE-2025-23016<br>
<br>
Tafil Avdyli (1):<br>
=C2=A0 python3-pybind11-json: fix Targets.cmake trying to reference host<br=
>
<br>
Vijay Anusuri (1):<br>
=C2=A0 postgresql: upgrade 16.11 -&gt; 16.12<br>
<br>
Yoann Congal (1):<br>
=C2=A0 polkit: Switch PAM files to common-*<br>
<br>
=C2=A0README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta-filesystems/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta-gnome/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta-initramfs/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta-multimedia/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-networking/MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-networking/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../dovecot/<a href=3D"http://dovecot_2.3.21.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">dovecot_2.3.21.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../wireshark/files/CVE-2026-0962.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
52 ++++++++++++++++++<br>
=C2=A0.../wireshark/<a href=3D"http://wireshark_4.2.14.bb" rel=3D"noreferre=
r" target=3D"_blank">wireshark_4.2.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta-oe/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...sysinfo-generation-in-parallel-build.patch |=C2=A0 69 ++++++++<br>
=C2=A0.../sysinfo.sh-Fix-typo-in-rm-command.patch=C2=A0 =C2=A0|=C2=A0 27 ++=
++<br>
=C2=A0.../nbench-byte/<a href=3D"http://nbench-byte_2.2.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">nbench-byte_2.2.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0...c-bypass-autoconf-2.69-version-check.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ostgresql_16.11.bb" rel=3D"noreferrer" target=3D=
"_blank">ostgresql_16.11.bb</a> =3D&gt; <a href=3D"http://postgresql_16.12.=
bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.12.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0...ert-stop-using-deprecated-ares_query.patch |=C2=A0 =C2=A01 +<br>
=C2=A0...pport-openembedded-OS-for-PAM-config.patch |=C2=A0 48 ++++++<br>
=C2=A0meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_124.bb" rel=
=3D"noreferrer" target=3D"_blank">polkit_124.bb</a> |=C2=A0 =C2=A05 +<br>
=C2=A0.../<a href=3D"http://source-han-sans-cn-fonts_2.004.bb" rel=3D"noref=
errer" target=3D"_blank">source-han-sans-cn-fonts_2.004.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../<a href=3D"http://source-han-sans-jp-fonts_2.004.bb" rel=3D"noref=
errer" target=3D"_blank">source-han-sans-jp-fonts_2.004.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../<a href=3D"http://source-han-sans-kr-fonts_2.004.bb" rel=3D"noref=
errer" target=3D"_blank">source-han-sans-kr-fonts_2.004.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../<a href=3D"http://source-han-sans-tw-fonts_2.004.bb" rel=3D"noref=
errer" target=3D"_blank">source-han-sans-tw-fonts_2.004.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-perl/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-python/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-m2crypto_0.40.1.bb" rel=3D"noref=
errer" target=3D"_blank">python3-m2crypto_0.40.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...p-PYTHON_INCLUDE_DIRS-from-interface.patch |=C2=A0 34 ++++<br>
=C2=A0.../python/<a href=3D"http://python3-pybind11-json_0.2.13.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-pybind11-json_0.2.13.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0meta-webserver/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../nginx/files/CVE-2026-1642.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 46 ++++++<br>
=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=C2=A0 |=C2=A0 =C2=A01 +<=
br>
=C2=A0...25-23016.patch =3D&gt; CVE-2025-23016-01.patch} |=C2=A0 =C2=A00<br=
>
=C2=A0.../fcgi/fcgi/CVE-2025-23016-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 83 ++++++++++<br>
=C2=A0.../recipes-support/fcgi/<a href=3D"http://fcgi_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">fcgi_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +-<br>
=C2=A0meta-xfce/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A035 files changed, 495 insertions(+), 23 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2026-0962.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/=
Makefile-Fix-sysinfo-generation-in-parallel-build.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/=
sysinfo.sh-Fix-typo-in-rm-command.patch<br>
=C2=A0rename meta-oe/recipes-dbs/postgresql/{<a href=3D"http://postgresql_1=
6.11.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.11.bb</a> =3D&g=
t; <a href=3D"http://postgresql_16.12.bb" rel=3D"noreferrer" target=3D"_bla=
nk">postgresql_16.12.bb</a>} (75%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/files/meson-build-=
Support-openembedded-OS-for-PAM-config.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pybind=
11-json/0001-CMakeLists-drop-PYTHON_INCLUDE_DIRS-from-interface.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
1642.patch<br>
=C2=A0rename meta-webserver/recipes-support/fcgi/fcgi/{CVE-2025-23016.patch=
 =3D&gt; CVE-2025-23016-01.patch} (100%)<br>
=C2=A0create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-=
23016-02.patch<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124849): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124849" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124849</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118131078/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118131078/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005c3c58064c40dea5--

