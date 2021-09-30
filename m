Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6425FC433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 15:45:21 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.14323.1633016720845015826
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 08:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q4s6EiF2;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 om12-20020a17090b3a8c00b0019eff43daf5so5105384pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=bQNRYJT16CPM6UWuOcu0eaiVrTrhEPmTFwNdTQdPUfY=;
        b=Q4s6EiF2925hrYVHfcTqyvb2s20xAgyiXm4h9HU3tqsR9RqlZ8NIq12mp+68CWA1KJ
         UlZ2+xOEDHHiN7pwxmWNipVVWlg/VlYZSUVWokiKrCSSQ5MRWYRIQQGKv4SABEn/dGv/
         mheC1vxvUNPRQPc3GYxDkcb76aBM0w6vlcwq5lPliA5QhZQJRfvjfwDKvDB40ji6dOXw
         JR0TEtGo5vinQViGbPBmRm0Yc9PxFSrWAmGYm01O05FMt2pU4LHSAB4oMp12eelswpWV
         OCRzh+xo14dwGh3t5CpwJ+hS8O1830kqz5J+DccdgB/KLehbWhRBwG2HrLnQ6A7tKwDa
         X3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=bQNRYJT16CPM6UWuOcu0eaiVrTrhEPmTFwNdTQdPUfY=;
        b=xvBFc1XnsrQMFWm3ri9xj+2xy4kQz5x6isuPf187mo/Q1enRqJYWlnt/JbZPA76LO5
         18lRo+KX8dxuO/odMCOUilDlgEWnlScvKEMVh8rj1Zzw5NSye9G51XIraIYiOsER/rvb
         qPjucCf4vbowI3Oc1uVTi2sTYX1UaQqFpW0GL4WqQNYZg3KJugST5zeiJ6/ikutpJBE/
         wzwATLgCe9RBhjnnGIz9HurUBDowdBQqxowdEK+ty04u0SJkOmY0z2GVP9pC3njtgPHt
         oTz4URTuBDAGsTBAXCviEui5Sp7DlgbSCvIfw4Um53lIZLSE98mGqtS71zrDTBAzL2Gy
         HRTQ==
X-Gm-Message-State: AOAM533kU4Td1h8hUVoy3H+swgN2KTK0V9czIDyG3SkuuP0SbhI8mn8b
	xQQPrZJCOvqfgrAK67eKOcc=
X-Google-Smtp-Source: 
 ABdhPJwYSbZo2X8WqAJVL2BsxuD8qXWn1QapfUJH9ISQUJzpv0rqbJa2VcwalBgtvw6PxluwpOEFhA==
X-Received: by 2002:a17:902:a702:b029:12b:aa0f:d553 with SMTP id
 w2-20020a170902a702b029012baa0fd553mr6012329plq.3.1633016720247;
        Thu, 30 Sep 2021 08:45:20 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:58b:d908:1eff:4166?
 ([2601:646:9200:a0f0:58b:d908:1eff:4166])
        by smtp.gmail.com with ESMTPSA id
 f205sm3539766pfa.92.2021.09.30.08.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 08:45:19 -0700 (PDT)
Message-ID: <045f0f12-e371-c831-0e8a-93add7e23322@gmail.com>
Date: Thu, 30 Sep 2021 08:45:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [oe][meta-oe][PATCH] chipsec: platform security assessment
 framework
Content-Language: en-US
To: Scott Murray <scott.murray@konsulko.com>,
 LiweiSong <liwei.song@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20210928092958.19196-1-liwei.song@windriver.com>
 <5d1e1868-add6-a677-f179-8ab2756a95c@spiteful.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <5d1e1868-add6-a677-f179-8ab2756a95c@spiteful.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Sep 2021 15:45:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93182



On 9/30/21 8:23 AM, Scott Murray wrote:
> On Tue, 28 Sep 2021, LiweiSong wrote:
> 
>> Add chipsec, tools to dump or analyzing hardware, system firmware
>> components, like PCH register, ioport or iomem configuration space.
>>
>> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> [snip]
> 
> This sounds like something that might be a better fit in meta-security?
> 
> Scott
> 

After rereading the README of project a bit more, I think it would fit 
in meta-security aptly, Please send a patch to move it to meta-security
since its already in meta-oe now.

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93181): https://lists.openembedded.org/g/openembedded-devel/message/93181
> Mute This Topic: https://lists.openembedded.org/mt/85920605/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

