Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFBC781F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 19:00:05 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id u185so6457213pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 12:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=scqDMS/zFXgig55/7h8thtRRvQ0fCcAcr2NIlMI670Y=;
	b=FkhPxzZJ6YAB91bEcY7GJMlkWNAmIozMlfNboQTVnEpIis3rwDkuMmHz/e6LLwLMv9
	s4uJquhRxyEEb9u4gLxdFooCi2zElcgmdWZtyCX3ifBhrvhEX3iOqnvRLlDsIiJij30V
	0LP/w4XQB4WgdVoDiDTTqawrd1nJ7MHevCGp4d73WYum6/FqB1BRptmgOrAT059Qg5t3
	XMJgzDzC8cZ1JKoab4QY2wQAutjU2MGvV3/HcyOhYNjRQHht+OBWM5VI709rLM1CsPuq
	GR1GqW0V3lvXP1w7cqAhokM6YmgQnWkTHF/3hYojQmrbKl/ymWkyeVpFzbvBg2crTAFn
	cS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=scqDMS/zFXgig55/7h8thtRRvQ0fCcAcr2NIlMI670Y=;
	b=pq241OcexvkKnbpM47289GTWSp6HAYwPlIfvn/28qxFLHZoq/AL+kH1wvIxRor22cT
	9bkMQwAd3af8G6ucUKWnz266cCKIiN/RrCdDpGHcrPLmUg8ZNcUkIWqr/oKg95OKKf1O
	JNyDyWsIoixfUSZrSS0mGB75ZNBaVQiw6/lAeWBu+Xc62fYY3T18cjUuAsc7rlM78m34
	TYW/iOmaMw1uGlaTyspzAeJzq22RKbkPDOML3aGon0XXbwGYhgkGB4VUr4NqQ6mtIt8k
	kQfxaXN6Tq9uWUMc5oeEUmScM2kS5ploHIRMfIe8+jYzgjG1YUVXKrPxx/X7S/EMSD3m
	zWqQ==
X-Gm-Message-State: AHYfb5gQB0MkJzXKNOVxylAUReEYh+ctzYavuuMw19UksY7ZYLSne0bt
	NfkMCXPCX4ZScw==
X-Received: by 10.101.89.3 with SMTP id f3mr12422813pgu.177.1502391607547;
	Thu, 10 Aug 2017 12:00:07 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:1546:4e93:629:a226?
	([2601:202:4001:9ea0:1546:4e93:629:a226])
	by smtp.gmail.com with ESMTPSA id
	w24sm13162895pfk.183.2017.08.10.12.00.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 12:00:06 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
	<20170331151828.25907-1-Martin.Jansa@gmail.com>
	<CA+chaQeX1LcAh0WQsMrNM49pgwOp-eeS8eafHreFMw5gX8BfFA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2388668f-8c1c-2f60-5156-a1c5b16ef5dd@gmail.com>
Date: Thu, 10 Aug 2017 12:00:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQeX1LcAh0WQsMrNM49pgwOp-eeS8eafHreFMw5gX8BfFA@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 Aug 2017 19:00:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ok. I dont' see this in the patch queue.

I work on this the next day or too.

- armin


On 08/08/2017 12:04 PM, Martin Jansa wrote:
> ping
>
> On Fri, Mar 31, 2017 at 5:18 PM, Martin Jansa <martin.jansa@gmail.com 
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com
>     <mailto:oleksandr.kravchuk@pelagicore.com>>
>
>     Changed SRC_URI source to official web-site, which keeps tarballs with
>     old releases.
>
>     Cherry-picked from master, but without the upgrade to 4.7.5.
>
>       commit a2e075ba656a89da58ca4f849c2f08ec6d50a96f
>       Author: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com
>     <mailto:oleksandr.kravchuk@pelagicore.com>>
>       Date:   Mon Jan 9 15:34:07 2017 +0100
>
>         lftp: update to 4.7.5 and change SRC_URI source
>
>         Updated lftp to version 4.7.5 and changed SRC_URI source to
>     official
>         web-site, which keeps tarballs with old releases.
>
>     Signed-off-by: Oleksandr Kravchuk
>     <oleksandr.kravchuk@pelagicore.com
>     <mailto:oleksandr.kravchuk@pelagicore.com>>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com
>     <mailto:joe_macdonald@mentor.com>>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>     ---
>      meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
>     <http://lftp_4.7.3.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git
>     a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
>     <http://lftp_4.7.3.bb>
>     b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
>     <http://lftp_4.7.3.bb>
>     index 287821194..d62453745 100644
>     --- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
>     <http://lftp_4.7.3.bb>
>     +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
>     <http://lftp_4.7.3.bb>
>     @@ -6,7 +6,7 @@ SECTION = "console/network"
>      LICENSE = "GPLv3"
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>     -SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz
>     <http://fossies.org/linux/misc/lftp-$%7BPV%7D.tar.gz> \
>     +SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.gz
>     <http://lftp.yar.ru/ftp/lftp-$%7BPV%7D.tar.gz> \
>                 file://fix-gcc-6-conflicts-signbit.patch \
>                "
>      SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
>     --
>     2.12.2
>
>


