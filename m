Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 029666C117
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Nov 2018 22:51:30 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v68-v6so3356923pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Nov 2018 14:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=iuk3wsutLSb1Ld10VQuAj5rBWT0Ax5hPlMINHT4x4nk=;
	b=Y8aLBSnxa7aCvJ7cE4w2aslpbUPWj/mJ/sPPBZuvB9FHWA8WImOIb8rznUnNbEZZCT
	WtjBCMPR49Z44tPSiisLtIi7bZ9EjlAYfjJBAE1H/1W8IVVwZ1b0WCMuRW3KLafNyopJ
	9hM0DNqIu5tcA6Q7zycYT25wekKkslEfqb2DzKza5XzPkcbgYh5k1mAAJHNlA8SECgkV
	n8cyO6dBWsW97jGNbOBQSM5fiUmJuzmDZsLWEpWuFYV0hn63+yjitE5xKjeuCG7dHoZQ
	0MMoWqWu/tC7Fty5GaBUCbqTYJI9kfgFpvhBqksfG5lyJAU/PGrqkr4IxpBie7s8eK2t
	WwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=iuk3wsutLSb1Ld10VQuAj5rBWT0Ax5hPlMINHT4x4nk=;
	b=BhJLa8R7LMN7Y0daebLU7QH0MDYLr2JGW0jPoyWP8kusufrZOfBC8waDf2S1qVEVOL
	YJDUzivg5N/89ofJ1Y/jR1jaCDKQHo6hs8rZThNich8JZVySYflbTygeqhpitBckKoyI
	m+EvYAHJjc+ZJAQusop1Ztbysa/g8oAiJBJ5E24ETn6hOulUbQI4bj6PaD/DgMv6/ZwJ
	blwWe12K6/s5ySFiRzkeX6wLdS0po2iSJg8JN6XwQtjjyy6MsTXY74Clxe3tDutQtfDw
	ULGf+ieoK9D/Cuyrw0vmmHxHlIUi5/vHgwfb63hGYU87IN/tvi1G5G2uzySMGKibh7uF
	9wsA==
X-Gm-Message-State: AGRZ1gIpQKWf9Pw0dbhQmAXchVK5OLD0HcPGkKn4v7tmlTq0gMGsLOEJ
	FOAuX7j7bqrFmvkSLhQC/r0qjJ7/
X-Google-Smtp-Source: AJdET5dKys8n82QrWXm1uLz6IOZ+1nui46yYHz/aKqLlIsJVphkNdOBJ+GrLIv2YSZngU1U4h+GEIA==
X-Received: by 2002:aa7:80ce:: with SMTP id
	a14-v6mr9593748pfn.86.1541976691768; 
	Sun, 11 Nov 2018 14:51:31 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7077:6962:50cb:42de?
	([2601:202:4180:c33:7077:6962:50cb:42de])
	by smtp.gmail.com with ESMTPSA id
	27-v6sm19200941pfm.36.2018.11.11.14.51.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Nov 2018 14:51:31 -0800 (PST)
To: primoz.fiser@norik.com
References: <1541662837-29069-1-git-send-email-primoz.fiser@norik.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <aa286fd0-cc9f-6e8c-6d92-34ca8f4bd723@gmail.com>
Date: Sun, 11 Nov 2018 14:51:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541662837-29069-1-git-send-email-primoz.fiser@norik.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] sedutil: Add recipe
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
X-List-Received-Date: Sun, 11 Nov 2018 22:51:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/7/18 11:40 PM, Primoz Fiser wrote:
> sedutil is utility to manage self encrypting drives that conform
> to the Trusted Computing Group OPAL 2.0 SSC specification.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  meta-oe/recipes-extended/sedutil/sedutil_git.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/sedutil/sedutil_git.bb

this seems security related. can we put it under recipes-security ?

- armin

>
> diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
> new file mode 100644
> index 0000000..cec569f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "A utility to manage self encrypting drives that conform \
> +to the Trusted Computing Group OPAL 2.0 SSC specification."
> +SUMMARY = "The Drive Trust Alliance Self Encrypting Drive Utility"
> +HOMEPAGE = "https://github.com/Drive-Trust-Alliance/sedutil"
> +SECTION = "console/utils"
> +LICENSE = "GPLv3"
> +
> +LIC_FILES_CHKSUM = "file://Common/LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
> +
> +BASEPV = "1.15.1"
> +PV = "${BASEPV}+git${SRCPV}"
> +SRCREV = "358cc758948be788284d5faba46ccf4cc1813796"
> +SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep

