Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4848BF43690
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 11:07:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42359.1776424011745041523
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 04:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sOzLDDd1;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso14649695e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 04:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776424010; x=1777028810; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0syGw6DNys9qPUxVui8NICiqaXSUmtV9iGKr211Ktc4=;
        b=sOzLDDd1HjtTEi9CAPw/NOjb6b8ezTIJOySkK4hA8j2eO3JNu3Pe1lKCfvqi+4EWjs
         f7G/X8aGy3ojgcm85C8OXW/oOyu1JHeUjkcjO1fvkJeeREQxQEzTYevB/sGUXSF63YPH
         +8RTcOy6J+8YcrYN2+bwuextaPqe8lAlj4vHvhfn8eIBmc5rYOiIUIzSvBq8arPQzy4E
         +oRC/oZpuIaI3OJ/Dx+m0ZpGSQm8P6gMvc/YaCiyGwW7aa5GB4UNifeT5vk1HbS9o0Xm
         EpHmTuyD4j1+YvYjaMEW8/0J12dEVDqsHIewJtw3WfECCPlF1jRcPryvlekB/udqjOp/
         ng2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776424010; x=1777028810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0syGw6DNys9qPUxVui8NICiqaXSUmtV9iGKr211Ktc4=;
        b=XcoZLuUFLd4P18EOnEIZX0euhl4ZGRVSTKAD2qxCII9z4pYOpCDxTsdlBxbInYHwMn
         Y/XsfVKAImrSrJoaCUuhSO9U0EWQxb08cctxHAQhQzYE+aC1XvJvTflaoihQGBu9MX8z
         fvIudc6yZgWUWsviG64g2muA/wUv7RaWJ7d9+PuridFZYdcLcDRobOt4laSat4n52aKE
         lZiH6Rt/XnfOJgPqY6xkf3A/WYR0IVmduL9P64ysg6ilfJ1BTUPeBWW8k6PfxzTGMJO2
         A+TXigYHXOoqirSdgX1asmRVFcFJM4MrOCNg6ziDknVHcB92qDANPdyhN7pBb5jL5wOK
         QoIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Vzk4FidB5Bvgh4ExcbFloyzXfjWM3Cz+0IJwMT4xxyKoIqCFoToUD88fDdMjBFUAtSzJKvdSpfBCHtwqqzXXt7Qg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YweHM3puEE0C7DUBMFdrzQSHOVmCjWyD/G6alcH+LGeQLc0aire
	u3TdQ6NsZfNbKDkLJ4G7E3BXgWU2m6KmnnojEYMFElRHbwpeUWkU5i7PEC6swg==
X-Gm-Gg: AeBDieudZnkHLeWXgm5kEGjRQFPU6qqoBGAmam1GlYSk/N0+PvziVYWDt43XaOSG9b9
	nNAgF2szoeHDxidwuMQXeygookcFeIuQ5owkEJoQizPqA11j0/FZ9jz7qRQp6IjVy+UYXJc1w1J
	HmySSJ0cBXNrbdF8aPbp2lQLrxf8LihnBnGWbLIYEpB/mP5K18JUfCMVXZR83Rvk2EOeDajSxAQ
	tOj4rF6ZUo6dg79n6coA/0neBA81N4pZRdCOavkQoSGPjLNOpg1HwossoIxNdPgIZP6o5Qos6PA
	Anl8DmEkrbXCnF53nnnpuh/ZUJpWzB3ZwTg+nJG9BPMuNEe3xjCvlDeCOjAquqvz3Y7OMvJJG3B
	rzeJWH8KAZ9JTujxlmvMr42RnSxWD+ABOoaP8pgH6Rq6nCimGpWb4hnzVyooeERNNefsxXe1WWG
	+Z0nyDaouW2cjAbf4t57V0hZvom94Ybl61YuxSXeIjWw==
X-Received: by 2002:a05:600c:c167:b0:485:3428:774c with SMTP id 5b1f17b1804b1-488fb889336mr31546835e9.4.1776424009721;
        Fri, 17 Apr 2026 04:06:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c01cfsm38943575e9.10.2026.04.17.04.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 04:06:49 -0700 (PDT)
Message-ID: <c42bb2c3-9def-4677-bfa3-acf5b65a915d@gmail.com>
Date: Fri, 17 Apr 2026 13:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][kirkstone][PATCH] strongswan: Fix
 CVE-2026-25075
To: Vijay Anusuri <vanusuri@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20260402035053.69593-1-vanusuri@mvista.com>
 <CANQUz19-1_+PGS_yyq+jQaiBAh6Mhi0+Zc7rD3Qte31tMCwv6g@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANQUz19-1_+PGS_yyq+jQaiBAh6Mhi0+Zc7rD3Qte31tMCwv6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 11:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126435

On 4/17/26 13:04, Vijay Anusuri wrote:
> Hi Team,
> 
> Any update on this ?
> 

It's in my staging repo:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/kirkstone-nut&id=e2988d39a10153b78906c103d84f402acf176f86

Planned to be included in the last PR.


> Thanks & Regards,
> Vijay
> 
> On Thu, Apr 2, 2026 at 9:21 AM <vanusuri@mvista.com
> <mailto:vanusuri@mvista.com>> wrote:
> 
>     From: Vijay Anusuri <vanusuri@mvista.com <mailto:vanusuri@mvista.com>>
> 
>     Pick patch according to [1]
> 
>     [1] https://download.strongswan.org/security/CVE-2026-25075/
>     <https://download.strongswan.org/security/CVE-2026-25075/>
>     [2] https://www.strongswan.org/blog/2026/03/23/strongswan-
>     vulnerability-(cve-2026-25075).html <https://www.strongswan.org/
>     blog/2026/03/23/strongswan-vulnerability-(cve-2026-25075).html>
> 
>     Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
>     <mailto:vanusuri@mvista.com>>
>     ---
>      .../strongswan/files/CVE-2026-25075.patch     | 50 +++++++++++++++++++
>      .../strongswan/strongswan_5.9.13.bb <http://strongswan_5.9.13.bb> 
>              |  1 +
>      2 files changed, 51 insertions(+)
>      create mode 100644 meta-networking/recipes-support/strongswan/
>     files/CVE-2026-25075.patch
> 
>     diff --git a/meta-networking/recipes-support/strongswan/files/
>     CVE-2026-25075.patch b/meta-networking/recipes-support/strongswan/
>     files/CVE-2026-25075.patch
>     new file mode 100644
>     index 0000000000..3b38a099a2
>     --- /dev/null
>     +++ b/meta-networking/recipes-support/strongswan/files/
>     CVE-2026-25075.patch
>     @@ -0,0 +1,50 @@
>     +From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00 2001
>     +From: Tobias Brunner <tobias@strongswan.org
>     <mailto:tobias@strongswan.org>>
>     +Date: Thu, 5 Mar 2026 12:43:12 +0100
>     +Subject: [PATCH] eap-ttls: Prevent crash if AVP length header field
>     is invalid
>     +
>     +The length field in the AVP header includes the 8 bytes of the header
>     +itself.  Not checking for that and later subtracting it causes an
>     +integer underflow that usually triggers a crash when accessing a
>     +NULL pointer that resulted from the failing chunk_alloc() call because
>     +of the high value.
>     +
>     +The attempted allocations for invalid lengths (0-7) are 0xfffffff8,
>     +0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn't result
>     +in a buffer overflow even if the allocation succeeds.
>     +
>     +Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
>     +Fixes: CVE-2026-25075
>     +
>     +Upstream-Status: Backport [https://download.strongswan.org/
>     security/CVE-2026-25075/
>     strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch <https://
>     download.strongswan.org/security/CVE-2026-25075/
>     strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch>]
>     +CVE: CVE-2026-25075
>     +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
>     <mailto:vanusuri@mvista.com>>
>     +---
>     + src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
>     + 1 file changed, 2 insertions(+), 2 deletions(-)
>     +
>     +diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/
>     libcharon/plugins/eap_ttls/eap_ttls_avp.c
>     +index 06389f7..2983bd0 100644
>     +--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
>     ++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
>     +@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
>     +               chunk_free(&this->input);
>     +               this->inpos = 0;
>     +
>     +-              if (!success)
>     ++              if (!success || avp_len < AVP_HEADER_LEN)
>     +               {
>     +                       DBG1(DBG_IKE, "received invalid AVP header");
>     +                       return FAILED;
>     +@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
>     +                       return FAILED;
>     +               }
>     +               this->process_header = FALSE;
>     +-              this->data_len = avp_len - 8;
>     ++              this->data_len = avp_len - AVP_HEADER_LEN;
>     +               this->input = chunk_alloc(this->data_len + (4 -
>     avp_len) % 4);
>     +       }
>     +
>     +--
>     +2.25.1
>     +
>     diff --git a/meta-networking/recipes-support/strongswan/
>     strongswan_5.9.13.bb <http://strongswan_5.9.13.bb> b/meta-
>     networking/recipes-support/strongswan/strongswan_5.9.13.bb <http://
>     strongswan_5.9.13.bb>
>     index 4c10636871..6a2b219275 100644
>     --- a/meta-networking/recipes-support/strongswan/
>     strongswan_5.9.13.bb <http://strongswan_5.9.13.bb>
>     +++ b/meta-networking/recipes-support/strongswan/
>     strongswan_5.9.13.bb <http://strongswan_5.9.13.bb>
>     @@ -10,6 +10,7 @@ DEPENDS:append =
>     "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
> 
>      SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2
>     <https://download.strongswan.org/strongswan-$%7BPV%7D.tar.bz2> \
>                 file://CVE-2025-62291.patch \
>     +           file://CVE-2026-25075.patch \
>                 "
> 
>      SRC_URI[sha256sum] =
>     "56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55"
>     -- 
>     2.25.1
> 


