Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0367869E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 04:55:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Oct 2018 21:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,355,1534834800"; d="scan'208";a="270362199"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.20.80])
	([10.221.20.80])
	by fmsmga006.fm.intel.com with ESMTP; 07 Oct 2018 21:54:37 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20181008044741.37650-1-raj.khem@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <1634ed07-43f8-7f24-0cfa-9024d7a45a17@intel.com>
Date: Mon, 8 Oct 2018 12:54:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181008044741.37650-1-raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH] umip: fix recipe location typo
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
X-List-Received-Date: Mon, 08 Oct 2018 04:55:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/08/2018 12:47 PM, Khem Raj wrote:
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
> index e3b46bc2c8..d0645007c5 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
> @@ -44,7 +44,7 @@ do_configure () {
>      export LD="${CXX}"
>      GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
>      # $TARGET_ARCH settings don't match --dest-cpu settings
> -   ./configure --prefix=${prefix} --without-intl --without-snapshot --shared-openssl --shared-zlib \
> +   ./configure --prefix=${prefix} --with-intl=small-icu --without-snapshot --shared-openssl --shared-zlib \

This hunk shouldn't have been part of this patch.

Thanks,

Anuj

