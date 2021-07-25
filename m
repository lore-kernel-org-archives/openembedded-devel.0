Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.23157.1627252827876485807
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jul 2021 15:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tw55L+Me;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id a20so9631591plm.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jul 2021 15:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=50qAQ/fAuWMJNSZmRCYia85wSe66PlcOpYhTX684l5g=;
        b=tw55L+MeZQltKX23vxwStpyfwpfm60MKiUs7YwgZHnb8aoMc3qwDbpMA1ktJdajWKo
         6Gf7BVViDT+cvCzQf7iXOi4uv8aVuEx7iW0/AS99o/BnFtDgopW+M9Qy28XoYGp/DdYJ
         JOCMIShEVmH1LFSE0etE/OvnQksls7yxwfZxLbzXeO0DbCO7V6jY5vLgRTSTmdzoWxJt
         3DbNpti3M47/R3YvGgKPJlSR5THkB1mIMqhpDtOxl2FJ/Uw7rO5L7APOtv13AmGqei/V
         LCRPJnU8i9zGAPFk3gZFqFFl6DOgmBs7TXKEk7FsZpNCeT2X6PfksB5HCo1uzb3p4SYi
         lmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=50qAQ/fAuWMJNSZmRCYia85wSe66PlcOpYhTX684l5g=;
        b=WNKSPvk3usE2+K44l9IPvDnLOFlLsNo67zh3OOzPUvHPfx0aMTWi7JEetp/IvD0xce
         5gLd9XRyrcAUEm0pQz7Z39ak9lkldjBS6cH3u/tidbSTrcZcX5NY4tyPGpyLZWxJiKsN
         ++krKvdLNki7Y+pUrIofYiO7qOPJi3V4sa669lvUs3OgzuNHtYdKIgAGOKxCP0fGg9UQ
         5gJinIztUb5/cHNc0aEFHqk9hRnlPtaewxYZFhti1Gf60M5ISJxyTQt9hwPyF7PUpAa2
         ErvjAuz6VfGjEASbnXRNz5uYBCPj0qo7AaJsoRU0c6Gel+nw8r0TFaxiwxIeQoq6r9wV
         rKCw==
X-Gm-Message-State: AOAM530gOA7S+stMH7KD+5pLOrzXkVP1FetDvddqhbNnY+UCmsOgew8z
	mvm7JZUmWR55nqn2VaGNvH4cYBx7mGPjDg==
X-Google-Smtp-Source: ABdhPJyc5sSsblKlzf/XagXZFR/+Qtt1tccCWCYwNH+v0T5L1iNpdlI29sAce+CKjM+PH0sLZZfs2Q==
X-Received: by 2002:a17:90a:a898:: with SMTP id h24mr23566505pjq.208.1627252827010;
        Sun, 25 Jul 2021 15:40:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26? ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id 33sm33555429pgs.59.2021.07.25.15.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jul 2021 15:40:26 -0700 (PDT)
Subject: Re: [PATCH 0/5] Various fixes for YP compatible
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 openembedded-devel@lists.openembedded.org
References: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <58338c52-d0b4-6342-19de-ddc20c1de83a@gmail.com>
Date: Sun, 25 Jul 2021 15:40:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/20/21 9:30 AM, Nicolas Dechesne wrote:
> There are some pending requests for YP compatible for layers which
> depend on meta-oe, meta-python and meta-networking. In dunfell, these
> layers do not PASS the yocto-check-layer compatibility script. With
> these patches applied, I am able to get this:
>
> INFO: Summary of results:
> INFO:
> INFO: meta-networking ... PASS
> INFO: meta-python ... PASS
> INFO: meta-oe ... PASS
>
> Khem Raj (1):
>   libdevmapper,lvm2: Do not inherit license
I remembered these changes after I sent out the last patch review. They
are queued up in the next batch.

-armin
>
> Nicolas Dechesne (4):
>   python3-markupsafe: remove recipe
>   python3-jinja2: remove recipe
>   python3-{pyyaml,cython,pyparsing}: move from meta-python to meta-oe
>   ostree: Do not check for meta-python
>
>  .../recipes-devtools/python/python-cython.inc |  0
>  .../python/python3-cython_0.29.14.bb          |  0
>  .../python/python3-pyparsing_2.4.6.bb         |  0
>  .../python/python3-pyyaml_5.3.1.bb            |  0
>  .../recipes-extended/ostree/ostree_2020.3.bb  |  2 +-
>  meta-oe/recipes-support/lvm2/lvm2.inc         |  5 +--
>  .../python/python3-jinja2/run-ptest           |  3 --
>  .../python/python3-jinja2_2.11.2.bb           | 43 -------------------
>  .../python/python3-markupsafe/run-ptest       |  3 --
>  .../python/python3-markupsafe_1.1.1.bb        |  2 -
>  10 files changed, 3 insertions(+), 55 deletions(-)
>  rename {meta-python => meta-oe}/recipes-devtools/python/python-cython.inc (100%)
>  rename {meta-python => meta-oe}/recipes-devtools/python/python3-cython_0.29.14.bb (100%)
>  rename {meta-python => meta-oe}/recipes-devtools/python/python3-pyparsing_2.4.6.bb (100%)
>  rename {meta-python => meta-oe}/recipes-devtools/python/python3-pyyaml_5.3.1.bb (100%)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2/run-ptest
>  delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
>  delete mode 100644 meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
>  delete mode 100644 meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
>

