Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673A3C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 22:08:21 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.308.1646345300045689009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HijgsyPC;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id jv12so5234958qvb.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eBpJzfue8DqiifGNmwSL5TWBYefPyoG6KvlK8WMeN7E=;
        b=HijgsyPC7WSvAYNQQcnQXQMtzckJhcMyLJQ/cVAr2jBH2pNI1KR2oiQnhOzTQp9hT6
         CfZxn/Z/6oGKYtP4LmNzc1zlccrJr1VZtF4iCCP+MhXlR+JOCzSGAIjAaJ0DUX3WuYRY
         eKJ4YA9hQgh3XNIvzhpo645GyhX3tx82USTlh8tnPXHdluex4d23DWJRAUenXYFCulKz
         zRMgxePi+8ElmzY0oE+qTa8wPeknvMYZjZVKPRsj8rBMmYuhK3zwVNYYH4CXRU+kJiBV
         GgYIs2gAWTqG9/uMQEMuhh5JSZvGQ0hYDP/+Cm6xqc43tyeAX8hXfWEUBAHYqXGxFSuF
         WScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eBpJzfue8DqiifGNmwSL5TWBYefPyoG6KvlK8WMeN7E=;
        b=2IaBui8mQTM2dtJB6fjSerxWhn9anVJimmnFmFVpKWolGra91SNcfeoeL/1OTGGr6c
         cNSJ3KeKRXQ90LDcU0Z6Kp9sHkTkSFAg9Le/VAasZJW+tOomtGL7dT9H69fMdMc86l8n
         /4qpp8tsnSRj2c4Mg42RMUkTfMFLUt6FxpS80eRoIq/rC2BhFB/8I8oE1OFXdWwnv8Ju
         8hSH/jk6iJ2Ll2EqJkonOJ1ZRp0YYb1mJUuBfIeFhdzb93ZqdE/5oQ/V0zEh8Amj7X0H
         UReVaRazgveyrUIk+AL/JCmDZzPA7xReKb7gCBEwnnDgStWAR5RITeYdUupsa2551US+
         iRaw==
X-Gm-Message-State: AOAM533lVZrfrBmgaY6OqeIbZgrwOnJaExfPYUwMKTrgy/qcjjfW23F3
	+rK5SjMX2hPtF4JSiGUvKKLl8/S97vPoSv/KfqE=
X-Google-Smtp-Source: 
 ABdhPJy11tffz1pwem+CvM80lQSn3YyXlkfMsZY3rA+odbHqJVZ4NlpUhhK0b4FYLTavDap3TougrZ2IQEtKyLSZ37c=
X-Received: by 2002:ad4:574a:0:b0:42b:ef56:c2a4 with SMTP id
 q10-20020ad4574a000000b0042bef56c2a4mr25636809qvx.16.1646345299065; Thu, 03
 Mar 2022 14:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20220303140833.5374-1-kai.kang@windriver.com>
 <20220303140833.5374-2-kai.kang@windriver.com>
 <CANx9H-CRb+TrzJCA5_8RF7TfxWi0L2tLVg63_-bZ1A84LL=ybQ@mail.gmail.com>
In-Reply-To: 
 <CANx9H-CRb+TrzJCA5_8RF7TfxWi0L2tLVg63_-bZ1A84LL=ybQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2022 14:07:53 -0800
Message-ID: 
 <CAMKF1sr8rXX5nYX5fF1ZYL+aoEnA9R3e-KUGgOZWYneTBu4x7w@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] python3-pyparsing: add recipe
To: Tim Orling <ticotimo@gmail.com>
Cc: kai <kai.kang@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 22:08:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95763

On Thu, Mar 3, 2022 at 7:07 AM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Thu, Mar 3, 2022 at 6:08 AM kai <kai.kang@windriver.com> wrote:
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  .../python3-pyparsing/python3-pyparsing_3.0.7.bb      | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>  create mode 100644 meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_3.0.7.bb
>
>
> python3-pyparsing is in oe-core
> https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb
>

right, I have ignored this for meta-python

>>
>> diff --git a/meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_3.0.7.bb b/meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_3.0.7.bb
>> new file mode 100644
>> index 000000000..30db080e8
>> --- /dev/null
>> +++ b/meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_3.0.7.bb
>> @@ -0,0 +1,11 @@
>> +SUMMARY = "The pyparsing module is an alternative approach to creating and executing simple grammars."
>> +HOMEPAGE = "https://github.com/pyparsing/pyparsing/"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
>> +
>> +SRC_URI[sha256sum] = "18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea"
>> +
>> +inherit pypi setuptools3
>> +
>> +RDEPENDS:${PN} = "python3-pprint"
>> --
>> 2.17.1
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95750): https://lists.openembedded.org/g/openembedded-devel/message/95750
> Mute This Topic: https://lists.openembedded.org/mt/89525383/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

