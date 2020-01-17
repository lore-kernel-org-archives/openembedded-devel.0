Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id D83127FBFD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:48:52 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m13so3713804pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 10:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Vc3w+qnYcL1xGRrkRDm+40Hu+kKsN3Qghd3D6KrU+00=;
	b=OW/wwfZYFPxcWdxwMV9ks7zmgMP4vx2F8vm+z9YfAhjv9LqujO/yB5YPwc6cgJdCKc
	mAyRNPoPgbH41BE5XqW+dzcBC5tXuQDQTASZn0sr/32Lf82ecjK0CewD0Xxr/NLSdhpd
	4SP5791/U4WLuKBiDdd0ZLvsL+vqCpHYbFzKipSsaB1edYxhwgVtOcFPY7oThhIK8kRs
	qf0big64epO06phr9Ntbt/ad0Al2Tqy8594vZuAfiBAHtaWO2U1O7eNzl2WX10XIJCjp
	UjMdSfrKpLpWo28oU/co6B4giibwBUCEvPAPEtlWvAhWCuA1kAemYQVjKzU3MoyiCrvI
	Vb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Vc3w+qnYcL1xGRrkRDm+40Hu+kKsN3Qghd3D6KrU+00=;
	b=cpXBnk1Y/svJb21sA6F9PLTlZWms4Hhbx841DKZe4D7WelEFWysx0rvd1BUp1E6qlT
	qGuRfbX98bjDmySHm8HcBPS0zEBxme6c2NkMToA8nchKyH4nLau+qhKIErz4HnNHdh7D
	mPYk/bGI9ZM4GanmLwzlHdztlax20W27Plwz9iy6PaAGvbRYqq+uYFBHQsmmmZRV2KaW
	iExHzTsdkSJYpjCROh4aUHviz3FXq+9JSkiYOYgYLYpqWRkBxNqdx6gTCC/PHEWLznc4
	t9XZbV7K0gACmnwrC3ZAgQbtDjXmZbPchoPH5sl3QAXTHbzZEh3JKiO5T438a93ybyBL
	vqrw==
X-Gm-Message-State: APjAAAV/cXsgP/EfCrtpJDh1qrD3RGAlWKBWoZZxXu/uaRe5TOyX11Ut
	V9dDbuPCBIp/wDbwc249xtc=
X-Google-Smtp-Source: APXvYqymtsVF1UQfmPnVNQdpgk+t+oHUm1vROixASrb5ZMIUV2LEGo9Jc1sj7Uj3IyKX+Nzx7N2RTg==
X-Received: by 2002:a17:902:524:: with SMTP id 33mr482484plf.241.1579286933711;
	Fri, 17 Jan 2020 10:48:53 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:6d1f:200c:159c:4a81?
	([2601:646:9200:4e0:6d1f:200c:159c:4a81])
	by smtp.gmail.com with ESMTPSA id
	x197sm31120740pfc.1.2020.01.17.10.48.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 17 Jan 2020 10:48:52 -0800 (PST)
To: Sumit Garg <sumit.garg@linaro.org>,
	openembedded-devel@lists.openembedded.org
References: <1579245551-14394-1-git-send-email-sumit.garg@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8912342c-0c14-9711-164a-f82a1a0eb85f@gmail.com>
Date: Fri, 17 Jan 2020 10:48:51 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579245551-14394-1-git-send-email-sumit.garg@linaro.org>
Cc: daniel.thompson@linaro.org
Subject: Re: [meta-networking][PATCH] meta-networking: fix recipes build with external tool-set
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
X-List-Received-Date: Fri, 17 Jan 2020 18:48:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/16/20 11:19 PM, Sumit Garg wrote:
> - drbd-utils: fix native tool dependency which was implicitly met while
>    building with source GCC tool-set.
> - unbound: Use HOST_SYS variable instead of TARGET_PREFIX for libtool as
>    TARGET_PREFIX may vary from source GCC tool-set to external GCC
>    tool-set. Also, libtool-cross is installed in recipe sysroot using
>    HOST_SYS variable only.
> 


Please divide this into two patches since they seem to solve different 
problems. Also remove meta-networking from commit summary line and 
replace it with recipe name.

> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>   meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb | 2 ++
>   meta-networking/recipes-support/unbound/unbound_1.9.4.bb  | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
> index 286b0f6..01bb16a 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
> +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
> @@ -23,6 +23,8 @@ UPSTREAM_CHECK_URI = "https://github.com/LINBIT/drbd-utils/releases"
>   SYSTEMD_SERVICE_${PN} = "drbd.service"
>   SYSTEMD_AUTO_ENABLE = "disable"
>   
> +DEPENDS = "flex-native"
> +
>   inherit autotools-brokensep systemd
>   
>   EXTRA_OECONF = " \
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> index 03eb2fa..6200214 100644
> --- a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>   
>   EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
>   		--with-ssl=${STAGING_EXECPREFIXDIR} \
> -		libtool=${TARGET_PREFIX}libtool \
> +		libtool=${HOST_SYS}-libtool \
>   "
>   		
>   
> 


