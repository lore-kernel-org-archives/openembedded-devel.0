Return-Path: <denis@denix.org>
X-Greylist: delayed 415 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jun 2018 17:50:47 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 241B0771C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 17:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 65CDD20BD6;
	Wed,  6 Jun 2018 17:43:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id L-iSCGK2KKSS; Wed,  6 Jun 2018 17:43:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F7A42085B;
	Wed,  6 Jun 2018 17:43:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BD625163492; Wed,  6 Jun 2018 13:43:50 -0400 (EDT)
Date: Wed, 6 Jun 2018 13:43:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Philip Balister <philip@balister.org>
Message-ID: <20180606174350.GC19965@denix.org>
References: <20180604181313.28487-1-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <20180604181313.28487-1-philip@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org,
	Philip Balister <philip@opensdr.com>
Subject: Re: [meta-oe][rocko][PATCH] protobuf: Fix fetcher failure for rocko.
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
X-List-Received-Date: Wed, 06 Jun 2018 17:50:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 04, 2018 at 02:13:13PM -0400, Philip Balister wrote:
> From: Philip Balister <philip@opensdr.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

Can we get this expedited to rocko, please?


> The 3.4.x branch disappered from the github repo. Remviing the branch
> entry from SRC_URI allows the fetch to succeed. Rocko is the only release
> that has this issue. Sumo and later have 3.5.x.
> 
> Signed-off-by: Philip Balister <philip@opensdr.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> index fae7c18a1..fe28f475a 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> @@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
>  
>  PV = "3.4.1+git${SRCPV}"
>  
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
> +SRC_URI = "git://github.com/google/protobuf.git"
>  
>  EXTRA_OECONF += " --with-protoc=echo"
>  
> -- 
> 2.13.6
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

