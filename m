Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id D50436AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 20:00:39 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id b67so38214160qgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2016 12:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Uxjo1eyPmu+r4MbF4Q5PBq9NlNTvEaGvXvcQjfdsjiY=;
	b=wE4W8Bk9wFIaXeLJbdeRCazSMvnG8Iuxe04g5qkQgJLmj4uGT/G8RS1sLTD7v6weNZ
	kYVtpFP222EBDpAwiBEkh2sYiqoiQQHfXV4vB4PK/tHcYngx+Px4Mjs61AnQ5l7m/Unq
	wqNV56wGFSbqqzz8wb7BjX4QSCVi/TaIDY676eBtdQPPjIE/Ivnzui/lkDpE72uBCVfp
	sWNGeEnwxERBNFQVb6gg6aOxf5VUkVBhQPVUPjX3BAF6sjd0uxDYqiZmFKqqCgU9vWRu
	CAY7s9ly7lbyn4aKudvZrU1fYsD/RXfw1nJl4lefD4uC+krho+wyj2wWoRDSFXlguSjG
	JBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Uxjo1eyPmu+r4MbF4Q5PBq9NlNTvEaGvXvcQjfdsjiY=;
	b=eO5P1wjNUd6XtUtAcGR5uEm5iun1lkCR+IJT6eWgOs64mqinlZ1PpUNUXk1at2+U12
	Re8gYgP2Gs3wxev3q0C8ZUgocKNOtz+w97SBfJ+FA+Uj7ZpDHZdUBNOhmWNbfYrcJeWp
	26GDGaixNOHMmEMj8gPqZGm9NQO9UMgdYlqu3m/CCW+uFgg3h3uvn0eLctvc+rI4ce3x
	Wqv588XCTQ7aY1Ey2mEBW5v7rIpm1fobFjI60mfDaE27DX/z1j+EOSfwx59ivUawQVHo
	hTrnGYk0TlDkfoJT2xLi08DZ7P0ZQADSalOtRJAWodQRdUr7rCWNM+j12H0iL5C3peDL
	jelg==
X-Gm-Message-State: AG10YORdqZQp/vmZ1+qc+XRhPanzWnyLx2p6Jzfpg5ZGF8Sdl6OZ0do3S9bFO04swNbSrT40Jf3ohyO98ePDEQ==
X-Received: by 10.140.238.8 with SMTP id j8mr35243082qhc.76.1454961640080;
	Mon, 08 Feb 2016 12:00:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 8 Feb 2016 12:00:10 -0800 (PST)
In-Reply-To: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
References: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Feb 2016 12:00:10 -0800
Message-ID: <CAMKF1spcJaX9+FcZHX+_QEVDH7QmDb0HCNecHwcuYqd0nM8_hg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: Re: [PATCH 00/14] Prepare for EXTRA_OEMAKE = "" in oe-core bitbake.conf
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
X-List-Received-Date: Mon, 08 Feb 2016 20:00:40 -0000
Content-Type: text/plain; charset=UTF-8

thanks for doing it Mike.

On Mon, Feb 8, 2016 at 2:57 AM, Mike Crowe <mac@mcrowe.com> wrote:
> This series fixes various recipes that rely on the current default
> value of EXTRA_OEMAKE = "-e MAKEFLAGS=" to explicitly set that value
> in the hope that bitbake.conf can set EXTRA_OEMAKE = "" in the future.
>
> The affected recipes are:
>
>  meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
>  meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
>  meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
>  meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
>  meta-networking/recipes-daemons/squid/squid_3.5.7.bb
>  meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
>  meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>  meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
>  meta-networking/recipes-support/pimd/pimd_2.1.8.bb
>  meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
>  meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>  meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
>  meta-oe/recipes-extended/efivar/efivar_0.21.bb
>  meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
>  meta-oe/recipes-extended/sysdig/sysdig_git.bb
>  meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
>  meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
>  meta-oe/recipes-support/ckermit/ckermit_302.bb
>  meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
>  meta-oe/recipes-support/mg/mg_20110905.bb
>  meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
>  meta-oe/recipes-support/uim/uim_1.8.6.bb
>
> Mike.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

