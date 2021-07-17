Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.3719.1626529833433477025
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jul 2021 06:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gq0C1HgQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id cu14so8154155pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jul 2021 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=56fwD31Q5bw0JkBEFGQKHig3QKEUaZSEJk4d38s0hQY=;
        b=gq0C1HgQwlAwS7/fHnEFp86f8TsD/o87pHoeo/SMTxUANbURNfKkDozc5hPRlRBL6M
         oX3v7jkwI+u6fy/cNqjJ1GwDHzAbYGZFXUAZXnnIACXtW5OnE2BZqfUnUTS0a3Y7VErL
         8JS1HE7YzY5xUlBDdrg7GrZPD0oIddnxwbEShdUiCerdEcgbAlISNqr7D0aZ+e3XV6PH
         3l+obCmsxTqFHCXzTSGmDr7cWzZdBiKpV38aUhAJjLxKhLG+10qcRCei+ryAYzZuPTLP
         uKlCrdtkLxv5/eTXc6tJbxI8+qAHi3MYEfb/APO4HIMgUYrPKdJdVZK7fFCaZ1xvEN7J
         pLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=56fwD31Q5bw0JkBEFGQKHig3QKEUaZSEJk4d38s0hQY=;
        b=tIWxl67hrwpYGihzpWrmohDIPeMUSoyiXEn7HjCA9qxpBgAawuJdxX1bTdQMmdhnWX
         +rP72U/FezVkimUympFXP6Z6gJMhObhc9YVzQZ0/fBT1cpC0MRK4BH5xi3EL+19/D8DI
         A2+jriNCEk8s+2OunaeXwcz2vchhbK4wIaU14xf24B7O3mkq+rcdjh3aBuAzlj4ZII7H
         NFD/WA996PV0BElQf2OrWjJMrpE/gGWs4kcMl3UWI04nEjcvT/crJkIw3MGazfOs96bx
         RcR1mqu5tjSoCjh2LuATTEbmtBZCgi395Ai3GvqohPw+E9YuFnL6us+DRKci5HX24xCO
         5Csw==
X-Gm-Message-State: AOAM530wSThtLxmq2o2C/alnNQsmuUwrsz+uMn3UR/hnIqnLE170f3yR
	w/UoIkRheX5o8YwmVwAw1FW3gFLRSWc=
X-Google-Smtp-Source: ABdhPJzSniBpIlcXZKVD6Lq+QaUx5NdL164TTh2Dy5xI8dhPkQLsHj4CIJhFwbKF40nOxi32xOqq+Q==
X-Received: by 2002:a17:90b:3d4:: with SMTP id go20mr20491147pjb.170.1626529832838;
        Sat, 17 Jul 2021 06:50:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e013:b135:6d1b:134? ([2601:202:4180:a5c0:e013:b135:6d1b:134])
        by smtp.gmail.com with ESMTPSA id h14sm14106470pgv.47.2021.07.17.06.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 06:50:32 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/2] redis: fix CVE-2021-29477
To: Tony Tascioglu <tony.tascioglu@windriver.com>,
 openembedded-devel@lists.openembedded.org
Cc: randy.macleod@windriver.com
References: <20210716184733.37797-1-tony.tascioglu@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <106d037b-ffac-beae-e65c-845e99742c86@gmail.com>
Date: Sat, 17 Jul 2021 06:50:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716184733.37797-1-tony.tascioglu@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/16/21 11:47 AM, Tony Tascioglu wrote:
> This patch backports the fix for CVE-2021-29477.
>
> CVE: CVE-2021-29477
> Upstream-Status: Backport
> [https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]

Thanks for the fixes. Any reason why updating to the latest stable 6.2.4
is not an option?
https://raw.githubusercontent.com/redis/redis/6.2/00-RELEASENOTES

- Armin
> An integer overflow bug in Redis version 6.0 or newer could be exploited using
> the STRALGO LCS command to corrupt the heap and potentially result with remote
> code execution.
>
> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> ---
>  .../redis/redis/fix-CVE-2021-29477.patch      | 35 +++++++++++++++++++
>  meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>
> diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
> new file mode 100644
> index 000000000..a5e5a1ba5
> --- /dev/null
> +++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
> @@ -0,0 +1,35 @@
> +From f0c5f920d0f88bd8aa376a2c05af4902789d1ef9 Mon Sep 17 00:00:00 2001
> +From: Oran Agra <oran@redislabs.com>
> +Date: Mon, 3 May 2021 08:32:31 +0300
> +Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-29477)
> +
> +An integer overflow bug in Redis version 6.0 or newer could be exploited using
> +the STRALGO LCS command to corrupt the heap and potentially result with remote
> +code execution.
> +
> +CVE: CVE-2021-29477
> +Upstream-Status: Backport
> +[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]
> +
> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> +
> +---
> + src/t_string.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/t_string.c b/src/t_string.c
> +index 9228c5ed0..db6f7042e 100644
> +--- a/src/t_string.c
> ++++ b/src/t_string.c
> +@@ -805,7 +805,7 @@ void stralgoLCS(client *c) {
> +     /* Setup an uint32_t array to store at LCS[i,j] the length of the
> +      * LCS A0..i-1, B0..j-1. Note that we have a linear array here, so
> +      * we index it as LCS[j+(blen+1)*j] */
> +-    uint32_t *lcs = zmalloc((alen+1)*(blen+1)*sizeof(uint32_t));
> ++    uint32_t *lcs = zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t));
> +     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
> + 
> +     /* Start building the LCS table. */
> +-- 
> +2.32.0
> +
> diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
> index 65b525709..e89bb50f1 100644
> --- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
> +++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
> @@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
>             file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>             file://GNU_SOURCE.patch \
>             file://0006-Define-correct-gregs-for-RISCV32.patch \
> +           file://fix-CVE-2021-29477.patch \
>             "
>  SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
>  
>
> 
>

