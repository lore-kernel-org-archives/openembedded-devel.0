Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA7CCCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 07:14:35 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.6233.1759994073042785697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 00:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QZ+rJ7a2;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso103869866b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 00:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759994071; x=1760598871; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/65ditaI0p7vV8aiRrfhXtfBDWXIYSBgPBtOdHsGW/s=;
        b=QZ+rJ7a2w8sRqqPpWG2dZo5iWVJG19qC+/qXR99eFQCvAk15grSQWaETmt4d+0U+tF
         PLgSLjBka7eiUoDMmiFNQ4eeDZJ9ZWo2t0H9gpURV9JuYIAptOuiFF0CIJRfknE1Oq+c
         Dhvs9v93H8WBJ+OmSECVeE9CIb0JL8e/3JRQoLC25VsPTu5BfHBXqmLbyfxYmfKOkmd4
         YOBnQX+6QIaGcgvwH/+pvjLFpELJ+iDaD8oWsSz+gsashsrlsqmyC0yaJVPQbNaclnqx
         xsAEVXrGKQgSK7gGXjVl+6Mc24VBER6QvxeOcGZiVFXugjvUrBxAuFulOsfOBpY9ObUs
         DpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759994071; x=1760598871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/65ditaI0p7vV8aiRrfhXtfBDWXIYSBgPBtOdHsGW/s=;
        b=ac4DWMlF9zoRzoDNASpWpKXjCtAGbm8Le5d6cMM2vhjdpEaIB+Wu6fgXS7HRx+LsE4
         iIU51VDOuckVMgS+iBXQFppwqrEXPYXin9o1f6q7qocUEKDIy4aY9B3UqWrMICkbCAwW
         Mu3xgzGhbOlPO94f9Y7YTWqR+GdWrof2cPVgDI3CP5/rw1m2yKZLyFtWMBDr0WbLwA7g
         sHDbBCKVmtZOTotnWDI19UrP01kYUBD2Cz6R+UGzTIsthdT5hJutdT2bsHKkY7Oi8zIi
         1fZatB4W5BamvAxAYO1/inkF46ixknQoXKbuDqHSuNhNaGwYUsqdxfcbTbO5dZ2U1zv0
         9SpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXz8xIDvzK84onZj5Lnp84OJ5bz6Co1tGfYLGIvFken7IWBTTewIFPNWLFB0EfqyyGpLQvAUjlyhA3TGN0pWCv9Bw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVNjOsM4L7D2LeAnlLMXLOoxOlXnLhkQOIr5KrzHUzX2WU/SHd
	8XgMqEH7yMd8n4+EBtDBhgDCmUDh7/YsGE+PIvi7wfe5v2tNpYULCuCb
X-Gm-Gg: ASbGncsBllYayVJGxv3kEddEY1g16J3dnDKTcDIkqIyCph6dnDksFplQNcfRZAPib4J
	CGzG7hN/Eqks/bcfD9pBNqtb8q4ouO29NPD7JA7F1A+FqhgtNjCuWOcfcv30Oy2TZ+DYuXU+vsp
	aAl5RB5LrBWL1vgzqiLc6KomV21cHz+mL1fWqMxIFQLhX4up/w74tvKxd2AnjCAL+HkmbrDnttm
	YI/83XiUKX2gVZjwRjwlWb9asBe2jLDrlcXbAhIWTxYkLFm1cZ1fzgxNS7FowMDSfkk+IOzXg6t
	Jpj7QCt7LvkArd4AgQf66DJd+ksuaNXXkDhISLQOw1p4aoXLUHPGC8/Tv35qToSCDo+qFEawyLR
	yShJInmkG1YACElTWS2X1+0rI838IaH/vP2Oh8F5tL22BsKz166iRJGA=
X-Google-Smtp-Source: AGHT+IGwFTEoIhI8Qm/zkCIWihkR2XcE369vzBD4WIaUrjPj09g3nNgKT6o7ApaCbO+L9X0nLXjbyg==
X-Received: by 2002:a17:907:c04:b0:b46:8bad:6981 with SMTP id a640c23a62f3a-b50aab9d542mr729013866b.20.1759994071281;
        Thu, 09 Oct 2025 00:14:31 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a174a6dsm1841969066b.90.2025.10.09.00.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:14:30 -0700 (PDT)
Message-ID: <5c00e118-82b8-4513-8378-c321b68ceb81@gmail.com>
Date: Thu, 9 Oct 2025 09:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][walnascar][PATCH 1/3] libiec61850: patch
 CVE-2024-26529
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251009041049.3279700-1-ankur.tyagi85@gmail.com>
 <186CC0B2E67F271F.10221@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <186CC0B2E67F271F.10221@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 07:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120421

On 10/9/25 09:03, Gyorgy Sarvari via lists.openembedded.org wrote:
> Is this the full patch? It looks like about half of it is missing - or
> am I missing something? It doesn't look like 1.5.3 had part of the fix
> already.

Sorry, please ignore this message. What I was missing is that the rest
is only whitespace change.

>
> On 10/9/25 06:10, Ankur Tyagi via lists.openembedded.org wrote:
>> Details https://nvd.nist.gov/vuln/detail/CVE-2024-26529
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  ...-break-CMAKE_INSTALL_PATH-by-trying-.patch |  7 ++--
>>  ...AKE_INSTALL_LIBDIR-from-GNUInstallD.patch} |  4 ++-
>>  ...ed-null-pointer-dereference-in-mmsSe.patch | 33 +++++++++++++++++++
>>  .../libiec61850/libiec61850_1.5.3.bb          |  3 +-
>>  4 files changed, 40 insertions(+), 7 deletions(-)
>>  rename meta-networking/recipes-connectivity/libiec61850/files/{0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch => 0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch} (89%)
>>  create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch
>>
>> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>> index 3f0490cb80..4426bafabb 100644
>> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>> @@ -1,4 +1,4 @@
>> -From d4ddfc7a350011b7944ed8d6bca80f164dfd1387 Mon Sep 17 00:00:00 2001
>> +From 21d0a059097dfae1723255e5ff59665d39420be0 Mon Sep 17 00:00:00 2001
>>  From: Romain Naour <romain.naour@smile.fr>
>>  Date: Fri, 10 Jul 2020 17:08:34 +0200
>>  Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying to find
>> @@ -14,7 +14,7 @@ Upstream-Status: Pending
>>   1 file changed, 2 insertions(+), 9 deletions(-)
>>  
>>  diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
>> -index 159ef4b..d1732a1 100644
>> +index 159ef4bc..d1732a16 100644
>>  --- a/pyiec61850/CMakeLists.txt
>>  +++ b/pyiec61850/CMakeLists.txt
>>  @@ -31,14 +31,7 @@ endif()
>> @@ -34,6 +34,3 @@ index 159ef4b..d1732a1 100644
>>  +install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>>   
>>   add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
>> --- 
>> -2.31.1
>> -
>> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networking/recipes-connectivity/libiec61850/files/0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>> similarity index 89%
>> rename from meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>> rename to meta-networking/recipes-connectivity/libiec61850/files/0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>> index e778e8158b..46e1c42e1e 100644
>> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>> @@ -1,4 +1,4 @@
>> -From 16d07a82242c3263ec0038c9b4c97355795d2dd9 Mon Sep 17 00:00:00 2001
>> +From aa48ec52d5792c18a3b369a55ed6472a7dfa1ec1 Mon Sep 17 00:00:00 2001
>>  From: Khem Raj <raj.khem@gmail.com>
>>  Date: Sat, 19 Mar 2022 23:16:51 -0700
>>  Subject: [PATCH] pyiec61850: Use CMAKE_INSTALL_LIBDIR from GNUInstallDirs in
>> @@ -13,6 +13,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   pyiec61850/CMakeLists.txt | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>  
>> +diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
>> +index d1732a16..c19f889b 100644
>>  --- a/pyiec61850/CMakeLists.txt
>>  +++ b/pyiec61850/CMakeLists.txt
>>  @@ -31,7 +31,9 @@ endif()
>> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch b/meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch
>> new file mode 100644
>> index 0000000000..b55a40b240
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch
>> @@ -0,0 +1,33 @@
>> +From de14cb2e053c95d9695bb41bbdd580f35f710793 Mon Sep 17 00:00:00 2001
>> +From: Michael Zillgith <michael.zillgith@mz-automation.de>
>> +Date: Fri, 2 Feb 2024 06:44:47 +0000
>> +Subject: [PATCH] LIB61850-430: fixed null pointer dereference in
>> + mmsServer_handleDeleteNamedVariableListRequest when receiving malformed
>> + message
>> +
>> +CVE: CVE-2024-26529
>> +Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/cf94d64206cf53298edf4799a75b31657bb7cbb3]
>> +
>> +(cherry picked from commit cf94d64206cf53298edf4799a75b31657bb7cbb3)
>> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> +---
>> + src/mms/iso_mms/server/mms_named_variable_list_service.c | 6 ++++++
>> + 1 file changed, 6 insertions(+)
>> +
>> +diff --git a/src/mms/iso_mms/server/mms_named_variable_list_service.c b/src/mms/iso_mms/server/mms_named_variable_list_service.c
>> +index 3a27061c..3365f771 100644
>> +--- a/src/mms/iso_mms/server/mms_named_variable_list_service.c
>> ++++ b/src/mms/iso_mms/server/mms_named_variable_list_service.c
>> +@@ -140,6 +140,12 @@ mmsServer_handleDeleteNamedVariableListRequest(MmsServerConnection connection,
>> +         mmsMsg_createMmsRejectPdu(&invokeId, MMS_ERROR_REJECT_INVALID_PDU, response);
>> +         goto exit_function;
>> +     }
>> ++
>> ++    if (request->listOfVariableListName == NULL)
>> ++    {
>> ++        mmsMsg_createMmsRejectPdu(&invokeId, MMS_ERROR_REJECT_INVALID_PDU, response);
>> ++        goto exit_function;
>> ++    }
>> +  
>> + 	long scopeOfDelete = DeleteNamedVariableListRequest__scopeOfDelete_specific;
>> + 
>> diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
>> index 0e1f50164a..3fff45670f 100644
>> --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
>> +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
>> @@ -17,7 +17,8 @@ SRCREV = "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
>>  
>>  SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
>>             file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
>> -           file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
>> +           file://0002-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
>> +           file://0003-LIB61850-430-fixed-null-pointer-dereference-in-mmsSe.patch \
>>  "
>>  
>>  S = "${WORKDIR}/git"
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120420): https://lists.openembedded.org/g/openembedded-devel/message/120420
> Mute This Topic: https://lists.openembedded.org/mt/115666831/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


