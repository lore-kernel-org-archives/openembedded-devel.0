Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8367FBEB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:54:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k197so12078022pga.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 10:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lOc6FiAQzA0uqMll+GoQWIMcybnkxqLY5wWG6gmuzYY=;
	b=apvvAcqFk0TsRwp9jpJVpGS9xECbrDedAwQUW65HDIy/GE2S4ev3v9D8n+fxz/XNMn
	tVAVh76Ahx2GKJgfW8n5YpWvJScsR8vSHaLK99Q2fe96C4mcL4HsRVKRLZcIKcmz4YrH
	6mTN8X+RpeFc3GXjJHlVNRXnX4eIo7XBMsMr05BO6Iz2XDjLMYvTfkt74rYQIoa41+yO
	xVl6Cu7/k3MP3SpGRimSdshw6qIWsOStsW0atEB2GLD6h8KI6mJxXwLmJjC024H4fIx4
	WzHm6qAqB6Aw45ct9ubfHaC5OpGsqgfbioT+sM6Qg3LXP/IY+sC0A2XQ1ak0B3QIehBa
	HXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=lOc6FiAQzA0uqMll+GoQWIMcybnkxqLY5wWG6gmuzYY=;
	b=MJ/8ZoSll5GbiMZLET/A79Xlo9Ws28IUUs6+BS+t3t4LJPEdwdzd+MWiu3MOsReBnb
	cBYO9Ay1jv+qt5NkaGis7l2A3dwMOy1vkJ9eluM+a0Bc4fjDdY7FGCFmNhxqBysIxoyq
	iOh1+d3CYKp5NSqtYTR81qqmqLjoL5Hk4HdXRY4xiZ8TwCMbSjaSw8LeWonsbcpRhpm0
	GKWOvVe6LbYjO+wqeO9ccLyhB2bcZFcJAohX4L0VVcoVAiQIwJQaEVroYg0Bdo6gyL18
	mr/FSLKHAlHDW+tgT0pNJPeZzqJ0SPkNjFy+wOTFjdjx+vWnRi8JHvc+Vm+wjJwP5mFh
	ooaQ==
X-Gm-Message-State: APjAAAULo6NoW0kkfjCqxeBiNdKsuKkVpFbPbgbN7oL3eKjutGA1CEJw
	wXjK4aEB/WQv4RXXwa71uOk=
X-Google-Smtp-Source: APXvYqyOVxS65DZbaSpQuGAAo6XOcpktKxKg5d0xqdoOPfFNA0qbafre9p4v9mUH4xKk3x2z/0jrdg==
X-Received: by 2002:aa7:928b:: with SMTP id j11mr4382622pfa.176.1579287296128; 
	Fri, 17 Jan 2020 10:54:56 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:6d1f:200c:159c:4a81?
	([2601:646:9200:4e0:6d1f:200c:159c:4a81])
	by smtp.gmail.com with ESMTPSA id
	e6sm31052687pfh.32.2020.01.17.10.54.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 17 Jan 2020 10:54:55 -0800 (PST)
To: Sumit Garg <sumit.garg@linaro.org>,
	openembedded-devel@lists.openembedded.org
References: <1579245551-14394-1-git-send-email-sumit.garg@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <16e95266-ffa0-ec52-0c9b-4eebc33c267c@gmail.com>
Date: Fri, 17 Jan 2020 10:54:54 -0800
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
X-List-Received-Date: Fri, 17 Jan 2020 18:54:55 -0000
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

there is a build error happening in unbound see [1], this is using 
musl/aarch64

[1] https://errors.yoctoproject.org/Errors/Details/306768/


