Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3777CC88E73
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 20:59:00 +0000 (UTC)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8237.1789419534034744868
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 13:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gPsTZF4F;
 spf=pass (domain: gmail.com, ip: 74.125.231.76, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab650so2878846fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 13:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789419533; cv=none;
        d=google.com; s=arc-20260327;
        b=gXntuPD6VQnElWD8fLOyEWZHy8lg+2fG7S67k8XeJmL4gjwaYTAHzJ8Gc7JtXujyM6
         EkT5TFw59LUt6PSbur+O+adS27R1TlWtVWinEBaqnc7pIgOnQaLPvnTiQVs+qkNKBSf6
         kF3eNduINdCWtm/Q58Cz/t3ZFDwQv/xBtjoVk2BTv9cnnDzelAxqHa8lw1N7ewvzElJR
         8QEkyW5o5pmKw7OgZBNhrViAJ2z6enL6A29wLj8SOuu2TPPqQ0L2KBihHjRcHtumkpje
         cj6MmTFCOGWmihSjt8gQizJi/JPpVy0206BncQq0Jq2p6lvpKpeswOmpOXI81730DXQE
         72Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7tRZNtMNVXbCprdpdNfmV18K3WBCNAHB1PrvEPe5O0=;
        fh=TgccigWwEISedZ7pLwzNLSIkGSpM8CuRZo1QBMHDyHA=;
        b=If5DHVuvudXfVSGtwAIraD8DnnxKr4ejGm4SedtO89Y7e/8Zn4JC+38XXhu69fZJ8W
         mfR3nmge+g3MK8QYpVROS8oThS6JebUJ0VAbYT33WqeaGkeVN9sKwcP8j5EDOV9jVWyD
         h1IK9t+R4sUNjkRqy2QO0oSlrTNH7yFTFxAPqbf1vVD9tc0NHKoLU3SHHnsOm+eJ4S46
         45WcDqsxLCYZxLz8Pbfk/CnSldB/8YjFpiWlGa5ZWixtgsZxuAu4yGIScmLpaANN8BwB
         IweEG5ZVnrKd7zYLBxPfuFKA7EnuEaTR1mKjm9WeF17twV29vVXI4D/a6504u5oQ2pdW
         I3VA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789419533; x=1790024333; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7tRZNtMNVXbCprdpdNfmV18K3WBCNAHB1PrvEPe5O0=;
        b=gPsTZF4FSdDe07vWasUQFf31xS6bntRoGF7pQdpl+u6QBJKca12/bG/6lAHpNybzM0
         hsy2KFS37vKk1P86lP33u4ZY0M8xNYZstfv6kujqow4n2gPPk8mttDWIR2KQEvHwsxy8
         5tfQOm1/kwpSzb4HMcBMKeMvj7g1n+3Ugg5fWBoDzzlPvINHJZ8rT5XVFF0odjuM8HWV
         9AitUzjQEM3dsOKUkdygzfCVwzllZhIZgOiEq5DvVy1psgE3ZE1WAtO//d/uPYrUMF2d
         yd9VN61ibUUsimlYsqijumdmhp4FHN9JC8EEK9F/WMBLr3+f9+0ZGg4bHoUeqrR4gorV
         /5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789419533; x=1790024333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7tRZNtMNVXbCprdpdNfmV18K3WBCNAHB1PrvEPe5O0=;
        b=k6sBwqQoFDAilmTkIhV+o3x/J7FkxB5ui2RtxOqGLtHGbUefm6L39/6PhTelMwRQH2
         fEcAOl0/PZeS+zKc6kCZpQ3CxCmNkYeX0n3d8Fg78DfLmQ3iTKON4KTyrWkV5yjHsF81
         oYASNZgy456sy7PYgIoX92fj8hH8ktGoJlbz97LLehu4DP9/CHdpQdZ0gLlIE99TUN5P
         vCehgexWZAuv2hkjqhSqA1avfg9AzVbZ4Pq3ePEy0K4KSPNOVf6ihCDlFUCmLMEAZQKE
         YS73dPkIkBR8bir7XdAfOtlgapzk0dGl+orQEeEy6oZo0aj7OzkafQWtdVIs3rPnkkhc
         47rw==
X-Gm-Message-State: AFuF++lyVldomheJmiTIS2aLatXj8G0qhM8XvEGaL8kwUwAUNfVcwHte
	XFdAKUgkEd4giQu5Y7nrK55XleE26Bhpids57Ox7iLiu+eMxeSc5V+tQkzVWBBghJmuGdaG6h/P
	TyfsXYrKCB65BA4fEqJ/mpQvnpTnvvdU=
X-Gm-Gg: AYBFou321DVpr+ajVOilGUK15asxst8xNFb16qeSNiskfYvR2eX//Rekwpedn7MCp5I
	4ToEQ3IKDcL7rBZspGr/aXkHHR5kd3jipFcviIi7lYKzcvoAWbqYutL0J01gIqN2pOmVQqCXt0m
	8BirJHzcJ/3OExq8LDRqX2iZBK7PgkeB5i3n6mRzH1fTOIeVG5xn/s7Rg3cxDTPFxRMz5xqkX0+
	eNIznOngmFDz1uoWo3zaHJy6EG7p691jP6wduQr39KOh4hPgiL5u52aE5DCCKWjLhrNTYpViRrP
	gp+rCG1WIDnpsAJkvbUnZutSEdaCsNwSmoj48KooeYeTpErCJvcTmtKPvYT60Ec4wdYlaw==
X-Received: by 2002:a05:6870:1649:b0:479:7931:cd6a with SMTP id
 586e51a60fabf-481fa2428c3mr2844420fac.32.1789419533021; Mon, 14 Sep 2026
 13:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260914092745.20027-1-jan.vermaete@gmail.com>
In-Reply-To: <20260914092745.20027-1-jan.vermaete@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 15 Sep 2026 08:58:41 +1200
X-Gm-Features: AcwNN1XAZzmz2g_qHU1IBw0nk-bktjj9Ss1Pp0mYJwUPTyL66HeJNhQxLlGddBE
Message-ID: <CADySD0FjZs2RK_dC7PcddEVuhLZwnc+892xjKmRR0tAq+4bk5g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-construct: new recipe version 2.10.70
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org, tfggeelen@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 20:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130025

On Mon, Sep 14, 2026 at 9:27=E2=80=AFPM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Recipe taken from meta-homeassistant of Tom Geelen.
>
> Added ptests.  But removed the tests with binary data (e.g. .so file).
> Those tests gave to much issues with QA rules of Yocto/Openembedded.
>
> Moved from pypi to github to have all test code.
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  ...ile-to-enable-pytest-8.x.y-to-find-t.patch | 25 ++++++++++++
>  ...002-pytest.ini-disable-the-benchmark.patch | 26 ++++++++++++
>  .../python3-construct_2.10.70.bb              | 40 +++++++++++++++++++
>  4 files changed, 92 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python3-construct/python=
3-construct/0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch
>  create mode 100644 meta-python/recipes-devtools/python3-construct/python=
3-construct/0002-pytest.ini-disable-the-benchmark.patch
>  create mode 100644 meta-python/recipes-devtools/python3-construct/python=
3-construct_2.10.70.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index e4eae4ef43..9b3a535e55 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -19,6 +19,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-cachetools \
>      python3-cbor2 \
>      python3-configobj \
> +    python3-construct \
>      python3-pyconnman \
>      python3-click \
>      python3-dasbus \
> diff --git a/meta-python/recipes-devtools/python3-construct/python3-const=
ruct/0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch b/meta=
-python/recipes-devtools/python3-construct/python3-construct/0001-add-pytes=
t.ini-file-to-enable-pytest-8.x.y-to-find-t.patch
> new file mode 100644
> index 0000000000..3e9e73bd45
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-construct/python3-construct/00=
01-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch
> @@ -0,0 +1,25 @@
> +From b8d0ba87f629cc6065a2d06cedc5e850407c45de Mon Sep 17 00:00:00 2001
> +From: Franz Haas <franz.dominik.haas@gmail.com>
> +Date: Tue, 17 Sep 2024 11:23:28 +0200
> +Subject: [PATCH 1/1] - add pytest.ini file to enable pytest 8.x.y to fin=
d the
> + tests
> +
> +Upstream-Status: Backport [https://github.com/construct/construct/commit=
/b8d0ba87f629cc6065a2d06cedc5e850407c45de]
> +
> +---
> + pytest.ini | 3 +++
> + 1 file changed, 3 insertions(+)
> + create mode 100644 pytest.ini
> +
> +diff --git a/pytest.ini b/pytest.ini
> +new file mode 100644
> +index 0000000..f5a52af
> +--- /dev/null
> ++++ b/pytest.ini
> +@@ -0,0 +1,3 @@
> ++[pytest]
> ++pythonpath =3D .
> ++
> +--
> +2.47.3
> +
> diff --git a/meta-python/recipes-devtools/python3-construct/python3-const=
ruct/0002-pytest.ini-disable-the-benchmark.patch b/meta-python/recipes-devt=
ools/python3-construct/python3-construct/0002-pytest.ini-disable-the-benchm=
ark.patch
> new file mode 100644
> index 0000000000..bc89546c82
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-construct/python3-construct/00=
02-pytest.ini-disable-the-benchmark.patch
> @@ -0,0 +1,26 @@
> +From 7acb7aa51db762a723d85b81262ca14614dbeac0 Mon Sep 17 00:00:00 2001
> +From: Jan Vermaete <jan.vermaete@gmail.com>
> +Date: Mon, 14 Sep 2026 10:24:51 +0200
> +Subject: [PATCH 2/2] pytest.ini: disable the benchmark
> +
> +Benchmark is also disabled in the github workflow of the project
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> +---
> + pytest.ini | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pytest.ini b/pytest.ini
> +index f5a52af..4b1b4b6 100644
> +--- a/pytest.ini
> ++++ b/pytest.ini
> +@@ -1,3 +1,3 @@
> + [pytest]
> + pythonpath =3D .
> +-
> ++addopts =3D --benchmark-disable
> +--
> +2.43.0
> +
> diff --git a/meta-python/recipes-devtools/python3-construct/python3-const=
ruct_2.10.70.bb b/meta-python/recipes-devtools/python3-construct/python3-co=
nstruct_2.10.70.bb
> new file mode 100644
> index 0000000000..681c43122a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-construct/python3-construct_2.=
10.70.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "A powerful declarative symmetric parser/builder for binary =
data"
> +HOMEPAGE =3D "http://construct.readthedocs.org"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D202b39559c1c79fe4715ce81e9e0a=
c02"
> +RECIPE_MAINTAINER =3D "Tom Geelen <t.f.g.geelen@gmail.com>"
> +
> +SRC_URI =3D "\
> +    git://github.com/construct/construct.git;protocol=3Dhttps;branch=3Dm=
aster \

please include tag=3Dv${PV} in the SRC_URI

> +    file://0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.pat=
ch \
> +    file://0002-pytest.ini-disable-the-benchmark.patch \
> +"
> +
> +PV =3D "1.0+git"

No need to set PV in the recipe, this can be dropped

> +SRCREV =3D "c25a47172d4bde392b7ad188175b07b319d3dea4"
> +
> +inherit setuptools3 ptest-python-pytest
> +
> +PACKAGECONFIG ?=3D "extras"
> +PACKAGECONFIG[extras] =3D ",,,python3-arrow python3-cloudpickle python3-=
cryptography python3-lz4 python3-numpy python3-ruamel-yaml"
> +
> +RDEPENDS:${PN} +=3D "\
> +    python3-compression \
> +    python3-core \
> +    python3-crypt \
> +    python3-cryptography \
> +    python3-debugger \
> +    python3-misc \
> +    python3-pickle \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D "python3-pytest-benchmark"
> +
> +do_install_ptest:append() {
> +    # *.so files gives issues with QA of Yocto/OpenEmbedded
> +    rm -rf ${D}${PTEST_PATH}/tests/deprecated_gallery
> +    rm -rf ${D}${PTEST_PATH}/tests/gallery
> +
> +    install -d ${D}${PTEST_PATH}
> +    install -m 0644 ${S}/pytest.ini ${D}${PTEST_PATH}
> +}
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130020): https://lists.openembedded.org/g/openembedde=
d-devel/message/130020
> Mute This Topic: https://lists.openembedded.org/mt/121239797/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

