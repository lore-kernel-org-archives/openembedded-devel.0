Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107AAC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 19:53:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.18460.1646596382900578193
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 11:53:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ha8Wc1PU;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id qx21so27748033ejb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 11:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tzaN9IrNcpbVW1EnTm496BhdMD4WJyJfOcDHHIxUjAU=;
        b=ha8Wc1PUw+XKwys8OjHaMQWgBXxtxHhyz1yjo2bSHH+1r6BfN8fDm5H6KJVTc9aUft
         dxeP2vIMXDkVJuMPtv+VPRELW0MWlVTfyrySlx0RSO9BvsMUjZiYNVdiJt0SGg20FKZb
         xx8ErYlqZ2Lw0D69pWUVpduWXNnkLnvKoLOdU06iYByhi9fK/iCpXb+ipB6cWqysvaQp
         DYr23iKueawXZvg/+/qcbWeqaWboWAYNgYuMSfgfOQCJZtNSW9XFtk6EpnROSjeelwv0
         t4ErRjoFBBYjfXxHNtfvDM0mdlHp1Y7EZaTDiOrAUtnX7dey+4PrZvNzvDqvb7xy6fF8
         czcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tzaN9IrNcpbVW1EnTm496BhdMD4WJyJfOcDHHIxUjAU=;
        b=1Tmy8ikCYL+SlZ1e/t40rN+8wLx0qjFRjzJdAyLE0Q6Yx6VzRQD2P4FAe+vUmECVZ0
         jPm1eJqWKr0vwzYFiFaNOgdYLwklUNwlguobj3DzW9Thz012VPwGUjtTGtBf4OQFyc3E
         9amksJCoI7YQ2YOjHleKk9N2Hys6V0KIB6Sy+pKQ6t69TyOtlGxeaQaGnTqNRGKbm+In
         2Jdlv/5FWjD41GGQoSmPOBAxJUapAo1goEKHwe6n9BKSq3TA5Ih7l2A6va493c8CE9G9
         HF+zX4EH1pRf2lsY3L6iRYN4DhQM8R+gBmN559t9FsjEOWyCEbGlMBl+x+C+k+pb2VaO
         C9FQ==
X-Gm-Message-State: AOAM531yKiQVbAmzEsao0zzvWZFYQizNNdejtA188iIxXoyw6Arkn+8o
	HnARMyhOvnHOR8wkjHp3F7Y=
X-Google-Smtp-Source: 
 ABdhPJx6edeHltBEISiXz1BvUYVyaCC+XqwdS903eNMaUqnJmLoMkfaZsTk3CSvmIYAaWThTgTXRwQ==
X-Received: by 2002:a17:906:2bc1:b0:6cf:d009:7f6b with SMTP id
 n1-20020a1709062bc100b006cfd0097f6bmr6649710ejg.17.1646596381269;
        Sun, 06 Mar 2022 11:53:01 -0800 (PST)
Received: from ?IPV6:2003:c0:f45:8e08:b2f2:a000:5828:3f16?
 (p200300c00f458e08b2f2a00058283f16.dip0.t-ipconnect.de.
 [2003:c0:f45:8e08:b2f2:a000:5828:3f16])
        by smtp.gmail.com with ESMTPSA id
 k9-20020a1709063e0900b0069f263a80fesm4117179eji.171.2022.03.06.11.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 11:53:00 -0800 (PST)
Message-ID: <7cc31e53-fff4-76c1-87bc-7d10cc630c47@gmail.com>
Date: Sun, 6 Mar 2022 20:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][master][PATCH] libtinyxml2: fix packaging of test
 files
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220305213515.5572-1-nisha.m.parrakat@bmw.de>
 <6a14ee75-6c38-c7c4-7942-09db621ac036@gmail.com>
 <CAMKF1spcUmsW=1sVwH7jCXVaobTTLLQ7=3i1ODgVk3qf+Q3V7A@mail.gmail.com>
From: nisha parrakat <nishaparrakat@gmail.com>
In-Reply-To: 
 <CAMKF1spcUmsW=1sVwH7jCXVaobTTLLQ7=3i1ODgVk3qf+Q3V7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 19:53:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95819

HI Khem,

unable to understand why it doesn't apply.

it seems to build locally at my system.

The file that i patch that is CMakeLists.txt is of format dos. Is that 
creating a problem ?


regards

Nisha P



On 06.03.22 04:55, Khem Raj wrote:
> this patch does not apply again
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1488
>
> On Sat, Mar 5, 2022 at 1:49 PM akuster808 <akuster808@gmail.com> wrote:
>> Nisha,
>>
>> thanks for the patch. feedback in-lined below.
>>
>> On 3/5/22 13:35, Nisha Parrakat wrote:
>>> The xml files inside the resources are to be used for the
>>> run of test named xmltest
>>> they were not getting copied from the source directory to the directory
>>> where xmltest was installed
>>>
>>> fixes the below error when code built with cmake
>>> ./xmltest
>>> Error opening test file 'dream.xml'.
>>> Is your working directory the same as where
>>> the xmltest.cpp and dream.xml file are?
>>>
>>> Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
>> This seems to confuse folks a lot. The "Upstream-Status" needs to be in
>> the patch it self, not the commit message.
>>
>> see below.
>>
>>> Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
>>> ---
>>>    ...y_resources_with_tests_in_CMakelists.patch | 30 +++++++++++++++++++
>>>    .../libtinyxml2/libtinyxml2_9.0.0.bb          |  4 ++-
>>>    2 files changed, 33 insertions(+), 1 deletion(-)
>>>    create mode 100644 meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
>>>
>>> diff --git a/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
>>> new file mode 100644
>>> index 000000000..09245ad36
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
>>> @@ -0,0 +1,30 @@
>>> +The xml files inside the resources are to be used for the
>>> +run of test named xmltest
>>> +they were not getting copied from the source directory to the directory
>>> +where xmltest was installed
>>> +
>>> +fixes the below error when code built with cmake
>>> +./xmltest
>>> +Error opening test file 'dream.xml'.
>>> +Is your working directory the same as where
>>> +the xmltest.cpp and dream.xml file are?
>> Here:
>>
>> Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
>>
>>
>> -armin
>>> +
>>> +Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
>>> +Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
>>> +
>>> +Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
>>> +--- a/CMakeLists.txt 2022-03-05 22:00:33.361601287 +0100
>>> ++++ b/CMakelist.txt  2022-03-05 22:05:19.953940006 +0100
>>> +@@ -51,6 +51,12 @@
>>> +         WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
>>> +     )
>>> +
>>> ++    # Copy test resources and create test output directory
>>> ++    add_custom_command(TARGET xmltest POST_BUILD
>>> ++    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/resources $<TARGET_FILE_DIR:xmltest>/resources
>>> ++    COMMAND ${CMAKE_COMMAND} -E make_directory $<TARGET_FILE_DIR:xmltest>/resources/out
>>> ++    COMMENT "Configuring xmltest resources directory: ${CMAKE_CURRENT_BINARY_DIR}/resources"
>>> ++    )
>>> +     set_tests_properties(xmltest PROPERTIES PASS_REGULAR_EXPRESSION ", Fail 0")
>>> + endif ()
>>> +
>>> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
>>> index 7f205987f..06410ab6e 100644
>>> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
>>> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
>>> @@ -4,7 +4,9 @@ SECTION = "libs"
>>>    LICENSE = "Zlib"
>>>    LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
>>>
>>> -SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https"
>>> +SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
>>> +           file://copy_resources_with_tests_in_CMakelists.patch \
>>> +          "
>>>
>>>    SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#95806): https://lists.openembedded.org/g/openembedded-devel/message/95806
>>> Mute This Topic: https://lists.openembedded.org/mt/89522514/3616698
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

