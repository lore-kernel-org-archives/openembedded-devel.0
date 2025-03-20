Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33600C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:30:27 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.2707.1742459420314896684
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mdruQXj0;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54993c68ba0so615368e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 01:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742459418; x=1743064218; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huusUCdNBdFTYBGF4vZPooKzrjuqchOABQeZlolDB44=;
        b=mdruQXj0PPSMIKM7RWJVV4/VK/QePKZw+6G+AdLn5GFRLS++pTH4sF7GipX1+abdoV
         r5F+KTHMorqK5zf3rbnFMP0MzhhgNteO+mVhGdYvu3Z5QhoNV+iI5o0OjQXDWX19ErEg
         QZu0BxNPgrCLFXK7Y7775n5Z2OJMWnH+Zk2J0Z37kVNPAMvLhLJjQkWSKa9NJzGT8qyT
         6M5uZl1aboIMzrEKmrmizigTUzI+Oij5UIE9XIwPyQPQFHyD95YcyHx1bd5OZPqEUSUw
         ZC6XrYlYvJhoKv4/WlTZjrDJFutjvLZKWlYX5bWrhGdHAtknwCnY7EjgqSwXPoxRGKIo
         iKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742459418; x=1743064218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huusUCdNBdFTYBGF4vZPooKzrjuqchOABQeZlolDB44=;
        b=wJhW+RTPFg1QPIrTVxkiSEbxWNFfNcZMfBE3mlRhPmlCNTW8dMY6ctUq+S2QLp4BzQ
         6aI61TU4c7nPly2irTQEFTbSGuzUA1SjlrFAkFjkkk5x/G+gZGpmApEzVb9o4qPVUOlU
         o5SHuELGKqDsdl8bOsKGWrNC+gDb+aPWcXhbm1nV8rU3/o/kRtfsQ5GQGR+vVCbVk98U
         8KE6Sltmb11ofICNSHFxHKsubkOPPp15p8CmJyTrbPURh0DwIiErO+tOJK82uLFFjnds
         ZeJAVo9xMtjr9DidOxN6uCoHXlJ0zwk1Y3R8Np5UHvweuvy2pGfMv3lknL4wviknumyD
         VlLw==
X-Gm-Message-State: AOJu0YwU/GZLoHPemFA7z8SruolH1twyvXNmJI0yAzqsVzoUaZTfDh5F
	hhAwCcAtLmAFouqFFpV3lZts25n2J+Hfpopjt59PMJa/BeyU301g
X-Gm-Gg: ASbGncvLfPTcakv7L028zqG6KkXC8c96oS4kFYn6bRsXtfAz07tDVvO0ae0dYhXxJ9a
	zRtk80JIa7HP2Shfadnm6Pu4NxaE3eGsjhuUw0SOG7ftQAzyIonz1Mwbd1QT10CLsTSSnpXLpdF
	B3B+3ltSxzJMu+NcyUi/2FmmanB85uyo5TG7mSkRjF0pL8JEc27xr8o3hZWFAn/uvUsuLWXyuNg
	GDfXxc1LZJS04vEFAXF5O+bbMXrD2RadKYmNa6pJmkp+sWlFKtJgTsLXyPqBg8IBrPUZrlD8Ros
	sBijMVlv5/0C+AkjtJ6wS/LM9eq6vFrsAPrlNRl8OVarA8BsPw==
X-Google-Smtp-Source: AGHT+IExjxa1t2wtXhtv94Ey3L/q2r0xkSYPGchKCjx8ky7u2VGyuglEfACOYY3DJ1oRWaGBxmTHsQ==
X-Received: by 2002:a05:6512:1107:b0:545:9e1:e824 with SMTP id 2adb3069b0e04-54acb224216mr2294410e87.48.1742459418058;
        Thu, 20 Mar 2025 01:30:18 -0700 (PDT)
Received: from [172.16.6.176] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549cbc2848bsm1524555e87.40.2025.03.20.01.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:30:17 -0700 (PDT)
Message-ID: <41a4b81a-5381-456a-9ef2-d507f1e1e928@gmail.com>
Date: Thu, 20 Mar 2025 09:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-varlink: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250320080451.1063409-1-omri.sarig13@gmail.com>
 <CAMKF1sqej34GVnCnEM0SUcd8Z90nE_npxetmWATPXKWgA+xj4A@mail.gmail.com>
Content-Language: en-US
From: Omri Sarig <omri.sarig13@gmail.com>
In-Reply-To: <CAMKF1sqej34GVnCnEM0SUcd8Z90nE_npxetmWATPXKWgA+xj4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 08:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116123


On 3/20/25 09:09, Khem Raj wrote:
> does this package have unittests ? if so can we add ptest support as
> well while here ?

I originally didn't see it, but I've looked at the examples again and 
they also have a way to run them as unittests. I'll add it and re-submit 
a patch.

>
> On Thu, Mar 20, 2025 at 1:06 AM Omri Sarig via lists.openembedded.org
> <omri.sarig13=gmail.com@lists.openembedded.org> wrote:
>> Add a python recipe to install the python implementation for the varlink
>> interface.
>>
>> The recipe is using the current master head, instead of the version from
>> pypi. This is done as the pypi version is 4 years old, while the master
>> is continuously maintained in GitHub.
>>
>> The runtime dependencies were created by looking at all the import
>> statement in the installed files of the repository and looking at the
>> relevant packages from the python3 manifest file in meta-poky.
>>
>> The repository contains a test directory, however, these tests are not
>> fully automated, and can be used as an example for running the package
>> on target. Therefore, the package is not added to the ptest system.
>>
>> Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
>> ---
>>   .../python/python3-varlink_git.bb             | 26 +++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-varlink_git.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b/meta-python/recipes-devtools/python/python3-varlink_git.bb
>> new file mode 100644
>> index 0000000000..d3c89527ea
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
>> @@ -0,0 +1,26 @@
>> +SUMMARY = " Python implementation of the Varlink protocol"
>> +HOMEPAGE = "https://varlink.org/python/"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
>> +
>> +SRC_URI = "git://github.com/varlink/python.git;protocol=https;branch=master"
>> +
>> +SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit python_setuptools_build_meta
>> +
>> +DEPENDS += "python3-setuptools-scm-native"
>> +
>> +RDEPENDS:${PN} += " \
>> +    python3-core \
>> +    python3-datetime \
>> +    python3-io \
>> +    python3-json \
>> +    python3-netclient \
>> +    python3-netserver \
>> +    python3-shell \
>> +    python3-stringold \
>> +    python3-unittest \
>> +"
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#116121): https://lists.openembedded.org/g/openembedded-devel/message/116121
>> Mute This Topic: https://lists.openembedded.org/mt/111804882/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

