Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D2CCD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 14:43:21 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51926.1778510600294543811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 07:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HHkdHmM+;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b0046078so37078615e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778510598; x=1779115398; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxc1CjJYZx09ynrE9JN7utQpty7w84qbieAzzwEV11E=;
        b=HHkdHmM+Gksyw4U2j4USc0/jUjanxEZ/KTJGbp+xFiFsd6KDAbg9H3kBRHGJu36irR
         hrPnO7tqK5ytYdOcPEWdcKF72lV6MCbMCy9rXWjHDGMk7rTFefVlKXWVRBUNSb80+Uv6
         uyuS/OpI1IvMTOyfIYymg9d7MZ1G72mY+aNwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510598; x=1779115398;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lxc1CjJYZx09ynrE9JN7utQpty7w84qbieAzzwEV11E=;
        b=Idvbd10dPFSdvv59V43G2nkibJmlMcnL8Q/mVG/XQ0aIPBdwrX3Dg1L4neq18GnOpO
         aIANl00/rUXMocn0dRyviVDdAU4kc9vdRnbNQ6+UUCHHZECQoJvpcteuCKxve13p2rb0
         KvM6iGsF/GbN9asI9qrdG+ckzYn+euERhikZ84pT8b7fnGULqfdmgXwCol3347n/tsqN
         K5dW/cr6k2mlBJdqdcjBDqRhw+67HoIPCcECX4DeawDrpmukhg9c3+7T80wybygzEuj3
         RV6cs74Rj4x4MqV2tY/W16/WDspCaISOEdketZQRBxT5vxmpxIFAB4LeYQ6xOAzeQFI4
         A+Sw==
X-Forwarded-Encrypted: i=1; AFNElJ/HK2/HLC/Jc5KCa6C6WoAlCj2JtgmCXbS9ZCW9y/fctzUz97u22xB/cimRTfDOOMKbOrfIUlSVI4I/rOaYH2VP3Eg=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/+ijcSO0w1Kut0yhkvJskfaAgO5fm530upa9BcnRDVWCfNXqW
	n1L/zZBiK40aDFOM5ThmSWo9/I17loj/oJLHM3cj+D0m89qLF9ddq1XvDVG4GPjLc60=
X-Gm-Gg: Acq92OEIP1dSGnvqcm+Tk2CkKo9KWjiumNdnRZNM5lwAzHbrJVVtG+yEgZOy8vhI1er
	7VS9dzP0OZ5Nfwh43TGTPSNkp8/URJY9r5WknduWWsYIzXsCOUOkse2c8z1r5RTOynmljGNDyl5
	9i3OQd9S3Gci+qUVc+U95CIyZ8GFYAC7164GkvUxmNtzQqZoeM/SnbRwpr2lDdwLiw7HOwvw31V
	LRj6Bl8EbRnlj1UUO69OxB/rSMktZF4mbuLKRjjZGqwIfCmaLsKTBi3/cuT0V7fKiCrpA6Aijao
	hTO7weHCXc6bXshxcndeFpWCwT8pcIgC5WZv20x49/2XsnZPNBHOY5n/06mNeoS1vClPpxESWvu
	CfsoRteis97uSGTTBMLOdCRkh6m58yu/7Bal5AlAyQlAtn6S2vijW4dVdbsUf0sNY19iFIE75dR
	ou2ekLkCjvPpON9si2C7/gyncGuI8ngZ+B0r2HwhdekJuN3lNSVKzkhbiVSq4LjLhSY7e75SHJG
	m9nFJlsM7sjmD/EBIkqLOK8S6wGEfzZ
X-Received: by 2002:a05:600c:5296:b0:487:219e:42d with SMTP id 5b1f17b1804b1-48e706932d5mr152138235e9.11.1778510598372;
        Mon, 11 May 2026 07:43:18 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm26421916f8f.33.2026.05.11.07.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:43:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 16:43:11 +0200
Message-Id: <DIFXDYIPL4EY.3BAEX7B7MNLX0@smile.fr>
To: <yi.zhao@eng.windriver.com>, <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH] nftables: improve reproducibility
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260511142142.3620917-1-yi.zhao@windriver.com>
In-Reply-To: <20260511142142.3620917-1-yi.zhao@windriver.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 14:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126851

On Mon May 11, 2026 at 4:21 PM CEST, Yi Zhao via lists.openembedded.org wro=
te:
> Use SOURCE_DATE_EPOCH to set MAKE_STAMP instead of using the current
> time, thereby improving reproducibility.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch | 34 +++++++++++++++++++
>  .../recipes-filter/nftables/nftables_1.1.6.bb |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001=
-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>
> diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-config=
ure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch b/meta-networking/recipes-=
filter/nftables/nftables/0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EP=
OCH.patch
> new file mode 100644
> index 0000000000..7d2f9c0dfe
> --- /dev/null
> +++ b/meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-=
set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
> @@ -0,0 +1,34 @@
> +From 77de073b1cc7413b1d230995851338345d56a8f8 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Mon, 11 May 2026 15:52:29 +0800
> +Subject: [PATCH] configure.ac: set MAKE_STAMP to SOURCE_DATE_EPOCH
> +
> +If SOURCE_DATE_EPOCH is set, use it to set MAKE_STAMP instead of the
> +current time.
> +
> +Upstream-Status: Inappropriate [embedded specific]

I think that this patch should at least be sent upstream.
Reproducibility is not "embedded specific".
See https://reproducible-builds.org/

Regards,

> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + configure.ac | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 6825474..2b147af 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -165,7 +165,10 @@ AC_CONFIG_COMMANDS([nftversion.h], [
> + ])
> + # Current date should be fetched exactly once per build,
> + # so have 'make' call date and pass the value to every 'gcc' call
> +-AC_SUBST([MAKE_STAMP], ["\$(shell date +%s)"])
> ++AS_IF([test -n "$SOURCE_DATE_EPOCH"],
> ++	[MAKE_STAMP=3D"$SOURCE_DATE_EPOCH"],
> ++	[MAKE_STAMP=3D'$(shell date +%s)'])
> ++AC_SUBST([MAKE_STAMP])
> +=20
> + AC_ARG_ENABLE([distcheck],
> + 	      AS_HELP_STRING([--enable-distcheck], [Build for distcheck]),
> +--=20
> +2.34.1
> +
> diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/=
meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> index d27e60a18d..5ab31f9b0c 100644
> --- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> +++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> @@ -12,6 +12,7 @@ DEPENDS =3D "libmnl libnftnl bison-native \
>             ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', =
d)}"
> =20
>  SRC_URI =3D "http://www.netfilter.org/projects/nftables/files/${BP}.tar.=
xz \
> +           file://0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.=
patch \
>             file://run-ptest \
>            "
>  SRC_URI[sha256sum] =3D "372931bda8556b310636a2f9020adc710f9bab66f47efe0c=
e90bff800ac2530c"


--=20
Yoann Congal
Smile ECS


