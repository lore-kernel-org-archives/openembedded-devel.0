Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCCFC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 10:57:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.4056.1745578659657205602
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 03:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cDMrKbRA;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso4012135a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 03:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745578658; x=1746183458; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wDSzWWsWbZ1q3EL8W/+ZzUrgyd+4dKpv8pNTO6dfeT8=;
        b=cDMrKbRAd5+qekkWJqcItgOYierZ/tywYjYP6ZcTcluED//md+Ye9Mf6kAdcu1x9CS
         kFmcR8NXMrq0dKZ7A5WO5hb5OeEPKFPpB0i2MHBGl8rqWHkcxvepynI1iDoOUVXZdZkv
         SYEnjydzcdM/EIYYLU6ebYNSSEfSs6JbwwkpBS5j+4rqc0T8fvU7zunDAshahr4HZtAj
         aZcKNcs+taay1yz9HII9n5bXX+DX99KU0PjfSJlnAvmt9xX0Tgg8+aQodBF/F+jGZfIF
         z1jdwU50lLwLclIA8St+1Lzs78C2CCyjIIWPHh6yy7TkzdFRilxuyMmcirZ6L3puGm/Y
         1kMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745578658; x=1746183458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDSzWWsWbZ1q3EL8W/+ZzUrgyd+4dKpv8pNTO6dfeT8=;
        b=LbyQn4O2XUKuRd/GMgS1nOqX7WvC3qegcbWvzVoRxXpgttYPyIVXQFXOLVHn0Jylr/
         rFyhXeWK40MvicvlFO8V9IhgDZ6Fc/xz/SghnxZSDlK3kMTmvI3s6bvlilASmLvNcBF5
         LvqFDvaqJrFyXZNRQ3uJjs0lHw0SWKv+Qy4A4ejGrSL4TJLxmrkeCkQvbdK0I8MZErNa
         V/s89Ic52HkDVGzrnGNmn/YJDcd5jDRChYyxfI4BzXddW1L4nBdOLm322RsvW0nyzhq3
         dpIYe/HZP4FzRHlXWQml06cLxb0pU6jbzjiet1au+87+f+1gwyRuxXbnPIxk7repeH1/
         UGZw==
X-Forwarded-Encrypted: i=1; AJvYcCWCx6h7RRVOn2KK+PoJHW2TcMg9RBfhNyRo+2ObA0Cx+aOl+kYAeznez4QgCSBpTGIA5UOvsMdfeKhzfAD/fxlsyJI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxBf6QB1CZGj254uOeuAtGM/xad+sZ6MwyxgKjm1htm84lwJBG
	Q9gO5BUQro1Qii2BQ4mdZV9NkJ6Dys5uQFmYX8sgDS/ncYitDV7+3w7LXXn7
X-Gm-Gg: ASbGncvxpDfCfEbBSYp1ba4USUAbKIqf6OOvMf4LPbWPRVgK8IVtQD/q2qwicqnJypl
	9U5MYN9Gp4ViXs2NIum+ZKz00Y9cYG5UvEi2PmOdgUThN1NHPwleNVX8f311fIbJtB/tG8v54KP
	z55uENVfXO97x50bFVRkEh9qvK3uu58Z57V2Ep8rNfEe48uji6y53waUlpRYmkZwPHAU/LFXYBz
	q0sQAhe2KX66RRLcvNl4M5za1pu12D9nnRj3PEj3ZLDsECc8jW/zBF3emHymEXTHPxWZRFL/V06
	tWrOEDpLHJikHsA7YgJVXsBJx5MjVNnFnnh+0/SjZZp+f8AU
X-Google-Smtp-Source: AGHT+IFtshQFN32I1mIUd9964fiuO6oD69TzJ+FYcE9eNNgSNwonFrmUgMlObEl8JYiY1abNCnOYWg==
X-Received: by 2002:a05:6402:2349:b0:5ed:c09c:10f with SMTP id 4fb4d7f45d1cf-5f722b69477mr1291299a12.15.1745578657663;
        Fri, 25 Apr 2025 03:57:37 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f703831dc3sm1087495a12.67.2025.04.25.03.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:57:37 -0700 (PDT)
Message-ID: <23321af9-a794-493b-b665-8b3f971aaf5e@gmail.com>
Date: Fri, 25 Apr 2025 12:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pykickstart: Add ptest
 support
To: mingli.yu@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20250425094926.151102-1-mingli.yu@eng.windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250425094926.151102-1-mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 10:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117125


On 4/25/25 11:49, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
>  # ./run-ptest
> PASS: tests/commands/test_authconfig.py:FC3_TestCase.runTest
> PASS: tests/commands/test_authconfig.py:F28_TestCase.runTest
> PASS: tests/commands/test_authconfig.py:F35_TestCase.runTest
> PASS: tests/commands/test_authselect.py:F28_TestCase.runTest
> PASS: tests/commands/test_autopart.py:AutoPart_TestCase.runTest
> PASS: tests/commands/test_autopart.py:FC3_TestCase.runTest
> PASS: tests/commands/test_autopart.py:F9_TestCase.runTest
> PASS: tests/commands/test_autopart.py:F12_TestCase.runTest
> [snip]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../python-pykickstart/files/run-ptest         |  3 +++
>  .../python3-pykickstart_3.63.bb                | 18 +++++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100755 meta-python/recipes-extended/python-pykickstart/files/run-ptest
>
> diff --git a/meta-python/recipes-extended/python-pykickstart/files/run-ptest b/meta-python/recipes-extended/python-pykickstart/files/run-ptest
> new file mode 100755
> index 0000000000..289e68b054
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-pykickstart/files/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake --deselect tests/test_packages.py::AddGroupsAndEnvironment_TestCase --deselect tests/commands/test_reboot.py::Reboot_TestCase
> diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
> index bd20c69980..200e8838fb 100644
> --- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
> +++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
> @@ -4,18 +4,34 @@ LICENSE = "GPL-2.0-or-later"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d"
>  
> -inherit python_setuptools_build_meta
> +inherit python_setuptools_build_meta ptest
>  
>  RDEPENDS:${PN} = "python3 \
>                    python3-requests \
>                    python3-six \
>  "
>  
> +RDEPENDS:${PN}-ptest += " \
> +    python3-pytest \
> +    python3-unittest-automake-output \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests
> +    for file in `grep -Rn unittest.main ${D}${PTEST_PATH}/tests/* |  awk -F":" '{print $1}'`; do

Isn't this whole grep+awk chain equivalent to
grep -Rl unittest.main ${D}${PTEST_PATH}/tests/ ? If yes, wouldn't this
be more readable?
> +        dirname=`dirname $file`
> +        basename=`basename $file`
> +        [ $basename != "__init__.py" ] && mv $file ${dirname}/test_${basename}
> +    done
> +}
> +
>  SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=master;tag=r${PV} \
>             file://0001-support-authentication-for-kickstart.patch \
>             file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
>             file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
>             file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
> +           file://run-ptest \
>             "
>  SRCREV = "6e0d1238cb4696a9040072a5a28a706e5775c552"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117123): https://lists.openembedded.org/g/openembedded-devel/message/117123
> Mute This Topic: https://lists.openembedded.org/mt/112448367/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


