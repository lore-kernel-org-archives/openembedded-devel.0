Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3931F6BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 13:45:07 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g17so2940505qkk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M3AmiozWZdwBO22ZFu8net8nDTbkW6rdqJIFfWDj/Y4=;
	b=usJaDXSPp3KFokY0hVSwj6O2KxbLhGN5GEXGby2uL0rokropgPgICKEBR9JrkfK1G9
	CblhRM45o4YiaRq4FVK6e2gKolFt1p2duqxQVcsI1iznQIMoKz4gTikJpdy9pKeejrAX
	jZds5rAMvct5wlU7CnfhWXWjKnKmdhJBx6HhIDQKooMOWTxtJfANOWiPITyPAkkgwl2e
	bRecKsNxZv2ZZggnuBdbJQH4+vTbqW/c6JtWssBu2tghPcHLIeJviNpg/jMzh/K6djHo
	xUsFFUW5ikDTryLL/OssYoMLtkuF2tCR/IS5NlW8VFAWBHRfhawPGbHnZQ7tpVgLmbzL
	oWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M3AmiozWZdwBO22ZFu8net8nDTbkW6rdqJIFfWDj/Y4=;
	b=Q++5IC+zWVTNU+Uwu20qpEE1AE6DVUolWCdL7uRgMFuX5lRm0wVmei+C6J+EKoRMIJ
	BFrlEr6m407QpAcze8qV+/OwfrxepuAfCT0c5TpTkxXTL1qhgWhn5tP+CvE0Xznu91BL
	cVy5Yg1nX8y1kfo5tFQiRKN6SLJoVgvntAp9vtvz9xX+FPaqzy1tU/CnAurlshtEMlKy
	eRJijEgVwCMlbRAsIiFchqpxLNQSJQuWECY5EbJMRIc0AEP9/sRv7cfxkX5O1EeTFrsA
	j5sSkh4Kz85DFFEDQ9AcgboC1M/CXbi5+U2yJ3wBZYux/ga/fp8ZZWXgZ3idplfiwv3o
	h2dA==
X-Gm-Message-State: APjAAAUGntFgHnweyGReIjMc56a7eZlfG/6MVb764/ZhRPd+QwBYwbaB
	t8xEh4DBJopusQ4J9wPzT1D/EjIe2p0KmSHmcO5/Wr67d5w=
X-Google-Smtp-Source: APXvYqzfx6of0p3Fx4Mmgm4o3Bc0KrPQqCJ6lpEbhC2x9ZkpR4ZCMD/JltOrjG0DNNFUWwsfQNwhm1V+P/wUkvh1oLU=
X-Received: by 2002:a05:620a:13c1:: with SMTP id
	g1mr9687616qkl.9.1567086308693; 
	Thu, 29 Aug 2019 06:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <1566554709-22088-2-git-send-email-hongxu.jia@windriver.com>
	<1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2019 06:44:54 -0700
Message-ID: <CAMKF1spiaLD-o1BemHAXRhwJwikeTcZr82P_TmBr12DT2BKWOw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Thu, 29 Aug 2019 13:45:08 -0000
Content-Type: text/plain; charset="UTF-8"

https://errors.yoctoproject.org/Errors/Details/266491/

On Tue, Aug 27, 2019 at 6:24 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
> add it to packages RDEPENDS to fix [file-rdeps] QA issue
>
> Skip [build-deps] QA checking, add lvm2 to DEPENDS will triger
> circular dependencies, use recipe libdevmapper to replace,
> ignore the QA checking is fine.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> index 6ebf1e2..eb155e1 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> @@ -16,6 +16,10 @@ DEPENDS = " \
>      util-linux \
>  "
>
> +RDEPENDS_${PN} = " \
> +    libdevmapper \
> +"
> +
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>  SRC_URI[md5sum] = "f7818082056e5bc0be12e4c7fc20345a"
>  SRC_URI[sha256sum] = "9d8f8cac2836a1623c075b5cba96032271dc81a28b2aa27fbd8331e831416bb1"
> @@ -85,4 +89,6 @@ EXTRA_OECONF += "--disable-libargon2"
>
>  FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
>
> +INSANE_SKIP_${PN} += "build-deps"
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>

