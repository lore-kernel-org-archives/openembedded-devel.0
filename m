Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D19CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:38:32 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.14678.1758627510443922824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qh39wYuo;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fa8d732daso8526275a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758627509; x=1759232309; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmGlRHq1w1bBOinBLORx51YfAWdc70P5d8dplcIR/s0=;
        b=Qh39wYuoE6O/LxjQhgmRgbxZzqurIllItGUDyACX4nPN3nsxzEjhDxJogkA8S8yWuc
         Cyb43F9bd0ZFiPyVFMdn5NtFMjEtPwH+oVlM7aPC5nAPtNfaS8fDk8uPDqtTeeAtIuF7
         cM3xh66BTIV/n/ORiYCJt7khIyQidsVdUqXvN+JOOTLZBIaRdqygjZVDpOM0yxkJVDbV
         jOxVrcPaH+CqBGC4iFXphfgSLPRxPaUCT1X13xKABXcFLxvkLgnXVV0oN/nYkcDUmxLR
         LxMjOzhwhXmtXOsPTaU0UkSxVxfpM8TybJnTMvYZVce5WNT5LiOGdBcvAr0nQPwQiQO9
         K7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758627509; x=1759232309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmGlRHq1w1bBOinBLORx51YfAWdc70P5d8dplcIR/s0=;
        b=HTXXD2xDxvXq40bvacjMVsbAbAYfa6YVhsVq2tJIciYPSFdLyXBUdpfYnh/1nvdAs8
         N+XZfDN1QPOEClDvH676uFKqPywYIH5ypPGZ8MqgwQvI19QS7WS+Y+lFHZ1TvTNa1RB2
         DXKTj2/D3rGM6pIHHITH1bq+Qzq9RqwFaUm3DW/ngVGBcsToUZui3+xxZ4AL9km7Ny+3
         b5MPAvqkCgA/4vijh8ZUib7ZWGTxE4DHpIVRI1sCvxkOHJz10e8yyJ+EqtlTqiMCgAlm
         4fzodrm5OevgUb+8MXOWpj3VBMlCW4vH6DhbdY7jDyj0E/WE6SsA9JNo4mkAPe4eG7he
         o8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWWi6i+l81Ynsstkom8Dznrzq1OK+1qDyi6R4PaOxd7mIueLW4TJi15SYp7HhY+1snmToCmyRfP7DaDZhs/wVoTUzg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwvsjeLRpF7d9ujJOQOU8XhRFP20gqF1f9n+kLyWCGevlvVDTvc
	sWsgocc7oF9XAvIpY85UzosK/U6dO+pPXmDwAIi90CASOtSUm7GH9NQ3
X-Gm-Gg: ASbGncuiFpYX8K5da1fRDbYVpBo3R5ZyPZgBbcvMaBLNlD8IH4rRM1AdF2PmsEhI3P/
	KEsZu4+fbeTQmO+HSKuQgKjbtvtvSEkdwWeowwM3IJqNpEYKKw8S+a7HdEbudxVFbyDX1R2ZMES
	++xXARchjS8Y6Bo3qQxm0F+hEo+DowStkRWriwspqcXo/AEVZPljDE16zYFSQ8KiX8vlS/bwfdo
	bVSnLqyP6c4wKISdnmzwOz/1QBtKbGzeZzb7dzAZQ0DByGw9mH1Cxt6p0NrIhCptixtltkb1wEx
	y5s36blGX16zZQvfPzkUm9SNyDxH7ozV2TsyWL5nLRysgmg+khn1yK21gAqJ+NTGDvRC/KvI6yz
	bDg1w7x34ag53tyAYo7FszIk+ScnKZ/s=
X-Google-Smtp-Source: AGHT+IEjOVTAGdLqxfQ1wTQxhlF3zdXkvSTWWTs9JvHiXQH82NSha/Ch/R6QYOuHzj6nAb0/ENCFig==
X-Received: by 2002:a05:6402:5046:b0:634:3531:d4c7 with SMTP id 4fb4d7f45d1cf-63467820d3cmr2309911a12.26.1758627508653;
        Tue, 23 Sep 2025 04:38:28 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6316acdfe14sm6563659a12.52.2025.09.23.04.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 04:38:28 -0700 (PDT)
Message-ID: <9cde1d49-9d30-4d38-9d5a-1705825bfd44@gmail.com>
Date: Tue, 23 Sep 2025 13:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [OE-core][Scarthgap][PATCH] examples: genl: fix wrong
 attribute size
To: nitin.wankhade333@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Divyanshu.Rathore@bmwtechworks.in, Florian Westphal <fw@strlen.de>
References: <20250923095903.2687733-1-nitin.wankhade333@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250923095903.2687733-1-nitin.wankhade333@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119687

Could you please send this to openembedded-core@lists.openembedded.org
so the correct maintainer will find it?

On 9/23/25 11:59, Nitin Wankhade via lists.openembedded.org wrote:
> This example no longer works on more recent kernels:
>
> genl-family-get
> error: Invalid argument
>
> dmesg says:
> netlink: 'genl-family-get': attribute type 1 has an invalid length.
>
> Fix this and also zero out the reserved field in the genl header,
> while not validated yet for dumps this could change.
>
> Upstream-Status: Backport [https://git.netfilter.org/libmnl/patch/?id=54dea548d796653534645c6e3c8577eaf7d77411]
>
> Reported-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> Signed-off-by: Florian Westphal <fw@strlen.de>
> (cherry picked from commit 54dea548d796653534645c6e3c8577eaf7d77411)
> Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
> ---
>  ...amples-genl-fix-wrong-attribute-size.patch | 44 +++++++++++++++++++
>  meta/recipes-extended/libmnl/libmnl_1.0.5.bb  |  5 ++-
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
>
> diff --git a/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch b/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
> new file mode 100644
> index 0000000000..9e06abb9a4
> --- /dev/null
> +++ b/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
> @@ -0,0 +1,44 @@
> +From 67ad7abf1fe888c650f9e8ed326a499e1456285c Mon Sep 17 00:00:00 2001
> +From: Florian Westphal <fw@strlen.de>
> +Date: Mon, 15 Sep 2025 14:40:30 +0200
> +Subject: [PATCH] examples: genl: fix wrong attribute size
> +
> +This example no longer works on more recent kernels:
> +
> +genl-family-get
> +error: Invalid argument
> +
> +dmesg says:
> +netlink: 'genl-family-get': attribute type 1 has an invalid length.
> +
> +Fix this and also zero out the reserved field in the genl header,
> +while not validated yet for dumps this could change.
> +
> +Upstream-Status: Backport [https://git.netfilter.org/libmnl/patch/?id=54dea548d796653534645c6e3c8577eaf7d77411]
> +
> +Reported-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +Signed-off-by: Florian Westphal <fw@strlen.de>
> +(cherry picked from commit 54dea548d796653534645c6e3c8577eaf7d77411)
> +Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
> +---
> + examples/genl/genl-family-get.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/examples/genl/genl-family-get.c b/examples/genl/genl-family-get.c
> +index ba8de12..0c20067 100644
> +--- a/examples/genl/genl-family-get.c
> ++++ b/examples/genl/genl-family-get.c
> +@@ -199,8 +199,9 @@ int main(int argc, char *argv[])
> + 	genl = mnl_nlmsg_put_extra_header(nlh, sizeof(struct genlmsghdr));
> + 	genl->cmd = CTRL_CMD_GETFAMILY;
> + 	genl->version = 1;
> ++	genl->reserved = 0;
> + 
> +-	mnl_attr_put_u32(nlh, CTRL_ATTR_FAMILY_ID, GENL_ID_CTRL);
> ++	mnl_attr_put_u16(nlh, CTRL_ATTR_FAMILY_ID, GENL_ID_CTRL);
> + 	if (argc >= 2)
> + 		mnl_attr_put_strz(nlh, CTRL_ATTR_FAMILY_NAME, argv[1]);
> + 	else
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
> index 66b30d7f60..d0bf658eef 100644
> --- a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
> +++ b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
> @@ -6,7 +6,10 @@ SECTION = "libs"
>  LICENSE = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  
> -SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2"
> +SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2 \
> +           file://0001-examples-genl-fix-wrong-attribute-size.patch \
> +"
> +
>  SRC_URI[sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525"
>  
>  inherit autotools pkgconfig
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119663): https://lists.openembedded.org/g/openembedded-devel/message/119663
> Mute This Topic: https://lists.openembedded.org/mt/115391501/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


