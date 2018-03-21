Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 23FFD78978
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:49:18 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j2so2051705pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=9+rtJVXm0dT9C3iODtreZF2OVj3OV0qFhvsSDvcQi4Y=;
	b=G2oLCvhIxDT7xFlT2bPMcDCd+4XgpLFW+yK5gdOfyIzR48kPX05Ls1QIgy2Ga98DM1
	AZ5/s3diyrGWhRepN0XROAk5tUC8IrIRK6vrvt+LUk710E8eqJXbKzNkiHI86FVUZawb
	szkm2oXnyanLNPSFY3fDULgTHd4yYJDkQC58XuxI6hiY1ISyV4ZzVj0fPoF9HJHcdVxs
	2PJjg/dYx1dgY1JNuwTr2U+46dL+HkWXZSZqMWSdlC5hioR1qVESSrohFgc8Zo/Ew6PU
	edJXC7p1oCk92/PNiV8iOob2tCB4KOYhMGYNBIZaGG2PUOG59qW5EEs118MGUDfIilNL
	IuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=9+rtJVXm0dT9C3iODtreZF2OVj3OV0qFhvsSDvcQi4Y=;
	b=rRrjfW1h1NvsKdnKANJ3oSlKPQOcAIGrmt+yzn2SFcxb2JWqM/tmxKsV6+qR0gNe5W
	7J9PbuqIVYgSENu4DkBpGpryyoJcKH1VASQ/X22JgmG84o4J4I3f3YjA+T27twS0FMCB
	wXbiBsPdJHTmGQNClRdSef2tkr6/szlJwsSk1cq2TlAA/J/MN8jCEr405Ffta3UaBhtY
	KpEK1L08Wk/vS9jU4ItHAYpQezcJ9BvDewi8CQpF4STFOg6lZnR99PrbkdAZcbTB9FMw
	zGhxWimI1ZoMTN9HKGFrXmBFzzcY1tTmTYQeQsL3evvOudb7LWNShlTnyuLRSARydN9x
	eH5g==
X-Gm-Message-State: AElRT7GWvhMLHDaFjikUGB47rn/fyvlPIQ+G0/ZDUGn3rIq7y2hnYGRj
	O0Ta7izR557gFQOPudrI6GvIWQ==
X-Google-Smtp-Source: AG47ELt8fivLfMNu61mdQ/cv5tjsSIqO2bzBH7DZIxmPMJlnjfBM+quGbBFXwcxOlrBqaFHe1QuVxw==
X-Received: by 10.99.178.88 with SMTP id t24mr11580889pgo.212.1521643760067;
	Wed, 21 Mar 2018 07:49:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:a1c1:eb3f:f249:aed1?
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id
	k185sm8224201pgk.94.2018.03.21.07.49.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 07:49:19 -0700 (PDT)
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521603377-34881-11-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0e9a6374-9e23-8775-cf07-49a59a80a793@gmail.com>
Date: Wed, 21 Mar 2018 07:49:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521603377-34881-11-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [meta-python][PATCH] python-pip: 9.0.1 -> 9.0.2
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
X-List-Received-Date: Wed, 21 Mar 2018 14:49:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 03/20/2018 08:36 PM, Huang Qiyu wrote:
> Upgrade python-pip from 9.0.1 to 9.0.2.

Already have an update queued up in stagging/master-next

>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-pip_9.0.1.bb => python-pip_9.0.2.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pip_9.0.1.bb => python-pip_9.0.2.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pip_9.0.1.bb b/meta-python/recipes-devtools/python/python-pip_9.0.2.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python-pip_9.0.1.bb
> rename to meta-python/recipes-devtools/python/python-pip_9.0.2.bb
> index 5ddd8d5..fa709a1 100644
> --- a/meta-python/recipes-devtools/python/python-pip_9.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python-pip_9.0.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
>  LICENSE = "MIT & LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
>  
> -SRC_URI[md5sum] = "35f01da33009719497f01a4ba69d63c9"
> -SRC_URI[sha256sum] = "09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d"
> +SRC_URI[md5sum] = "2fddd680422326b9d1fbf56112cf341d"
> +SRC_URI[sha256sum] = "88110a224e9d30e5d76592a0b2130ef10e7e67a6426e8617bb918fffbfe91fe5"
>  
>  inherit pypi setuptools
>  


