Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id A5B4B7D713
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 18:18:18 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id k189so10898953qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 11:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8H0CDWBqZiebXhCBP2OEv0BRiFYevrU/jl9I1myC4yA=;
	b=eQa92QXbpvcCeGI2EdPHDDbPeuasocUQnKLfuNayh6vbwmpJAw+sURoHdqgeAMmrUS
	Lu3i6h7CgKRez9MJe+ZBoVqtXBsxsvFbz+dJpenSVr+ZG/hoSDB+GjTwmFKu05ny7Gsi
	U39WgD681757SpfASmUEz5qx5krB3kXTwflUr9CaKaufeZ2+ybvef1Fh61aL9RsH3f0w
	Gj8NMBDDgDwqUtQzq+yo9ItZiSFPaD6mxEP9q6RrGfM+0e8CoK1KAimrdK3iPXIdtjua
	kXZwVPnOv5SuRcxk72H7Wa3He1ZxWdSZMa/on8o3wRw9v3sYh2DOp1enGkVgYAVXhXGd
	V5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8H0CDWBqZiebXhCBP2OEv0BRiFYevrU/jl9I1myC4yA=;
	b=NXrxHyXZxTy9ctootg+pIsjA1Ayq2/g3YWVyGem4uG1w6PpWYyNP1sPmKNE/jDlF+n
	WHiN0LaiVPBjXO7SNgGRoTMvQDCVEUKGjIskoPe6XCOwjUc07osxULPwBgxMQGpsGVmD
	omn3rHwYOFvZ3+DXaIbDPGr+SH0AzRLwiYYb2PNNgy5PtjdIX26lZblXRaMe0Q/PnBoz
	FqCRVVblvYdXSWnAi+uPJomOlf/l8GwMILLBn1gBbDGJZQ6nF8Sic7smAA1Hatm0N1m+
	Jmeo5DOh2py6CCFnhq29+K7BW0UCmIcSbvfHW5dsHbGQmtPkTcVYDewPZ/FH1xZeMjoc
	cIbw==
X-Gm-Message-State: APjAAAVfNOItbHN81/ymefdZ2lUjxgqpRQP8OqgUI2c5f6sVUHaNhjhR
	zFG7uk78iceVTpOOKNiXoj9kjITJWNdWwlHpNqBfZAtnPwM=
X-Google-Smtp-Source: APXvYqyczMrCMXRRRSedhhDw9YHxQx2nf0XuocHa9aowZkOYsY+cQGP/8xyHqRTnu1IOTDTqmxIhERRADNWwiSXDktY=
X-Received: by 2002:a37:7b02:: with SMTP id w2mr28538271qkc.225.1554833899348; 
	Tue, 09 Apr 2019 11:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190408205138.29472-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190408205138.29472-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Apr 2019 11:17:53 -0700
Message-ID: <CAMKF1sq3JHuxAH6cjG1AU6fYN7hj6jkiM836b3BGHr5=01UStA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] ell: remove recipe
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
X-List-Received-Date: Tue, 09 Apr 2019 18:18:19 -0000
Content-Type: text/plain; charset="UTF-8"

ERROR: Nothing PROVIDES 'ell' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
DEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'ell' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'ell' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ell']
NOTE: Runtime target 'packagegroup-meta-oe-multimedia' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-multimedia', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-dbs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-dbs', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-devtools' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-devtools', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-bsp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-bsp', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-extended' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-extended', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-core' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-core', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-security' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-security', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-gnome' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-gnome', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-kernel' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-kernel', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-graphics' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-graphics', 'ell']
NOTE: Runtime target 'packagegroup-meta-oe-benchmarks' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-benchmarks', 'ell']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-crypto' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-crypto'
NOTE: Runtime target 'packagegroup-meta-oe-crypto' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-crypto']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-support' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-support'
NOTE: Runtime target 'packagegroup-meta-oe-support' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-support']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-test' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-test'
NOTE: Runtime target 'packagegroup-meta-oe-test' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-test']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-connectivity' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-connectivity'
NOTE: Runtime target 'packagegroup-meta-oe-connectivity' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-connectivity']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-navigation' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-navigation'
NOTE: Runtime target 'packagegroup-meta-oe-navigation' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-navigation']
ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-ptest-packages' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-ptest-packages'
NOTE: Runtime target 'packagegroup-meta-oe-ptest-packages' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-ptest-packages']
ERROR: Nothing RPROVIDES 'iwd-dev' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'iwd-dev'
NOTE: Runtime target 'iwd-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['iwd-dev']
ERROR: Nothing RPROVIDES 'iwd' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'iwd'
NOTE: Runtime target 'iwd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['iwd']

On Mon, Apr 8, 2019 at 1:51 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> This recipe will be moved to poky instead as newer versions of some of
> its components depend on it.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta-oe/recipes-core/ell/ell_0.17.bb | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/ell/ell_0.17.bb
>
> diff --git a/meta-oe/recipes-core/ell/ell_0.17.bb b/meta-oe/recipes-core/ell/ell_0.17.bb
> deleted file mode 100644
> index 27f11cfbe..000000000
> --- a/meta-oe/recipes-core/ell/ell_0.17.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY  = "Embedded Linux Library"
> -DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
> -LICENSE  = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> -SECTION = "libs"
> -
> -inherit autotools pkgconfig
> -
> -S = "${WORKDIR}/git"
> -SRCREV = "ebc021cee3b2d20ca2af5e3ed02495da616b2fd3"
> -SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
> -
> -do_configure_prepend () {
> -    mkdir -p ${S}/build-aux
> -}
> -
> -DEPENDS = "dbus"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

