Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B949578217
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 09:05:38 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u101so37756568wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 02:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A/9FyY96XLGr38hgrk6XAq74DNaoxOkAjZUcQWXdPo0=;
	b=eUc6JH+qCOFVHefTDiPq2US5abtzFVe6UkEwLZl53nyhK0mG0+COaPc90Lv9bp0/HB
	AUyiIcOvgyzCTWi40rLO7MEfLRdU2V8ZQVvfFVoKrFavJf2O9fU6299AWkQAZ3+6RUJ8
	b6+Mts+c6zZqEZ1jrb3z26MnzHlKqe4/lKYZ0jx1PgI8idofb+Pe651Rsieyr8MxJx78
	wioWCXfe031cdytZ47Z4qUS14FwDvAo4YikQb4jauXH9JkfS75jdD0Ej3ESjMm9cncVw
	vQqOz45Hs7hnOPhH64nbwTqdJpSSz0wWRQpGlQva4HZIUd3vwRzscmACkrMYQ2xniEf8
	ymUA==
X-Gm-Message-State: AKS2vOwkCQH1xFZz7mbRzQLiwqZDHv7/EchNulOAQ25mwRk+g43NlLCV
	+iGrhfFfm3B0bg/6ei4=
X-Received: by 10.223.141.138 with SMTP id o10mr552500wrb.69.1497431139115;
	Wed, 14 Jun 2017 02:05:39 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id k56sm431189wrk.45.2017.06.14.02.05.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 14 Jun 2017 02:05:38 -0700 (PDT)
Message-ID: <1497431137.19546.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Jun 2017 10:05:37 +0100
In-Reply-To: <20170614082721.7902-1-ismo.puustinen@intel.com>
References: <20170614082721.7902-1-ismo.puustinen@intel.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] fuse: fix fetcher error.
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
X-List-Received-Date: Wed, 14 Jun 2017 09:05:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Wed, 2017-06-14 at 11:27 +0300, Ismo Puustinen wrote:
> The recent fuse recipe update broke fetching the sources when building
> fuse-native (it tried to fetch non-existent package
> fuse-native-2.9.7.tar.gz).
> 
> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
> ---
>  meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb b/meta-
> filesystems/recipes-support/fuse/fuse_2.9.7.bb
> index e66f3cd..ed353c7 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
> @@ -10,7 +10,7 @@ LICENSE = "GPLv2 & LGPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LIB;md5=4fbd65380cdd255951079008b36451
> 6c"
>  
> -SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${P}/${P}
> .tar.gz \
> +SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-
> ${PV}/fuse-${PV}.tar.gz \

You can use ${BP} rather than ${P} or fuse-${PV}

Cheers,
Andre'


>             file://gold-unversioned-symbol.patch \
>             file://aarch64.patch \
>             file://0001-fuse-fix-the-return-value-of-help-option.patch \
> -- 
> 2.9.4
> 

