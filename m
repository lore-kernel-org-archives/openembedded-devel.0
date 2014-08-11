Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEA970B2B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 02:45:29 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lf10so10387235pab.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 19:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=B4Bm9plArb9CFNsDoMZZOrecU+wBV7IMHFRM+4PBoys=;
	b=MgbkZFZtBXxHXc+Jn5nZovBL9ZpxDFVUkAOleCCjiRsq4yzVIuxVb5bkBhAGCWNaxi
	0dr/OQ6rMm3QALWiZySab2q4kISszzQggR7ZEpA85rj6a8B7F0aro88EnrGpVzr/nHQK
	sCLDR2Y/+MyFxhfXF5yG+sQyjBhShTgWDN3JdJK1t6eTyi35nPGusvVTT6nqOAxPxHqF
	pgNVc4CSnO+6o6TGdbn4obZFdLK3Dc48x0Qo5/pDGlCQQVlAysHZQ/Qd4JtcHYQmDvWb
	t0yjssHh8f8BA9R0uk7Ps8vn7FlUQ8bvCGjbFxR0k61Bds6pxjwXUdF473wDdEDPk5Es
	pFlA==
X-Received: by 10.70.20.34 with SMTP id k2mr18287020pde.98.1407725130315;
	Sun, 10 Aug 2014 19:45:30 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:35b9:fa54:d802:ee1f?
	([2601:c:9380:601:35b9:fa54:d802:ee1f])
	by mx.google.com with ESMTPSA id pv2sm9725108pbb.13.2014.08.10.19.45.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 19:45:29 -0700 (PDT)
Message-ID: <53E82E3E.2030707@gmail.com>
Date: Sun, 10 Aug 2014 19:45:18 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1407661142-12785-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1407661142-12785-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-oe][daisy][PATCHv] ltrace: add PV and PACKAGECONFIG for libunwind
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Aug 2014 02:45:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/10/2014 01:59 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Armin Kuster <akuster808@gmail.com>

> ---
>   .../ltrace/{ltrace-git => ltrace}/ltrace-0.7.2-unused-typedef.patch   | 0
>   meta-oe/recipes-devtools/ltrace/ltrace_git.bb                         | 4 ++++
>   2 files changed, 4 insertions(+)
>   rename meta-oe/recipes-devtools/ltrace/{ltrace-git => ltrace}/ltrace-0.7.2-unused-typedef.patch (100%)
>
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch b/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
> rename to meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> index 149af52..6476f97 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -9,6 +9,8 @@ HOMEPAGE = "http://ltrace.org/"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
>
> +PE = "1"
> +PV = "7.2+git${SRCPV}"
>   SRCREV = "f44b28421979cec88d6d6a778fc27a8cd514f508"
>
>   DEPENDS = "elfutils"
> @@ -20,6 +22,8 @@ S = "${WORKDIR}/git"
>
>   inherit autotools
>
> +PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
> +
>   do_configure_prepend () {
>   	./autogen.sh
>   }
>

