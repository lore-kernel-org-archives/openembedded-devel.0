Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C4DEB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 15:08:36 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.7239.1688310510390719523
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jul 2023 08:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YbwkLnwd;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5703d12ab9aso43192237b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Jul 2023 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688310509; x=1690902509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gIL03Oc2MITb+OtwuS92kTc/Hot3duk6egbKtULiMA=;
        b=YbwkLnwdCSM2mWsTiBs/27TXbzwTX1Rzo5xCVwUbXlk3nZGo0t4tIOOG53AkgrUkp4
         McUMlkFYJ269fGw0a3KBQf7zLe5yFF1Mxeu7NkoAKrQQjDPEWyhoscbS0DKX7eMuYJGr
         93tNpgKBKWVap18zoMSFysO1imsiVsDF3XIVyulhKH/fr835jmOcOFRZ9HVNUXTIWTaU
         jLHso3xm4vIV5t5PZWgZ9h/pAXjZDB00OJBbFYGXYxwoCoU8zItFz3tzJSBeKx8pKl1p
         bYR6MaMOVYOqW5odlp0jTY+rthNWj3VNeczDc7/1WAzClz8zxyWwkaaHBrrueOddbC69
         7xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688310509; x=1690902509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gIL03Oc2MITb+OtwuS92kTc/Hot3duk6egbKtULiMA=;
        b=DY+OM1jfzzyibSHo2isyU5YukrBdw134ZUl7zB/+YctyezQJYZwVgAU9l/v7BBL+Gi
         pYOqcGXBd+BgXi5bNtFMvn5i8SkkG5nAAFISY4FAJd4fDKddF77VICbbnMngJayJQ+tO
         WhGcHP+pe3UNYLCL78arBjBX0lBr2lDkVYp2GugLZlS4ze7miJFoiV1ek7uh/o/RdJAx
         eTGjEk+m+OQaQlHs1o03qpxSRZgGoJZkgQK7w82wxEQ0zetGRdCLozDsZksQaxNEE836
         65FotnsHmgG2GJce4O91kGsfwplMeNNUGCh3WJzNn0eCOtolhXtr0fEmE77XU95Dxri7
         gyrA==
X-Gm-Message-State: ABy/qLalKw2ZpQjP3FSuzNq1Wic4qQ45kJL7FzbGMq3qFdjPKiRrNILb
	GYsrwHQYI3rdcuER8ZhFe8U=
X-Google-Smtp-Source: APBJJlECjebWqI/ex5VAgqz+5pe6apGDtzgJoCFBnmWuAOOo7hPtGhagi8o8jbuz8TtIfza/RUWbRw==
X-Received: by 2002:a0d:d5ca:0:b0:556:ceb2:c462 with SMTP id x193-20020a0dd5ca000000b00556ceb2c462mr7765869ywd.2.1688310509508;
        Sun, 02 Jul 2023 08:08:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:2d9c:8fc4:3a88:3856? ([2600:1700:9190:ba10:2d9c:8fc4:3a88:3856])
        by smtp.gmail.com with ESMTPSA id y127-20020a818885000000b00576cd8f9770sm3537841ywf.146.2023.07.02.08.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 08:08:28 -0700 (PDT)
Message-ID: <2c58401d-adb9-82ac-31ea-723d14abebd3@gmail.com>
Date: Sun, 2 Jul 2023 11:08:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-oe][mickledore][PATCH] opencv: Revert fix runtime
 dependencies
Content-Language: en-US
To: sandeep.gundlupet-raju@amd.com,
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: mark.hatle@kernel.crashing.org, twoerner@gmail.com
References: <20230620153917.1749409-1-sandeep.gundlupet-raju@amd.com>
 <a5c4679d-2d26-682e-299d-00c30082cae8@amd.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <a5c4679d-2d26-682e-299d-00c30082cae8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Jul 2023 15:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103649



On 6/27/23 6:21 PM, Sandeep Gundlupet Raju via lists.openembedded.org wrote:
> Hello All,
>
> Can we get this patch merged to mickledore?
its in mickledore-next so sortly
>
> Also is langdale branch is still open? If so let me know I will send 
> the patch for langdale as well.

Langdale is closed.

- Armin
>
> Thanks,
>
> Sandeep
>
> On 6/20/2023 9:39 AM, Sandeep Gundlupet Raju wrote:
>> This reverts commit 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837
>>
>> libopencv-ts package is not empty and libopencv_ts libraries are
>> not all installed in the -dev package, these libraries are needed
>> for sdk development listed in opencv4.pc file.
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>   meta-oe/recipes-support/opencv/opencv_4.7.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb 
>> b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
>> index 361b00430..bad6f1508 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
>> @@ -162,7 +162,7 @@ python populate_packages:prepend () {
>>         metapkg =  pn
>>       d.setVar('ALLOW_EMPTY:' + metapkg, "1")
>> -    blacklist = [ metapkg, "libopencv-ts" ]
>> +    blacklist = [ metapkg ]
>>       metapkg_rdepends = [ ]
>>       for pkg in packages[1:]:
>>           if not pkg in blacklist and not pkg in metapkg_rdepends and 
>> not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not 
>> pkg.endswith('-doc') and not pkg.endswith('-locale') and not 
>> pkg.endswith('-staticdev'):
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103619): https://lists.openembedded.org/g/openembedded-devel/message/103619
> Mute This Topic: https://lists.openembedded.org/mt/99646756/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


