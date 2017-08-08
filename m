Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 047797197E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 19:04:12 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id s143so27134040ywg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 12:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FNV0SYSB2oJaNVSXCB5rup8qNwVdgJO6JsSZnARZ+g4=;
	b=vSQdQRyLEgJF52sm4vcYS59PVrOmKSWa2qV34rNzICJZRjk3cf2djntIuNMvOXu0MA
	8VkCOTDEECyFNzqzVPyr++N58YvLeg94fkYSgYt1ODxSFQ/NJ7LLB3sO8gKSYsNYt+g/
	PjTVdD7kTl5x1DPfjtdcRRj70Z+aEq3F658oH/2CovOhvO4aah2VjEHKrdclA/eQC1vc
	FB/GrHlaWVvPeOJd0XGgQRVag5FvKs93AMSbBKvn0guf1hA9yl65SDxcsY+JsmqqJ/Lr
	MhTimuYLhxK6EImSRq85W1ZKhTUSgkCu6pAZQwIh1IoHrMaBuUeJZXw/m1oD7B49UHsQ
	dFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FNV0SYSB2oJaNVSXCB5rup8qNwVdgJO6JsSZnARZ+g4=;
	b=d9AugHSiIZzCPGeHnGkwEGgkn4gRznuLt25zrcUAyig/+2YjtBTmPbkGwoT8Qr/eXm
	5AD2DiQQVwDBoMc9wqr9+Yd0ygHt2tWU0JSJhzhrSYynlgs03O8BB2KdOTPUQuWna7Ex
	0KnogOzCA3sqq2mQHxeBk+YUK9zplv3R98ec0M8RTot+Mrg58Es51gwlbj2zX9fVT+0I
	BMtuktKKAj1kd5DO6bMiFSMFfuXkkZbTk64OmGTWdyvgOHU+sE3p9ElfUbNpl0rsV1hh
	wWx7jWRcG5nCSipXtxICdNwYhAjG8tDUy4TibqHnjOOmzsnUV8l6Yr/0HucE9jRg9vom
	hSKA==
X-Gm-Message-State: AHYfb5hkpLfMLQxx1su0JbqQV4Y+N80fEorR+L/BxKxxN+RsyNlStQYP
	PbMufClgcYrJvJ3gAm1dPGNAOciYXw==
X-Received: by 10.129.183.20 with SMTP id v20mr4404981ywh.377.1502219053652;
	Tue, 08 Aug 2017 12:04:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.172.196 with HTTP; Tue, 8 Aug 2017 12:04:13 -0700 (PDT)
In-Reply-To: <20170331151828.25907-1-Martin.Jansa@gmail.com>
References: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
	<20170331151828.25907-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 Aug 2017 21:04:13 +0200
Message-ID: <CA+chaQeX1LcAh0WQsMrNM49pgwOp-eeS8eafHreFMw5gX8BfFA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: Re: [meta-oe][morty][PATCHv2 1/7] lftp: change SRC_URI source
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
X-List-Received-Date: Tue, 08 Aug 2017 19:04:13 -0000
Content-Type: text/plain; charset="UTF-8"

ping

On Fri, Mar 31, 2017 at 5:18 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>
> Changed SRC_URI source to official web-site, which keeps tarballs with
> old releases.
>
> Cherry-picked from master, but without the upgrade to 4.7.5.
>
>   commit a2e075ba656a89da58ca4f849c2f08ec6d50a96f
>   Author: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>   Date:   Mon Jan 9 15:34:07 2017 +0100
>
>     lftp: update to 4.7.5 and change SRC_URI source
>
>     Updated lftp to version 4.7.5 and changed SRC_URI source to official
>     web-site, which keeps tarballs with old releases.
>
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> index 287821194..d62453745 100644
> --- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> @@ -6,7 +6,7 @@ SECTION = "console/network"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
> +SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.gz \
>             file://fix-gcc-6-conflicts-signbit.patch \
>            "
>  SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
> --
> 2.12.2
>
>

