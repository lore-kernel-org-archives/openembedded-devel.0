Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7067860197
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 18:13:01 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y72so2105868pfb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2019 11:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=d1sHksyPErND4r0rlyI4ey9qspgs0XiyQm62H+ElLXM=;
	b=CwFl2NysEF1ew0cWOsSQ/3582ex4zaTnN+AA1fmk+yAXUIb1+ORRVycVxzeX8XRkyq
	KU1COcrUpp1bOuQ04ZZ4obcxiZ1d93ux1Onr7oJ8ZBN3wxtBXvIV2JgrJLB6vXV9jFij
	QquzJpeZ3A/FIZmmvTt3UUxF9vbsYv59C7ilQ6JUhwcaGHobYkizyUTStVkzH/31j9DI
	H+DOO02/bYuoCj/0wZAZBgGRqvisjB5l17dkVG/izMyqPzfYnkM/FbQDJYa+uR6SNPqT
	v3mS17FK//rv7eCtZyg5RTJfJge+3mlrRXRk0RsUEVUqzs6yaijIwpTay+1RVOIAGXSX
	G18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=d1sHksyPErND4r0rlyI4ey9qspgs0XiyQm62H+ElLXM=;
	b=TuhiPdKEQ/fITlya+susv4Q+L+V53Tppd42H2CDBZ8J07p3FSx1M/gVNLv3brVBZ9/
	l0t8lEXi1UHzE7ApYeQTFmMWazCDqaiY+UtrUO+FTK2sfWWt6FY1uZ7R0fhWrmqC9I5c
	Hs9hJZlF9kdcqNDx8MCxt1iIcoyK6AhdwOZep9VmOg1gzf1NQUZVJjMgRxFplmc/s2AG
	e6KMch9NeUcAJFI7tyVX2u71SjOwMV2YErBfSIT6zq0PBQVUQPD3MalEB6KarFvfxqs1
	QruJHod4i45A9WqWfHsNzdNl97eR+NOP4/68lfo79VJ573p/3eHU4NmqxdvGXM9Stgdl
	T6HQ==
X-Gm-Message-State: APjAAAWhODkg+ZVTub2BavnGS7QF19/qwY2Yj9jzNxewvxS5992y57ca
	jLbmlFtDfwsgoLslBaQRG8P+QV5f
X-Google-Smtp-Source: APXvYqxBgIjJ2ihD6SxzeBFFA2V6VSrYoL5fak1mWIKo08Acp0bAqx/ejK5xW35tucOHfyntt5/41Q==
X-Received: by 2002:a17:90a:80c2:: with SMTP id
	k2mr5841256pjw.92.1570644781940; 
	Wed, 09 Oct 2019 11:13:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:3474:1cc:c6fb:432b?
	([2601:202:4180:a5c0:3474:1cc:c6fb:432b])
	by smtp.gmail.com with ESMTPSA id
	l24sm3347291pff.151.2019.10.09.11.13.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Oct 2019 11:13:01 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20191009074207.18686-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <712d85ff-bf08-fbf8-e3e9-b599adef6305@gmail.com>
Date: Wed, 9 Oct 2019 11:13:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009074207.18686-1-bunk@stusta.de>
Subject: Re: [meta-oe][warrior][PATCH] xmlrpc-c: Remove the RDEPENDS on perl
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
X-List-Received-Date: Wed, 09 Oct 2019 18:13:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/9/19 12:42 AM, Adrian Bunk wrote:
> The tools that use perl are no longer built.

What error are you seeing that this fixes in warrior?

- armin
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
> index 524263760..6c31b6981 100644
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
> @@ -15,7 +15,6 @@ SRCREV = "343a3b98e54999d67edb644bcd395aa9784fb16e"
>  S = "${WORKDIR}/git/stable"
>  
>  DEPENDS = "libxml2"
> -RDEPENDS_${PN} = "perl"
>  
>  inherit autotools-brokensep binconfig pkgconfig
>  


