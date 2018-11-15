Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 403746C1C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 21:35:53 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p16-v6so10073913plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 13:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jlinNIAGDB18X4CEbITf50txjV9r297BNgXKTPm7YmE=;
	b=JHZSZubOQFA91/6DaDV3OkkD2ZGkh8mr81Xo4su+NLkrujyXOF/MfPZJGDRq1Vp5Z7
	7JGEa+8/k6cSZhYiWrPjPAVDBzVlpy+OsvpgRE/P/fmHnfqnGoT60zxsFsLzGWLtzuGq
	m+raYD3fu41iLTYUIaOo7Zc2OW4kn5ihiC8m8QVqR3hvDvAl6JkmAP4GZtUD61t4kEDx
	uXGMueQc0fCpDy85lUE1XCzoysAX1j+A5r1aHpwWLXFLmTihkPrNn3JO8bP9vgHqAe3F
	AtsNo1du5h45pj1GLdb/wfMjdozYoYdIFsE3+Ox02cGZBSWIWFKpYX4LIb7vJgi29Ah+
	RRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=jlinNIAGDB18X4CEbITf50txjV9r297BNgXKTPm7YmE=;
	b=YbSYg49Os4tMZ1GoehZrnH2y9iiNqA8ckBBwi/zuSXWVQg9X54d/pjSA9IG9pUIQC8
	v9FBN0asxMAPM2c3QWyechAZgR1E66EwJ7i5YZOTgkLZRCzF8Dsm4WOf8W+TS+aeWRRV
	5wJC+MWApQdGZ40ju9DazNdU4pTaH3c42tPCekaw09xfCDoVrm3a2N30t/P/FFnru4pF
	muZDEzPy7q8FM0KTa9PE416ocbrSFu5b4uFaWsISzhl6GqmvzHJ82Mn0kQfM0+8wJq+d
	KrNUakXbB3W+FpXYoe6EyB6asebSOp9HgeCuj2luqBV6sIQ6BjfhEkXNrsOJckHzCGLR
	RoxA==
X-Gm-Message-State: AGRZ1gI3ZMptk4pE7oYnC5iYxlv9WpXtrvpAaUEhNzEJO9G2pKruwtMW
	167fz9FsMxYfrnIIukqfo/dIHBX2
X-Google-Smtp-Source: AJdET5d3Hvvnafj3R2eCRtrbhEPVUwdh99gx7ycHHKDX5hiHIyo+yKRSogylqDte4zpX/Yz5thSNaA==
X-Received: by 2002:a17:902:509:: with SMTP id
	9-v6mr7913891plf.3.1542317753890; 
	Thu, 15 Nov 2018 13:35:53 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:ad7f:56cd:6813:1de5?
	([2601:202:4180:c33:ad7f:56cd:6813:1de5])
	by smtp.gmail.com with ESMTPSA id w3sm24709497pge.8.2018.11.15.13.35.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 13:35:53 -0800 (PST)
To: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org
References: <1542002391-62018-1-git-send-email-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <896c9962-2e7b-9ede-272e-2d6751ddb491@gmail.com>
Date: Thu, 15 Nov 2018 13:35:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1542002391-62018-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [meta-networking][PATCH] geoip: update GeoLite Database checksum
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
X-List-Received-Date: Thu, 15 Nov 2018 21:35:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/11/18 9:59 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> GeoLite Database checksum changed again recently, so
> update it.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> index 0657369..1e1a7ff 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> @@ -20,14 +20,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>  SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
>  SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>  
> -SRC_URI[GeoIPv6-dat.md5sum] = "a685e71ab129b6ca4cba75f7eaeb5335"
> -SRC_URI[GeoIPv6-dat.sha256sum] = "a94398430701c8458fedbd20aa2a5d460858441f2ca495f32621f6d16154171f"
> +SRC_URI[GeoIPv6-dat.md5sum] = "00dc3b3f53eb5f7bf6915f939998f12c"
> +SRC_URI[GeoIPv6-dat.sha256sum] = "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
>  
>  SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
>  SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>  
> -SRC_URI[GeoLiteCityv6-dat.md5sum] = "f6dff70c99f8449af1b7a33073eaa743"
> -SRC_URI[GeoLiteCityv6-dat.sha256sum] = "8b6f065ed68bed2a03d61b8d6c7e2f1c52ebd00c0d4a00f6cdc04195c03e32e3"
> +SRC_URI[GeoLiteCityv6-dat.md5sum] = "7f6333d433d8127181ea3c5828287c98"
> +SRC_URI[GeoLiteCityv6-dat.sha256sum] = "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"

I am seeing this with stable/thud-nmut ( mainly master)

ERROR: geoip-1.6.12-r0 do_fetch: Checksum failure fetching
http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat
ERROR: geoip-1.6.12-r0 do_fetch: Fetcher failure for URL:
'http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat'.
Checksum mismatch!
File: '/build/downloads/thud/GeoIPv6.dat.gz' has md5 checksum
e75b84a4044e81d6d4484e33816bc762 when 00dc3b3f53eb5f7bf6915f939998f12c
was expected
File: '/build/downloads/thud/GeoIPv6.dat.gz' has sha256 checksum
a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e when
e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480 was
expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within the
recipe:
SRC_URI[GeoIPv6-dat.md5sum] = "e75b84a4044e81d6d4484e33816bc762"
SRC_URI[GeoIPv6-dat.sha256sum] =
"a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.

- armin
>  
>  LICENSE = "LGPL-2.1"
>  


