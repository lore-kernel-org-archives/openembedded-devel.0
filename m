Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12166.1795765541777784956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gEiuUUK1;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so54693835e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795765540; x=1796370340; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gdFAtfGRDYMFYLn2945GDR+j4m3jJcNekz0isDy3X6k=;
        b=gEiuUUK1ajHshIsdSBJgqWatIIko0Erq/83mxiO28CMIWxMM6D3tb7jWxDMj1ScCGc
         VzCfXAfTQn3rXAr2f0+rehw+3xu3CBk53tSFytjaeQyw8INtoRtBDScJ+suIvQ7HdyRh
         KWSS8iMeclbsJ8LKmuW+iDMeJFHAPnWW9Ps0OZkP95wtukKqhnRIfkSW19/uHwKPJssl
         Js7YrNusCvKSelBTRMC4/xg1WbN/AQQ9Xr2t3q/lNfoFM2269ynmzVOcOKl6Cu5M50pT
         pzcGWgzX2RPOX1wBiMrK88y5FgBDweSifGJhaNghXmGgy6T8xJ43SyJBHCMzXe8DdnHT
         O0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765540; x=1796370340;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdFAtfGRDYMFYLn2945GDR+j4m3jJcNekz0isDy3X6k=;
        b=yxe6MXYITR4BEMncP3Wt469+fUC7X5uB3yMlFHl9PtrwaUEzXnl9i3agKxJG7HVAYT
         0bHTAL5zohbR/5oYz/n6BXrP7E4kOMpfK1CNCldf0FfpRbRjErSV8k8sk8fLLopUae00
         Uf9H8AYK2hTNzpvhYoMS6d0NdqcbK8Z6oL0io7gydgTa/MmFCPJI6KvezBvyCH0ZrmC+
         hplqUl5Q9dn6o4Pgwife5e4M/8cbkX9QlZBWwQFqy5MlcECrUI5CDOnZ/AycN9dq1cmX
         7KRhJjCVqlloeut/8hAF2ZfkKthlAZviET1EEVnuHZDsUjqaPV1MkMGHgVn23ENiMDkM
         qiqg==
X-Forwarded-Encrypted: i=1; AL+hErEm9qPuBAlm0X7ZpKAGXCBiNA/ufJ7xRrU3gqBZOAKR8WhtOdYyeF0Z8VhLbkX0+wd2RmfdcCZJdoiUCVkORlCipZw=@lists.openembedded.org
X-Gm-Message-State: APuU4Z9gVNfLFC1hs15R0PuSz915AKZXwdWjly+kfP6zpgYePmuJZjUK
	v2OwxLx7nxOnSqhwEd7Rd6CnsBiNfEmWBHbU61zw84m2SE1nDsAdAYDqN5+YN1G9CDE=
X-Gm-Gg: AZFdTZfH2VhtxWWDNtLyllDAgnX7YDGBAco40FHmIhfdWz6mQzSxQofwaBdBos1SDpo
	jgW02hKDbKGDK1YzK30sAdZJzhEW/j/gQcNA88lcK+uFqP600kTLp9HA60JMxj1MUY1yeZdexu0
	2m0FiEmETLZPtFcd83VjK6QAivVjbkFsn3DZbRAo0GHZUyCXxcv1Q6TKV6rZeHrJKAA8GCKgW9k
	K+1uVZo+5Jik3GqTBOQ4VOS/TCJei5UTWXm4Jnu51RJHvvFqYW+AE3VIyO52CrPqsAcfZqFwR5n
	wxDBLlJUvYNhoF0i+M80PRAmS2/OOMMLyYOAwbSPxzRBFaInbQV4Os/2zzr4knKo2kR8aKfGMkA
	i/a1cpX0AShL++KkMXLmGInUA8vph6UVO371Gnk/2QBJ24gYZXFe3J4HV5pmWHhler5howbftAI
	igxwbpwvsa0M2Jhvk6waKxljLQMb0clI+OdgHNCL/5NrlBrqEyKnD91/FvWGbljUGzlS5r4/ZdG
	WcESnUlR1hIkkW6/dNCzkAaUOjW3ojTlmERrFN0IbQ8aeTovS43XuR8zW6x39QQR/arUhdmYtNd
	oBrJMqUAtoDMWjoUDo4NSFmuxy02W+Hrg8rm1bXONGSNCsnuVYed278MCMD7Kw6MdXw9ZeQu2Fj
	xQpS4dYbRwQRGZz414Q==
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr570551265e9.12.1795765539839;
        Thu, 26 Nov 2026 23:45:39 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa006c84c8cd12b797e5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:6c84:c8cd:12b7:97e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm816169875e9.6.2026.11.26.23.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 23:45:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 08:45:39 +0100
Message-Id: <DN5TR7XMD64W.1WVHLUD7CNKRM@smile.fr>
Subject: Re: [oe] [meta-oe][PATCH 00/69] Upstream version check fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133372

On Fri Nov 27, 2026 at 1:33 AM CET, Khem Raj via openembedded-devel wrote:
> Fix or add UPSTREAM_CHECK_* settings so devtool check-upgrade-status
> reports real versions: anchor tag regexes to release tags, restrict
> series where newer major versions are separate products or rewrites,
> point checks at the current hosting after moves, and mark the few
> recipes whose upstream can no longer be checked as unknown.

Hello Khem,

Once these series merge, do you want to run the auh-meta-oe build?
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/47

With all those fixed, output should be interesting.

Regards,
--=20
Yoann Congal
Smile ECS

