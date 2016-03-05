Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4362F601A5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Mar 2016 07:30:48 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so46425480wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2016 23:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=akEbPDGujGA8+U1uJsqg5nlnnU+KX4ndrHA+jD4BkN0=;
	b=y83xZU8CIfHYAEt4ULY0L9/uF2rA1O/BahWsooWN//VR7QdbnUWTx3aSZJrWwmBrUK
	q4o8gUcMaXZiIqUmsuBmMuVcwiD8Ug3eALmAr1+TiBMYI7cFwdfMcCHjITQwUDLCOH0Y
	jY5yzC2yrWm93IJbVuNoIbwse5W4vuptPTBpeLbEePVzpvASN3Qkme3kzRyztXLzx+bM
	QpnL8D3zIJiQxRASiOTlVK6QteGFDnpDbHrE6w14arJ+tiYStYZ0Y2zH4anRzVKbODPV
	ZAmMEkWiD41NSYPJZdZOIM5Pnoy/FQUKUXUSEvGc0NJHOZ/YhcywALdIU38VcydtiPZl
	9ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=akEbPDGujGA8+U1uJsqg5nlnnU+KX4ndrHA+jD4BkN0=;
	b=mU53hCExb/xk/UftT4g3WJrF4x12mH7lLKfd59Wu3VNgG+UwVeIMHYvVw0RRxgHFhe
	GNB+ej3srmUpPFmRl8G/wQIJYQXTvBT1V5+Zarw7/To1f+rlIm+X3DCVkgfXjjtWTC3H
	hO7qqDkOACdmHdyPqht1hdkguN9KykZ/G1TQwdb5kgITOqNaZmx76NmAGUSwAFF7OwBL
	Cl3SSZ8W1YWqYFEN+mmlvZ2zke6iyhtj2NQ9NQ5mVMgTRUuDNY8LkIoM8ABe3ziFMCkF
	h2n9+QqZooQAYM2OEg92GGJ58zFQWAjfyQS9yNfTjBs944y0p8sFihP2Nyq4PMx7HMeE
	BiXg==
X-Gm-Message-State: AD7BkJJpCwE/aqoyrPTh3D3qg1xnIgzJz1oFUiynSTUveN4r9RkkAiwu3E4aeehxYpQtWMlEBGsFKtokp+dUww==
MIME-Version: 1.0
X-Received: by 10.28.158.198 with SMTP id h189mr2502987wme.74.1457163049317;
	Fri, 04 Mar 2016 23:30:49 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Fri, 4 Mar 2016 23:30:49 -0800 (PST)
In-Reply-To: <1457138269-32121-1-git-send-email-derek@asterius.io>
References: <1457138269-32121-1-git-send-email-derek@asterius.io>
Date: Sat, 5 Mar 2016 08:30:49 +0100
Message-ID: <CA+chaQe98+Mr6ra_EsJ2ziY90Fn4fuQ-nCZgon_jj_QyR-+JwA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-webserver][PATCH] nginx: update to 1.9.12
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
X-List-Received-Date: Sat, 05 Mar 2016 07:30:49 -0000
Content-Type: text/plain; charset=UTF-8

Missing SOB line

On Sat, Mar 5, 2016 at 1:37 AM, Derek Straka <derek@asterius.io> wrote:

> ---
>  .../recipes-httpd/nginx/{nginx_1.9.11.bb => nginx_1.9.12.bb}          |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.11.bb =>
> nginx_1.9.12.bb} (96%)
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
> b/meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
> similarity index 96%
> rename from meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
> rename to meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
> index 8b60e53..d18f82b 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
> @@ -19,8 +19,8 @@ SRC_URI = " \
>         file://nginx-volatile.conf \
>         file://nginx.service \
>  "
> -SRC_URI[md5sum] = "76eb5853a1190e0cfc691aa21c545de3"
> -SRC_URI[sha256sum] =
> "6a5c72f4afaf57a6db064bba0965d72335f127481c5d4e64ee8714e7b368a51f"
> +SRC_URI[md5sum] = "0afe4a7e589a0de43b7b54aa055a4351"
> +SRC_URI[sha256sum] =
> "1af2eb956910ed4b11aaf525a81bc37e135907e7127948f9179f5410337da042"
>
>  inherit update-rc.d useradd
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

