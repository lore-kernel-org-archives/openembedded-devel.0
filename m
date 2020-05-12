Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.1568.1589318606706339807
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 14:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KyPbtrml;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id k12so23847533wmj.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 14:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nfm1/awf/j2SHmV4uCNLm5O4pmCjlbYLqiX3sA+qg+A=;
        b=KyPbtrmlE32OcsLO+F3G7hEX7Xo1/4morUlfCiNhZ0pvrOTvgDx8PunJQ0ZLvuvp7Z
         WH9gs8U6esBjQ0+wWZbLS80uOtjo0N6DJNyNzV1pLMnbi4c/zMJmJFZ7HNF+i7ZXsqVr
         cu8g0nh6d1+YTpaojW0r5uCMRTZzoSMNMT1sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nfm1/awf/j2SHmV4uCNLm5O4pmCjlbYLqiX3sA+qg+A=;
        b=HW6KI15HFPgbfE3Y6VKo+nwOvGA84LPKW0IgJjhgrGzVu4AczLffgSNRdLDjqpsIDf
         5iO8qsZAmSwNEpAwbIucPdyrn1wakUoUtt+E86Z7i0Z1m0IU83ht6FyUxptdsYz+uGB7
         HwLFGC0ya0mMUuXk3k+hyDjLpO/HIEksZT1IMYMaBh1lCEtoTDuGGjjdB3O3x+DskmbQ
         MGzlMViOzcHEBCfsiKiGeIF0oYKO951S+06i8lRApGJMa3WyjaG4bsJKx0zDp4zdPBqr
         v35KZNqYqPaBFrBe84KU1AsfQHYBT60k7SfbxHYHgUKN8Yjw+TK6I0IJXjmjK0AorEgo
         wWhA==
X-Gm-Message-State: AGi0PubqNxJ6aJ2pb05Fcpg4uoEHmro/npKqlmexBkLtuMjmFv8GTjDF
	RkGNrMtOpkN6H/4JDQv9/8kJWQ==
X-Google-Smtp-Source: APiQypKMik41p+Ib2PLdpvF63yVHTDDs1wFcUZm96gauslrzI8MxVGxRkZXJxczCKtTfuJl9USmjeA==
X-Received: by 2002:a1c:2ed3:: with SMTP id u202mr37189619wmu.77.1589318605305;
        Tue, 12 May 2020 14:23:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w82sm4566619wmg.28.2020.05.12.14.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:23:24 -0700 (PDT)
Message-ID: <717899d43ac1c6d9f7b4f334b705e10b0fbd1ae3.camel@linuxfoundation.org>
Subject: Re: [oe] [meta-python] [PATCH] python3-parse-type: Modify ptest output format
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zangrc <zangrc.fnst@cn.fujitsu.com>, 
	openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Date: Tue, 12 May 2020 22:23:23 +0100
In-Reply-To: <1589293385-96425-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1589293385-96425-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-12 at 22:23 +0800, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python3-parse-type/run-ptest        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-parse-type/run-ptest b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
> index 5cec71169..b63c4de0d 100644
> --- a/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
> +++ b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
>  
> -pytest
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'

Rather than doing this for every python module, it may be an idea to
consider:

a) teaching ptest runner how to handle the alternate output format
(triggered by run-ptest-XXX instead of run-ptest)

or

b) adding a common python script which could avoid all this sed/awk
magic and the extra dependencies

or

c) patch in a parameter to pytest which outputs the data in the format
we need.

Cheers,

Richard

