Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404D1C83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 11:08:26 +0000 (UTC)
Received: from smtp.heteigenwijsje.nl (smtp.heteigenwijsje.nl [185.216.161.180])
 by mx.groups.io with SMTP id smtpd.web10.8214.1753255235200239573
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jul 2025 00:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@heteigenwijsje.nl header.s=dkim header.b=SuoXTfAT;
 spf=pass (domain: peskens.net, ip: 185.216.161.180, mailfrom: gijs@peskens.net)
Received: from mail.heteigenwijsje.nl (localhost [127.0.0.1])
	by smtp.heteigenwijsje.nl (Postfix) with ESMTP id 3B3C0EA224
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 09:11:13 +0200 (CEST)
Authentication-Results: mail.heteigenwijsje.nl (amavisd-new);
	dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
	header.d=heteigenwijsje.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	heteigenwijsje.nl; h=content-transfer-encoding:content-type
	:content-type:in-reply-to:from:from:content-language:references
	:to:subject:subject:user-agent:mime-version:date:date
	:message-id; s=dkim; t=1753254671; x=1755846672; bh=5MdxfpDgTyX0
	j8aFB8CliJxDkrKEz+Ys8e+cU8b2u0k=; b=SuoXTfATNWZwVWZDA9oLEoZleNPQ
	LlAA8LexEi31UuCDRR5t/wevdsTIV2PucNzxixERccuZQpfKxKzD1xP0XrD2blrU
	Ci3oUE29By2fKc/uio+uaroU6Zh2GBakS4IWYbfxWSOoNcA+nOf2rHlw5TssVrkZ
	XdDU8OrR6VlESZI=
X-Virus-Scanned: amavisd-new at mail.heteigenwijsje.nl
Received: from smtp.heteigenwijsje.nl ([127.0.0.1])
	by mail.heteigenwijsje.nl (mail.heteigenwijsje.nl [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EsCSbndcUSpA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2025 09:11:11 +0200 (CEST)
Received: from smtp.heteigenwijsje.nl (localhost [IPv6:::1])
	by smtp.heteigenwijsje.nl (Postfix) with ESMTP id 9B702EA619;
	Wed, 23 Jul 2025 09:11:10 +0200 (CEST)
Received: from [IPV6:2a00:1708:3ba6:500:3a9f:132d:ee6f:5a41] ([2a00:1708:3ba6:500:3a9f:132d:ee6f:5a41])
	by smtp.heteigenwijsje.nl with ESMTPSA
	id QCW2IA6LgGgYSAEAc3PRCQ
	(envelope-from <gijs@peskens.net>); Wed, 23 Jul 2025 09:11:10 +0200
Message-ID: <2349189b-2269-4eed-bc43-48e071584504@peskens.net>
Date: Wed, 23 Jul 2025 09:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] php: fix removal of --with-zlib-dir configure option
To: Gijs Peskens <gijs.peskens@munisense.com>,
 openembedded-devel@lists.openembedded.org
References: <20250723070852.381343-1-gijs.peskens@munisense.com>
From: Gijs Peskens <gijs@peskens.net>
In-Reply-To: <20250723070852.381343-1-gijs.peskens@munisense.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 11:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118716

Since I seem to have forgotten (first time mailing a patch, sorry) to 
add a explanation:

PHP has removed the --with-zlib-dir configure option since that is now 
taken over by pkg-config, this breaks building PHP on Walnascar when zip 
is enabled via PACKAGECONFIG.
So remove it.

On 23-07-2025 09:08, Gijs Peskens wrote:
> From: Gijs Peskens <gijs@peskens.net>
>
> ---
>   meta-oe/recipes-devtools/php/php_8.4.10.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php_8.4.10.bb b/meta-oe/recipes-devtools/php/php_8.4.10.bb
> index 4d598949a..4ed5d1e4f 100644
> --- a/meta-oe/recipes-devtools/php/php_8.4.10.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.4.10.bb
> @@ -110,7 +110,7 @@ PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
>                             ,--without-sqlite3 --without-pdo-sqlite \
>                             ,sqlite3"
>   PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
> -PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
> +PACKAGECONFIG[zip] = "--with-zip,,libzip"
>   
>   export HOSTCC = "${BUILD_CC}"
>   export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"

