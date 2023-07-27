Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D153CEB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 05:22:07 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.1210.1690435326046610683
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 22:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hQMqCBLL;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1bb5ce75e43so414421fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 22:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690435325; x=1691040125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgbFShVed29uq2OvDNZeNznIQDdLm2Pxt5rvSPB63IQ=;
        b=hQMqCBLL/WQK7oRvGDEtv5ETiMGr0XldPa7UqNK6kS2MDjA+GeDfMsXE27NFvqGEyi
         QretR9kUTI6VJxRX2dnV6QcPstyDucWRT5kduH02OxpDA5QhyFzUH2tMPZz03gPFLElJ
         nRuGcSqWHObmSbhwuK2x8m3vQglAE9Eyw7bMd9v+YXjTJVohalWGjjnJL2tfiG/embpj
         1aQhBbKTyAuG1v72/jpIjGDKBPV+FaKI5k9ixOwAghB0QyvvDPypBNF1DZBapSO/8jNO
         +l7Uk0ViBj/EWAsTx2z95VkxDxs9jLkPObHUnlOh7YDU7v4t1Q3uzshu1h7c9ghhWe5N
         daGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690435325; x=1691040125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgbFShVed29uq2OvDNZeNznIQDdLm2Pxt5rvSPB63IQ=;
        b=RwZ7pmdwuuYIeunVcgGzLX/CeftYdldnmJTf8v6qgcuX0kagUzBFYgGvcQZ1v3Jat5
         SgvP+aytREWuVlCPkUg58EBG5oUdkidWNPAyAv2GCfzxPQMlF5HtFukI1J4u/JzhpiE7
         CQgTJiSp7gs5jYwV5gkSp7fFVLBKtLW3mtMysVaEa10ruIQ8q9J8XAvpwbgs4bHyTMY4
         3WLWnscQ9NoOXIlSNywgbNrRfyP+uHhJH7MZfaz1HeqioqQz6tUU3/upZWoJnzHIdnuS
         azoqSPiAG4x5EEdUXvn5ay/r2USAf2mqT+lmyEuiIesbiMNNN/uTaOwX49PDJvJVzPtf
         R9iA==
X-Gm-Message-State: ABy/qLZ/wxzYaImBbAJNkCO5zYZeBplIXEoUwCB806lc0fD0zPl8hsNi
	cNqxj9FqcxwH+RZ/N7LvgKxFJvtUE/fu8smHRWg=
X-Google-Smtp-Source: APBJJlG9WlYnWts9puuSWYkWU2AZzDmYnzTajX5IENPHE1WIKwcdeG6CIJMTrzpQxzlanY9brAjcyLGV0I7smK+HgqY=
X-Received: by 2002:a05:6870:a40b:b0:1ba:52e8:cfe with SMTP id
 m11-20020a056870a40b00b001ba52e80cfemr2050041oal.22.1690435325114; Wed, 26
 Jul 2023 22:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230725210925.158485-1-cvubrugier@fastmail.fm>
In-Reply-To: <20230725210925.158485-1-cvubrugier@fastmail.fm>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jul 2023 22:21:39 -0700
Message-ID: <CAMKF1sqp9kxar2DSmONt-xshS-4TSn=yCdoKC-fjP56um8fnvA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libnvme: add recipe
To: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Cc: openembedded-devel@lists.openembedded.org, 
	Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 05:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104049

This fails to build python pieces see

https://errors.yoctoproject.org/Errors/Details/729064/

Something like below might helps fix it. Please test it out and resend
a v2 if it works for you.

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
b/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
index 607b055d81..2166ff677d 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
@@ -17,4 +17,6 @@ SRC_URI =3D
"git://github.com/linux-nvme/libnvme;protocol=3Dhttps;branch=3Dmaster"

 S =3D "${WORKDIR}/git"

-inherit meson pkgconfig
+inherit meson pkgconfig python3targetconfig
+
+FILES:${PN} +=3D "${libdir}/${PYTHON_DIR}/site-packages/${BPN}"

On Tue, Jul 25, 2023 at 2:09=E2=80=AFPM Christophe Vu-Brugier
<cvubrugier@fastmail.fm> wrote:
>
> From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
>
> Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
> ---
>  .../recipes-support/libnvme/libnvme_1.5.bb    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libnvme/libnvme_1.5.bb
>
> diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb b/meta-oe/rec=
ipes-support/libnvme/libnvme_1.5.bb
> new file mode 100644
> index 0000000000..607b055d81
> --- /dev/null
> +++ b/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "libnvme development C library"
> +DESCRIPTION =3D "\
> +libnvme provides type definitions for NVMe specification structures, \
> +enumerations, and bit fields, helper functions to construct, dispatch, \
> +and decode commands and payloads, and utilities to connect, scan, and \
> +manage nvme devices on a Linux system."
> +HOMEPAGE =3D "https://github.com/linux-nvme/${BPN}"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPL-2.1-only & CC0-1.0 & MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
> +                    file://ccan/licenses/CC0;md5=3Dc17af43b05840255a6fed=
c5eda9d56cc \
> +                    file://ccan/licenses/BSD-MIT;md5=3D838c366f69b72c5df=
05c96dff79b35f2"
> +DEPENDS =3D "json-c"
> +SRCREV =3D "4fea83db8328ea788ea8f1001e8ce1cb80ef5fae"
> +
> +SRC_URI =3D "git://github.com/linux-nvme/libnvme;protocol=3Dhttps;branch=
=3Dmaster"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104026): https://lists.openembedded.org/g/openembedde=
d-devel/message/104026
> Mute This Topic: https://lists.openembedded.org/mt/100359101/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

