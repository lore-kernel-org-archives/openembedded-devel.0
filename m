Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E58FCAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:33:40 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.11670.1758807218593735203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5/AAE9C;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fbc90e6f6so1430750a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758807217; x=1759412017; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=buzeOmS7LZMOmjWUeXd5bL7YREsprY+TtjDzjUYeZiY=;
        b=S5/AAE9CB/Wg1fZWH/ipciJ4r93XPs3oRUHQPRRnyypk2MAHpTVaM+jJQdEeGZ4qQD
         fpwfgjYyOvb+6hGv2ukRxXAW79/rFc4uwg9sBtLlbqEueTMH/2sgJBq78m4qKQObAk8K
         3kEaJepxAblJO33lZ3txAy18DX8jtMsrQjAPA1gDQBsSmgJWZvtY0Kn0sUNREmoZA4qg
         jTKhkDbRxVC8R6Pq/U0JePOTOB8l/xuqE9w+g9+/yBAOGVt740xzdLFXMD3s4Ng5PgSs
         x5m09AYJEaxymQsgu9pO8Ea49rDjfyPShwUAAkWCAI2LGApQ9H+HAZ1F1K48akwc/nun
         6GpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807217; x=1759412017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=buzeOmS7LZMOmjWUeXd5bL7YREsprY+TtjDzjUYeZiY=;
        b=gJYKO7mrFyVI+PxlExNdlSd2dTlVmzIW4cUbwdzotZWQ0bQfUw9cFa8YIrm3WRHJXU
         UYzP1V1YWYtf5WoUiNPkHTKm7boqvHPueeIisxbQnvnyVxRIOoAAgwZjWDsA7g+qJGTB
         W2XJ1eECR9ZSmYQVH1XdHd303NUVbfaZEgy6LeDjCjHQvdsjrIC4X0RkI9tR/nmnt78Z
         Ex1Aw2NdDW0vbBlXYxuy1yCy2LtJ923TQus383C7QlW1mRrWbhX4ejNxqA2OIdymqQQd
         XXEzR914zReRbhz75Wx3XPcR/G+EugQ3CyweKE98Vxn9SpbP3dmZfbzPUT1jB3lEsRjT
         XGhA==
X-Forwarded-Encrypted: i=1; AJvYcCXTqoR0PrH7VEOudNyhNx2hTRybgbHd/pJEPfrdmuXzqZLHjnOVrOKk3iLLK0NeE4PDB6cTaiLCnYMnNv+gg04nRm0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxi63CZFJ6XAGRgOucLK8xnRolfn0+2rq0t2uWiGFsPOprMk1ap
	vYfYzN/7FkknQu18aO22EIny3WpmVS4IEBUcQ/ejMguCS21p+ZD9Vt5H
X-Gm-Gg: ASbGncvcf+2sX2fcBRCk9+uKU+AHE2d43d6y0qJR+oMMIM57HCHGpRipgzvhrsB2ZJ1
	qakXyO+HQ35jsPyxR7CRrMj4uKCjhAoXBhNUly7WrHZ6fODzv2G76RCe7yHM2SXhJ1K+7VPQ5a1
	++8t5jm6iVKFzLXbxZDI1d0UEWvx0XJKFfaSUSxtOenqqfkRs2fWUhYH7+jG3lrX+kBt5J+IXK4
	6Q5EyEtW2ZHbQoGPasK3wTdj+Kh0vV6NK2/ibElgInk6WRQFb1Wwrdu6Dr0uaSPp8J8VJfg504o
	oZ1MiBG8k9IjFKzF4UZKh9siB8H7nDn1TUqR8lIEpBmnd9UybKKK3hYTBGz2k4Yh+6ppvumBacE
	dexQWxIOD49wfnuAaHapqkkiAt5fWr1YAZA4C12w5uw==
X-Google-Smtp-Source: AGHT+IFmzHioU3DHljbqdwKzCwzHs1SrsyfnlPHueZhO7xkf/68IelMKJCOEoFD/9woroVSm1D9UdQ==
X-Received: by 2002:aa7:d1d9:0:b0:632:67ba:f9b3 with SMTP id 4fb4d7f45d1cf-6349f9edac2mr2173135a12.11.1758807216612;
        Thu, 25 Sep 2025 06:33:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm1250532a12.24.2025.09.25.06.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:33:35 -0700 (PDT)
Message-ID: <2971ce3b-81fb-465f-bf32-b38053e98eb3@gmail.com>
Date: Thu, 25 Sep 2025 15:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH v2 3/3] lsscsi: upgrade to version
 0.32
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250925062111.240262-1-ankur.tyagi85@gmail.com>
 <20250925062111.240262-4-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250925062111.240262-4-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 13:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119882

I dunno. This recipe is a bit of a mess, at least regarding the
application's versioning habits and the recipe's history due to this.

The changelog definitely looks suitable enough. And interestingly
Kirkstone has a newer version - which has been reverted later in master
(which revert was later reverted once again, to have the latest
version), and that old version got into Walnascar.

But here is the real problem: this version goes backwards[1] (at least
as far as Bitbake is concerned) - and I have seen people being unhappy
about this. I wonder if maybe in master it would be better to give this
recipe a PE...

[1]:
https://gist.github.com/OldManYellsAtCloud/f3e26c13bd68118f8e586803e9b3a8d4
- this was copied from buildhistory.bbclass and from bb.utils module

On 9/25/25 08:21, Ankur Tyagi via lists.openembedded.org wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Upstream changelogs:
> https://sg.danny.cz/scsi/lsscsi.ChangeLog
>
> Changes in this commit are referenced from 51e410a84eaa9742ea8881435925a242fb5529cd.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 51e410a84eaa9742ea8881435925a242fb5529cd)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb}    | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb} (63%)
>
> diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
> similarity index 63%
> rename from meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
> rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
> index 63b94e9d6e..127be8fbfa 100644
> --- a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
> +++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
> @@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>  
>  SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
>  
> -SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15"
> +SRC_URI[sha256sum] = "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1"
>  
>  inherit autotools
>  
> -S = "${WORKDIR}/lsscsi-${PV}r154"
> +S = "${WORKDIR}/lsscsi-${PV}"
> +
> +UPSTREAM_CHECK_REGEX = "lsscsi-(?P<pver>\d+(\.\d+)+)\.tgz"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119852): https://lists.openembedded.org/g/openembedded-devel/message/119852
> Mute This Topic: https://lists.openembedded.org/mt/115426052/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


