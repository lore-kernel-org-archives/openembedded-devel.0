Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB92C2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 13:19:26 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.56043.1718630361815378923
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jun 2024 06:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iDrtsY8T;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa7fafa0c0so4083817276.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 06:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718630361; x=1719235161; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bLQ/jfFlTdJgEnLgvYpOvhXLHAurFEZ7gUNESlAElj8=;
        b=iDrtsY8TPa9fIJ01/JGTmxVK4rs6sCW6qYqin516TENcU2vOv8YmaA+NDVuQSS7nRY
         5aL5yg6DBabsvjtYJjypG4dRFhl1xeSfyWrnKF2h8zltTmNy/UbDFIeMc0X+5VI7pbUA
         WsYqi2Frscwzz0IaIc52WIWWNtCDWCYDRwNbC7q6W2iszjp9m2hZYXQMg9s1dXeZrhGX
         YvehbZu+ldscR30hn0oQ+DoU/fFhe+pQTWUGxXVf/02rbz6PPmgGWdmznUJxIc44KqdV
         7EjzPCLH7R4CYPT+3hZ36EyvKWgduP5xtKPneGncnngbzigHwjzH+hbuj/WGmokunOLM
         K22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718630361; x=1719235161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLQ/jfFlTdJgEnLgvYpOvhXLHAurFEZ7gUNESlAElj8=;
        b=pk3PSeaWDa6fgqSWILvTE1rnD5rTvS3oupnXwSKqlbWZjquZiI8x7eLnRs1DLFkl2I
         HL1X1VS+XgLvj43Y7kxorB+V4bxH0wJyAfFCHzhbFSVaX8GMzYKzxXS4iqFpYUC4H3er
         VMl+LpoXXFt+oXhuTfnIo2B2vWRRO0dslRzeqMguw46zp4LW4cH+XqhxyvB8AyfVLuVX
         m12Q0LV9CrX518rt0dxr3xwO6V62S/uo8uiKzmP6B54xXDZVM2dIWj73rz+YGC3i6vQH
         i/5KYvGbQjGjTK9CJ08o6/ZX1gHzvxjf1oxw5zrQRG/ugBOARW/IvPAxWDd+7VEvGTqW
         B5PA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Gahe7m/VQGr4vwHqagQwOLK7rWlS6a0gqpvKelL477X3X01SdyhdsukKlRcpdpcTQr7xHL5EIPHVDGS77VSRJY+Uf8RDworioeqRR08Rmc1uWSDFNzvtgQ==
X-Gm-Message-State: AOJu0YyegCYAy80x9FXkwOQjQPm7NrcqwNppO6lQ8rAxFeJMqc0+l3nC
	xQCsp5EF/R5ncBpaYMwA2PR7IA840J//Py9RZwPl0jj7i8Pbuns3
X-Google-Smtp-Source: AGHT+IHwMhmI0CypnwVWeGoWQxzwaA+P+0ACSEHoW4DOKQupxL+Oxvu2szX+iYxzu8G+suVZV6mTxQ==
X-Received: by 2002:a25:694c:0:b0:de5:8427:d66f with SMTP id 3f1490d57ef6-dff1380c9c7mr5994339276.4.1718630360721;
        Mon, 17 Jun 2024 06:19:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:be2b:da22:beb7:11ef? ([2600:1700:45dd:7000:be2b:da22:beb7:11ef])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff048774basm1853129276.25.2024.06.17.06.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 06:19:20 -0700 (PDT)
Message-ID: <27bd2286-1de5-4359-bfc7-bc881f0c9c4e@gmail.com>
Date: Mon, 17 Jun 2024 09:19:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] hiredis: change ptest output
 format
To: peng.zhang1.cn@windriver.com, openembedded-devel@lists.openembedded.org
References: <20240617050230.520417-1-peng.zhang1.cn@windriver.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 xsDNBGNNaZMBDAC6/Mhpw3EGOOTPtIpcUHT4lI974zN/QqccMPxH4oyBPRJbjVImYs9avXwV
 Ae9xoWKMM/vocEZWm6SOESZSGf+7l05Eo6MxU50cIQh0/bcOcdDAtFRDk4pZIL6X7vGzvFe6
 17tfNwKrTPgDFSSvq6XLUOqukInaVMHPeZum5GNnfuJswSDEQdxGTgudLWhCYwwoJ1AsVhg1
 nJXjQLOGUHFAZPYMhTak5jFXwG+CFzJ1OPpoAfcjQGYEYY5k5Yr1dESl/zgZSwwRLAAXo6JZ
 lm1rdd0c54XG4ah6fvZkd8r05uBVvbvmrdw5OohqqWzMq7RB9DAsszLvOaxN1epwUYnpkQ6x
 yYRBQxt766hLxtW6+bIXUZdinUsc0cD+MlLfynTzpT3eJPhvU9EtpTkA7hlFtHrhENRlT5rE
 F1ZCGykIhg5J/BL/JO3AISgliu0pPLg9r6tgZKu8r2LBf05LJ1vT2P1wVwlzpAdgHKAmTDF8
 MFEASfeJ4o9TrVFGbt8+cA0AEQEAAc0hYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFpbC5j
 b20+wsEHBBMBCAAxFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZQCGwMECwkIBwUVCAkK
 CwUWAgMBAAAKCRB5KfJxvOuR703oDAC4coUucV3gE+pNQAJcNWqIQwZHiwxbMy2fBgvTP0bx
 TQj6ZFl4tkiXGydUy9c2lcOj4XfaJuG85Z24IIJE0d8hWZMOZkSv5bmyB/NxbM5xRnPkHb6M
 n58wMSRCfNj/fsOoJE9nj5s41ktg1CA9QFBl9Dt0/8J/Mq+TxOKqYvzL4L8KEIw9nsi/yHQX
 ukXDwI2V01hTPZ6P7a4cZsjuvzCVN/WK2N3LzoVhQZHOOHGgx3h8XmsXMZ2ZxKjIdFTO2gFS
 48zXa4+LW/ZyJIUlnBIUdSnpS826wSq6Zn3TyvLJrFD3KSviX0N48htIfiYFJmTcGdDU+Zqr
 wKnPQWdZXgWLsv+3deGZ8z0UCdt3n/OSwRML3gFfYd7QBLazXIkFyplFmgOLwXkf+YifwSbu
 P3KTOpYN9bcl1Og2zU1dPTEg7RndDAvRUUA+XWrp7VM5gZgc0UFRNkrf4CZhxuMwATCJQVPj
 aII+TOxThBkx6NJqXD3tvlNozjLy4fLNZd8sAsrOwM0EY01plAEMAJ5IoQo1AbOAoMYUytqx
 zi1uOQa+ak48yVg4llEs55D9h9ANFEY8C5CyEYyXYKjHCgepUUHDRKIMIMxxzYLKDkd8bgvt
 +cmi1Jj36Wrzrf9qGFq5SvGL66IoUBCTsN64UexxbnNWMDF8qO2aXLvJZtfFJfYGc1ATDw8i
 96pv+FpjE3N76RdYRSFv5UGRqSKhT6jGlVMHb+Z/h1BOIsEBmbtgCozzJ45zhOY9635B4D7w
 i6CB2Aau3/FycPrKk/ZvkSq28tGYWwuhr/fvfvowg+IeClP1oCdKbaWsEwkGTN/PsRM8dPPe
 n07jesJUgpiHCUTF9oY3wJ1a86otszmWbvtJieM7vOxP3YnzF/VVFgDhTzRS0VqAjNRNOMoF
 E7ENS8o7uj7jrrGPuuM9cOhuDqqHwla3Rh0VX+W0//8qGZJ61oGV9paoGUb4PoRqC8ZpLrMB
 Z+f1VQ4iH7rzSQTOLEqGMZ+A34266TtKZKgmBxyqgNFd1HEeO4PD46ycLpnZAQARAQABwsD2
 BBgBCAAgFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZUCGwwACgkQeSnycbzrke+SWgv/
 QvvX84fAHEl7dkhla/oPdqY2bULh+hOxpo3WZmFhHi+41z2GhOJ78S3mY3yD+O7rdXkQIgIu
 bZDOIBMJc0lY/qKfXGpFOg5b8/hW3pYdjmUP1NQmdFK4XRLRL4OhLttgxVgO2yqDtlt9x1o3
 RLgTSJNsy/gQzUJw4m1zYs9qPRz7xglHwrn0OdDwgk6UofiS31cTZgz7txdNJ5pMNEOcjsaD
 KE+3jd6mAOz/VTG7mH3/5z0t+g9onQmfxBFpgxSM8HVtmjT4KWkqqUJzyXLtawbxhdv+fcUv
 5qUSr9ktwA8NJHmIHHcXBqiZLtLWFMJrdsgTFvjCXmTpm3ncsHS9L+JLVwIVCmUQUUCN1LhG
 itDSpYIEGrZObj82rX1wvxf/ZQ8VXS+owIR2F4yeeqPH/CyrPA1ASdtt+Am28/dJ2krr72at
 J++uLxA0cein1kjcosFDpQscnDcPzohnGyyjgEd6VwelZboIS1jt4lIa1badtV+cWMGMgM8W
 ApZ86eOP
In-Reply-To: <20240617050230.520417-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 13:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110941



On 6/17/24 1:02 AM, peng.zhang1.cn via lists.openembedded.org wrote:
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> This change consolidates the output format of the ptest command
> into a single common format.
> The format selected is the automake "simple test" format:
>      "result: testname"

Doesn't this affect master as well?

-armin
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>   .../recipes-extended/hiredis/hiredis/run-ptest  | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/hiredis/hiredis/run-ptest b/meta-oe/recipes-extended/hiredis/hiredis/run-ptest
> index 59b747dbd8..8d450b881f 100644
> --- a/meta-oe/recipes-extended/hiredis/hiredis/run-ptest
> +++ b/meta-oe/recipes-extended/hiredis/hiredis/run-ptest
> @@ -1,3 +1,18 @@
>   #!/bin/sh
>   
> -TEST_SSL=0 TEST_ASYNC=0 ./test.sh
> +TEST_SSL=0 TEST_ASYNC=0 ./test.sh | sed -e 's/PASSED/PASS/g' -e 's/FAILED/FAIL/g' -e 's/SKIPPED/SKIP/g' | awk '
> +{
> +    if ($NF == "\033[0;32mPASS\033[0;0m" || $NF == "\033[0;31mFAIL\033[0;0m" || $NF == "\033[01;33mSKIP\033[0;0m") {
> +        printf "%s: %s\n", $NF, $0
> +    } else {
> +        print
> +    }
> +}'| awk '{
> +    if ($NF == "\033[0;32mPASS\033[0;0m" || $NF == "\033[0;31mFAIL\033[0;0m" || $NF == "\033[01;33mSKIP\033[0;0m") {
> +        $NF = ""
> +        print $0
> +    } else {
> +    print
> +    }
> +}' | awk '{gsub(/:/,"",$NF)}1'
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110939): https://lists.openembedded.org/g/openembedded-devel/message/110939
> Mute This Topic: https://lists.openembedded.org/mt/106715624/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


