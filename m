Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 783C660706
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 00:44:46 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id j4so284828pgi.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 16:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hpEt3ddvY0cFiJCHYX+uYsOP3AHBg7NxhJ8jqVuRRgg=;
	b=uxXoYqiAdj0l2NPGdJb4rnNN1mSZJJGBjAFnTlZSEcG/65qdXZ/x/a9m7mXPNE4HqJ
	ThK2vd8sG0V+9zoA9M1DXJ1qR4b03v6roPTvs/ljVN6igCRcAtnk1S78kfazkpKm3wbj
	FwmyABAZ7kPD1iNqHSkMlvO/HEPz4h04x/vXZM4jOi+4367iInGtzOrp+2+pE1Zi8/+j
	ayU9khlujOttCrpTwVSzt/6cpkJUp9MBG+eKxOnlvdNwWZHzq1uvLi8d66zdVqLOFHpU
	OkOVC3n+y+5N8s0Mxua9ouOhfChr6JpxvE6sd3yDk5eJSmMC4yzKwBGeim8J3d3WmHj8
	Bnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=hpEt3ddvY0cFiJCHYX+uYsOP3AHBg7NxhJ8jqVuRRgg=;
	b=XCGlYpwSccZyp1hvNJwQXhkJmVez87/v5MfOt1FVYuhX9Jnj2pfYlptUfX56JsRNhq
	Vm+U1laJ3P07tal+vMPgFGm4o1VbMbYJTVSqKdOZE2ATFybfzRGdP3sltSan3S/MKdD3
	wHPEcDwq0irQEH1NRtnlEKPAEjnrhyQ9VzHKEFTdma59UiEJKv4ivpePIyIU/ddwJNOp
	WeLKIFlr6jPAjHfT494rZ/oU2xurSPB8OSUjhuURs3s1W+0fvak/UQKsKweGxcZr8lrk
	6b1GVokJvSxs9FD5vC9qvKXLa1jFhyK4rzqRj/QpSEtLy3shKqbTDpuUBiUc03+BCkeo
	KEPw==
X-Gm-Message-State: APjAAAXUFx+7nm1pNmpjTbO0WKPAOhsoJDwUcAZWPexQHo4TfgjF7ZWh
	mGoUimXw4h7eUXMCu1+1luzwRrmmieg=
X-Google-Smtp-Source: APXvYqweWHdK34uuarc33mfLclAZ9Ow71zYcayRwfY7iJlwPaS8DtcU7FrdjEpnKwqBJOZ0j56o/Ug==
X-Received: by 2002:a63:f40d:: with SMTP id g13mr6157262pgi.374.1581468287069; 
	Tue, 11 Feb 2020 16:44:47 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:81b3:3ac9:364:a87?
	([2601:646:9200:4e0:81b3:3ac9:364:a87])
	by smtp.gmail.com with ESMTPSA id h3sm4492416pjs.0.2020.02.11.16.44.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 11 Feb 2020 16:44:46 -0800 (PST)
To: Dan Callaghan <dan.callaghan@opengear.com>,
	openembedded-devel@lists.openembedded.org
References: <20200211060834.19790-1-dan.callaghan@opengear.com>
	<20200211060834.19790-2-dan.callaghan@opengear.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <1d4e0221-9376-b5e5-9a85-9c59559e0c43@gmail.com>
Date: Tue, 11 Feb 2020 16:44:45 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211060834.19790-2-dan.callaghan@opengear.com>
Subject: Re: [meta-networking][PATCH 2/2] quagga: install tmpfiles snippet to /usr/lib/tmpfiles.d
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
X-List-Received-Date: Wed, 12 Feb 2020 00:44:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/10/20 10:08 PM, Dan Callaghan wrote:
> Package-owned tmpfiles snippets belong in /usr/lib/tmpfiles.d,
> /etc/tmpfiles.d is for administrator customisations.
> 
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>   meta-networking/recipes-protocols/quagga/quagga.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
> index 2673a8976..f35b27160 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -116,9 +116,9 @@ do_install () {
>       done
>   
>       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> -        install -d ${D}${sysconfdir}/tmpfiles.d
> +        install -d ${D}${nonarch_libdir}/tmpfiles.d
>           echo "d /run/quagga 0755 quagga quagga -" \
> -        > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> +        > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
>       fi
>   
>       # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
> 

Fails packaging

ERROR: QA Issue: quagga: Files/directories were installed but not 
shipped in any package:
   /usr/lib/tmpfiles.d
   /usr/lib/tmpfiles.d/quagga.conf


http://errors.yoctoproject.org/Errors/Details/390597/

