Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC6CCD5BD1
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 09:56:26 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4510.1780221380999579532
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2026 02:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J4x1c6we;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ce9df48e1bso6085776d6.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2026 02:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780221380; cv=none;
        d=google.com; s=arc-20240605;
        b=YJQLlbCJNQyO7FFgCr5/2/jyMSLYTaOI+uFn+ZOgD/I907+DLM31hZaDq8n6exw6Oh
         26FOHtWPAMsMoITu8bw6Elan1RwcTly5mChXIwIDZxWQIjjphTsFeu355sFInmlBBij4
         3ocqEZ/zBOGfGO68Fw71sxq5HPqOM1w69U2FTJq6TqaF1PO1vpprQYS72GHkIG6/55eq
         HGrSvRbC5hJHtLGGMR+1dXkVmk9Jzst+/IGtvvJRKH9xSa8jze7SzJjMX0WgEvkjXITu
         Wb6bgXebNeRxGbHqLGUZ7igjaUSzYgslHu5PXBXcp6Ye99cNhcAkaRGlSm74W9Pbj3Dx
         leow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M2JTB3r7FouaLktAPRuKLKrtP8168EimMQq62Zx2Lio=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=MsVWwTRMSCmIKFXNXaKX8nU6sbxSvbHYeDZNKcNZyo1HVElh4usHs6F9LHiOLZje0x
         YCIsHl7RC57CIRMaUZ6xKiQj+2aHUNwJLhi5yag4ChE1OXi+mPHYO34mBx6V72yceGEy
         w//oISVvXnuFKF3W0VvjEDWdrwbutURsae9d12F4271TpOr8t0K6OeAOkrlDEUX/79yJ
         ysio3XK0sW8dJohQWHdB+8swglzJD+2vmCkjl5sjFf8SgMazcNvALckdQfp1SbZd1GqN
         8B7B3sz7H8pu2JWQr+mBEzVsyHCewczsC+YnK9PiUvURYe7hcGSzOMhaWwJqWdj7LpNJ
         hG/g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780221380; x=1780826180; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M2JTB3r7FouaLktAPRuKLKrtP8168EimMQq62Zx2Lio=;
        b=J4x1c6weub5QqRamspqkXq8g+2TOZ3ZPi58e4ZWUS6aOl02QDN8qzQ3iTt5MJ7NjBu
         Iq8MtSzDqEDKSuv1E5ZZkwFBz225w07I0FNYFwcTcHFEapg1xN25vAGQH8rLL+SeN6rv
         VPoFIvw87QOfk8VZWhPSMFSYoV/FHg22TLNZKn609/xj11KGzq/4ykZHSy/V2SL80xXS
         BDl2JBZ6Q7dWjrYc9C+wceACWie0P4EuFlK7NzjGZ9MIlGj9ToO6Vp8ssUWd9NRNkEj9
         AOs+hQy2bpgdtvY8Xmsat1lHXrTi2LLX2h3CENwINb/pRTQkdp7bIhUdQbunejm1nqM8
         ZrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780221380; x=1780826180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2JTB3r7FouaLktAPRuKLKrtP8168EimMQq62Zx2Lio=;
        b=mz0xvlOj1VhFxRzIh3kUaVvOuWWOdHELtEiNnB5CS2+jaOH8A+iLlydBygQDJhxFzY
         Hze5NeVYr/EP1QZNMF+KHLMcY1rPgKhBRjWl9AB3WRosnaY7tBan6Yp1aDDOjDr/jsOh
         F+B+tFwcs1/YkvuiSueDVOHusI0OyhQXOzc4xOZFMaHb7+2s3jLXrDW9egNWQPUD14wv
         zGlK2DEuIDdMVJbl1aDmnn3EHEsIuHftyfPlMqhyeuQAGA7Wxz1RWASZqUikD3R91EaR
         HXILqBxvFI94Y78A4U+6Yp/F7i2WYrq2j21+YC95D9a0wPF5JqBxJds6wbac64qnOEIM
         vo2w==
X-Gm-Message-State: AOJu0YwES/h+RmLYjVrnIZX5g9PPo4unuGewcqUqnYRQs/rqlkY74iXO
	xaaO0WltRFOWWHYqyXf/LFjh/pP6Q3q3gBQckyiMrsaAL1gHZPZhPQ4uEUGLLrzAsCkIwgm7gUu
	D3q8AHtMBkz57KjD2Cqv6UBDrd23MvzdhoWus5qzNeBTA
X-Gm-Gg: Acq92OH8xZua/51cCIm5vLv9qicBbAb3Tms8CsKyOeSCkkFKhMSHj9CD0sBSiT9E4SI
	Pn2Fch8m4aDP4cEkmN4WbSV6UAaYv9r0mRZ1VvAjmEpVzjIgN7EAtSO3qeQ+smciufKppWHpvns
	P1Bdc97JtblqKvf6k0r7rDANC09QXM4Yq+3Q83SQ/dzNqZv+4IO/BV6SYdwsGq+zkCEOabLzZRY
	6s4Vuk1e3EvvfpkI4acViyKQ/y3fxAHZJZJF2QA62r7fG1IzUHxsOEVt4bm7g4gKY7jTRhkpfN4
	yPX4R60DiHZ8CMl3sm6BJZYQuFXmXK2HxIaEmKxJmNdpVAVaPLK8//0R0k0rNVgNhM+hkXLxOvu
	CZG/Yt+mHzeAoUf2xVF9ClS8EZB8KuXanv3cgbBjTMldmkYWEJhC7lPTaijOPArenNJ4xwisUSg
	qNFuFzf1M41cZIPCgLsQkGWkZRmOg=
X-Received: by 2002:ad4:5ecc:0:b0:8ce:f1b:74ec with SMTP id
 6a1803df08f44-8ce0f1b76f9mr52219376d6.25.1780221379005; Sun, 31 May 2026
 02:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779718757.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1779718757.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 May 2026 11:55:52 +0200
X-Gm-Features: AVHnY4LAOiR_vQDJYeWTfBV0q2eByjdbCMsABX10U_52AefDO1PlyDh2T-dRchU
Message-ID: <CAMKF1sq8j-=OLDj-iWTgAsuUVtsRjBBBFryvx5UC_t5YcC=axw@mail.gmail.com>
Subject: Re: [PATCH 00/29] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ead0b506531a169b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2026 09:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127304

--000000000000ead0b506531a169b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

lgtm, merged now. Thanks Anuj

On Mon, May 25, 2026 at 4:27=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Mostly CVE fixes and a few bug fix only upgrades. There's a new recipe fo=
r
> python3-backports-zstd that introduces this module for Python 3.12 which
> didn't
> have this.
>
> Tested locally and on autobuilder:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1538
>
> The following changes since commit
> ae7dfb12245c7f9b9a353499e2688015bd4e6413:
>
>   jq: Stick to C17 until next release (2026-05-05 06:57:17 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to d8cc4e44001c7257273d290ce8c4496e93d32841:
>
>   postgresql: upgrade 16.12 -> 16.14 (2026-05-25 08:05:43 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (8):
>   exiftool: ignore CVE-2026-7580
>   firewalld: upgrade 1.3.2 -> 1.3.4
>   frr: patch CVE-2026-28532
>   lcms: patch CVE-2026-41254
>   lcms: patch CVE-2026-42798
>   postfix: upgrade 3.8.12 -> 3.8.16
>   nanomsg: upgrade 1.2.1 -> 1.2.2
>   postgresql: upgrade 16.12 -> 16.14
>
> Gyorgy Sarvari (1):
>   python3-ecdsa: set CVE_PRODUCT
>
> Het Patel (3):
>   abseil-cpp: Add CVE_PRODUCT to support product name
>   onig: Add CVE_PRODUCT to support product name
>   open-vm-tools: Add entry to CVE_PRODUCT to support the product name
>
> Hitendra Prajapati (2):
>   wireshark: fix for CVE-2025-13946
>   strongswan: fix for CVE-2026-35334
>
> Hugo SIMELIERE (Schneider Electric) (5):
>   nss: Fix CVE-2026-2781
>   dnsmasq: Fix CVE-2026-4891
>   dnsmasq: Fix CVE-2026-4892
>   dnsmasq: Fix CVE-2026-4893
>   dnsmasq: Fix CVE-2026-5172
>
> Jason Schonberg (1):
>   php: upgrade 8.2.30 -> 8.2.31
>
> J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric ) (1):
>   python3-backports-zstd: add recipe
>
> Liyin Zhang (1):
>   apache2: upgrade 2.4.66 -> 2.4.67
>
> Peter Marko (1):
>   python-grpcio(-tools): add grpc:grpc to cve product
>
> Sudhir Dumbhare (1):
>   libssh: set status for CVE-2025-14821
>
> Theo Gaige (1):
>   dash: fix CVE-2026-31323
>
> Theo Gaige (Schneider Electric) (4):
>   nginx: patch CVE-2026-40701
>   nginx: patch CVE-2026-42934
>   nginx: patch CVE-2026-42945
>   nginx: patch CVE-2026-42946
>
>  ...{firewalld_1.3.2.bb =3D> firewalld_1.3.4.bb} |   2 +-
>  .../{nanomsg_1.2.1.bb =3D> nanomsg_1.2.2.bb}    |   2 +-
>  .../{postfix_3.8.12.bb =3D> postfix_3.8.16.bb}  |   2 +-
>  .../frr/frr/CVE-2026-28532.patch              | 309 ++++++++++++++++++
>  .../recipes-protocols/frr/frr_9.1.3.bb        |   1 +
>  .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |   4 +
>  .../dnsmasq/files/CVE-2026-4891.patch         |  44 +++
>  .../dnsmasq/files/CVE-2026-4892.patch         |  41 +++
>  .../dnsmasq/files/CVE-2026-4893.patch         |  38 +++
>  .../dnsmasq/files/CVE-2026-5172.patch         |  39 +++
>  .../open-vm-tools/open-vm-tools_12.3.5.bb     |   2 +-
>  .../strongswan/CVE-2026-35334.patch           | 255 +++++++++++++++
>  .../strongswan/strongswan_5.9.14.bb           |   1 +
>  .../wireshark/files/CVE-2025-13946.patch      |  51 +++
>  .../wireshark/wireshark_4.2.14.bb             |   1 +
>  .../files/0001-Add-support-for-RISC-V.patch   |   7 +-
>  .../files/0002-Improve-reproducibility.patch  |   7 +-
>  ...c-bypass-autoconf-2.69-version-check.patch |  11 +-
>  ...-config_info.c-not-expose-build-info.patch |   9 +-
>  ...gresql-fix-ptest-failure-of-sysviews.patch |   7 +-
>  .../postgresql/files/not-check-libperl.patch  |   9 +-
>  ...ostgresql_16.12.bb =3D> postgresql_16.14.bb} |   2 +-
>  .../abseil-cpp/abseil-cpp_20240116.3.bb       |   3 +
>  .../recipes-devtools/perl/exiftool_12.72.bb   |   1 +
>  .../php/{php_8.2.30.bb =3D> php_8.2.31.bb}      |   2 +-
>  .../dash/dash/CVE-2026-31323.patch            |  43 +++
>  meta-oe/recipes-shells/dash/dash_0.5.12.bb    |   5 +-
>  .../lcms/lcms/CVE-2026-41254_1.patch          |  30 ++
>  .../lcms/lcms/CVE-2026-41254_2.patch          |  36 ++
>  .../lcms/lcms/CVE-2026-42798.patch            |  38 +++
>  meta-oe/recipes-support/lcms/lcms_2.16.bb     |   6 +-
>  .../recipes-support/libssh/libssh_0.10.6.bb   |   2 +
>  .../nss/nss/CVE-2026-2781.patch               |  36 ++
>  meta-oe/recipes-support/nss/nss_3.98.bb       |   1 +
>  meta-oe/recipes-support/onig/onig_6.9.9.bb    |   3 +
>  ...ake-license-entries-compatible-with-.patch |  38 +++
>  ...s.toml-lower-setuptools-requirements.patch |  31 ++
>  .../python/python3-backports-zstd_1.5.0.bb    |  21 ++
>  .../python/python3-ecdsa_0.19.0.bb            |   2 +
>  .../python/python3-grpcio-tools_1.62.2.bb     |   2 +
>  .../python/python3-grpcio_1.62.2.bb           |   2 +
>  .../{apache2_2.4.66.bb =3D> apache2_2.4.67.bb}  |   2 +-
>  .../nginx/nginx-1.24.0/CVE-2026-40701.patch   |  73 +++++
>  .../nginx/nginx-1.24.0/CVE-2026-42934.patch   |  79 +++++
>  .../nginx/nginx-1.24.0/CVE-2026-42945.patch   |  46 +++
>  .../nginx-1.24.0/CVE-2026-42946-01.patch      |  46 +++
>  .../nginx-1.24.0/CVE-2026-42946-02.patch      |  91 ++++++
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |   5 +
>  48 files changed, 1445 insertions(+), 43 deletions(-)
>  rename
> meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld=
/{
> firewalld_1.3.2.bb =3D> firewalld_1.3.4.bb} (99%)
>  rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.1.bb =
=3D>
> nanomsg_1.2.2.bb} (94%)
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.8.12.bb =3D>
> postfix_3.8.16.bb} (99%)
>  create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2026-28532.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-35334.patc=
h
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2025-13946.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.12.bb =3D>
> postgresql_16.14.bb} (86%)
>  rename meta-oe/recipes-devtools/php/{php_8.2.30.bb =3D> php_8.2.31.bb}
> (99%)
>  create mode 100644 meta-oe/recipes-shells/dash/dash/CVE-2026-31323.patch
>  create mode 100644
> meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch
>  create mode 100644
> meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch
>  create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patc=
h
>  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2026-2781.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-backports-zstd/0001-pyproject=
.toml-make-license-entries-compatible-with-.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-backports-zstd/0002-pyproject=
s.toml-lower-setuptools-requirements.patch
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-backports-zstd_1.5.0.bb
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.66.bb =3D>
> apache2_2.4.67.bb} (99%)
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-40701.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42934.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42945.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-01.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42946-02.patch
>
> --
> 2.54.0
>
>

--000000000000ead0b506531a169b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">lgtm, merged now. Thanks Anuj</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 May 25, 2026 at 4:27=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anuj.mit=
tal@oss.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Mostly CVE fixes and a fe=
w bug fix only upgrades. There&#39;s a new recipe for<br>
python3-backports-zstd that introduces this module for Python 3.12 which di=
dn&#39;t<br>
have this.<br>
<br>
Tested locally and on autobuilder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1538" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1538</a><br>
<br>
The following changes since commit ae7dfb12245c7f9b9a353499e2688015bd4e6413=
:<br>
<br>
=C2=A0 jq: Stick to C17 until next release (2026-05-05 06:57:17 +0530)<br>
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
for you to fetch changes up to d8cc4e44001c7257273d290ce8c4496e93d32841:<br=
>
<br>
=C2=A0 postgresql: upgrade 16.12 -&gt; 16.14 (2026-05-25 08:05:43 +0530)<br=
>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (8):<br>
=C2=A0 exiftool: ignore CVE-2026-7580<br>
=C2=A0 firewalld: upgrade 1.3.2 -&gt; 1.3.4<br>
=C2=A0 frr: patch CVE-2026-28532<br>
=C2=A0 lcms: patch CVE-2026-41254<br>
=C2=A0 lcms: patch CVE-2026-42798<br>
=C2=A0 postfix: upgrade 3.8.12 -&gt; 3.8.16<br>
=C2=A0 nanomsg: upgrade 1.2.1 -&gt; 1.2.2<br>
=C2=A0 postgresql: upgrade 16.12 -&gt; 16.14<br>
<br>
Gyorgy Sarvari (1):<br>
=C2=A0 python3-ecdsa: set CVE_PRODUCT<br>
<br>
Het Patel (3):<br>
=C2=A0 abseil-cpp: Add CVE_PRODUCT to support product name<br>
=C2=A0 onig: Add CVE_PRODUCT to support product name<br>
=C2=A0 open-vm-tools: Add entry to CVE_PRODUCT to support the product name<=
br>
<br>
Hitendra Prajapati (2):<br>
=C2=A0 wireshark: fix for CVE-2025-13946<br>
=C2=A0 strongswan: fix for CVE-2026-35334<br>
<br>
Hugo SIMELIERE (Schneider Electric) (5):<br>
=C2=A0 nss: Fix CVE-2026-2781<br>
=C2=A0 dnsmasq: Fix CVE-2026-4891<br>
=C2=A0 dnsmasq: Fix CVE-2026-4892<br>
=C2=A0 dnsmasq: Fix CVE-2026-4893<br>
=C2=A0 dnsmasq: Fix CVE-2026-5172<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 php: upgrade 8.2.30 -&gt; 8.2.31<br>
<br>
J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric ) (1):<br>
=C2=A0 python3-backports-zstd: add recipe<br>
<br>
Liyin Zhang (1):<br>
=C2=A0 apache2: upgrade 2.4.66 -&gt; 2.4.67<br>
<br>
Peter Marko (1):<br>
=C2=A0 python-grpcio(-tools): add grpc:grpc to cve product<br>
<br>
Sudhir Dumbhare (1):<br>
=C2=A0 libssh: set status for CVE-2025-14821<br>
<br>
Theo Gaige (1):<br>
=C2=A0 dash: fix CVE-2026-31323<br>
<br>
Theo Gaige (Schneider Electric) (4):<br>
=C2=A0 nginx: patch CVE-2026-40701<br>
=C2=A0 nginx: patch CVE-2026-42934<br>
=C2=A0 nginx: patch CVE-2026-42945<br>
=C2=A0 nginx: patch CVE-2026-42946<br>
<br>
=C2=A0...{<a href=3D"http://firewalld_1.3.2.bb" rel=3D"noreferrer" target=
=3D"_blank">firewalld_1.3.2.bb</a> =3D&gt; <a href=3D"http://firewalld_1.3.=
4.bb" rel=3D"noreferrer" target=3D"_blank">firewalld_1.3.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://nanomsg_1.2.1.bb" rel=3D"noreferrer" target=3D=
"_blank">nanomsg_1.2.1.bb</a> =3D&gt; <a href=3D"http://nanomsg_1.2.2.bb" r=
el=3D"noreferrer" target=3D"_blank">nanomsg_1.2.2.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://postfix_3.8.12.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.8.12.bb</a> =3D&gt; <a href=3D"http://postfix_3.8.16.=
bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.8.16.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../frr/frr/CVE-2026-28532.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 309 ++++++++++++++++++<br>
=C2=A0.../recipes-protocols/frr/<a href=3D"http://frr_9.1.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">frr_9.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0.../recipes-support/dnsmasq/<a href=3D"http://dnsmasq_2.90.bb" rel=3D=
"noreferrer" target=3D"_blank">dnsmasq_2.90.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
=C2=A0.../dnsmasq/files/CVE-2026-4891.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 44 +++<br>
=C2=A0.../dnsmasq/files/CVE-2026-4892.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 41 +++<br>
=C2=A0.../dnsmasq/files/CVE-2026-4893.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 38 +++<br>
=C2=A0.../dnsmasq/files/CVE-2026-5172.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 39 +++<br>
=C2=A0.../open-vm-tools/<a href=3D"http://open-vm-tools_12.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">open-vm-tools_12.3.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../strongswan/CVE-2026-35334.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 255 +++++++++++++++<br>
=C2=A0.../strongswan/<a href=3D"http://strongswan_5.9.14.bb" rel=3D"norefer=
rer" target=3D"_blank">strongswan_5.9.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../wireshark/files/CVE-2025-13946.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
51 +++<br>
=C2=A0.../wireshark/<a href=3D"http://wireshark_4.2.14.bb" rel=3D"noreferre=
r" target=3D"_blank">wireshark_4.2.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../files/0001-Add-support-for-RISC-V.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A07 +-<br>
=C2=A0.../files/0002-Improve-reproducibility.patch=C2=A0 |=C2=A0 =C2=A07 +-=
<br>
=C2=A0...c-bypass-autoconf-2.69-version-check.patch |=C2=A0 11 +-<br>
=C2=A0...-config_info.c-not-expose-build-info.patch |=C2=A0 =C2=A09 +-<br>
=C2=A0...gresql-fix-ptest-failure-of-sysviews.patch |=C2=A0 =C2=A07 +-<br>
=C2=A0.../postgresql/files/not-check-libperl.patch=C2=A0 |=C2=A0 =C2=A09 +-=
<br>
=C2=A0...<a href=3D"http://ostgresql_16.12.bb" rel=3D"noreferrer" target=3D=
"_blank">ostgresql_16.12.bb</a> =3D&gt; <a href=3D"http://postgresql_16.14.=
bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.14.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../abseil-cpp/<a href=3D"http://abseil-cpp_20240116.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">abseil-cpp_20240116.3.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../recipes-devtools/perl/<a href=3D"http://exiftool_12.72.bb" rel=3D=
"noreferrer" target=3D"_blank">exiftool_12.72.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.2.30.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.2.30.bb</a> =3D&gt; <a href=3D"http://php_8.2.31.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.2.31.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../dash/dash/CVE-2026-31323.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 43 +++<br>
=C2=A0meta-oe/recipes-shells/dash/<a href=3D"http://dash_0.5.12.bb" rel=3D"=
noreferrer" target=3D"_blank">dash_0.5.12.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A05 +-<br>
=C2=A0.../lcms/lcms/CVE-2026-41254_1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 30 ++<br>
=C2=A0.../lcms/lcms/CVE-2026-41254_2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 36 ++<br>
=C2=A0.../lcms/lcms/CVE-2026-42798.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 38 +++<br>
=C2=A0meta-oe/recipes-support/lcms/<a href=3D"http://lcms_2.16.bb" rel=3D"n=
oreferrer" target=3D"_blank">lcms_2.16.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A06 +-<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.10.6.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.10.6.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../nss/nss/CVE-2026-2781.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 36 ++<br>
=C2=A0meta-oe/recipes-support/nss/<a href=3D"http://nss_3.98.bb" rel=3D"nor=
eferrer" target=3D"_blank">nss_3.98.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A0meta-oe/recipes-support/onig/<a href=3D"http://onig_6.9.9.bb" rel=3D"=
noreferrer" target=3D"_blank">onig_6.9.9.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
3 +<br>
=C2=A0...ake-license-entries-compatible-with-.patch |=C2=A0 38 +++<br>
=C2=A0...s.toml-lower-setuptools-requirements.patch |=C2=A0 31 ++<br>
=C2=A0.../python/<a href=3D"http://python3-backports-zstd_1.5.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-backports-zstd_1.5.0.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 21 ++<br>
=C2=A0.../python/<a href=3D"http://python3-ecdsa_0.19.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-ecdsa_0.19.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-grpcio-tools_1.62.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-grpcio-tools_1.62.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-grpcio_1.62.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-grpcio_1.62.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../{<a href=3D"http://apache2_2.4.66.bb" rel=3D"noreferrer" target=
=3D"_blank">apache2_2.4.66.bb</a> =3D&gt; <a href=3D"http://apache2_2.4.67.=
bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.67.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-40701.patch=C2=A0 =C2=A0|=C2=A0 73 ++=
+++<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-42934.patch=C2=A0 =C2=A0|=C2=A0 79 ++=
+++<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-42945.patch=C2=A0 =C2=A0|=C2=A0 46 ++=
+<br>
=C2=A0.../nginx-1.24.0/CVE-2026-42946-01.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
46 +++<br>
=C2=A0.../nginx-1.24.0/CVE-2026-42946-02.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
91 ++++++<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +<br>
=C2=A048 files changed, 1445 insertions(+), 43 deletions(-)<br>
=C2=A0rename meta-networking/dynamic-layers/meta-python/recipes-connectivit=
y/firewalld/{<a href=3D"http://firewalld_1.3.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">firewalld_1.3.2.bb</a> =3D&gt; <a href=3D"http://firewalld_1.3=
.4.bb" rel=3D"noreferrer" target=3D"_blank">firewalld_1.3.4.bb</a>} (99%)<b=
r>
=C2=A0rename meta-networking/recipes-connectivity/nanomsg/{<a href=3D"http:=
//nanomsg_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">nanomsg_1.2.1.bb</=
a> =3D&gt; <a href=3D"http://nanomsg_1.2.2.bb" rel=3D"noreferrer" target=3D=
"_blank">nanomsg_1.2.2.bb</a>} (94%)<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.8.12.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.8.12.bb</a> =
=3D&gt; <a href=3D"http://postfix_3.8.16.bb" rel=3D"noreferrer" target=3D"_=
blank">postfix_3.8.16.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2026=
-28532.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4891.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4892.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4893.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-5172.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-35334.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2025-13946.patch<br>
=C2=A0rename meta-oe/recipes-dbs/postgresql/{<a href=3D"http://postgresql_1=
6.12.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.12.bb</a> =3D&g=
t; <a href=3D"http://postgresql_16.14.bb" rel=3D"noreferrer" target=3D"_bla=
nk">postgresql_16.14.bb</a>} (86%)<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.2.30.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.2.30.bb</a> =3D&gt; <a href=3D"=
http://php_8.2.31.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.31.bb</a=
>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-shells/dash/dash/CVE-2026-31323.pa=
tch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2026-2781.patc=
h<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-backpo=
rts-zstd/0001-pyproject.toml-make-license-entries-compatible-with-.patch<br=
>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-backpo=
rts-zstd/0002-pyprojects.toml-lower-setuptools-requirements.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-backports-zstd_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-backports-zstd_1.5.0.bb</a><br>
=C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://apache=
2_2.4.66.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.66.bb</a> =3D=
&gt; <a href=3D"http://apache2_2.4.67.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.67.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-40701.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-42934.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-42945.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-42946-01.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-42946-02.patch<br>
<br>
-- <br>
2.54.0<br>
<br>
</blockquote></div>

--000000000000ead0b506531a169b--

