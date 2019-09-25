Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0438F7E545
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 13:22:06 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id h195so3418850pfe.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7f/hOtKrkv69sSPP+JZpCtTLZEgKNJgH34O1NRIdC9Q=;
	b=sgiSswNwFC4VCbIvfEgvpq3GjhIxihknZb3Y3DO+lg4HcSWjan4uJw8lOIYPDHACUv
	x1B8qqOjt/AbTiDzP11b2i+dbfiaC1gvBrLosB7uVbG/FG3/JdZQaNkzbckPnrXK1iQO
	XGDpet1X3kmLuJxeOnCBDfcp66Y1s73a6KXBObjwsweEcMvxu8pu5jnpGa8dI2ofnilA
	egABOeIPMDGyII/E4r500g5LrLkMtVAuq/7im7rCbtoAObR/SpFEMUmYKGVmdbjnB+el
	cz/lq+hkuiSoN6tlDv+PidhGtzMzmohu57bkgVQGFP1ggjsLRQ5X2plHLqfoFZerAY6z
	UXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=7f/hOtKrkv69sSPP+JZpCtTLZEgKNJgH34O1NRIdC9Q=;
	b=Elogsnu5Ahpxua90Xj/lDnf1KYLOKPGu8n2jy9GSEqZyls3mrx00cFK3yNTjstaR3t
	DWpegKXhthdZAeKoMl4jSCTyhjUSFceTDZOlUc0jEg3wWKYDg6SfTPpqSEoROsC4TVpq
	Y9Ts9PJsS0X4mVHnwFKgn+dQh7nKWwGoXWzqmuJ0cH0VNKmjGTLk75BWP9SaiQjzGyBv
	QT+5BG8PIivJ7iKWLPG/KzY2EU+cCXT1hUn0Oc6OnCaB6dY4Ylnc+7bO/qJi7DgR51mD
	QSKXbSAe2hLI/qG9V4qpcSneeVuLdIMtgkMJjygT2+l1dU7eMjSUuu9JWXYRBQmfVWpl
	uvHw==
X-Gm-Message-State: APjAAAWZL5xb+l5JyqYOD6KDM0AH4VV16gT88lEkd3/BT9nZd62vpq7s
	2u76cOeWJ+OWnl7sE8TZ6pQ3Hy9q/1w=
X-Google-Smtp-Source: APXvYqxMdOqaOt+eXuWRvu40VTIvi1IWY+sx4IL2y2ueWILWZ4Q7KSe3R64oDqxbDdvX0m1Xao4Wcw==
X-Received: by 2002:a63:682:: with SMTP id 124mr8730837pgg.102.1569417727246; 
	Wed, 25 Sep 2019 06:22:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:1c20::cd8f? ([2601:646:8500:1c20::cd8f])
	by smtp.gmail.com with ESMTPSA id
	u3sm5433595pfn.134.2019.09.25.06.22.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 25 Sep 2019 06:22:06 -0700 (PDT)
To: Gaylord Charles <gaylord.charles@veo-labs.com>,
	openembedded-devel@lists.openembedded.org
References: <CAAqXYd28BP4hUHjs215ebh+JOp04hHEaK0jxSmfJYosWZfYYeQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <ee3c08d0-c2bf-70e5-ae8b-3aa29b260ae4@gmail.com>
Date: Wed, 25 Sep 2019 06:22:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAAqXYd28BP4hUHjs215ebh+JOp04hHEaK0jxSmfJYosWZfYYeQ@mail.gmail.com>
Subject: Re: [meta-webserver][PATCH] nginx: fix install paths
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
X-List-Received-Date: Wed, 25 Sep 2019 13:22:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/25/19 2:20 AM, Gaylord Charles wrote:
> Hello,
> 
> This patch fixes Nginx install paths. I tried to build the native variant
> for testing purpose and had errors.
> 
> Regards,
> Gaylord Charles
> 
> From b6dc845b645cc8667b2d89412c292c0801de9270 Mon Sep 17 00:00:00 2001
> From: Gaylord CHARLES <gaylord.charles@veo-labs.com>
> Date: Tue, 24 Sep 2019 18:56:45 +0200
> Subject: [PATCH] nginx: fix install paths
> 
> - Use path variable instead of /usr
> - Replace the absolute path symlink with a relative one
> 
> Signed-off-by: Gaylord CHARLES <gaylord.charles@veo-labs.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index 29e7efc14..1e9d2e1a4 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -92,9 +92,9 @@ do_install () {
>              >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
>      fi
>      install -d ${D}${sysconfdir}/${BPN}
> -    ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> +    ln -snf ../../var/run/${BPN} ${D}${sysconfdir}/${BPN}/run

localstatedir variable could have stayed there, any particular reason to
drop it in favor of hardcoding /var

>      install -d ${D}${NGINX_WWWDIR}
> -    mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
> +    mv ${D}${exec_prefix}/html ${D}${NGINX_WWWDIR}/
>      chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
> 
>      install -d ${D}${sysconfdir}/init.d
> 

