Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6BA6C10B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 01:05:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3615TZP026587
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Apr 2019 18:05:29 -0700 (PDT)
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 5 Apr 2019 18:05:28 -0700
To: <openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <20190406004827.14047-1-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <74cc7853-e1ca-3b81-1424-1923853525f5@windriver.com>
Date: Fri, 5 Apr 2019 21:05:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190406004827.14047-1-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.10]
Subject: Re: [meta-networking][PATCH v3-retransmit] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Sat, 06 Apr 2019 01:05:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Khem,

I know you had a compile problem with this patch last time but
I've checked it again and even 'called a friend' to do
a sanity check and the simple patch works for both of us.

I don't see what the problem could be so hopefully it'll
just work this time.

../Randy

On 4/5/19 8:48 PM, Randy MacLeod wrote:
> The previous SRC_URI did not work for the new version and
> when looking at the site, users are required to navigate
> through a click-through license agreement. Also use git
> repo rather than the .zip archive since the github checksum
> can change from time to time.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}        | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb} (77%)
> 
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> similarity index 77%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> index 0a0a6075d..d4b969104 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
> @@ -12,9 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   PROVIDES += "cyassl"
>   RPROVIDES_${PN} = "cyassl"
>   
> -SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip"
> -SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
> -SRC_URI[sha256sum] = "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
> +SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
> +SRCREV = "e87433e2b6682aa7162fcb4aafefb08e2fbd932b"
> +S = "${WORKDIR}/git"
>   
>   inherit autotools
>   
> 


-- 
# Randy MacLeod
# Wind River Linux

