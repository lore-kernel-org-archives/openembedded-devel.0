Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D0A32788FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 18:36:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q83so6927535wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 10:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I3rocnOp0Ka9h5VhbUOeW4KxqJiIjLh4SLTFbHwaA6c=;
	b=GecPIg3mBLq8G1fv3Z/yWO5fG0gybsqegL/ucc8UTaSHg3w1cLmzXMzJJJJjMGMYHu
	qNbnHjbd6WdVDX8TlzJQcAbzGDW6yVf16kRFZpsxB1cDmVweKgJZySLONm8phBiHlDWa
	mTA0V3TVbfPPLZiM/k7M1RaKjwwqKVtOd8JnTlxMo+DbvOmGCSnxRYFgv2qOchIphaqm
	bVqhk+UhZ7gaXV9fVvigWqGJRvKf/DP0L9PISjkb8XaAvUGvELdgyLxMP6w+Osedr94g
	hy6e1PL8ZC8yfER9wSSdtTne7RLFTxU7igxWb45I3bLJMWTicj/O2ss7L06ECrbmXWrs
	cqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I3rocnOp0Ka9h5VhbUOeW4KxqJiIjLh4SLTFbHwaA6c=;
	b=s9gtB23Yvga/lj0V//0NlJpoHtupYpws528u4HEXEH4kWYUFw+SefcmtdHDi2/Z9wx
	WqXoE8mOsPWUm92nmN1tOtzrSPfFAElK9ZFBDbKtdn78rPgPfv9lsmlP26YToEd3nTEy
	5BHHkUQqS9QtfDptEZoO8yVls2OYZfgOpy+cdRHMKFbcfQoTy0iVqkto3rh8ikfcpUoZ
	J5/ZCeKKie/sULtA4qcwI9ZjRfYOTt9Mlrl2CMfD95voWObbOlU3ub5E1DdcqxRQOTFo
	IGWx59h9oEgzebbFqSj42Gv3zgRWCE01KzjcPcZ/6vI5wAmIFXceaKYH1SNEkqk1cb+o
	W2HQ==
X-Gm-Message-State: APf1xPB9g9ncBjCkUREt7sFYUozHTYzYDgQpj4qhebnKIGL9dUio8Bd7
	w/QvAQGizzzrIjF74Y9D38j+gwavaZKCmmmOrWo=
X-Google-Smtp-Source: AG47ELuY8mX8l6XtwrRvnDNL1PhmUxeVFjdqZaq4D8GCfn/+BHY6X8SRZOkahdXF/8v1QKJOl6MmhLjDJu7nVFbT35Q=
X-Received: by 10.28.225.130 with SMTP id y124mr10732311wmg.60.1519842987346; 
	Wed, 28 Feb 2018 10:36:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 28 Feb 2018 10:36:26 -0800 (PST)
In-Reply-To: <20180119151942.19731-2-Martin.Jansa@gmail.com>
References: <20180119151942.19731-1-Martin.Jansa@gmail.com>
	<20180119151942.19731-2-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 28 Feb 2018 19:36:26 +0100
Message-ID: <CA+chaQcfAXi3qiQ_oyDX+becM=auVOMpnNuTThXLUJ+0+WdH1Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/3] freediameter: add dependency on virtual/kernel and use MACHINE_ARCH
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 18:36:27 -0000
Content-Type: text/plain; charset="UTF-8"

ping

On Fri, Jan 19, 2018 at 4:19 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * TUNE_PKGARCH cannot RRECOMMEND MACHINE specific kernel-modules
> * without virtual/kernel dependency (which isn't really build time
>   dependency) the QA check won't traverse the dependencies correctly
>   and shows following errors:
>   ERROR: QA Issue: freediameter rdepends on kernel-module-ipip, but it
> isn't a build dependency? [build-deps]
>   ERROR: QA Issue: freediameter rdepends on kernel-module-sctp, but it
> isn't a build dependency? [build-deps]
>   ERROR: QA Issue: freediameter rdepends on kernel-module-tipc, but it
> isn't a build dependency? [build-deps]
>   ERROR: QA Issue: freediameter rdepends on kernel-module-udp-tunnel, but
> it isn't a build dependency? [build-deps]
> * also change kernel-module dependencies from RDEPENDS to RRECOMMENDS
>   because the kernel config might include these directly and then
>   freediameter shouldn't fail to install
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-protocols/freediameter/freediameter_1.2.1.bb          | 8
> +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta-networking/recipes-protocols/freediameter/freedia
> meter_1.2.1.bb b/meta-networking/recipes-protocols/freediameter/freedia
> meter_1.2.1.bb
> index 92cd24c3ae..c556eb48e8 100644
> --- a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
> +++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
> @@ -7,7 +7,9 @@ Accounting needs."
>
>  HOMEPAGE = "http://www.freediameter.net"
>
> -DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn lksctp-tools"
> +DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn lksctp-tools
> virtual/kernel"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  fd_pkgname = "freeDiameter"
>
> @@ -121,8 +123,8 @@ FILES_${PN} += "${libdir}/${fd_pkgname}/*"
>
>  RDEPENDS_${PN}  = "glib-2.0 gnutls libidn"
>  RDEPENDS_${PN} += "openssl openssl-conf openssl-engines"
> -RDEPENDS_${PN} += "kernel-module-tipc kernel-module-sctp"
> -RDEPENDS_${PN} += "kernel-module-udp-tunnel kernel-module-ipip"
> +RRECOMMENDS_${PN} += "kernel-module-tipc kernel-module-sctp"
> +RRECOMMENDS_${PN} += "kernel-module-udp-tunnel kernel-module-ipip"
>  RDEPENDS_${PN}-ptest = "cmake"
>
>  INITSCRIPT_PACKAGES = "${PN}"
> --
> 2.15.1
>
>

