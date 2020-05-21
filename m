Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.611.1590082754115111625
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 10:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LumZqXiu;
 spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id b18so6169733oti.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2020 10:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=0CPI4Zk8Kl/A5mvYArwiNYVi9l1hfCYv4zlVYy7rnMw=;
        b=LumZqXiutAr4u/XQ5ng/w6VQw4zOniLrj7Pkk7fR0g1SGXxfohcIegfLGEdGJ8ThHv
         qxFe0PxQLxeVzMnSlJs2qmP55Oe/07lKf9x6ostoVDWI+vknRpaQwsoIQF46YLbx3d/e
         2+UuRosTl2Ew2VOAhkOJadFfmpz1JCZmjlWMnYT63H5wt3JOLZchTRn+4G8+Z91A4690
         YxJGRYX4FlCLgkfm1ecfaNkpX39lFXnzKNxhEcuEpF589ZZl7XDzzypM+df+A7kYr9qK
         tQjUHKibB4cEDo1UV9X+gLZctOPsGZh5ya9Y/ugJL7Bi52waegqOIdn0++E3gZadEHCK
         OVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0CPI4Zk8Kl/A5mvYArwiNYVi9l1hfCYv4zlVYy7rnMw=;
        b=fAjmC1BAgLE9tWnbP5o1PKABIrr9iOJj3o2y3xyG5Rhs1C50Y6KgF3kWUQkaFkUL/m
         I9Ul88rSKE4en8LuRwjONcZgxASkCVzeYo/V15ebLxCxzzh8m5/tFbDwHexnsK22p4rb
         ZNU25ZFqHeGKJkSUtzoZ+nWj5ZUpgdGP9H1/AGMXcSt6NA1wMOXR7sLeknKdqIKJv8IU
         /B1gZetPf8hTHY/UWT35bOhl+Z30M4tXxdICebbRo6JQ8tzZL9PfUgqh90S9pa9nCMY4
         Z8LohpFXnXpVvVY5sxKAQxON46oaVjFmvgUuQMDVjb47WYFNad3b83mv5rxEBXxXVv1m
         NMtA==
X-Gm-Message-State: AOAM533wctmpD12iaNpOsFr3668bagmGWtgLpTxt4pj7W0fX+hnngI2U
	9DJWvYrt+JJJq0vj6PbExvmUO34YaaI=
X-Google-Smtp-Source: ABdhPJxR6iV28guyD5sU2K8NGqYCtLosgKzb7ghP07TxQ8BdWoJbPgelNzu00yMJsQZ+m0M5XINixA==
X-Received: by 2002:a05:6830:91:: with SMTP id a17mr6900923oto.27.1590082753001;
        Thu, 21 May 2020 10:39:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:603f:8403:c197:4cd1? ([2601:646:9200:4e0:603f:8403:c197:4cd1])
        by smtp.gmail.com with ESMTPSA id c26sm1806490oov.13.2020.05.21.10.39.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 10:39:12 -0700 (PDT)
Subject: Re: [oe] [meta-python] [PATCH] python3-parse-type: Modify ptest output format
To: openembedded-devel@lists.openembedded.org
References: <16100A98A66EDE53.23434@lists.openembedded.org>
 <047f518b0904400c8a171a69943d52a1@G08CNEXMBPEKD04.g08.fujitsu.local>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <57f22a6f-7eec-297f-f526-3dcad7ca1e24@gmail.com>
Date: Thu, 21 May 2020 10:39:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <047f518b0904400c8a171a69943d52a1@G08CNEXMBPEKD04.g08.fujitsu.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

check master, I think its already applied via
https://git.openembedded.org/meta-openembedded/commit/?id=86d1c32a818abba71c5a52d21249759cf601ab2e

if not, please send a followup.

On 5/20/20 6:03 PM, zangrc wrote:
> Ping
> 
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of zangrc
> Sent: Monday, May 18, 2020 2:12 PM
> To: Richard Purdie <richard.purdie@linuxfoundation.org>; openembedded-devel@lists.openembedded.org
> Cc: Tim Orling <ticotimo@gmail.com>
> Subject: Re: [oe] [meta-python] [PATCH] python3-parse-type: Modify ptest output format
> 
> Is this solution feasible, and if it is feasible, which mailing list should I submit the patch to？
> 
> -----邮件原件-----
> 发件人: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> 代表 zangrc
> 发送时间: 2020年5月18日 14:09
> 收件人: Richard Purdie <richard.purdie@linuxfoundation.org>; openembedded-devel@lists.openembedded.org
> 抄送: Tim Orling <ticotimo@gmail.com>
> 主题: 答复: [oe] [meta-python] [PATCH] python3-parse-type: Modify ptest output format
> 
> Now I have modified the output of pytest by modifying ptest-runner. My solution is that if OSS uses pytest testing, name its ptest file run-ptest-pytest.
> 
> The content of run-ptest-pytest is as follows:
> pytest -o log_cli = true -o log_cli_level = INFO
> 
> The test output is as follows:
> START: ptest-runner
> 2020-05-18T05:42
> BEGIN: /usr/lib/python3-parse-type/ptest ============================= test session starts ============================== platform linux -- Python 3.8.2, pytest-5.3.5, py-1.8.1, pluggy-0.13.1
> rootdir: /usr/lib/python3-parse-type/ptest collected 192 items
> 
> PASS: tests/test_builder.py::TestTypeBuilder4Enum::test_make_enum_with_dict
> PASS: tests/test_builder.py::TestTypeBuilder4Enum::test_make_enum_with_enum_class
> PASS: tests/test_builder.py::TestTypeBuilder4Enum::test_parse_enum_yesno
> ...
> PASS: tests/test_parse_util.py::TestFieldParser::test_extract_types
> PASS: tests/test_parse_util.py::TestFieldParser::test_parse__raises_error_with_missing_or_partial_br
> PASS: tests/test_parse_util.py::TestFieldParser::test_parse__with_valid_fields
> 
> 
> ============================= 192 passed in 18.41s =============================
> STOP: ptest-runner
> DURATION: 32
> END: /usr/lib/python3-parse-type/ptest
> 2020-05-18T05:42
> STOP: ptest-runner
> 
> -----邮件原件-----
> 发件人: Richard Purdie <richard.purdie@linuxfoundation.org>
> 发送时间: 2020年5月13日 5:23
> 收件人: Zang, Ruochen/臧 若尘 <zangrc.fnst@cn.fujitsu.com>; openembedded-devel@lists.openembedded.org
> 抄送: Tim Orling <ticotimo@gmail.com>
> 主题: Re: [oe] [meta-python] [PATCH] python3-parse-type: Modify ptest output format
> 
> On Tue, 2020-05-12 at 22:23 +0800, zangrc wrote:
>> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>> ---
>>   .../recipes-devtools/python/python3-parse-type/run-ptest        | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
>> b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
>> index 5cec71169..b63c4de0d 100644
>> --- a/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
>> +++ b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
>> @@ -1,3 +1,3 @@
>>   #!/bin/sh
>>   
>> -pytest
>> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> 
> Rather than doing this for every python module, it may be an idea to
> consider:
> 
> a) teaching ptest runner how to handle the alternate output format (triggered by run-ptest-XXX instead of run-ptest)
> 
> or
> 
> b) adding a common python script which could avoid all this sed/awk magic and the extra dependencies
> 
> or
> 
> c) patch in a parameter to pytest which outputs the data in the format we need.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
