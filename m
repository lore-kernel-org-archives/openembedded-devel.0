Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 67390786B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 01:57:22 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j4so1554945pgp.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Dec 2017 17:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=geMPlvNHfLT/uPLlYtzAuO24LonBUR7Ye6vSLdm8K1E=;
	b=C1G8kpH/XwMzvX4cLpM4+ZdBldjj9F/r4CZnPmaN8lAEuNHNmstsrePNSWAYeRUFSC
	UO2ihIr9PxhtFl2fQE1ZsdgDxbk7CXVwHjrPzU8J5N1K6rAVh4TZHIYcD7FYaL4Hw6JZ
	DZhdgmbsE9BPIcG3s7V+r6BbhpwfW2eiwJbHAaGfyH2t7UYPda7pLvuhyErnH9qn1nzp
	l+oNo7V1xQq2XCYMzONJ1FwTpe3bGwQlrXPwjDlX2LhMUDsePatLXzyOLnBhPETqVQQ4
	5w1I/qtLz4rsPw08E3KGb9UVUufnKmyKO8X88tyaCQAg0r8j2UI6HvwQR5KIAW/SX+8Z
	BsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=geMPlvNHfLT/uPLlYtzAuO24LonBUR7Ye6vSLdm8K1E=;
	b=iSZvxXii4Jj7HBZT3fuiwauiCOw9C5Ua9vH5lFOt6xQL0MUgd/arvjrpfv2dTbBbaT
	OLQ+1tIdgghp9U4/HVVNVlkn7nd4UqYdj2KBGf4q8rrOzIFTp1yUJQsZVry8DJGFWYIe
	Sd61Ow/WgJ+DzrodN0L+kVOVztfgNq+7zGtu4cI5BniG9NZJT3zSq7dWcMMyLeuReK/5
	KPt5huqABuYdy2WTUUCzu0I+cEUSt5FkpY/Vs4AxfiRAGh/IJ9xHoiTR4U7kNPDFSabm
	pLie1vIN2ckiQIoPGvGwGvYSb9SSZas09+mMkGZhLBVNq+rfY/m2JaPD4BnPpdwnVVZr
	w98w==
X-Gm-Message-State: AKGB3mITZL8dp4VrcxpTAI8n/+CfgOwaeCDjJIWnYbi/qcUDJoADm0ZB
	ZzTThUb5CeR8vt6kG5lQCoY=
X-Google-Smtp-Source: AGs4zMbNAwce9CiVLizYTF6ytcTMimYPOUABX7Uqznbc8MMeWlZ3D7tY2xtLD00YFQB9KCGAP4T/kA==
X-Received: by 10.99.111.206 with SMTP id k197mr6535768pgc.182.1512525444356; 
	Tue, 05 Dec 2017 17:57:24 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:94bc:1c6f:280d:e35e?
	([2601:202:4001:9ea0:94bc:1c6f:280d:e35e])
	by smtp.gmail.com with ESMTPSA id j6sm1879547pfg.85.2017.12.05.17.57.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 17:57:23 -0800 (PST)
To: Bill Randle <bill.randle@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
	<1512020828-4040-8-git-send-email-bill.randle@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2c075ea2-9526-2e2c-2136-523fecd5419b@gmail.com>
Date: Tue, 5 Dec 2017 17:57:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1512020828-4040-8-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: Re: [meta-python][PATCH 07/12] python-flask-wtf: move core of recipe to a .inc file
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
X-List-Received-Date: Wed, 06 Dec 2017 01:57:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/29/2017 09:47 PM, Bill Randle wrote:
> Signed-off-by: Bill Randle <bill.randle@gmail.com>
> ---
>  .../recipes-devtools/python/python-flask-wtf.inc        | 15 +++++++++++++++
>  .../recipes-devtools/python/python-flask-wtf_0.12.bb    | 17 +----------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf.inc

I am getting this error:

WARNING:
/home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb:
Unable to get checksum for python3-flask-xstatic SRC_URI entry
remove-pip-requires.patch: file could not be found
WARNING:
/home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb:
Unable to get checksum for python3-flask-wtf SRC_URI entry
import-simplejson-as-json.patch: file could not be found
ERROR: ParseError in python-flask-migrate: not a BitBake file

- armin
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-wtf.inc b/meta-python/recipes-devtools/python/python-flask-wtf.inc
> new file mode 100644
> index 0000000..e42f7c1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-flask-wtf.inc
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "Simple integration of Flask and WTForms."
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=507e8635f25a06dc4f041a3a1b3359b3"
> +
> +SRC_URI[md5sum] = "c53a74e8ba481bf53405fd5efdf0339e"
> +SRC_URI[sha256sum] = "bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
> +
> +SRC_URI += " file://import-simplejson-as-json.patch"
> +
> +PYPI_PACKAGE = "Flask-WTF"
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-wtforms \
> +    ${PYTHON_PN}-simplejson \
> +"
> diff --git a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
> index 79afaf6..dbf091b 100644
> --- a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
> +++ b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
> @@ -1,17 +1,2 @@
> -DESCRIPTION = "Simple integration of Flask and WTForms."
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=507e8635f25a06dc4f041a3a1b3359b3"
> -
> -SRC_URI[md5sum] = "c53a74e8ba481bf53405fd5efdf0339e"
> -SRC_URI[sha256sum] = "bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
> -
> -SRC_URI += " file://import-simplejson-as-json.patch"
> -
> -PYPI_PACKAGE = "Flask-WTF"
> -
>  inherit pypi setuptools
> -
> -RDEPENDS_${PN} = "\
> -    python-wtforms \
> -    python-simplejson \
> -"
> +require python-flask-wtf.inc


