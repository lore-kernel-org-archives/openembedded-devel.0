Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E923671E1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:56:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u63so9626277wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=k/O0evLpNAIvD2V/EYEGBDD2oma0qH/ZlWM3FinFSkg=;
	b=jgjhpqqfLGMGgjOUjIExADvkJziLZ6ywUhEGKxtsRAGFfSemwdHwyMKqgU7gJXQyP4
	NdOr68CQ8Vmsye3/e1Veyq0maH9XcU2nQjrk7/LKdqsdC3g5G+33KEvtx0K7K4z45oZW
	oaPYs/snYx73gg5y0fGe4GrJQmXI88P+xj8AGU+f0YxV0eGJIWJOF6RISv0TF91IaLso
	CD1tbcuKLvu7ykkd/YHmNRG7geTDlXPEtOqJ0jQqy4dZcuQUGj/CZ2ghNsQCpoFxtc75
	BXm9uz1aKTv8BNhnJLUAvr/TTeC6RR3zzdUENFUfDA5WcnFoN7FnlGxZSWa91YVZJV/z
	2HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=k/O0evLpNAIvD2V/EYEGBDD2oma0qH/ZlWM3FinFSkg=;
	b=T04wXPhBt6XOSY1ySQb9hvIdnMe1KWUTR8cWYTz8YCmI5n3D5aq1wVEuVJGi+5d1eI
	ZBodB0bqzkFWBW3dESg+tkal17+2xrGsGGTNkEuZMl0WsB8xMV/Kmw49CkIjJ5GuoCB2
	wCNJpFjFcHUBV7SABUjv83N3KkttEez5/8vmeyRTWA71YLA5fxzlvKoXC1gh4emyuFBP
	HXYZwkutNk4h2jHxDl8UAYH/vyvrtz5e4E0w9vvNccgwhrHHQIa8QCfOP901dZpkIg/G
	k52+V62R7LO0ENzTJNDbhSVT/iUjdda7b3nspcuyuhlTyBlvuATIWWtDxH92LlkkpsNh
	wXyw==
X-Gm-Message-State: AMke39kp0VcnCf14Rgss43yE4vbPcim3OENsLAE9/tT7QKHDIrCXdoez300v0uM+FQih2+S+F06jgwY4E5RIlg==
X-Received: by 10.28.61.136 with SMTP id k130mr9178447wma.128.1487184962649;
	Wed, 15 Feb 2017 10:56:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.150.194 with HTTP; Wed, 15 Feb 2017 10:56:02 -0800 (PST)
In-Reply-To: <1487019728-19329-2-git-send-email-max.krummenacher@toradex.com>
References: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
	<1487019728-19329-2-git-send-email-max.krummenacher@toradex.com>
From: Andy <andreas.kling@gmail.com>
Date: Wed, 15 Feb 2017 19:56:02 +0100
Message-ID: <CAE-gg=5LXaa+ym_kHePZyGt0x3w1Lp2BXjwSHXbt7dzsr9S5Lg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH][master-next 2/4] crda: add rdepends of python-m2crypto-native
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
X-List-Received-Date: Wed, 15 Feb 2017 18:56:05 -0000
Content-Type: text/plain; charset=UTF-8

all right, the fancy way. Thanks you for clarifying.

2017-02-13 22:02 GMT+01:00 Max Krummenacher <max.oss.09@gmail.com>:
> This fixed the build, remove blacklist also.
> While at it, cleanup DEPENDS of python stuff already added by inherit.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta-networking/recipes-connectivity/crda/crda_3.18.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> index 2aa9a09..45ecdd7 100644
> --- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> +++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> @@ -4,7 +4,7 @@ SECTION = "net"
>  LICENSE = "copyleft-next-0.3.0"
>  LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe"
>
> -DEPENDS = "python-m2crypto-native python-native libgcrypt libnl openssl"
> +DEPENDS = "libgcrypt libnl openssl"
>
>  SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
>             file://do-not-run-ldconfig-if-destdir-is-set.patch \
> @@ -18,7 +18,8 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
>  SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
>  SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
>
> -inherit python-dir pythonnative
> +inherit python-m2crypto-native
> +
>  # Recursive make problem
>  EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg'"
>  EXTRA_OEMAKE_append = " USE_OPENSSL=1"
> @@ -34,5 +35,3 @@ do_install() {
>  }
>
>  RDEPENDS_${PN} = "udev wireless-regdb"
> -
> -PNBLACKLIST[crda] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130675/"
> --
> 2.6.6
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

