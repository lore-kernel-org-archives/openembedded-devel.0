Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id A72A67E95B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 07:53:01 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w3so2079025pgt.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2019 00:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=qSdcDUQ58iCzrkOIg5+ojBymaXRIfLd3TDWlBvIdHhI=;
	b=t9QLYm3UQXPawgSNJZ+6ppjLeynTamlA70lcTmcID5jzlBiVTmnVa4bQ5nY7R54CHX
	2KJCUWDQTYowQBUMfJ4AJ0M/0h3+CzeJTyQPWIbARvz5dNflf/Xj1w6X1G95oCUUJKbd
	uf+OHNmp9+qOl1RzNMl0SFYfVbblDhBxC8TP0w9FOxkMZwAP+fCptA9BUnQLB/Q5Vjqa
	i8gjNwhivHqtEgWn5WCKPL9HwUh4bO5ODlw92KR11ve+NXKVUEL5783Fn1abg9N3v3yH
	oQFwFgQAGqcborZM6td/Qm5v2AIj3A75RXf5fOd0sXvJEywWzf08Hu4oXWeuNFVy92Rg
	OWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=qSdcDUQ58iCzrkOIg5+ojBymaXRIfLd3TDWlBvIdHhI=;
	b=F+26BfNZTdSUh9+4RMgMgn4wZ/X3jCvLNsJyDnfAiuCCGdoO6bZJoyCj0v7CZ+7CFE
	nBElEZJVMEP3QjP0vVpdfvVJ0YsbMOZ0JSaF82wUO47pQBQ/6OILAYqgHvwOpqprz81Z
	xI6PVz8wn/K2A9p4P9ckdR+GFLn/BbRMfBDWIVA0VUL1TsPAZNK/mbBdhWp8E/xZjqfW
	YgbLrC0VQVgaZWDvj0G2uMQmnRlZs08E/4xSrYv0Uj2PVs5gpHh91JTmGY6B08zrnCsB
	arzZXuDm9rA4YmTCmxKrCWWOMFu3sO5CCnLJnmJR/p0KHM7xqU9D+J9DsvJPCsE4vr1L
	cbnQ==
X-Gm-Message-State: APjAAAXjZpnyAH08bLS/0CrP3jOg/hZGUwTNrGrrEI6ynJvCXc+U5+rj
	ve0TesFkEhi6ehi/F+jqIofDmbJztP0=
X-Google-Smtp-Source: APXvYqy2sRsqwcqiFvzhlBn+Qunp1JxDyRCqFMvnQ2KrAq0VLfmwXUkPF3BmSS83YYGH+dJORaVZwg==
X-Received: by 2002:a63:5162:: with SMTP id r34mr17692325pgl.229.1564991582365;
	Mon, 05 Aug 2019 00:53:02 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::31f9? ([2601:646:8500:6bc6::31f9])
	by smtp.gmail.com with ESMTPSA id
	q22sm77413448pgh.49.2019.08.05.00.52.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Aug 2019 00:53:01 -0700 (PDT)
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <20190802013035.18267-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <d8684e43-688f-7f25-0ac9-e82d4a85f970@gmail.com>
Date: Mon, 5 Aug 2019 00:53:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802013035.18267-1-zangrc.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe] [PATCH] itstool: upgrade 2.0.5 -> 2.0.6
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
X-List-Received-Date: Mon, 05 Aug 2019 07:53:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Can you rebase it on top of latest master and resend please ? it does 
not apply cleanly.

On 8/1/19 6:30 PM, Zang Ruochen wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>   .../recipes-support/itstool/{itstool_2.0.5.bb => itstool_2.0.6.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-support/itstool/{itstool_2.0.5.bb => itstool_2.0.6.bb} (80%)
>
> diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
> similarity index 80%
> rename from meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> rename to meta-oe/recipes-support/itstool/itstool_2.0.6.bb
> index a0af44a..7ea253c 100644
> --- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> +++ b/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
> @@ -8,8 +8,8 @@ inherit autotools python3native
>   DEPENDS = "libxml2-native"
>   
>   SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
> -SRC_URI[md5sum] = "655c6f78fc64faee45adcc45ccc5a57e"
> -SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100d4b308"
> +SRC_URI[md5sum] = "4306eeba4f4aee6b393d14f9c3c57ca1"
> +SRC_URI[sha256sum] = "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa917b92a9"
>   
>   do_install_append() {
>       # fix shebang of main script

