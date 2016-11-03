Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C47D719F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 15:24:32 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so5160197pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=SWK8DjHj67vRwDMdyhQdZ6OqGmodoABNcfsJllE/qrs=;
	b=SJz6OLLTkJFobmHjEqNBMPCjL/9KXQqkLvzM9zVmf2Jo4SqjnySBLpCbjKX7i7Ipj5
	vn/Lau/k1OvHkS5eOXNSDuG1XHWK8Esphp0elASSKxo7X8v5uMtqX67PR4YQBknQ7Mvk
	L/+ay1DYYnnIt2bgrwA0EMSHdM51meywKtPqJN4RLEG7ivtVL5q5vo+FWY2rA929bXit
	fGxNKxO9r3IaM+LH0U9HXDcIL+pLany34EGklm6T2xBFMpcx7ZIoTqnH/qp+BA84Ta/t
	X4qP27X5aiqPueKj6rsSO7LaCM3ZGty6q8RuoVha6jEOH2V7aGwrgLibA5HKBZscZjKO
	BJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=SWK8DjHj67vRwDMdyhQdZ6OqGmodoABNcfsJllE/qrs=;
	b=mTPR29Cw7goxuyL7zjVhCBbzLHry4TwK1xHvNB/8xVmb5kdB8Gt7x/5QisCBlzTaV9
	bk9QWaP055AnTukWK/BjbLuYtTB0LqdUFjmK8bTG4KJfs97hE+maqCr3s1cXBmutSaRO
	KSpC2Ex9FrNxsLexZi2hK2WPQo5ZdNQZCegFagR2/F7VaYYzIgbiiO9LgXE0Hifm6Lyo
	FLHiYgj7x3iiab29E9aDEDIa0mkpI7CyhSQ/Exw/je9ZAtJqnzSmB0AD98nqNA744/RP
	M4s+1qJdqdJyRA5/MVSfw12TJRB5ko1UV2FaV8RLrd5mckrtAlzlD1XP4vL4tmBW0qzF
	86xg==
X-Gm-Message-State: ABUngvdmdRpRlxVXTf2q+fSIZNzsYFhY7pELtNmEaQgmd8XDdc8hOykDLYmwYcqgaSQREw==
X-Received: by 10.99.251.5 with SMTP id o5mr14695890pgh.160.1478186673630;
	Thu, 03 Nov 2016 08:24:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:614c:a5d9:489d:9d27?
	([2601:202:4001:9ea0:614c:a5d9:489d:9d27])
	by smtp.googlemail.com with ESMTPSA id
	r88sm13550879pfe.93.2016.11.03.08.24.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 08:24:33 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1477420954-7346-1-git-send-email-michael.davis@essvote.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b917a9b5-5b0c-607b-011a-6fed1e528b37@gmail.com>
Date: Thu, 3 Nov 2016 08:24:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1477420954-7346-1-git-send-email-michael.davis@essvote.com>
Subject: Re: [meta-oe][krogoth][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Thu, 03 Nov 2016 15:24:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 10/25/2016 11:43 AM, Davis, Michael wrote:
> From: "Davis, Michael" <michael.davis@essvote.com>
> 
> GPLV3 and BSD portions were originally placed in the same package.
> The GPLv3 portion has been seperated into pcsc-lite-spy and
> pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> (cherry picked from commit 54c7e784c7689d8cff4173db716bb7913c65315f)
> Signed-off-by: Michael Davis <michael.davis@essvote.com>

merged to staging.
Armin
> ---
>  .../recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb  | 24 ++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> index cc72549..0d2cb33 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> @@ -1,7 +1,13 @@
>  SUMMARY = "PC/SC Lite smart card framework and applications"
>  HOMEPAGE = "http://pcsclite.alioth.debian.org/"
>  LICENSE = "BSD & GPLv3+"
> -LICENSE_${PN}-dev = "GPLv3+"
> +LICENSE_${PN} = "BSD"
> +LICENSE_${PN}-lib = "BSD"
> +LICENSE_${PN}-doc = "BSD"
> +LICENSE_${PN}-dev = "BSD"
> +LICENSE_${PN}-dbg = "BSD & GPLv3+"
> +LICENSE_${PN}-spy = "GPLv3+"
> +LICENSE_${PN}-spy-dev = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bcfbd85230ac3c586fb294c8b627cf32"
>  DEPENDS = "udev"
>  
> @@ -20,14 +26,24 @@ EXTRA_OECONF = " \
>  
>  S = "${WORKDIR}/pcsc-lite-${PV}"
>  
> -PACKAGES =+ "${PN}-lib"
> +PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN}-spy-dev"
>  
>  RRECOMMENDS_${PN} = "ccid"
>  
> -FILES_${PN}-lib = "${libdir}/lib*${SOLIBS}"
> +FILES_${PN} = "${sbindir}/pcscd"
> +FILES_${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
> +FILES_${PN}-dev = "${includedir} \
> +                   ${libdir}/pkgconfig \
> +                   ${libdir}/libpcsclite.la \
> +                   ${libdir}/libpcsclite.so"
> +                   
> +FILES_${PN}-spy = "${bindir}/pcsc-spy \
> +                   ${libdir}/libpcscspy*${SOLIBS}"
> +FILES_${PN}-spy-dev = "${libdir}/libpcscspy.la \
> +                       ${libdir}/libpcscspy.so "
>  
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} = "pcscd.socket"
> -RDEPENDS_${PN} +="python"
> +RDEPENDS_${PN}-spy +="python"
> 

