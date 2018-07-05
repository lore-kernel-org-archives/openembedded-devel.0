Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8D72378493
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 16:04:59 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id t14-v6so5745212uao.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2018 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UpFsrMElVUQ1HbNoE21xshko6zn32ZTAQRvhYe+AodM=;
	b=bVRfaFaZRpbBn3dkTwLJiLPFmDHUHxogYwpSKwrLdbGEeFLjVWkheEUrXIPU+bI04J
	CeYrA0IQaysyxnTXr6JDbmAbE8HMe8tksmdgIi24XHnVdpuUkL0pV/BtAY/zoJDxcgUa
	1MYmOmXzLZLJ61eBisdNxVnHF4QOic0jaF/su+D/H3Hyy/0IY/zhx8fpktSjnLjxbNlw
	xS1XjcVuVk8bBzsLB6u8TqeFlTsv7v868V1MHc3l2T6UzCmgLesM9a3A6Xu3UJHqwJUL
	XBkkISNiaQZprDhOqQ2xPnHMA8k5JwFP5Eu3/DQfz/2In8Aez6nwq2gGrpCNogHgJ0Ze
	k+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UpFsrMElVUQ1HbNoE21xshko6zn32ZTAQRvhYe+AodM=;
	b=SiNSOR9cjaiRtyY5q09uKPxrvr9Zbe4GJ9NU1A7GUBDwTR4NGAIPz/14y3ZNT8DfCj
	F0WPUAlyjx8mEwekNcnLg4qYQbM1LYZDRJpvqcYQ/Z4q1KMr4YNp3pUSAOaT/8brFwtV
	XJdlD2dshqLuzgvex6b6cwl7mF4Hh9891/CXufimUyXTUuKCsphCyDKJEX8RV62zpmIC
	6MBX83aAfnWt2V8nk356ih+/NirMTJpIdsRlcXzon9ym5wJaLXMDHcUBmVpVX1vaxP5l
	S5ZOWHLqDR/LQm/Zh0Q02x8a6EcrNi1P/OE0Pkg/vyKgd997FO4FEZ3B+nGNQ7Jg21OZ
	20ZQ==
X-Gm-Message-State: APt69E28lj72SF5EQIx/iSyHzHfa4fgu+VIsdMJy9AUAtWHgU1IUA67T
	8Y6jWDO1r2uQH3R7buEgQFTSbFowdRPQLyMPacU=
X-Google-Smtp-Source: AAOMgpfNWZUuvxBmC7C8jy+i2B3QdS0FVfRtU+IPlqeflURLv/hWHnbb33qjfQQ1EvPO8ZOUUciMmTCyVSz0kNLdsOY=
X-Received: by 2002:ab0:11dd:: with SMTP id
	q29-v6mr3953262uac.191.1530806700195; 
	Thu, 05 Jul 2018 09:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20180705092836.120148-1-xiao.zhang@windriver.com>
In-Reply-To: <20180705092836.120148-1-xiao.zhang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2018 09:04:34 -0700
Message-ID: <CAMKF1sqFq4WgmqM12otHrqNiTTfjgEjgG5AtrMk3z9pNRHiDCQ@mail.gmail.com>
To: zhangxiao <xiao.zhang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-core][recipes-extended][PATCH] diffutils-ptest: add runtime dependency on make
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
X-List-Received-Date: Thu, 05 Jul 2018 16:04:59 -0000
Content-Type: text/plain; charset="UTF-8"

wrong ml. This should go to oe-core ml.
On Thu, Jul 5, 2018 at 2:29 AM Zhang Xiao <xiao.zhang@windriver.com> wrote:
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ---
>  meta/recipes-extended/diffutils/diffutils_3.6.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/diffutils/diffutils_3.6.bb b/meta/recipes-extended/diffutils/diffutils_3.6.bb
> index deadd62c65..8ba897d18f 100644
> --- a/meta/recipes-extended/diffutils/diffutils_3.6.bb
> +++ b/meta/recipes-extended/diffutils/diffutils_3.6.bb
> @@ -19,6 +19,8 @@ acpaths = "-I ./m4"
>
>  inherit ptest
>
> +RDEPENDS_${PN}-ptest += "make"
> +
>  do_install_ptest() {
>         t=${D}${PTEST_PATH}
>         install -D ${S}/build-aux/test-driver $t/build-aux/test-driver
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

