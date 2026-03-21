Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD77F1094495
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 19:49:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17657.1774122579953168328
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 12:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TjYz4bMI;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so14885435e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 12:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774122578; x=1774727378; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hydQCl+peJuYJ/UpRRjNePjX62Z/mF7a+RuAGpaizgE=;
        b=TjYz4bMIYqPO+nW8Yu3OcSU7+L1ZjBEZSyCntfvSK+EBrmPH6whYUTGpFV/BiFkVRa
         zfnpqMsqZ7V/AG6abpaFunAXgKM5IGBZbB0Q94uwFOjFQPtAy24A5540/7lt975RelgN
         Q4eIbJDui4OJ/dQliMouuT66ODBT+knrigxZ5Z709WXl6Wa1TfIbiRhtxU4WR2r+ziMj
         CkGykbFRTVwmhML6fZRw6TYjeSCNezVjuZr5o+o4KLYMUQQCBxm/06J++cqwIN6NmrG5
         RnNUGxw4gXw1790B07t4RCKyLKOFIKCr9KQzLmZRMTO1iFdocgoCJIOsuH+0EDuJdWOB
         tX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774122578; x=1774727378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hydQCl+peJuYJ/UpRRjNePjX62Z/mF7a+RuAGpaizgE=;
        b=NA1FP24MjV+X9XLj4RgFNPJ6TtGO/a/B8jG5Uab1gEFJnxeMds77Ew8C6GHhEOx4PL
         q4/u2TOVFegSjAcO40C598ZCR1rAJfieZRNAsfnZPaR6HzwJd1v/6dviPDm5uy+LoLWR
         +VrKVa4H8gsIDSuFO4b6cxGIh8GdxHjYItvS+Y9ASH65Zc9YSsdOanWI+OncitAePkgg
         gV8dj1BSHXzxEAPznkRGo6sEAH3HR7W+D/vrM9cGPR4DWVEk8f4ikhUZy4gT7wh2kIma
         z69eTVpZIqXJNGwbZHOZSU5Tc+9bPlKSIt5NMU/Rft7sj4MoRFTZJRUBLthnzJMJ8T8y
         jslA==
X-Gm-Message-State: AOJu0YyLelSpHRLqMUY5KW4V+qFVua8itmhP47iYAqKUeiyPA8VXOF+6
	kTwf/RyB05qg/cBVdCQMXIai+Pxv4dS2rkv+Uzytp1wkXPWkSmslx8kXBEkzvQ==
X-Gm-Gg: ATEYQzyrPX0lHrHVA1IHiGUrLkxJcGr0dj4Y2oPMY8S5ycJF9CTnpPVLOSOByo5WF2y
	InCNrjCRKBHJXjc6d4++HZDwFXxGJ1iybr4mxlOIPzHIdtp3Hcial8SD0If+25E9vP9jj10OpGg
	spW6ylfIgOTxlI1YUpRL1T4OoMHDPOKprNwTf5ssPLrRf0/tH5YEu9GRmrBCcYffcG+lBNsbGY6
	i5QI8olAiLtsdsqV9aekJobhV1MioOfwGAqs8EK4YL2VNnVb4alu+O90bhdPGt0GYLVHW4nq3hI
	qgCL1YpQvtwMfppXH7PmWC3gZkbST0NC2GLm6jCkOdE3s34T0DI+IbMNhN1PBQgp7smNbxr0rwr
	cj4dyZlcWGQHdN8dPyBpTm6TialS4UttENJFMddtp1tcpoRTV0lONKLwpfQOMqZIaxJbMveInTV
	Y6L8t0V/ct1omqsxjiQocYL53Hg0FBzoA=
X-Received: by 2002:a05:600c:1f86:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-486febbc653mr107055495e9.6.1774122578099;
        Sat, 21 Mar 2026 12:49:38 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1db4aesm57353515e9.7.2026.03.21.12.49.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 12:49:36 -0700 (PDT)
Message-ID: <f03624e2-2866-465d-8c27-52fc5cab6d87@gmail.com>
Date: Sat, 21 Mar 2026 20:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libjxl: mark CVE-2025-12474 and
 CVE-2026-1837 patched
To: openembedded-devel@lists.openembedded.org
References: <189EF30D224E8A4D.1870776@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189EF30D224E8A4D.1870776@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 19:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125469

This patch builds on top of a previous, not yet merged patch:
https://lists.openembedded.org/g/openembedded-devel/message/124883
If that patch isn't accepted ultimately, this one should be dropped aswell.


On 3/21/26 20:48, Gyorgy Sarvari via lists.openembedded.org wrote:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
> https://nvd.nist.gov/vuln/detail/CVE-2026-1837
> 
> Both vulnerabilities have been fixed in 0.10.5.
> 
> Relevant commits:
> CVE-2025-12474: https://github.com/libjxl/libjxl/commit/5ce68976a5abfaea7b3086036ab9f6543ab5b29e
> CVE-2026-1837: https://github.com/libjxl/libjxl/commit/36b0cecaa12f643d03c16bd32e5f83775c912b07
> 
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
> index de4aabee22..5a00f8343c 100644
> --- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
> +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.5.bb
> @@ -37,3 +37,6 @@ PACKAGECONFIG[gimp] = "-DJPEGXL_ENABLE_PLUGIN_GIMP210=ON,-DJPEGXL_ENABLE_PLUGIN_
>  PACKAGECONFIG[mime] = "-DJPEGXL_ENABLE_PLUGIN_MIME=ON,-DJPEGXL_ENABLE_PLUGIN_MIME=OFF"
>  
>  FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"
> +
> +CVE_STATUS[CVE-2025-12474] = "fixed-version: fixed in 0.10.5"
> +CVE_STATUS[CVE-2026-1837] = "fixed-version: fixed in 0.10.5"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125468): https://lists.openembedded.org/g/openembedded-devel/message/125468
> Mute This Topic: https://lists.openembedded.org/mt/118439301/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


