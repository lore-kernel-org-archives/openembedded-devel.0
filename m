Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 42B907884D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 11:00:40 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v65so13631175wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9IPibZzJ/BznwOQAziOvoaAXgbaA3rjPvn3DE1Vq9Ww=;
	b=omLu3At8FY06VpakACg2D2xApssOSlEbOQpUV1GB8vrDkwLOuN0Zub/vETODsNAWnW
	H4nsFRY8e6GDM3DHVRjOWNxex+mLx1DiP+BInJm09bixv7FFgaC5kP9JW/h8+3EYlWVF
	d68dIgNeagnhTpQwOYoH472kGpM5GZGF7jhkupgnIkQNFxzCRo94/22yI1ONvDQboYEG
	iuY0d3G/fmzx/xJGxvClepV1xfYMjwUabtKAGwkEV3SRIvYJ8XAHLP9swYP79duD2/mA
	BmqXQq85U1V0qBA4PcbO6sE2BDSmI5s6L9SdMTkrhofnsKQZCobHsW3wKfIBaNEZqK15
	I6Pw==
X-Gm-Message-State: APf1xPA3ELk6MohOpDqeFm+DwCvmTs2R2Oh5/Q4GWnRXYqqLcgQ0pxZg
	WDmYMiZnJcPxABEte+h/PjN1Rb7R
X-Google-Smtp-Source: AH8x225tvavA9XhMlGNwMO/CFrUYf5sp8iaxcU7c/8lyLKGV81DmnaBT5WoVVLAtW1yMmJgwGABQtw==
X-Received: by 10.223.134.42 with SMTP id 39mr1304567wrv.10.1519383641740;
	Fri, 23 Feb 2018 03:00:41 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 47sm2139067wrb.48.2018.02.23.03.00.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Feb 2018 03:00:40 -0800 (PST)
Message-ID: <1519383638.10914.14.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Feb 2018 11:00:38 +0000
In-Reply-To: <20180222075116.4175-2-otavio@ossystems.com.br>
References: <20180222075116.4175-1-otavio@ossystems.com.br>
	<20180222075116.4175-2-otavio@ossystems.com.br>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: [meta-python PATCH v2 2/2] python3-requests: Remove RDEPENDS on python3-misc
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
X-List-Received-Date: Fri, 23 Feb 2018 11:00:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-02-22 at 04:51 -0300, Otavio Salvador wrote:
> The selectors module is now part of python3-core. Remove this
> dependency.

http://lists.openembedded.org/pipermail/openembedded-devel/2018-February/116731.html

:-)

> Tested using updatehub's uhu utility.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
> Changes in v2:
> - Fix commit log
> 
>  meta-python/recipes-devtools/python/python3-requests_2.18.4.bb | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-
> requests_2.18.4.bb b/meta-python/recipes-devtools/python/python3-
> requests_2.18.4.bb
> index d91d993bf..0a2410f85 100644
> --- a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
> @@ -1,5 +1,2 @@
>  inherit setuptools3
>  require python-requests.inc
> -
> -# Add the runtime depends for selectors.py
> -RDEPENDS_${PN} += "${PYTHON_PN}-misc"
> -- 
> 2.16.2
> 

