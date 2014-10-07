Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 58646717F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 08:39:39 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga103.fm.intel.com with ESMTP; 07 Oct 2014 01:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,668,1406617200"; d="scan'208";a="482469674"
Received: from dngooner-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.35])
	by azsmga001.ch.intel.com with ESMTP; 07 Oct 2014 01:39:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 07 Oct 2014 09:39:34 +0100
Message-ID: <1801470.RIdAKMambK@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1412657597-13020-1-git-send-email-Martin.Jansa@gmail.com>
References: <CA+chaQdOUkViSuuZF+Fn1hfz+1P7ijgFYGTjgaRGUWTdVLCVZA@mail.gmail.com>
	<1412657597-13020-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2] modphp, xdebug: blacklist because of conflict with php
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Oct 2014 08:39:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 07 October 2014 06:53:17 Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-webserver/recipes-php/modphp/modphp5.inc     | 3 +++
>  meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc
> b/meta-webserver/recipes-php/modphp/modphp5.inc index 6932429..8707950
> 100644
> --- a/meta-webserver/recipes-php/modphp/modphp5.inc
> +++ b/meta-webserver/recipes-php/modphp/modphp5.inc
> @@ -14,6 +14,9 @@ S = "${WORKDIR}/php-${PV}"
> 
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
> 
> +PNBLACKLIST[modphp] = "CONFLICT: 466 header files conflict with php"
> +# e.g. sysroots/qemux86-64/usr/include/php/main/win95nt.h
> +

I'm sorry, but we are not going to blacklist this recipe for everyone. I 
appreciate that stricter tests mean these can't be built side-by-side, that's 
just unfortunate and something we will have to live with for now.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

