Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id AF0C878A2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 16:02:46 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id h22-v6so5164385vke.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2018 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=po045kGL6VZaqnXTStRS7MYeMndcDc21vNQW3asEnbw=;
	b=dWx6FN7+pN+4FeN96ZX2kqm4JZRc5XSGt6ty8DknXNlvp+9qZRj/zZYFJXQQFGALHc
	aVI6dlg/sM8r68IoQO+R/bCUDLem3dWP2qrwhm5Os6IHVpIdhex7ETQXDX1cCiKRATBg
	YsbFAEZuXQ3zm76PerGJ2Jq9jqJ0K51xiPOZj1WdAPMG7VhC68aHR5rT7KUjh+t54Fw2
	nVn4Do4wbAShkrTiS7TAGxmHMBet/3cRugXGqdi6WdCeuHBcKEueFUvHAalqQ72UXrHO
	plWkYlGDbEHADsxf3YuPGFCS5x5wl0QFJZ7aEI5guQx3yhIquRJ65my51LZrnjvAqWT3
	NghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=po045kGL6VZaqnXTStRS7MYeMndcDc21vNQW3asEnbw=;
	b=etMgP2UutbQR8JAkBkqfQT4kNpSkyCbG1gwDhk4PlJCPIxmze8RcHOhm2bfao1/0Mc
	6EJeEh75iZvZCOKF53UgxEbsIL0NuLO36Isf7Avx37SYIGcV/7EOOp6ZCebCodke5+J1
	+oYG/byIak36kYxsZXardo5w1Iw7M6/oCcHKnkMCzCXfxptakk8HNcyj2HrSlzbwRNZy
	R8zGjcnNRb3Ls4PZTKWzH11tuldVyPzG/8QMaLuA5Ic9AUfXPTosTgIKPxF2HzmhGoSf
	D2VCUXp7DlkwHY0O2NskjJzci52GSf9rlN/k99JKDnsUWxoCVAJAe9JT1PI2gfw/nml4
	Ah3Q==
X-Gm-Message-State: APt69E1kb1FJVfr4eBoUZ+5u18FROG8XiDFi9yNyHHQdM2OX+OxMXbba
	QtXolyuL5hVoiW2hfM2CKapgUmz3yy5P2u2bub8=
X-Google-Smtp-Source: AAOMgpeLl/JZ7ye1V0BIq7Qztro+rVSdjAXBBG5wLsKoMj055E+//42UUhXIlU+tupsurmFk2HFTq624n1dRHejKqw8=
X-Received: by 2002:a1f:20d4:: with SMTP id
	g203-v6mr3694791vkg.176.1530806567489; 
	Thu, 05 Jul 2018 09:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180705081113.45222-1-mingli.yu@windriver.com>
In-Reply-To: <20180705081113.45222-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2018 09:02:21 -0700
Message-ID: <CAMKF1srfhZcGmPMvEpJyvfVVt+8vMN73Qw76FMayAbcfcFSx2A@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mcelog: Upgrade to 159
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
X-List-Received-Date: Thu, 05 Jul 2018 16:02:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 5, 2018 at 1:11 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Update LIC_FILES_CHKSUM as README.md updated
>

Please provide the information about what changed in README.md

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../recipes-support/mcelog/{mcelog_1.49.bb => mcelog_159.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/mcelog/{mcelog_1.49.bb => mcelog_159.bb} (89%)
>
> diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb b/meta-oe/recipes-support/mcelog/mcelog_159.bb
> similarity index 89%
> rename from meta-oe/recipes-support/mcelog/mcelog_1.49.bb
> rename to meta-oe/recipes-support/mcelog/mcelog_159.bb
> index 84633a76c..236ad7d00 100644
> --- a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb
> +++ b/meta-oe/recipes-support/mcelog/mcelog_159.bb
> @@ -9,10 +9,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;
>      file://run-ptest \
>  "
>
> -SRCREV = "2cfdf29b2ef98ccd5ed42cdde8bbe437e0d6412f"
> +SRCREV = "2ed5cc0489d20cbffdc6d2e08b1fe49973f0ee34"
>
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://README.md;md5=279840fabb191e6cd9150492d31b0e20"
> +LIC_FILES_CHKSUM = "file://README.md;md5=74bb47b9a68850cb398665cf78b31de6"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

