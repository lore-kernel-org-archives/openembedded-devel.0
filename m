Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.498.1615581783786948627
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 12:43:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EQyAlD4q;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so5330976pjb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 12:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KoLdgBOY0u/FUa7pdxSMfYMkL8Gx0x/97DvwiO+YFm8=;
        b=EQyAlD4qpVx8J606qnzWSjPZOpQbx9iQNR4zPVf6x2cNF+wGFHyS0aylzWHUAgRgy5
         7JG0oyOUF+4Qo1aQ/eKXr2u0D0ksOH7w718lJQtBCi9tedOt4FvWRlPQYyZ4hKbuzxxB
         2XoZQGMka3xPAVz7cbGjIUH0vaZSuQ+l7KGbjhxX/0Lu4YVbPj1uPicpTN6ECSN3i3Mw
         BhTiIy9BFtl87CnuKD0UqqdmoKN/0Q9FV23mTUS4xE0DJY4Zf3R1hnVfwK/mWNe49vOS
         TpzsnEXbusnZsZ/oeH/hIeAagc7SuSbHdLUJwFmxmaRE40hh+8ZBsxmuxjI3wAvQStla
         ZE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KoLdgBOY0u/FUa7pdxSMfYMkL8Gx0x/97DvwiO+YFm8=;
        b=Nzf1BVn3JCH+94b5a3mh4LQvHkc/7C4ocCoRK6wOKgXsxIJVK2Hdgm2Vq/FDIXfOGd
         tMiyuw7jk7m6TXEI1gWHmrqaFZlMjmHyPtCJA7LCbPUxepcjcdxlQ5uY0Hvg+GFQ+y98
         OK6fTRFHoYh/hXf4Qv/K2TWT1bipyEw3Rtwn9dKQNjqjal9ZoQPawNIF543RZ6kNSN1o
         YbTsj642O8QrjM/jqU6b4MvRPbPgF8rumfUijTvR8nMKIjouHQWnKPBTHQOwZjG9Ix9a
         LVaxVuxh00Qll+MiOYjTsGSnNBm1At95U9rACpZv6zzWUR80MeDxXQfsrHyq2gjUJYBr
         bECw==
X-Gm-Message-State: AOAM533YkrakOVy65aX10EMfHyMdmydrWVi7/jm5pBx5rXKSzxlXUPNA
	JkKLJaXJbyw9gvNeKOIZKPNonOp8D1Rz8Q==
X-Google-Smtp-Source: ABdhPJzMiJ7+BjGZVawUrycRImWAE2a1VzrnvrcjOQ/k5P7lBR/oQINt9aclk3yn8zqRrR8DD05sOA==
X-Received: by 2002:a17:902:8601:b029:e6:7b87:8add with SMTP id f1-20020a1709028601b02900e67b878addmr317024plo.3.1615581783112;
        Fri, 12 Mar 2021 12:43:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9c7e:15b:d723:6fd9? ([2601:646:9200:a0f0:9c7e:15b:d723:6fd9])
        by smtp.gmail.com with ESMTPSA id d24sm6514302pfn.54.2021.03.12.12.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 12:43:02 -0800 (PST)
Subject: Re: [oe] [PATCH] [OE-devel] [meta-openembedded] quagga: fix do_fetch warning
To: Stefan Ghinea <stefan.ghinea@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210312181432.14324-1-stefan.ghinea@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <2c7758c0-ad20-d5f0-5ef1-f8dd2677b055@gmail.com>
Date: Fri, 12 Mar 2021 12:43:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312181432.14324-1-stefan.ghinea@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/12/21 10:14 AM, Stefan Ghinea wrote:
> WARNING: quagga-1.2.4-r0 do_fetch: Failed to fetch URL
> https://download.savannah.gnu.org/releases/quagga/quagga-1.2.4.tar.gz;,
> attempting MIRRORS if available
> 


thanks for the submission, there is a patch fixing this already staged 
in master-next. please check that out and see if it fixes the issue you 
are seeing

> Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ---
>   meta-networking/recipes-protocols/quagga/quagga.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
> index 6df72427b..6680fec01 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -20,7 +20,7 @@ SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '',
>   # the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
>   RDEPENDS_${PN} += "iproute2"
>   
> -SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga/quagga-${PV}.tar.gz; \
> +SRC_URI = "https://github.com/Quagga/quagga/releases/download/${BP}/${BP}.tar.gz; \
>              file://quagga.init \
>              file://quagga.default \
>              file://watchquagga.init \
> 
> 
> 
> 
> 
