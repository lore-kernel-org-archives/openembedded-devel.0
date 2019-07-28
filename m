Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3121A7F1F9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 15:32:29 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u14so26746644pfn.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 08:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=+sT50Zf7TFl82B6seNN5PBK6OQPzmxDegYs4gsQGL7E=;
	b=QFeEaugl/46DAH6PGtpcFVs7L0LdTBWjjzibiBqxLW3xnN9hwoMBSddGOoJq6dntW0
	pbViZlKbnarIW9hwDKnn9cL5icIe3UZCz47L/Vp9Oge0i1NBu6NAwQA7lmIjlmSk8cTh
	NBbH8FwQYYYcT49jkUpTindvsCDUaCPVQY3NpSiu/vMww0/52zU+A2ThmEkO1oVGMUPv
	JDbwSCfkrNoEkbD/iY7UXz+RYtCncsMv7fY7yrhXN0/xoXSYHCjZHH36UHsW2RVUGUHE
	ZW9SSnuARtP0u9aXLTVruxaotF25XL/upgmWk8I702faCnBoBI6RJK8NktugaFeRXqHR
	GftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=+sT50Zf7TFl82B6seNN5PBK6OQPzmxDegYs4gsQGL7E=;
	b=c7yRxxrAFKKKgI/bbw9lEs9m0Qp1up/OA8YcZAveKPa83GT8qjVOm8xfoLQSNgZsoV
	YvW7hz/mJz3CYYJ5fm5HkTE2tLWTa//e9nHj98E0dUE6qEB3TdqhTKPZiIV0HUW3JTer
	mM2mGUIcQZWrnAOwKrP+yN+qlQocCABhsVoBNyj7QGxrsNc/rQ5snM0Uar64IDgtbEFn
	T05qa7SjPTqE3xoBQ56osLFv9eQKnmJBXS+gFr6XDlHawfwtB4BLChQZuuHIBdxmVR+V
	VHbgdBgxC6JaOjEZAFMLD7yHPMLhTdmeNaMkonB5TyKfsZSAhELZt9x+RArEEwZih0sB
	WseA==
X-Gm-Message-State: APjAAAVM2h0pgoD3+ggsqrDayXUm47qGs1KiZnI/t2MngaoU0TOY1STv
	OPTQd6XUJOdh/abb6LshXuKPQn07NtM=
X-Google-Smtp-Source: APXvYqy3wchB/7jokfg4AeyA/etYslicUJRM0iAoLjFI5x/gWDTnjYKG+28VaueybMKYPj6jRSK3rQ==
X-Received: by 2002:a17:90a:6546:: with SMTP id
	f6mr61361398pjs.11.1564327949798; 
	Sun, 28 Jul 2019 08:32:29 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::e5a4? ([2601:646:8500:6bc6::e5a4])
	by smtp.gmail.com with ESMTPSA id
	g2sm96399025pfq.88.2019.07.28.08.32.28
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jul 2019 08:32:29 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20190728105220.20595-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <69940a08-dfb2-cd3b-1e31-af3f69aa5591@gmail.com>
Date: Sun, 28 Jul 2019 08:32:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190728105220.20595-1-bunk@stusta.de>
Subject: Re: [meta-gnome][PATCH] gnome-system-monitor: Add DEPENDS on polkit
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
X-List-Received-Date: Sun, 28 Jul 2019 15:32:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/28/19 3:52 AM, Adrian Bunk wrote:
> The build fails without polkit in DISTRO_FEATURES:
> FAILED: org.gnome.gnome-system-monitor.policy
> msgfmt: cannot locate ITS rules for org.gnome.gnome-system-monitor.policy.in
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   .../gnome-system-monitor/gnome-system-monitor_3.32.0.bb          | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
> index 701b0891c..8d39101e9 100644
> --- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
> @@ -10,6 +10,7 @@ DEPENDS = " \
>       gtkmm3 \
>       libgtop \
>       librsvg \
> +    polkit \
>   "
this should be probably guarded with polkit as DISTRO_FEATURE knob as well.
>   
>   GNOMEBASEBUILDCLASS = "meson"

