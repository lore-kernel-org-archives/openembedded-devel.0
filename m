Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 57B2D78901
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 05:10:18 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id m22-v6so9592066pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 22:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DUGVVtdsy0sD5oLsrrpaAJfu6Sfovzp6Ns0KrPqBKhs=;
	b=AgarTOoQ/blXtG4YBUpfqDvDuA7UAwGU0ITsBDRmpIZzWCQsgQqFuNDfNfNDsrFVlm
	ZGvVsssCio7GwaYZY4DQQsNbLAu1gdtnsKAHFMhxGzAv8DM6lNST+S92lam4b6SYNZSn
	Tpm5WCzQOz8VrurgK+x/i3ZymxaLlV2qNE/hirqa3WbqhbqlhFhSrSa9aB31COeHqvz0
	YTc1h7YUlDtIxPM//hiKnx+ApH26E+nxSzvSPuFaCDuayKdk2gZh7SkX8YBa0wbyfkR/
	WuXuR6y/kdq1+bglAT8tUqu/L3mfiitjJqMBORxNAIdMH7hArE7C8Vxv42xvsakQYR24
	CjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=DUGVVtdsy0sD5oLsrrpaAJfu6Sfovzp6Ns0KrPqBKhs=;
	b=Ns4N6xRsscPWRGNUpmvPr8qvPB0nvByNWJmPiD5dlb1zc+0WCUR3BTT0WH91m3W+EC
	zrkxonXkIh5yk9Zj7XzVNjyki31xM2RQnQoV8cnyC0m3+C9TSBh4YbVnQtR4qTY9ScTH
	sMU6+xC5GN0y221YwS5r/N7Nu8icjH3CNTmCzQ19g1EaGiC0pmST4HZ3WI4ksHQtvwkN
	nQT/8oKwRH20EVtQuxDKu6abAGa2P0ksO2LJSD/Hdq1VhI6tgBaDes0Zp0hBzuBf3JIF
	jqXNsYqR4nAKeL+lEC03y+fdJ9foMssYM9ZX4AyGyySETcBhpI6Jj2Vo1QCx5yxByi66
	dU1g==
X-Gm-Message-State: AElRT7FdF3ijGBJSXt4wQGXCaQAdRZ543yRbmCjz9DR8tQSQrvLnx+Bs
	Yx8ONA0tUFIZkgB8tMauYRc=
X-Google-Smtp-Source: AG47ELuy58w2XRgMBRwtIUPpzzO97UBJXFlb5L6Aw/lbR06yUGBskOvUSOMrt5zbHbtVVZapvt2UXw==
X-Received: by 2002:a17:902:8d92:: with SMTP id
	v18-v6mr11050018plo.21.1521436220424; 
	Sun, 18 Mar 2018 22:10:20 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:88cb:1f0a:76ca:272f])
	by smtp.gmail.com with ESMTPSA id
	l64sm27742391pfi.142.2018.03.18.22.10.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 22:10:19 -0700 (PDT)
To: Parthiban Nallathambi <pn@denx.de>,
	openembedded-devel@lists.openembedded.org
References: <20180318164919.5142-1-pn@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <cf67ffc0-84fc-5ed5-5826-eec9b8bffabe@gmail.com>
Date: Sun, 18 Mar 2018 22:10:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180318164919.5142-1-pn@denx.de>
Cc: barathiraja@gmail.com
Subject: Re: [PATCH] [busybox]: Adjust the correct version according with patches and meta-oe
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
X-List-Received-Date: Mon, 19 Mar 2018 05:10:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/18/18 9:49 AM, Parthiban Nallathambi wrote:
> Patches reffered in bbapend are with 1.24 (based on
> meta-oe 'rocko') version but the bbappend naming is
> with 1.27 (based on meta-oe 'master'.
> 
> Rename the bbappend to point to correct version of
> meta-oe rocko branch.
> 
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> ---
>   recipes-tweaks/busybox/{busybox_1.27%.bbappend => busybox_1.24%.bbappend} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename recipes-tweaks/busybox/{busybox_1.27%.bbappend => busybox_1.24%.bbappend} (100%)
> 
> diff --git a/recipes-tweaks/busybox/busybox_1.27%.bbappend b/recipes-tweaks/busybox/busybox_1.24%.bbappend
> similarity index 100%
> rename from recipes-tweaks/busybox/busybox_1.27%.bbappend
> rename to recipes-tweaks/busybox/busybox_1.24%.bbappend
> 

Please add [meta-openwrt] in subject, and [branchname] as well 
otherwise, I will miss it, best is to send a github pull request. we do 
not have rocko branch for meta-openwrt because we only have it working 
with master and we will create sumo branch once core layers branch out.

