Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F31C19F2D
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 15:40:35 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.4360.1659800426937493918
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 08:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bo1CwuqM;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id u133so4646110pfc.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 08:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=aYRRujlWZkVNfhQ8uhx2nhGxoeFtpM9f8jBHwaNOq94=;
        b=bo1CwuqMO+HewtXh9ZrzeREncASjslJrKEXoxQtPgZcgp2xZrWLY7e8taGjYDqjS/o
         6IZymzsW41UvQK/98FY3Vh9H0iyfbIt9vEPTj/2cBcytX+nmOgqdtDd9CzMhIqXPF4th
         0QmSseNhcJoDMKlR9tZ1vGPK92zB5J8VGDmfHRdHOhIS+p/6aqLyP7XjvGi9chISyeud
         acz7/RZP/9oSTxunSNWAEfJXFKLPqIOcLQK2UkazIZO2E13mKR/18hUt6M4FJNXSkvrM
         5BzswA7vbfYLMDtAYuTrF+TtNCAgPNX3PkA4sToD8EGldw11gXMOMRz77MQtxvsmedru
         kTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=aYRRujlWZkVNfhQ8uhx2nhGxoeFtpM9f8jBHwaNOq94=;
        b=Ec1YZB+yxgZB8AARKv7RxwDSU70gvMjj5x/9+qHJPDAPjcIMx+t8cQMS40DoFyowlI
         SWn/KPy70fHPBi4anou4Bgw4oezs8XhvJPlJPqb/MSEUdLXLT37r2sV4VduUtT/zdrbr
         ckemqVB1o46VlZYhibHxMSwXgzNOKEVNDZ32oGNnHbJv5U/dSPNotc/2546Dt/zga07E
         QaDvUJ8G9yqA5A0Mw4NbF+CcHMjVEHvbEjzjZqOpaPTSyJAjZRBtWeaFxeDU6P0rAUZa
         VNL7sHqYgHi2uKRU7cpt1OAjFb0iNNux5AvcbEn0PIx3F5p/cvOaqtGOh14VRMPcNU0U
         VekQ==
X-Gm-Message-State: ACgBeo2k3hWEQkufM3C7+vxul3J0O47vncPgg5IcddJsJPATwuQgBJJq
	hq0JZS58eP53hOfzjazVjyE=
X-Google-Smtp-Source: 
 AA6agR61WA1UGgSA3rxswL/N0kFxSDPws5MLkjgJgcTpAoee09yUYEETjQDhHb1yJiNgONMEHdXIHg==
X-Received: by 2002:a63:f144:0:b0:41a:fbe1:7af3 with SMTP id
 o4-20020a63f144000000b0041afbe17af3mr9876707pgk.591.1659800426118;
        Sat, 06 Aug 2022 08:40:26 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::4c04? ([2601:646:9200:a0f0::4c04])
        by smtp.gmail.com with ESMTPSA id
 g9-20020a17090a300900b001f21646d1a4sm25617110pjb.1.2022.08.06.08.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Aug 2022 08:40:25 -0700 (PDT)
Message-ID: <4c031233-a33a-9841-b11a-4381c6ea6927@gmail.com>
Date: Sat, 6 Aug 2022 08:40:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [oe] [meta-networking][PATCH v3] sshpass: add recipe
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Mike Petersen <mike.petersen@ni.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20220729173209.69103-1-mike.petersen@ni.com>
 <20220729173209.69103-2-mike.petersen@ni.com>
 <d30b35312e5344db9fd83fac41910dc3@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <d30b35312e5344db9fd83fac41910dc3@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Aug 2022 15:40:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98139



On 7/29/22 12:41, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Mike Petersen
>> Sent: den 29 juli 2022 19:32
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Mike Petersen <mike.petersen@ni.com>
>> Subject: [oe] [meta-networking][PATCH v3] sshpass: add recipe
>>
>> Needed for automating ssh logins, used in auto-tests.
>>
>> Co-authored-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> Signed-off-by: Mike Petersen <mike.petersen@ni.com>
>> ---
>>   .../recipes-connectivity/sshpass/sshpass_1.09.bb      | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>   create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
>>
>> diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
>> new file mode 100644
>> index 000000000..0bfed694b
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
>> @@ -0,0 +1,11 @@
>> +DESCRIPTION = "Non-interactive ssh password auth"
>> +HOMEPAGE = "http://sshpass.sourceforge.net/"
>> +SECTION = "console/network"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> +
>> +SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"
> 
> That can be written as:
> 
> SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"


right I have incorportated this change in version staged in master-next

> 
>> +
>> +SRC_URI[sha256sum] = "71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7"
>> +
>> +inherit autotools
>> --
>> 2.37.1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98056): https://lists.openembedded.org/g/openembedded-devel/message/98056
> Mute This Topic: https://lists.openembedded.org/mt/92696075/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

