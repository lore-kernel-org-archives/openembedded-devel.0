Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 791C874BD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:56:17 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id bi12-v6so3610956plb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Fp2UCnSJUZ79Ho1LZqChuKw7yBG9v0TKEtnLzmyQR6I=;
	b=YIIbhwqX8JTnpRjEltb7qWomD61AIwMim8WlJDCqJRDYCuRhByWJDr5Mpjg6bkdN28
	sSwblVzuy0iS0NaZTnSYI7DyIEzJuHKFJNn1XZTdFAiWu8t5YaThQ5Rs5XDrRQLqNoXA
	23Q0ZY0GTNCTWDh/jq6808KfbV/8Qd2b0jtcxkrqnRlgHtzFiITpx29CBUQyYbsqA72C
	4VfYYjSX24k1AtKpTu3shJyWuaukSzWZ/Xgq48fbBsE6VLR4XA1gVvqy1d3tuEhTFCCe
	RYSe3J8IT+hkXqzCzJfH0QM8PnNltBoOMFKblocN18XmR0uhTejMocunto4HgbjQZpYV
	aPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Fp2UCnSJUZ79Ho1LZqChuKw7yBG9v0TKEtnLzmyQR6I=;
	b=beoasRLVuSV7fC4WQ6Pn67KaSlwBbmH5NImZRRq4pTHaU9NHDq421B35DlFFQ7Y+fh
	mPKEU3qk2mqWMXCiXi4qR/urKM+Lb+SM0YKnmMlwPewtlBvg8b8cJq/szmPmPbRzkhDy
	0HG2pgNtXWs0jRFPx1JEXmU5BaOvIX4VaLAabb0fvQnW7A75s0uITP67snoPVgiVpygk
	XeR7Vly+TkiJOUSWfpsf8BBNxBjYuPu8HMnyisywIyxnb/lMdwrgBW1RUeqr2Krg8omA
	Z943dsjE2bCXmi1eoPgNZEEHiq0Dj5dPL6qhHIaAEI7KskVTMY1/BkTQw4WPLhCJUHpX
	zi1A==
X-Gm-Message-State: ALKqPwf93QbGLtjtL5GI0FgBGbsGeNCGHudko3NbpuSeePgSQz8ZaPJo
	3WzmuS2fKwVXT4IAQWsTGmbHms/M
X-Google-Smtp-Source: AB8JxZpF8wpktr78onxPXY8dGzj0PmheAM3YKVXZ3zaKS6n2hmLz31Qlg81mONuk9c91XLYEoFFODQ==
X-Received: by 2002:a17:902:7288:: with SMTP id
	d8-v6mr7532330pll.218.1526608578028; 
	Thu, 17 May 2018 18:56:18 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:50cf:a971:a3cb:56ce])
	by smtp.gmail.com with ESMTPSA id
	v6-v6sm9172943pfm.120.2018.05.17.18.56.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 18:56:17 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
Date: Thu, 17 May 2018 18:56:16 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:56:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Andre

This series is fine, except that it has some formatting changes mixed 
with cmake related changes. It would be preferable to have them as 
separate pulls. I reckon that both types of changes are good.

On 5/17/18 6:30 PM, Andre McCurdy wrote:
> The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
> ${datadir}/cmake end up in the dev package, so recipes no longer need
> to provide custom packaging rules to handles these files.
> 
>    http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
> index 9354799..6b9c545 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
> @@ -24,5 +24,4 @@ PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,
>   
>   PACKAGES =+ "${PN}-testapps"
>   
> -FILES_${PN}-dev += "${libdir}/cmake"
>   FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> 

