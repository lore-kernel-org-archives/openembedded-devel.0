Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id BB7C365C70
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 18:22:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Aug 2014 11:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,850,1400050800"; d="scan'208";a="467959744"
Received: from unknown (HELO [10.255.12.111]) ([10.255.12.111])
	by azsmga001.ch.intel.com with ESMTP; 12 Aug 2014 11:22:31 -0700
Message-ID: <53EA5B67.8060809@linux.intel.com>
Date: Tue, 12 Aug 2014 11:22:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BLU436-SMTP25D2D90D21B574BE00B964D6EA0@phx.gbl>
In-Reply-To: <BLU436-SMTP25D2D90D21B574BE00B964D6EA0@phx.gbl>
Subject: Re: [meta-oe][PATCH v3] CyaSSL: Sumbit cyassl recipe to meta-oe/meta-networking/recipes-connectivity
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
X-List-Received-Date: Tue, 12 Aug 2014 18:22:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2014 10:21 AM, lchristina26 wrote:
> CyaSSL is a lightweight SSL library for embedded systems.
>
> Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
> ---
>   meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> index accc144..441d321 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> @@ -9,8 +9,6 @@ SECTION = "libs/network"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -PR = "r1"
> -
>   SRC_URI = "http://www.yassl.com/cyassl-${PV}.zip"
>
>
> @@ -21,6 +19,3 @@ S = "${WORKDIR}/${PN}-${PV}"
>
>   inherit autotools
>
> -# Detect and build with correct endianness
> -# CFLAGS += "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '', '-DBIG_ENDIAN_ORDER', d)}"
> -
>
Leah,

I think Martin wants you to re-submit a new version of the complete 
recipe, not a patch to a recipe that is not yet included. That's what he 
meant my squash your changes together.

Sau!


