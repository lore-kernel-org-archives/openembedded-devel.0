Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id A51B374BFD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 14:15:50 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id q11-v6so10005428oic.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Aug 2018 07:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bstmSLyM2/+FodHU8v2poqINDV8u/oamfWrxye4591o=;
	b=Yc7tMroV0zm5VYyJ0pvi/ozlIWeyvPGY3IPb3EpcqpbO1fTeilDLivFDo7Nt5A/ILq
	n4Huw6NezKMW4Is8XIyVVttQoq52Cri3Vxx9qSoxOXO4STQyPLwZoaAuw6ETE7KOO9fQ
	Y949vHvNZjWf+Wtusx2aZBJB6rtVavov6os7uiw1KC1tYlM/Y3i9k7dpv0HYsP1WOYZv
	7EC3zPARhpVTDCuDF/ejAQjs/WRLNTq46OBcDN1b2MVQ4wyWKmmRYIENvkKDYU423wqY
	y/WsYCAmQ2QK8Xk6g8GIRQV47v0YHJg4iR+cfLO/MJsFQ94kn7wrg9vx/u2mqYHwWvwN
	qTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=bstmSLyM2/+FodHU8v2poqINDV8u/oamfWrxye4591o=;
	b=LckRJCMzt2ArUig5cgDUbM13mDHGCYQGmOql4tHQ2eMLeZrKgVH0s659rKwewxR1O4
	3UOVWJhw6c9ug7aIVa8AhXHMubts/Y5d3RyKBWprxcjhdA9xxiD0aCR1zD+DETNet4T5
	hIxOgKtp/lH4uGP080IjLLAOX9SN049gSNKc5OKjmNdDsHjJ1AiAhu3snHhARbWwJLfd
	vHemGzMyqIcJRMT97TtAqEpyPMr2oGmAqLkPmNva7giZ3n+TztSU8HIDoEh+bFj2JY7f
	bF56dWolyoA35krfAz/PkHgP6RVba4fqwB8AaJ63SoJ6wnKD+o9BIQbtri37cKncI7na
	E2yQ==
X-Gm-Message-State: AOUpUlFdDkeVV178UYfpI+Waeck4Vs2KNgrMtdrxJ1sn4RZ+SN92+YlR
	LPv8UAQJZLSf6Ph1uhYT4y+w6tdI
X-Google-Smtp-Source: AA+uWPxvtseNT/FIStMwt//nJbQJr3Tqcr7AC21Oqvi+3dxNCfiPJrOhGhFsO5xIgAhTZHpUWaHJbg==
X-Received: by 2002:aca:5585:: with SMTP id
	j127-v6mr2241160oib.202.1533824151418; 
	Thu, 09 Aug 2018 07:15:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:7d5f:b84e:a37e:2b6c?
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	n15-v6sm3407828oic.33.2018.08.09.07.15.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 07:15:50 -0700 (PDT)
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>,
	openembedded-devel@lists.openembedded.org
References: <1533778721-28693-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4b304730-403e-daec-ca87-b7a4423a31dc@gmail.com>
Date: Thu, 9 Aug 2018 07:15:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1533778721-28693-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Subject: Re: [PATCH] wireshark_2.6.1.bb: Fix the configure error on git describe
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
X-List-Received-Date: Thu, 09 Aug 2018 14:15:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Manjukumar,


On 08/08/2018 06:38 PM, Manjukumar Matha wrote:
> This patch fixes the following error during do_configure task
>
> | fatal: No names found, cannot describe anything.
> | CMake Error at CMakeLists.txt:3086 (string):
> |   string begin index: 1 is out of range 0 - 0
> |
>
> Using --always is a fallback for fetching uniquely abbreviated commit
> object

There is an upgrade to 2.6.2 sitting in master-next. Have you checked
that version?

- Armin
>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  .../fix-fatal-no-names-found-git-error.patch       | 23 ++++++++++++++++++++++
>  .../recipes-support/wireshark/wireshark_2.6.1.bb   |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch b/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
> new file mode 100644
> index 0000000..80119e3
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
> @@ -0,0 +1,23 @@
> +fixes
> +
> +| fatal: No names found, cannot describe anything.
> +| CMake Error at CMakeLists.txt:3086 (string):
> +|   string begin index: 1 is out of range 0 - 0
> +
> +Use always to circumvent the issue if git tag is not present
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> +---
> +--- wireshark-2.6.1/CMakeLists.txt	2018-08-08 18:18:05.388318652 -0700
> ++++ wireshark-2.6.1/CMakeLists-fix.txt	2018-08-08 18:22:27.829670496 -0700
> +@@ -3078,7 +3078,7 @@
> + 	endif()
> + 
> + 	execute_process(
> +-		COMMAND git describe --abbrev=8 --match v[1-9]*
> ++		COMMAND git describe --always --abbrev=8 --match v[1-9]*
> + 		OUTPUT_VARIABLE _git_description
> + 		OUTPUT_STRIP_TRAILING_WHITESPACE
> + 		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> index 91c5e96..b001bcb 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> @@ -10,6 +10,7 @@ DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
>  
>  SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
>             file://0001-Add-libm-to-link-for-fmod-API.patch \
> +           file://fix-fatal-no-names-found-git-error.patch \
>            "
>  
>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"


