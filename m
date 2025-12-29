Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03940D3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 12:15:22 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42233.1767010516269852263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 04:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b5pW5d7J;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: skandigraun@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5958931c9c7so10192202e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767010514; x=1767615314; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mt8KFJ3FeAzxBkakcpDpg45+wV+G8dROLZqKHCZl458=;
        b=b5pW5d7JZKQY9WMmsMjP/WH7025L6Q7m1n0aunGMm2J/hQLzGuzExM5uIVkZJ/dVt2
         fCU+57OpGqqDKYOyWxvqEIrTF2wHnJ4iIAgTs/PIsbvzlg8i4BfjCS4lNBkOxGN9bmjA
         OQMN6KOJfBcjmGvZAeiua5KeZyLHulStlzEQm1CAjL0zowQhsPtl37glmtX/rcogJ3e1
         oBV+RJgsHgxvw5Vizs2fxgkfzoVc1ySn8Zj2PQ6o+PEyF7Y0FYNW2ehsWvvzEcT7G43W
         EaBXfOh+xX8bN4jwD8FmSIQC+Ty9peIXEl+1sl6J/ov2x3NQAn9q3iIsztbG1qnWwRr7
         ovjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767010514; x=1767615314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mt8KFJ3FeAzxBkakcpDpg45+wV+G8dROLZqKHCZl458=;
        b=Nuz9uWwkP0oWfziQ3l7QGXMHogPjNCCKoFVUxZQSxanhtuSK1uuf9AkYkIwQj0r4bn
         PMTcHEz0LtohdYoVyhiH3f0ibEGwNOGVOHJl05wOKAvl9aFjsekfr9dGM4sGEXE5Vhdw
         RrAJkB8t34cZAB5DEGmSUR3Er7XhYrauWi2tHfRA3Ikujvw4oGInOPD0StSWUb7xtGFF
         At7L8h0pc//jJMCPMljsUlGGm4uwraQF5atShocz8/WSReIm1tkjJ/71jVa8/8aKyt84
         xUDOSDCmJ8rcZoK8epIoFuM/pRlnt4qPUtMl1fvgK1HOZyYI8nPjllNZnM86Pi2q1/70
         XOyQ==
X-Gm-Message-State: AOJu0YzuCsSnBVgs9zJ/H2YxStleX6rExOW17y1/wQe1XY8wUriD5+XN
	n36s8JuRkJvOhGzfQVto46zDdhoDp4cpYkU5Xy/IxVDjUYcQGudWyktjUANbtg==
X-Gm-Gg: AY/fxX5kl3CHmmvnkn35bpvPa9YPaN8xF//j2ol91CeRR4rgaz+DdgMhCV8OaD4jSzy
	E05W1DVfTZeZCPZOk6bw6HQji3Xsf0Z/CZ4FlCElubbacpWzlJdY0AMuuRxW3jON+D8rCQs3Bky
	BC4M5odlQNYyXc7doMHDLnAcLYwRrxmXX7XCVW6WIWr9QngsA1t0B4vECRZYRzlRIuMWQV5j/SO
	R1QSqQK8xnp7KIPSUR+p6JnUYHbXSPa6t40KR/30htvakIpXxgArR8KhQ4FSbZUHJOsRJnNJZeU
	ui8UGlEdMA6yP4GCnE3tWlFBbajOVFVqXObFmmwIdv0QZ4wTqiW+2FnZTcjrIUE4lskCAYO2lHL
	JJz6oTH/SVOFfeKRBG5FVg6Y0pEdvmzybBNETGcWTd/s/gUWuvLAO1bembC2O4a5p/hRG0dit30
	Bzbz69wIKPOk/DNYrX0otjmFUbRNIczw==
X-Google-Smtp-Source: AGHT+IFEfbFtzEMdp+u5ldqCIyGS+X6g+mhsCkuRm0bBCLQOlkRJFUjYxD2ApYXhq2xJ3OPyRm+Ktg==
X-Received: by 2002:a05:6512:1113:b0:598:eed5:a218 with SMTP id 2adb3069b0e04-59a17d74470mr9915738e87.10.1767010513781;
        Mon, 29 Dec 2025 04:15:13 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5f12sm9105305e87.3.2025.12.29.04.15.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:15:13 -0800 (PST)
Message-ID: <943e5b9e-5c0c-4c68-aa15-7894fff8c1b5@gmail.com>
Date: Mon, 29 Dec 2025 13:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE report - scarthgap - 2025-12-29
To: openembedded-devel@lists.openembedded.org
References: <1885AE2CD342E878.1706869@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1885AE2CD342E878.1706869@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 12:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122979

Just would like to add a quick note about these suddenly disappeared
zabbix CVEs. All of these were LLM-enriched CVEs, and they lack CPE with
both NIST and MITRE. Though they are associated with the correct recipe,
they are not interesting for one reason or another, and they won't
appear in future reports. Below you can find the justification. (Same
goes for Kirkstone)

On 12/29/25 13:05, Gyorgy Sarvari via lists.openembedded.org wrote:
> Removed this week (4): 
>
>  - zabbix: CVE-2025-27232: https://nvd.nist.gov/vuln/detail/CVE-2025-27232

This CVE affects only Zabbix 7.4, as it is confirmed by upstream, and no
other versions. (Kirkstone is using 5.4, Scarthgap is on 6.2)
>  - zabbix: CVE-2025-27234: https://nvd.nist.gov/vuln/detail/CVE-2025-27234

This affects only Zabbix 5.0.

>  - zabbix: CVE-2025-27237: https://nvd.nist.gov/vuln/detail/CVE-2025-27237

This is a Windows only issue.

>  - zabbix: CVE-2025-49642: https://nvd.nist.gov/vuln/detail/CVE-2025-49642
>
This vulnerability is only for AIX.

