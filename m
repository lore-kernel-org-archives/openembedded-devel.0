Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5BFF3ED79
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:32:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.270216.1776079911703656040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 04:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MaDeY6da;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso34828885e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776079910; x=1776684710; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qeb3KIZhUA996lU47/YAb2NIe2ljL8vH7TeHqWGL/Yw=;
        b=MaDeY6dawXNECtAfslvP1ze11JNVMiYQGUKuxmAKOSaboxV5HdFZP2KXzPs9QvoUzE
         gA0YH0Dh4lVpy1tiVGsVIhvBZp31bodROeC8ajqFe66fcgl+4fPixHtqxNxt3+nU1apQ
         uQOI1zeRLmBuJOciFPYgoVrK6ZdPAqolzQEEN0RkE5l0nXfc/jOAtWauvFpzYBXM1wkx
         Kg+YsggeqVV60mOab08Wv1EEaptdYtqA5PyAj+gT8wzb6nZ7wDsUyfYpFcAwlDmVZa9p
         iFAZ1CLYaCoFAtdJPtAwuFRc+Mlw3LP6koCnfu0AcK+Xg1EqkoqMllCLPRDk/3vpN5lz
         N3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776079910; x=1776684710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qeb3KIZhUA996lU47/YAb2NIe2ljL8vH7TeHqWGL/Yw=;
        b=DI+zhrKjF877y3kX9F6aKRpnqnJoOfwbTnLoEYDmLiPSf9PHtWhU0WTx2yjrNgJMA3
         zQWOZ8h7NU6HIqeiXZXX7bpfLCRUMcxJXP4VaggIG20btwlYjSoeH6Di36zDmo+XJxg7
         5pR/22srRU4MWh+j45357UAfKOTqU31V6cgwg7eYSZ7mzMHrsfGA/LdzEFPzaiUiKJWA
         J13k9fJZkAV8yCVuNUSyVpXVW9Dul7X5S5I8NhZeVp41hpw5aEI0CkE1NkMeQAUZztcz
         04iBK6tj4ju7UIwij/DzFzNSM1VmhVkCQznNh4v7g9ESNqIaELGw0aqiHeQWE0Z4iVoJ
         r/Bg==
X-Forwarded-Encrypted: i=1; AFNElJ8xB2Z/NIgLmyxIeKQD2OfLcVYFdBnHj+fwTASP8RbLmI95NPxfiroH+/n1VYQ7Eblqfd5PIdqC9AXLqTFQ38shmE0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQlzIQw16ASO/17QIfJKnZ1/SgrnQiOAaFqaMOpoJxz29ipOon
	LSomaYcnyJFb/rm1BDVCXxOEaJWoKTvdqzW5aMKfNEPOBZtdQIny+Wzw
X-Gm-Gg: AeBDies/d33xtu6xaynv1h5juVuq56CBmQA+zQqlcrYyvkO6YFekSxk7J40bljL+JOg
	Ug8ilGhZlyGFNHUKerMQXN8/AJfi6J7gdBWMCsRLCoKv3ICL8wKRZ3XbZas6CttouTKH5EtkSv+
	SPeAo3tnNtaUxjFL+krQUd/9NpUc8IpMd++1JGOWB0j6gjXiQmYdm6DPL7LcGNqDNDNqJJGDq4r
	KKHxbzbtnq5HoC7rqUYi8BZrqpnQbchq0bYLFNQbbQmXiT9qd1y3iSHb0L2V1QMp4gEMeR9Q/Mk
	vtRbBYHs2KJWo4676hPZskQFgXTIDQGe7cZURGsrJWK6uItNjq5Hs172ddaECX/SM0mwjBWwEdr
	D7ruIdExTMURgAxMJR7Kd4plYYZMtuw+CXycQlSXN1HPsoHE6zO+7SdUG0u1GfhQfJK0p5zfOeD
	qfP1L47lpOzpx83264dVf4mwFAV1zu6xs=
X-Received: by 2002:a05:600c:8709:b0:488:945a:ed63 with SMTP id 5b1f17b1804b1-488d6655adfmr179868505e9.0.1776079909818;
        Mon, 13 Apr 2026 04:31:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488df272d55sm64841895e9.15.2026.04.13.04.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:31:48 -0700 (PDT)
Message-ID: <134abd7c-df60-42a4-b836-c7984e62d1e4@gmail.com>
Date: Mon, 13 Apr 2026 13:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [master] [PATCH] augeas: Add CVE_PRODUCT to
 support product name
To: hjadon@cisco.com, openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
References: <20260413112313.1825573-1-hjadon@cisco.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260413112313.1825573-1-hjadon@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126275

On 4/13/26 13:23, Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE
LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Himanshu Jadon <hjadon@cisco.com>
> 
> - Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
> reporting.
> 
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  meta-oe/recipes-support/augeas/augeas_1.12.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
> index 14e818253b..10a3cf5fe1 100644
> --- a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
> +++ b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
> @@ -33,3 +33,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
>  PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
>  
>  EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
> +
> +# Add CVE_PRODUCT to match the NVD CPE product name
> +CVE_PRODUCT = "augeas:augeas"
> 
> 

I can't find any CVE records with a different vendor in the db, and the
CPE dictionary at NVD seems to have only one product with this name...
are there any misreported CVEs or potentially ambiguous CPEs that I have
missed, and that triggered this patch?

