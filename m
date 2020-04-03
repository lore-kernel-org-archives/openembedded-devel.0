Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web12.1263.1585935434243684167
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 10:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j9XiGNOD;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id x16so8043796ilp.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ChAvfZ0IJ5X8XStmNIiSQdLZpvcnn+9PsbbcSA/E2ao=;
        b=j9XiGNODs0W/KCm2U6IYUQLe0CabXkODLTw0mAq20EBc7QG5hlpv0UNRkTo/mO3+IE
         a7E8vvGFq91aD7PcLkcorkQ07IyEmdQQn1YgIXab/I9PZ7k38d8jPiu5QmYQVESCgKJs
         koy8Xft2AAxDoUvBCBUWZPc5AHX15W00nl1R/XXFEWP/HmCRCL62LCa3yQJr4RhSXaU3
         64gaM0Xl9Sf8zGIuw4W24i+L8qj3JMC8bAkBgsiStStD89A9FuIn8OQmsZIDT8WJtqIA
         adyC/FbeMF9rOnh7ac9CQFn0+wdGfDiTApKVaL0ug2hukbzaD+OCQTAYppA1zZBlCc5m
         OOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ChAvfZ0IJ5X8XStmNIiSQdLZpvcnn+9PsbbcSA/E2ao=;
        b=r08I1RJcCRjdzEcf8jeQ6KySfrJ5k1/PryQcD+zdDHGbhj3R47Rjiaeat8ea/07Fgv
         Lc6TYlF5mHveNfR4WJHEmwA/ijC2tyxnoqfj3uOhp5IuEns3BjV5rIewrPK6CkZt1DIp
         1MW7sA3efeQH6vfQ4eh/0GpCW1h+WSu90aBE5WcsLRGAx8I3T0+raufgdF8aeCSRQHF7
         7wrXZi09Jm7vFItpJ+dpGwGDl8y8FxqFzst9M87rTe7tR6dzlba7p9+th/YHSDhY/nHc
         63m5+AEgFSXp30YPwyPY0Fcwlmdw2IuVSvkm7GYN3ZtYDu6/ZVmtnZzaT8uT9fwW9H04
         1M/A==
X-Gm-Message-State: AGi0PuYJP7b28DxSKHcro7ExyrlJVul2UM1ZYnAB0GME/sNW90738rVQ
	3GQPfsFnzI0MYROtU/MAHGQy2FiqKHs=
X-Google-Smtp-Source: APiQypKdqtR622nl1DzT0l/FocNseQ4fu2qBQO7pdv7tbFrOoQpSzLeZqr9PIiY7QTvsjf536D1mRw==
X-Received: by 2002:a92:8e50:: with SMTP id k16mr10360238ilh.45.1585935433186;
        Fri, 03 Apr 2020 10:37:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5d80:f4ba:ee3c:9546? ([2601:646:9200:4e0:5d80:f4ba:ee3c:9546])
        by smtp.gmail.com with ESMTPSA id v80sm2993878ila.62.2020.04.03.10.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 10:37:12 -0700 (PDT)
Subject: Re: [oe] [meta-python] [PATCH] python3-pint: Enable ptest
To: Tim Orling <ticotimo@gmail.com>, zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
References: <1585935907-41366-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <CANx9H-A5BPzGv71Y_sirS6ihD1hx18581a+BkKhU0iiri96c_g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <4dc87703-de0e-c9c3-7356-13b1bc8a3f3a@gmail.com>
Date: Fri, 3 Apr 2020 10:37:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-A5BPzGv71Y_sirS6ihD1hx18581a+BkKhU0iiri96c_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/3/20 10:28 AM, Tim Orling wrote:
> Please merge the .inc file into the .bb file.
> 

merging inc into bb is a good change but should be separate to this one

> On Fri, Apr 3, 2020 at 1:45 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com 
> <mailto:zhengrq.fnst@cn.fujitsu.com>> wrote:
> 
>     Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com
>     <mailto:zhengrq.fnst@cn.fujitsu.com>>
>     ---
>       .../recipes-devtools/python/python-pint.inc       | 15 ++++++++++++++-
>       .../python/python3-pint/run-ptest                 |  3 +++
>       2 files changed, 17 insertions(+), 1 deletion(-)
>       create mode 100644
>     meta-python/recipes-devtools/python/python3-pint/run-ptest
> 
>     diff --git a/meta-python/recipes-devtools/python/python-pint.inc
>     b/meta-python/recipes-devtools/python/python-pint.inc
>     index c58dc9076..5c3481008 100644
>     --- a/meta-python/recipes-devtools/python/python-pint.inc
>     +++ b/meta-python/recipes-devtools/python/python-pint.inc
>     @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
> 
>       PYPI_PACKAGE := "Pint"
> 
>     -inherit pypi
>     +inherit pypi ptest
> 
>       SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
>       SRC_URI[sha256sum] =
>     "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
>     @@ -15,3 +15,16 @@ SRC_URI[sha256sum] =
>     "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359
>       DEPENDS += "python3-setuptools-scm-native"
> 
>       BBCLASSEXTEND = "native nativesdk"
>     +
>     +SRC_URI += " \
>     +       file://run-ptest \
>     +"
>     +
>     +RDEPENDS_${PN}-ptest += " \
>     +       ${PYTHON_PN}-pytest \
>     +"
>     +
>     +do_install_ptest() {
>     +       install -d ${D}${PTEST_PATH}/testsuite
>     +       cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
>     +}
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-pint/run-ptest
>     b/meta-python/recipes-devtools/python/python3-pint/run-ptest
>     new file mode 100644
>     index 000000000..5cec71169
>     --- /dev/null
>     +++ b/meta-python/recipes-devtools/python/python3-pint/run-ptest
>     @@ -0,0 +1,3 @@
>     +#!/bin/sh
>     +
>     +pytest
>     -- 
>     2.20.1
> 
> 
> 
> 
> 
> 
> 
