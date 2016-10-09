Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 696FE6080F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Oct 2016 08:33:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u998XUwc017298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 9 Oct 2016 01:33:30 -0700 (PDT)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 9 Oct 2016 01:33:29 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1473832153-165988-1-git-send-email-wenzong.fan@windriver.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <659b3af2-08a8-fd39-a950-a873bce2b3ab@windriver.com>
Date: Sun, 9 Oct 2016 16:33:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1473832153-165988-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [meta-networking][PATCH] mbedtls: upgrade to 1.3.17
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
X-List-Received-Date: Sun, 09 Oct 2016 08:33:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...

Wenzong

On 09/14/2016 01:49 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> * fix CVE: CVE-2015-8036
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../mbedtls/{mbedtls_1.3.10.bb => mbedtls_1.3.17.bb}                  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_1.3.10.bb => mbedtls_1.3.17.bb} (91%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.17.bb
> similarity index 91%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.17.bb
> index d5c7afe..fcfec69 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.17.bb
> @@ -25,8 +25,8 @@ SECTION = "libdevel"
>
>  SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
>
> -SRC_URI[md5sum] = "19ebbc96feceb430ad958dfe89cb633f"
> -SRC_URI[sha256sum] = "746fd88e0c6623691fc56c4eed52e40a57b2da0ac80f6dd8995094aa6adb407e"
> +SRC_URI[md5sum] = "a6ed92fc377ef60f7c24d42b900e0dad"
> +SRC_URI[sha256sum] = "f5beb43e850283915e3e0f8d37495eade3bfb5beedfb61e7b8da70d4c68edb82"
>
>  DEPENDS = "openssl"
>  RDEPENDS_${PN} += "libcrypto"
>

