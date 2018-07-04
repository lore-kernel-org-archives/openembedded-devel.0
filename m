Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 34D8B74B02
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 00:33:17 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id x18-v6so2389002uaj.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 17:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SbTSTxGUa943yXaVYfbs4h+qQ7hW3OeIb8TlDHjRx2k=;
	b=qLAg0lsW48qjYh/8TrqNSnr2lr3hjM09k2tST6Lfn/8kDtvA5bUaympB3XbCg9XdJB
	k6qCMpW21xH79chIfToNrmou3cARisXGIXQD5fnwvRpO4Dj8UkYn86z2/vlOyKBzbgy1
	I0fNCqHWIPVIewkDqNQJH/af2qzIBYa6uHR/nh65UIs2hsN0ksxZFpl2s6mLewzZZy9O
	88pIBWe19kkaEReQl2JsIw6Df/6tvp1tSL7Hw9AD3PSYDcqfV/WiemelC+F3xPgEMSb1
	k9OcWC7edare3h57+LVWssMlVB9RCB2F7MYYKRbeZKMnW+rJqQxrFLyTYK4cHZQduURt
	bMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SbTSTxGUa943yXaVYfbs4h+qQ7hW3OeIb8TlDHjRx2k=;
	b=Iezp6FgpFI/oycqXXNb5W/f241H0jU3tXEj1A85UVCfwi7dpboxIJUrPEfICbg6HoI
	NOK8LtG/emVrutggfy12AB3UlaJAqf2wpLfSunAFgm8DXAiXvbRIblZigToRjnxrUq3B
	YPeu/UhzuKpHiNxX+Lg+YKhOIG4Lo3G9LxoQJ+/Rb2W0QjuZ4SSZjDq+wuEnYIWXmtLt
	6n04ZKPe/FS4rQfReonM+PZ0xqqWivifckdgmBBrX3OSFXzGmZyEkW8N0v9DJSNijnwY
	te97dsFESmawkNuC7X4pMLWJBdHUnte2bJzDtNTvUGI1IYZw2Wi5mSrBos+a647orU03
	vpZg==
X-Gm-Message-State: APt69E3KqVNR8/ZSuXrdhHXVEtXdPhgsFJZQCu6eQ0DxALoBFMuyxk1t
	UpyycYduXR+BaUlObiNjIJF8hddZ3XIqG9E+klA=
X-Google-Smtp-Source: AAOMgpcfF4SJHJqhnn5JaSsYURyPDbRmnqUVbXxJ2brCTBDnJefBhflTcsPNeFVmqWiqyZsBPvMW9NeLhml2oi2q750=
X-Received: by 2002:ab0:7296:: with SMTP id
	w22-v6mr14604236uao.184.1530664397865; 
	Tue, 03 Jul 2018 17:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20180702093122.31132-1-alexandru.vasiu@ni.com>
In-Reply-To: <20180702093122.31132-1-alexandru.vasiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jul 2018 17:32:25 -0700
Message-ID: <CAMKF1srKYDa1Jp1vh==MiNMLt6X83=Ui5YAt-sY5bsoFQ0yESg@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH v2] python-pyiface: Upgrade to 0.0.7
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
X-List-Received-Date: Wed, 04 Jul 2018 00:33:17 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rebase it on top of master-next and resend please
On Mon, Jul 2, 2018 at 2:32 AM Alexandru Vasiu <alexandru.vasiu@ni.com> wrote:
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta-python/recipes-devtools/python/python-pyiface.inc        | 4 ++--
>  .../{python-pyiface_0.0.5.bb => python-pyiface_0.0.7.bb}      | 0
>  .../{python3-pyiface_0.0.5.bb => python3-pyiface_0.0.7.bb}    | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pyiface_0.0.5.bb => python-pyiface_0.0.7.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.5.bb => python3-pyiface_0.0.7.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
> index 620b244c6..895a0ae09 100644
> --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> @@ -5,7 +5,7 @@ LICENSE = "GPLv3+"
>
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
>
> -SRC_URI[md5sum] = "06c3c71fe51df740dae6a88a13afb5e0"
> -SRC_URI[sha256sum] = "4bb79100cbcf7344a1ccaddc578cd6455da47d8eac6eb1bf903ec32e043af924"
> +SRC_URI[md5sum] = "1bbc53c281925eae5f508b8b1a1f8259"
> +SRC_URI[sha256sum] = "83a64f5672cda48776ca9ed228dbf2e2df7b074a7dcb52ed4f6987322051928d"
>
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb
> rename to meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
> diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

