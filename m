Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7866E7544A
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:50:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117716.1766569846470398573
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nBJ0bJJ1;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so41649945e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 01:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766569845; x=1767174645; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c0+cqvhhsIdTFjT3k9mgwqpouGTNExVQuEIlvBUxSEI=;
        b=nBJ0bJJ16cvZhwaZDWUyOPWpwpjDTdOxXlkAufEge+jrD6dfMjn8yqhSH4h0CuUBRr
         oBe3r5b9Lo8JWZqbq/cZjhTADiOriuefXycAq+zyvns5S+HyMf9j9rJYyosEpTTKK0Us
         B35/V/YFwAX9ZK9Yw1+TQdhqpZOknjKVUILeUx0CKs57/aw/d+JbnILGkLctVplVzS5x
         ThVtIpmIoJJ7+LWUQ13uwHnrjNEZb6kNw9HATSLejqmdEL9qgI5/0GO0b9eKTdlVquTV
         95bkMgxv3CEQeq+VazIC9vFuCtXFxkJSxnx8aCfUqRydNnPebIKwW3lv1i/Rcf+0ykGh
         zTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569845; x=1767174645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0+cqvhhsIdTFjT3k9mgwqpouGTNExVQuEIlvBUxSEI=;
        b=Ztv4NI51mRNSZk1hEgf918BmqjJ1WsTzU8tfJ9TDmPMU9WR6jnSrQwD49911/9Lv4i
         sXOtqh4iFRCqVQqJodGroLX6vg10tQ2BSbVPhp+2uYr0QwH8Q7YbolHZAGLPJLKvqZVl
         2wj/e+rlFXzx9UhpuV4h1kVT3M5TrGHvw0ID3M8hE3c7ZT1GhkFLO8m0jYO4MyLgRNQN
         uAem0Ly0obCsiAAZmDPvkha1PjPNnx8B5Oqml3G1E43hhbGE8O2W8DRsoz13fkusO/jB
         pYVXlsBS3Vr5V2CFHaEqSDLwjALmaWYE038z/LIQpH2OJ+1RS0zpbWUJemR9hjvG2cuS
         LqLA==
X-Forwarded-Encrypted: i=1; AJvYcCUwrjOxnqGe+9mrDusBiWeYIwe/cJn6lomMiC/eIixZrWt7Bv8qL0p44KLp80mb7yEHfA23qJfp9bCHEQad4BXTPaM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwhCHSwDTdremVcc8cVG+X6De9pqIQT+LI7od2coQBDIxZv/Ope
	oawlODxlci790+0LAWNSwZxKzCC2OulJnMEXB0+mABS4d3aD7pZQT6Yf
X-Gm-Gg: AY/fxX6zJ3IISCvH2tz6NKfWbFqJtlQdv8cEXDAo7aOBE4GGISeru8NgbUOIdBbPzrB
	E7nqobEwmwo7AJiXEWwmewUWAkpNcxA8I7FvdEsjoBZAr+zfkLrOQFbghYXnhyGfv3kZXccybBv
	OSNc1nguOfWPazh6w10EmIEghnEdUnH1qaBFQW/gddDODJE6tuyA+3y6PanR9AzbED2CYqxoVzm
	whl8wuFreRDMcvLKMOUlkyec/08e7t3Gi2i8MQTrHtAXpEymzc9/EqSp3iLKg4/a1R5a54FM7ON
	UuBOtwQWraJV3ll1SaLlOZ4wdgZYZ7lghJKCMutE15Dn5jxPty4g6SRckjIepibmRxIxqrtCOlU
	3Zfym0jEGeqIeqDXrq35AmPPckseoKLEYzAu9eCTPFiQdiuTlBnhhQc5XA38ZmjsQuGtghV9RaV
	zSjQvMluJapUO73aAuDVc=
X-Google-Smtp-Source: AGHT+IHOnyMrsbF1NvDtYwE1ACPID+T7LvrrpWCX72TLi8bwckdoZHgg+vw3jlWGG/hsRK410iplgg==
X-Received: by 2002:a05:600c:524f:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-47d19594b2emr157417125e9.20.1766569844614;
        Wed, 24 Dec 2025 01:50:44 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ad0c60sm139935245e9.5.2025.12.24.01.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 01:50:44 -0800 (PST)
Message-ID: <368bde00-9678-4748-ad9c-c04b99115a1c@gmail.com>
Date: Wed, 24 Dec 2025 10:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][kirkstone][PATCH] apache2: upgrade
 2.4.65 -> 2.4.66
To: Liyin.Zhang.CN@windriver.com,
 "valeria.petrov@spinetix.com" <valeria.petrov@spinetix.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <20251208205128.1274030-1-valeria.petrov@spinetix.com>
 <CYYPR11MB8430C5040A442964D7BE733BD7B2A@CYYPR11MB8430.namprd11.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CYYPR11MB8430C5040A442964D7BE733BD7B2A@CYYPR11MB8430.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122880

On 12/24/25 10:44, Zhang, Liyin (CN) via lists.openembedded.org wrote:
> Hi,
>
> May I ask why this CVE patch didn't merge in kirkstone branch?
> https://git.openembedded.org/meta-openembedded/tree/meta-webserver/recipes-httpd/apache2?h=kirkstone
> It is still apache2_2.4.65 in kirkstone.  We need this fix in kirkstone as well.

It is in staging[1], but it arrived after the previous batch was merged.
It is planned to be part of the next merge.

[1]:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/kirkstone-nut&id=46a6fbcdcb710e09d640f91609738e79b5a617eb

> Thanks,
> Liyin
>
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Valeria Petrov via lists.openembedded.org
> Sent: Tuesday, December 9, 2025 4:51 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Valeria Petrov <valeria.petrov@spinetix.com>; Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-oe][scarthgap][kirkstone][PATCH] apache2: upgrade 2.4.65 -> 2.4.66
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> From: Valeria Petrov <valeria.petrov@spinetix.com>
>
> Security fixes:
> - CVE-2025-66200
> - CVE-2025-65082
> - CVE-2025-59775
> - CVE-2025-58098
> - CVE-2025-55753
>
> See: http://www.apache.org/dist/httpd/CHANGES_2.4.66
>
> Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb} (99%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
> similarity index 99%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
> index 98b2215f44..0e96643fc3 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
> @@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
>             "
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> -SRC_URI[sha256sum] = "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3"
> +SRC_URI[sha256sum] = "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a"
>
>  S = "${WORKDIR}/httpd-${PV}"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122879): https://lists.openembedded.org/g/openembedded-devel/message/122879
> Mute This Topic: https://lists.openembedded.org/mt/116683862/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


