Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.193.1624555494906513141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 10:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EAJ/Orxu;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id c5so5762136pfv.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZqBTn+eyd/gSe78zngHNQgGm3JO2yTobsRPSJyEtQlg=;
        b=EAJ/OrxuF0b86XF+5blaVX58OrgVeTA0KGZwwqpyc0ec8ycWTu5u+Cbjo6eXUnHgjN
         YkYqz9ph542m0o3QumHKDzlAy23wgDGR9i1bU8KTyxNhoBcYlZpbZM8zx77vL0HEZedK
         XA6WWmX3Hyu+IkvrVYRMYQgXLvpMmG+AzlVrJN/2HhmzH9A0gcnEqkyEcfJpfFIMcOMV
         u9kaNWy55SIcJoWGI7SwXKS5NMEq97GvzJhj6Z++RRUQiUMUw9m5bBXv9yLwRH5cPBwl
         wvsx1JD06cP9OdJWMbvWvPoyjrQyw7zRhudwrfyIH+6WVOU+usy6q24xpl9YRMHHiZTt
         lJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZqBTn+eyd/gSe78zngHNQgGm3JO2yTobsRPSJyEtQlg=;
        b=AahTFtmsj7lBI5p/psCmflP3lV2crIc4fKtIb+LNFEOGvsL90ZQsf3xAAnL0vhCMih
         0o7EGofOdSP57FDy0fMnA2sKNPxR52v3TsV82WLZ5MxuucPcDKUuA5rDcQ8aZNWHnr7x
         iPiHGniGzvZKgTwCHRL6p72W+aXYN/m9OvHFWKMmpFTTLQHewV8xOSDdePp66kFJZGt3
         q128ILkhwOYcivU4AAj6osNc/Q5952gCMwO/mebl/98UBUJq9oCWgoq0Ie+Ogp4PKWn/
         Otg5QxRgo/4g/5CqvLY7h021ubaEHvqbjUNmmFIpYCOAQlxxOWKhvj6GC8DnyDopKqy9
         Kc2g==
X-Gm-Message-State: AOAM532dK/shVv5yg9pgfuSHjyHULZGfhgTTyC3Cwkhu+PPwwXYbWTnI
	6h1iDglrZHUftlJqkwEjbOU+oosg3BBdKw==
X-Google-Smtp-Source: ABdhPJzlQJzzJW2ZjYaRyGB6Ll9NLPrHd3GeAjPvCosoSO48e6J2pJmu3V0KcO7g0bLCJzJv/xv0fw==
X-Received: by 2002:a63:f009:: with SMTP id k9mr5690390pgh.356.1624555493841;
        Thu, 24 Jun 2021 10:24:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:89a7:dc85:dd20:c47e? ([2601:646:9200:a0f0:89a7:dc85:dd20:c47e])
        by smtp.gmail.com with ESMTPSA id c22sm3442139pfv.121.2021.06.24.10.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 10:24:53 -0700 (PDT)
Subject: Re: [oe] [PATCH] openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist
To: Akifumi Chikazawa <chikazawa.akifu@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <20210624072457.674372-1-chikazawa.akifu@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5b38d255-32d0-9932-e04b-3c5b3c23bdc0@gmail.com>
Date: Thu, 24 Jun 2021 10:24:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624072457.674372-1-chikazawa.akifu@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Thanks for the patch

On 6/24/21 12:24 AM, Akifumi Chikazawa wrote:
> CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client,
> not for openvpn.
> 
> Signed-off-by: Akifumi Chikazawa <chikazawa.akifu@fujitsu.com>
> ---
>   meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb | 3 +++
>   1 file changed, 3 insertions(+)
> 


we are on 2.5.3 on master, is this meant for master ? if so , please 
rebase it on latest master/master-next and resend, if its meant for a 
release branch then prefix the subject line with [release-name] so 
release maintainer gets notified too.

> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
> index f82107dbe..646f0387a 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
> @@ -17,6 +17,9 @@ UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
>   SRC_URI[md5sum] = "7643f135b49aee49df7d83c1f434dc4e"
>   SRC_URI[sha256sum] = "b9d295988b34e39964ac475b619c3585d667b36c350cf1adec19e5e3c843ba11"
>   
> +# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
> +CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
> +
>   SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
>   SYSTEMD_AUTO_ENABLE = "disable"
>   
> 
> 
> 
> 
> 
