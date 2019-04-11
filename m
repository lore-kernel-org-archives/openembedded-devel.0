Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id B0C667D985
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 17:56:51 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id z16so8168634qtn.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 10:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z0M22+nG/x9b5ZlvFTudvbS8JqNzSPVhIua8mjauYQI=;
	b=FZT7xZPbGqK11UyrlhYkK8GCmuLfvJ+M13IMrUSgRNOoy2e5Lod2wJg639JSZmOEx2
	2FBspv6rRmm3LJC1L7rtunY64PMGTp1C6SlK0f/kslBHyTp2Hn+JIVRqIjjsdvCdhnTQ
	hVFc4X6QBR9aLiRh8q9DtFwYA8ICpsiZRg3t0fjaWBts91uPysKhLSKrqK3YBDDGHzvU
	mkAD9XKwJcgakw1pSA5/5A8nPrG2efygTdcoXs7k7R9My0aqCpNvAIRY2aqY7CLz35+u
	sJVPw89oMjRR4QnpGIgU9BfX/8Itpa9axanG9NMitKBi5AS2BAdwMTd7K19DtVq4W8eH
	85xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z0M22+nG/x9b5ZlvFTudvbS8JqNzSPVhIua8mjauYQI=;
	b=mQIijJfqP0ZRhSIpjTSlDg0bnlEktRK2JiuJqcAIH/e2jyQtne8ZaevDn9JTSTuwSl
	ZGKoEuiQmOHZ7sLOqLUiQ3nxqAM1K0X21cffJQ147oWZ7ubb+27H5ovj4DByFuapiblq
	dxRxQOwPVkTk5s9sLN9Ef5e71NXfN40ETekOqPFX9D3jtqAwfQtsUwUfUMs1FCsYdv/Y
	+TKAt4kJ8Kg+XMexx8vvTT4h9YHZpljWbuqTJVXku6gMcEn4o/pOwmoHkFWFy6G1aIw9
	ShDPf3RdtwBFtak0Q1/+PTaTC5E4vtyXOReXcDb1lN6udZtNcOSjtP1j2BIqw05UgODl
	f/FQ==
X-Gm-Message-State: APjAAAXCzckF2XJKsSHp6FwfUiVG39SXq/zxAqU5ly06opw0z/EmDjuw
	9b5UzFrbaHYrzrAWV4mV/02wTuEBuOKXDzyMw9k=
X-Google-Smtp-Source: APXvYqxFAalmxXaolSp6YyL9fzMmamSBTND2iigdYDZwMhI/rOR6dzfL2ZkGGujueq0JYz3/cNKjNz6kaxi8JW1lW20=
X-Received: by 2002:ac8:f86:: with SMTP id b6mr42716346qtk.330.1555005412494; 
	Thu, 11 Apr 2019 10:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190410082726.30843-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190410082726.30843-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Apr 2019 10:56:26 -0700
Message-ID: <CAMKF1spQiTCd8rGkvEGFsnZBe9cgjmXBLUeBKx=tmihwuQPQPA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-attrs: upgrade 18.1.0 -> 19.1.0
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
X-List-Received-Date: Thu, 11 Apr 2019 17:56:51 -0000
Content-Type: text/plain; charset="UTF-8"

Please upgrade python3-attrs at same time

On Wed, Apr 10, 2019 at 1:27 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from python-attrs_18.1.0.bb to python-attrs_19.1.0.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-attrs.inc          | 4 ++--
>  .../python/{python-attrs_18.1.0.bb => python-attrs_19.1.0.bb} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-attrs_18.1.0.bb => python-attrs_19.1.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
> index d0b5697cb..1f767ba19 100644
> --- a/meta-python/recipes-devtools/python/python-attrs.inc
> +++ b/meta-python/recipes-devtools/python/python-attrs.inc
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
>
> -SRC_URI[sha256sum] = "e0d0eb91441a3b53dab4d9b743eafc1ac44476296a2053b6ca3af0b139faf87b"
> -SRC_URI[md5sum] = "3f3f3e0750dab74cfa1dc8b0fd7a5f86"
> +SRC_URI[sha256sum] = "f0b870f674851ecbfbbbd364d6b5cbdff9dcedbc7f3f5e18a6891057f21fe399"
> +SRC_URI[md5sum] = "2be7bce157988928f5ff2bb50a0b510d"
>
>  inherit pypi
>
> diff --git a/meta-python/recipes-devtools/python/python-attrs_18.1.0.bb b/meta-python/recipes-devtools/python/python-attrs_19.1.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-attrs_18.1.0.bb
> rename to meta-python/recipes-devtools/python/python-attrs_19.1.0.bb
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

