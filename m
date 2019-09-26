Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id EB2D07CDE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 18:33:58 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q7so1981187pgi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 11:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TilZvu42KHu7ucsfc7w7Qkclg/rdoea5/S8NITWpjUg=;
	b=WuK1XmS4J4Zg3IEqlOlFIuseayvUILKR5h0TuK2T6uWnqPVd3QIsZxMnHMXa8GzPKQ
	P0jrWjB8D2jqvi1s8cqer3H21h8c95sOjT9Ns3dQ292zSXdiWCUovp68mhqZ417623i1
	Gs6CZBuX7uhWbulk0uhze9I2zE3JWSMQgLIurrwfx+fCoP9ZqRHDgYoCvvaSAzxvRFUN
	c7X3//tMva98VZ4sIND+OZJkwA797JgmCVzwB3vn+8KjdO4k7OOm+CUe8q29ZmR8CIuE
	rLnsKGkgNX2MfTL3D0qah8x90k6AwZS/C+BMs26ias3t39qNsurpXvPxlSZf4c9e3AAs
	uI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TilZvu42KHu7ucsfc7w7Qkclg/rdoea5/S8NITWpjUg=;
	b=Dje/ShtPFUSHVo7iW2+cc38EixmBFJupsHA6OTf7J174GKZOxEQdl43h9thqnO+00q
	m0mpeA8h3gjg4J/C2iD3KLsFBAN308GPVt3DGzZ/lOpbwuI234nq5/QPptLqYDn9EyZM
	Vk/yQ5+cLQOXkjx7m6GQ9RKPI+MpAUDc/yyKWh93c04qVDkrJJr8OPzx96LLHV0uZaPx
	kYenSmri4eXgvDCiszjN88eMgdEh310SH2w73ZRETr71xNQrSyOfK++h7G7HluoMm8pE
	tjQ+qtcducoc6Sl+/P+QIjrBnGWyYl70ZtYJWhJE+7L5prwNnStxauP2aSIAZoqifHN6
	HY0g==
X-Gm-Message-State: APjAAAW3YmGBPL9SBycKWccj+LfA9IPXNOXyYKWX95Q19mQrLzzjc+Kk
	dqVYwi9+nLLJuc6f/OLSbVIa7M9OHSo=
X-Google-Smtp-Source: APXvYqzpOHwp/M6Hr7M7W7hZ2iA0DfbT9wfDWL0p19BQQQuF4oe1Vqqn+EchSAfHj7TsimmweoAH2g==
X-Received: by 2002:a17:90a:c582:: with SMTP id
	l2mr5238914pjt.62.1569522839429; 
	Thu, 26 Sep 2019 11:33:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:1c20:1987:2136:d2a9:51b6?
	([2601:646:8500:1c20:1987:2136:d2a9:51b6])
	by smtp.gmail.com with ESMTPSA id
	j128sm5512218pfg.51.2019.09.26.11.33.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 26 Sep 2019 11:33:58 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20190926162655.375600-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8371ac14-5ef6-a385-f324-6ea84648257d@gmail.com>
Date: Thu, 26 Sep 2019 11:33:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
	Gecko/20100101 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190926162655.375600-1-Martin.Jansa@gmail.com>
Subject: Re: [meta-networking][PATCH 1/2] spice: append -Wno-error=address-of-packed-member only for target
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
X-List-Received-Date: Thu, 26 Sep 2019 18:33:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/26/19 9:26 AM, Martin Jansa wrote:
> * with older native gcc on host this will break spice-native with:
>    cc1: error: -Werror=address-of-packed-member: no option -Waddress-of-packed-member
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta-networking/recipes-support/spice/spice_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
> index 30e939ac07..2829a59d15 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -37,7 +37,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
>   export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
>   export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
>   
> -CFLAGS_append = " -Wno-error=address-of-packed-member"
> +CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"
>   

There are hosts with newer version of gcc and I think they will start to 
fail. So I guess we could try to use ${@oe.utils.host_gcc_version(d, 
taskcontextonly=True)} to deduce host gcc version, another option is to
add something like --disable-werror and move on.

>   PACKAGECONFIG_class-nativesdk = ""
>   PACKAGECONFIG ?= "sasl"
> 


