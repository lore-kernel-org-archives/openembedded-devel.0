Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04186C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 21:40:12 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.9641.1646516411312011784
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 13:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MvhHoMfd;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id hw13so24271955ejc.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 13:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=83PIZQMG51XSg0FGvFqfAc9QuYCpPIJHycLMTXvReNA=;
        b=MvhHoMfdXxbn81gaILAxWzhz4BHyO5dVMl22in68zR7A2xCIdEbu01P7xL8Kg6CtcO
         Cw1bPw2GxUJU9vsbaxwJlQNjUVkmsHQlySkZ0VCvzwJaPXuORqGMrLv6CNfcfDt90XV2
         YPt4qkMHB4ofs02+w5FUEYJYolZqXAv3VxitIXrRq3m8JY3W0kevqs9Us+5muL+CKegv
         eak0n407zVjlLPY5TnFkYzIeaiBOiUBdmRICfaf3iBVCaV3wifCMwzlqRA7hKdc79AF7
         z/qT12Q5znm0mASf96Ck3ZmyqntBEc1XjiJihi0AfillS6WRg3ttKBHY4opgRi9KU2or
         nKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=83PIZQMG51XSg0FGvFqfAc9QuYCpPIJHycLMTXvReNA=;
        b=D7uqBBybCC0ob2orKH5mpx2Qu5jINe9Lsp46RU5yyuNiqUNjYZo7o/BHx7e91z7P/4
         t8qTSI93LOT9UqTUvAzLinMQE1/ovAu4Amx/nGsLvVCj+E8RlHhShwUY5Uagb1N4QneO
         vAEf334Ah12/aK2ant8yqBDEbE0/isr6LU5YzJAHFolT3Gf1fw7KZ0/3KZ2wj8bHL+kj
         KeCB8XssEjl0wNTGoKme8zHtkMYef31GKRQOqYj5kdb9xbYHX3ZFsqMcE61P1LtREHDm
         H2uU2i8w7KudBmYd/S1uE5JIdc+v5grea6L7rFwO/FgzT9b4Ql9BexnYl85/fyTZxVBv
         8cvw==
X-Gm-Message-State: AOAM533q/p1vpO1Kukd4XODW7xqGFk2jth6fd8SknbJn87jxyHFre7NT
	3cbbJ5VmofU6Bd+zeFda4U/CyFET0EA=
X-Google-Smtp-Source: 
 ABdhPJzcOxKMm4IbyEk3kyvmpbFvk8GeKzOt13goE75561FC3a9aQj++bVu9JxnrPs5n4QMBO70UTw==
X-Received: by 2002:a17:906:66cb:b0:6cf:e4f7:9504 with SMTP id
 k11-20020a17090666cb00b006cfe4f79504mr4111568ejp.142.1646516409702;
        Sat, 05 Mar 2022 13:40:09 -0800 (PST)
Received: from ?IPV6:2003:c0:f45:8e81:edbd:2d1c:599:5c59?
 (p200300c00f458e81edbd2d1c05995c59.dip0.t-ipconnect.de.
 [2003:c0:f45:8e81:edbd:2d1c:599:5c59])
        by smtp.gmail.com with ESMTPSA id
 si13-20020a170906cecd00b006cded0c5ee2sm3257667ejb.61.2022.03.05.13.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Mar 2022 13:40:09 -0800 (PST)
Message-ID: <88c479b2-3955-42cb-c509-c102b6339927@gmail.com>
Date: Sat, 5 Mar 2022 22:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][master][PATCH] libtinyxml2: fix packaging of test
 files
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220303102758.36283-1-nisha.m.parrakat@bmw.de>
 <CAMKF1spxuZyhzZmNU1EKoiX+hrQ279gWBJQ0gd43_WshF7ca1g@mail.gmail.com>
From: nisha parrakat <nishaparrakat@gmail.com>
In-Reply-To: 
 <CAMKF1spxuZyhzZmNU1EKoiX+hrQ279gWBJQ0gd43_WshF7ca1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 21:40:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95807

i could build it in my local clone of poky and meta-openembedded

i have taken the file from upstream pull request, i recreated the patch 
file from the

code that is fetched by the yocto setup and again built locally to see 
if it is ok.

please try with new patch that i sent at

https://lists.openembedded.org/g/openembedded-devel/message/95806

regards

Nisha P

On 04.03.22 08:07, Khem Raj wrote:
> this patch does not apply cleanly, how has this patch been tested ?
>
> patching file CMakeLists.txt
> Hunk #1 FAILED at 50 (different line endings).
> 1 out of 1 hunk FAILED -- rejects in file CMakeLists.txt
> Patch copy_resources_with_tests_in_CMakelists.patch does not apply
> (enforce with -f)
>
> also see
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1479
>
> On Thu, Mar 3, 2022 at 2:28 AM Nisha Parrakat <nishaparrakat@gmail.com> wrote:
>> The xml files inside the resources are to be used for the
>> run of test named xmltest
>> they were not getting copied from the source directory to the directory
>> where xmltest was installed
>>
>> fixes the below error when code built with cmake
>> ./xmltest
>> Error opening test file 'dream.xml'.
>> Is your working directory the same as where
>> the xmltest.cpp and dream.xml file are?
>>
>> Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
>>
>> Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
>> ---
>>   ...y_resources_with_tests_in_CMakelists.patch | 31 +++++++++++++++++++
>>   .../libtinyxml2/libtinyxml2_9.0.0.bb          |  4 ++-
>>   2 files changed, 34 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
>>
>> diff --git a/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
>> new file mode 100644
>> index 000000000..ac05dc2ae
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
>> @@ -0,0 +1,31 @@
>> +The xml files inside the resources are to be used for the
>> +run of test named xmltest
>> +they were not getting copied from the source directory to the directory
>> +where xmltest was installed
>> +
>> +fixes the below error when code built with cmake
>> +./xmltest
>> +Error opening test file 'dream.xml'.
>> +Is your working directory the same as where
>> +the xmltest.cpp and dream.xml file are?
>> +
>> +Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
>> +Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
>> +
>> +Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
>> +--- a/CMakeLists.txt   2022-03-01 12:28:46.780447542 +0000
>> ++++ b/CMakeLists.txt   2022-03-01 12:28:55.951951478 +0000
>> +@@ -50,7 +50,12 @@
>> +         COMMAND xmltest
>> +         WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
>> +     )
>> +-
>> ++     # Copy test resources and create test output directory
>> ++    add_custom_command(TARGET xmltest POST_BUILD
>> ++        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/resources $<TARGET_FILE_DIR:xmltest>/resources
>> ++        COMMAND ${CMAKE_COMMAND} -E make_directory $<TARGET_FILE_DIR:xmltest>/resources/out
>> ++        COMMENT "Configuring xmltest resources directory: ${CMAKE_CURRENT_BINARY_DIR}/resources"
>> ++    )
>> +     set_tests_properties(xmltest PROPERTIES PASS_REGULAR_EXPRESSION ", Fail 0")
>> + endif ()
>> +
>> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
>> index 7f205987f..06410ab6e 100644
>> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
>> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
>> @@ -4,7 +4,9 @@ SECTION = "libs"
>>   LICENSE = "Zlib"
>>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
>>
>> -SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https"
>> +SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
>> +           file://copy_resources_with_tests_in_CMakelists.patch \
>> +          "
>>
>>   SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"
>>
>> --
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95737): https://lists.openembedded.org/g/openembedded-devel/message/95737
>> Mute This Topic: https://lists.openembedded.org/mt/89522514/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

