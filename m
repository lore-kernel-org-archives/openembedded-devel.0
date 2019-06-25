Return-Path: <prvs=072d76755=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 7214F7E241
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1561455689; x=1592991689;
	h=subject:to:references:from:cc:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=c4Jzn+e8w6NLLmTke4NMhnpPLjqr/seRkngPpTE37oU=;
	b=jaMVZS2h7zkAFnHgUFdQ2yMsP8F765yQtawsJvfvTGtqXsv1LMpQvteh
	wKoZoGiuxY0hvPCsPNydVc3ceLRo0SzuumOU/8rB7V9zi+r30C1pMnnnb
	Hfl5nEtUMVCjD9uNiGu41OjPybfDua/vyBb1C+IRSdvs/AiOaN8eD3xo2
	B2TUEKtf4rqCddNtYbk/4Tqdn1u6xD5Rd1uJsTUQHQRsqDF2VPKaqwiZt
	SzxWlwxXhWPsOF7C8faj3d+zqt7FKLAKcJ5B/BEPJOciWkDBxB0whPjXm
	fo3H4Dk9HoSVxAEW+/PuIlD5bA+BL2iFlKGFZ86E++s4t6Kz4ACW84dXR g==;
IronPort-SDR: HVGCtWN2ceMzrjUjJ4lFPncxqeivqmxfp6TQQsioxe2huIm75MS2TicJwBYM3dUA19zxRBxkNl
	lvEvDiowQZsvnGsjxz4I03JvbgIkbs2IQ6v6tGdUYj/QOjFTr/NBxiDq8EZM89oVYfRiqYmbXS
	zB9oSf3oWxpRo1blWIziqvFebpcWg9b5lvEzAsQTWxLsQixG8aRlAQ9ek3Co1uU+ZBPrbdQUoa
	hPZsc0WmnBcN1azt0bhScEQLNAGXaE0WnZqQZIjkdGWQXfKQ73pBzfCHqkEUoHAAkEks8ZwsCS
	APY=
X-IronPort-AV: E=Sophos;i="5.63,415,1557180000"; 
   d="scan'208";a="2207205"
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190625075223.13585-1-ricardo@ribalda.com>
	<20190625075223.13585-3-ricardo@ribalda.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <46a0e244-16f4-f014-bdd7-08ea31c32176@skidata.com>
Date: Tue, 25 Jun 2019 11:41:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190625075223.13585-3-ricardo@ribalda.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH 02/23] openjd7: remove support for kerberos
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
X-List-Received-Date: Tue, 25 Jun 2019 09:41:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ricardo,
thanks for the patches!

On 25/06/2019 09:52, Ricardo Ribalda Delgado wrote:
> It triggers a lot of dependencies, and it is no clear that
> is needed.

To be honest I don't know if it's needed or used by anybody, but would 
it be possible to create a PACKAGECONFIG for de-/selecting the 
system-kerberos?

Furthermore if you send a v2 can you please fix the subject (openjd7 -> 
openjdk7)?

Same goes for openjdk-8.

Thanks & regards;Richard.L

> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>   recipes-core/openjdk/openjdk-7-common.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
> index 794bf58..26e71ce 100644
> --- a/recipes-core/openjdk/openjdk-7-common.inc
> +++ b/recipes-core/openjdk/openjdk-7-common.inc
> @@ -67,7 +67,7 @@ DEPENDS = " \
>       jpeg libpng giflib \
>       gtk+ glib-2.0 \
>       cups fontconfig \
> -    rhino krb5 \
> +    rhino \
>       libxt libxinerama libxrender libxtst libxi \
>       freetype alsa-lib libffi \
>       attr \
> @@ -134,6 +134,7 @@ EXTRA_OECONF = " \
>   EXTRA_OECONF += " \
>       --disable-system-pcsc \
>       --disable-system-sctp \
> +    --disable-system-kerberos \
>   "
>   
>   do_configure_prepend() {
> 

