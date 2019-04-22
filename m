Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5686D4C6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 23:01:10 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id x15so2128398pln.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 16:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RAOw9C9Tqb+9kdxsJtnyNMa2iNo8gFLprMJM9SJdJbo=;
	b=tX+EJbKHqkhXWHcSI6WmGumBht3Mp3rJv5V3ultStf9to07wX72wErWX/Fwee+EwOc
	tGBUTf50zBs1ft4Sga9/QB4+8RQKTO4kSRBAoxqV7xpR6D33w2H2sXaMVANECNIcqwKs
	pNs5ulDoLF0LC9dRgbjYDXIXsKiSCwLO2rates/SrBnORr2FqV1iGGQqe80miCPsIUSn
	kCfQdiP9NdXw5+kj13X0SyYZt+tlOwbl9EucwQ7sP0X+rD17uNUSCeU4ciW+CLV9GImF
	bUrbS7sIXZXJsln9cHaVHytQ/vkLO+JxEx64pBCq4gdbPfeuNvHsmKmeIUqmV9AI87iH
	qRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=RAOw9C9Tqb+9kdxsJtnyNMa2iNo8gFLprMJM9SJdJbo=;
	b=U9kE7pVAf+OcwxvZlSG4FVHPu3zeBOIfEizZFHh9ICkQ4wG72EPtN/P8I29Y+HTngi
	t18uwWaKad2ofznEcqMp5BN0oqeYBOE6seBJl0aiNj1KoZ6h/+GfX9qM8VC2Nn7RQHYl
	1D6bIrzbLoUGGtiJH+/Zc0/4PJnqsKIPyQu2kiDw74PPaD+MOfcHIhZHqjv+0yN1ajO5
	VuEo+VdMk05RKm/Y/tmAXcXpkL0NqwHbw07HijnM+z+JYXuarQx/XabDSIpDb0uXAkn/
	ridECuhB4LBjOPlHVjZ2rWQ+2WPkeqhWoEkDe1Ptz9tHPcBL56USXcNXvW+IpyMH0wzm
	He6Q==
X-Gm-Message-State: APjAAAXN8erHrR2fPFWAryWUuHDKSBSXdXYu5YBXNRwn9hkjIvS9Kb/z
	0q8bfQyH/xYAAet7kE4UR2TtFjMV
X-Google-Smtp-Source: APXvYqzRSrAtzweYaaB0aOXS9rLRNjh6DBASWBAKpmC1NqHpfCDvz6OnWJJ0sRNnmwWQRQyo8W2r/Q==
X-Received: by 2002:a17:902:70c8:: with SMTP id
	l8mr23147362plt.177.1555974071295; 
	Mon, 22 Apr 2019 16:01:11 -0700 (PDT)
Received: from [192.168.0.33] (75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	l88sm23632857pfb.104.2019.04.22.16.01.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 16:01:10 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-devel@lists.openembedded.org
References: <20190422212229.8610-1-open.source@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f3df4eb3-9250-d0c2-6772-f11a6c4c2f3e@gmail.com>
Date: Mon, 22 Apr 2019 17:01:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422212229.8610-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH][meta-support] nano: update to 4.1
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
X-List-Received-Date: Mon, 22 Apr 2019 23:01:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/22/19 2:22 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
there is no meta-support , there is a meta-oe.

- armin
> ---
>  meta-oe/recipes-support/nano/{nano_4.0.bb => nano_4.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/nano/{nano_4.0.bb => nano_4.1.bb} (79%)
>
> diff --git a/meta-oe/recipes-support/nano/nano_4.0.bb b/meta-oe/recipes-support/nano/nano_4.1.bb
> similarity index 79%
> rename from meta-oe/recipes-support/nano/nano_4.0.bb
> rename to meta-oe/recipes-support/nano/nano_4.1.bb
> index 3d7921a37..1fe36cdb0 100644
> --- a/meta-oe/recipes-support/nano/nano_4.0.bb
> +++ b/meta-oe/recipes-support/nano/nano_4.1.bb
> @@ -12,8 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
>  PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
>  
>  SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
> -SRC_URI[md5sum] = "2de3e8a60ecf09649e316e89be2aac65"
> -SRC_URI[sha256sum] = "1e2fcfea35784624a7d86785768b772d58bb3995d1aec9176a27a113b1e9bac3"
> +SRC_URI[md5sum] = "235eaf7d27db3c3679b2054361ff6181"
> +SRC_URI[sha256sum] = "86bde596a038d6fde619b49d785c0ebf0b3eaa7001a39dbe9316bd5392d221d0"
>  
>  inherit autotools gettext pkgconfig
>  


