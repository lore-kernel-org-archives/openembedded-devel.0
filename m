Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2C81F7E97C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 18:04:42 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id j31so8130938qta.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 11:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8mDVZJNKaaxcvOD0ypuR74uNWRdjOMyPKvbe83yU2ho=;
	b=insgbwjlwh8x4dwqelMr2yYcAwxVfVTs2mEmC7Im6nuHCvD6DXAoBBDD1LDQwQpRyB
	OwMYfPZ7yh2PuCx+bMBY1GLr+aK6CechXNUmBWNhwgOEi3gx7EifJSCGrmx/DTVGB1Xn
	0P1cbigeMYKLGdcbCMSCB6jWyL6L6ChfBOon/bH4XxcvnANJ1zg/N7RCg+NWBbWD3lTs
	YRb2YyYdrONiBS7k2ayDT5gMkfFzJZ6hLzrjkkm4MLcNAukGp79ZYSa6kbnpSG8k/vrU
	+zrHbr4hFDjMBOW24gwiOs4j3P1sCTC9X6oEbE3jIVpGG0u2T3351y6dVDYAJArggI6/
	H3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8mDVZJNKaaxcvOD0ypuR74uNWRdjOMyPKvbe83yU2ho=;
	b=bt8aA4Ss/mXNaE7VroBH2p3E4rvL3wc+eLBma9iEQgyA4Idi8HelMDtVo/jXscFfmw
	+D62M2TWUT0phiPU0aHCZsNnpNOzSc0ez+zLOxSMMe7OwFnnjaQ9gSkTNQ/xnBPuVQ82
	eMz4zS/15plCx5DDuxmqXxYDXTlgMZV3A4DH+aT/k0RFMuUJOMvGYvDO7G3WA5ZTh0y2
	Phi3keQ/UAdMTy7BqpfVMmfjKel7706zoGc90hTeGCXiBTRnC9HOaDOqG4wBG7g/nQS0
	2+PyzBTmxR72NH0VMd/PPXOn1eEDvsFs4Gvszj2nVJPA7SRjNNH9cxb02qjdNyb/AHa1
	alZg==
X-Gm-Message-State: APjAAAXNMeUsTWSuPMEWxEbJueAxZ+7SM2p8ZIVJiTlcCkopaIemWXma
	UeQX/W6mDv0mCV0yZqeg3B1aMrotlwVv3ADWKwkqZf1eQHc=
X-Google-Smtp-Source: APXvYqyn215H9VCltX7uUjeZ7rEB312a4R4+Qqu+7NyDDmrmoLlMkTqPRAh+URJXKv1Exm7U7Ksu3wNYhgPNeVZ0OeU=
X-Received: by 2002:ac8:1103:: with SMTP id c3mr4497439qtj.88.1568397883525;
	Fri, 13 Sep 2019 11:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190913140533.7328-1-sno@netbsd.org>
In-Reply-To: <20190913140533.7328-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 11:04:29 -0700
Message-ID: <CAMKF1soMXNPLopyXTV9t3M5f1KVpBOJCAa2TutCdJ7PL2Uv+2g@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libstatgrab: add recipe for libstatgrab-0.92
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
X-List-Received-Date: Fri, 13 Sep 2019 18:04:43 -0000
Content-Type: text/plain; charset="UTF-8"

Fails

https://errors.yoctoproject.org/Errors/Details/270231/

On Fri, Sep 13, 2019 at 7:05 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> With the recent update at begin of summer, which includes the fix
> for nxp bsp issues, it's time to bring libstatgrab to more people
> than the few who use it in datacenter monitoring.
>
> Language bindings will follow once base library is settled.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  .../libstatgrab/libstatgrab_0.92.bb           | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
>
> diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
> new file mode 100644
> index 000000000..ab08d8bb2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Utilities to collect and visualise system statistics"
> +HOMEPAGE = "http://www.i-scream.org/libstatgrab/"
> +
> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS = "ncurses"
> +
> +PACKAGES_prepend = "statgrab statgrab-dbg saidar saidar-dbg ${PN}-mrtg "
> +
> +SRCREV = "fa7e1d9fe76c3a1a7ade264c746b3f5edc566f3b"
> +SRC_URI = "git://github.com/libstatgrab/libstatgrab.git \
> +          "
> +# Perl5 is for tests only
> +EXTRA_OECONF = "--without-perl5 --with-mnttab=/proc/mounts"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +FILES_statgrab = "${bindir}/statgrab"
> +FILES_statgrab-dbg = "${bindir}/.debug/statgrab"
> +FILES_saidar = "${bindir}/saidar"
> +FILES_saidar-dbg = "${bindir}/.debug/saidar"
> +FILES_${PN}-mrtg = "${bindir}/statgrab-make-mrtg-config ${bindir}/statgrab-make-mrtg-index"
> +RDEPENDS_${PN}-mrtg_append = "perl statgrab"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

