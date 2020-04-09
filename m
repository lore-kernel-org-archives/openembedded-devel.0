Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.12013.1586447415030545150
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=ao28NiaR;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=361225990=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1586447415; x=1617983415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RxZHvQJW91ehTL3L7c1UhQv6/VwY4ACNEp1o37K2hTU=;
  b=ao28NiaRX5mojUM+YT+8cwuVxCy310bzXS0QZ9pvM6q5BF+iZCELlXCS
   Lasbidu7SuG829YVB6YMHbJdGHsvyx+aGDk703xD1Dd15BAN/2GTHHxT6
   xSa0DzKdbHHswsuj7RM82sqJl/gw1ydxoKv+WwH63tWr8i5cNwuyEMePA
   G+XNBuVXv2fTcsvPb7oJc4YqH1xv0AK/tnabOt7+XBdNB7T2DbNUf1kr7
   5ELvOL6C/OIfROrc6w+c2EMBS2OyctBANeZJYIOVzvRZyBBP+QTLaFT6B
   kfgSjMBiy2+yI9gNguQiGqn5LxW5tBhvkQOlN4ZgyKBmD8qKqf7VF55KY
   g==;
IronPort-SDR: nnD0Nfn9dOaW6E2IZNDVTo0xiSFA/1KGkf9kFHp+4rX3adnNyfBz/qehg96xM+5NGM8JPxJouD
 BnXlJQBatbgatCbDyUqnKosRZ+4QesQX8zbvo8M4OKNrXpu640K8uFZlC8ylkqmA6c+53c8+KO
 +2AI94VxUmUgctFrujB1QofLKbJ+RUDD+fL0xql0vCH/7ihV3HTRwtMWuT5FQYN+amAnOswyr+
 T/fn9XsepOWjyKIAWm8BcsVlBsYJ+I296d/tG939Poz43eq+eITS9+teKBE84IMZhI7sd3Yymd
 DpQ=
X-IronPort-AV: E=Sophos;i="5.72,363,1580770800"; 
   d="scan'208";a="2562256"
Date: Thu, 9 Apr 2020 17:50:11 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH] layer.conf: Mark as compatible with dunfell
Message-ID: <20200409155011.GB77653@pcleri>
References: <20200331080704.947412-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200331080704.947412-1-jacob.kroon@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Jacob,
thanks for the patch.

I've applied it to master{,-next}.

regards;rl

On Tue, Mar 31, 2020 at 10:07:04AM +0200, Jacob Kroon wrote:
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 0ddc5f9..294c319 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "meta-java"
>  BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java = "10"
> -LAYERSERIES_COMPAT_meta-java = "zeus"
> +LAYERSERIES_COMPAT_meta-java = "dunfell"
>  LAYERDEPENDS_meta-java += "openembedded-layer"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
> -- 
> 2.25.1
> 

> 

