Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 23A1B78245
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:14:17 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u18so3509340pgo.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=GI/SSvNEucyyBm3wdK5bz4xGHJjpjaGNA7LwLt1lACo=;
	b=n8dT4pBTC3PhmtRAM73zpave5G9z1CrnxfrKVP8vQZ8+I2perU4KvpPcsEkmBCfHV9
	0vROITEjUk3cg4WZgz9jcSHFioe6ZHE6XdYhynH28zIyNRGOnVPMKnzT7MFAFP9wqaYa
	ypWS9W0jle7rQk/pcqUy8pFQaDaNaDIqUxjHS81ziA+ey0GJeyLO1H67XZ+tlw0EKmhS
	HF6MlaSZC1vbSDxtAQ2qme9Vjqvsw8xLBBq+5TWwL+p4Jfaqm0WcZuN98v6Li/hz9i4b
	L8tZkxmgxRDukalaaVsiW8qMRFJ20wIRywD6LUzv1xi6fFfn05aUkadcNTiQZ05SgpSy
	d2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=GI/SSvNEucyyBm3wdK5bz4xGHJjpjaGNA7LwLt1lACo=;
	b=PIw0KZcwX6WUxADedvZI1u8NTQ++snM6IgDF4/i3CQyeg52+gxcLQssALDxLaSQfWl
	Y9ftRzN1FMTGfRnsZ5dAvwfb0ZKFXddHmbbFrZmGggW5SGswXPq/dZL5NYxNquuCiRlS
	iX/5tkqkyZzWGxNP/XQgzeKBiFFsY/jiasZwdaqXUyLcpjngs+AkOBfDd5ay/llvPshI
	iqCs6iGNo5SMEvaS0ekP1SS6iajNiZ0h6PRUhqPu4rFfTqT132JcTbj5ZnTJ9ikY388p
	Ha8GrURksDyKRParUi8ssAfoG283KJGSeW2gu/e3k7LCYxcXhOq/o1eT7wIdssE9l5Pn
	zr+g==
X-Gm-Message-State: AHPjjUgStFDoIIW1WanbC8OAgN6jtx5LUVN3L7KTs/6Lq5i8oNJp2r86
	7I9iI4mTDwJZESFvaicOzFM=
X-Google-Smtp-Source: AOwi7QBl+DFDC6lNgdj/yt6NsBc6/x7X++4+s2eML96dzPafKBZHff23bNLUOEhys2TKs3wiLo9bGA==
X-Received: by 10.159.198.10 with SMTP id f10mr5858722plo.14.1506003259188;
	Thu, 21 Sep 2017 07:14:19 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:6413:eafd:1152:fa5c?
	([2601:202:4001:9ea0:6413:eafd:1152:fa5c])
	by smtp.gmail.com with ESMTPSA id
	v186sm2656249pfb.51.2017.09.21.07.14.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 07:14:18 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20170921100000.19981-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bc2d867f-7417-a56a-9770-dc46ad474664@gmail.com>
Date: Thu, 21 Sep 2017 07:14:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170921100000.19981-1-Martin.Jansa@gmail.com>
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: Re: [morty][PATCH 1/2] lftp: change SRC_URI source
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
X-List-Received-Date: Thu, 21 Sep 2017 14:14:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/21/2017 02:59 AM, Martin Jansa wrote:
> From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>
> Changed SRC_URI source to official web-site, which keeps tarballs with
> old releases.
>
> Cherry-picked from master, but without the upgrade to 4.7.5.
Both in stagging.

Thanks,
Armin
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
> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
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


