Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4539AC35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 09:54:09 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.17393.1742550841078440027
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 02:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PQzebB49;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bee278c2aso31296911fa.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742550839; x=1743155639; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjyTHdDK/VlBDJG4F0OE7hNWas+yvjVGe/ATp5cfq0U=;
        b=PQzebB49Jv6VpYnLFCSeQMVKRCBiiIScz8O6wd76lHDjFjsoGdyadB+7GGJKGhhJ/Q
         gqEc+yDSQ+s22+Og2751Eqt4+kJFGNrHIlh6dSMUjBFUv6yj+PKZFZyDqN16YyH/HhxU
         BPCpEbNDAjzhIYOVPgDm6A7SCm3pt+doSYrMeqFnVpox8ShY9fOdI+7ZU2hd9yT3gLk8
         Pytk7hIOItkIx8ZPVjTVphkOlOW/4pTJqMJkQpdED8scwAgdEP9NH2OH3fh5d0Zg6rAv
         5lOnnvAbv/woFVZQxJcUu8IvQcOeCNx6pMPzA5ekJ/vZ/IFI9Sm7Kbysov/FOOxV77Xd
         pVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550839; x=1743155639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjyTHdDK/VlBDJG4F0OE7hNWas+yvjVGe/ATp5cfq0U=;
        b=XLYzfEj3QMHozSK4/sIGw3aFudBI1xpWrzRLEUKYn6cFRLei/4GmNP1uHdRI4xmjoP
         ekEvB1pW1MC6yE4sX2o/QCeArcpYQYLEEJeiubXp2OjtQ4F9iQAMr8yLZm7bymEms+yk
         zSxDX400Axn0YFIoioXy6+yinqFCcYYWRhVKlCq3ZiU8bbYee8HPtsLmyybMGbwF7BXY
         R+AS3WGNK3mC5BbBa38/hd3VeAbFZeb1N04n5xdvbW8fLMINm8Jz2nO/HR1efYOIyzzA
         cKBP+UejIcZMI16PYLJUIveXih0ohkgKIxhTR5l0V0BKCSA1RE6m3yZzGgHljTuK7N6Y
         Wpzw==
X-Gm-Message-State: AOJu0YyErBdZB8I4du8GSCqQMPjkvg6LsjwfCosMz0j0dplLiOAbcoiK
	dBa/aPen4t5vVuI4i4dNkyqLKnZxAWm0d1xroP2h1FTgdsWp6avt
X-Gm-Gg: ASbGncs9dpTrmg+iv2ZqV5kIRIS6GXEIfhWdKaF36WOm/LlROWfp5oc6X2fatbJugdn
	Zp/dsdyeUQDzqCrhD4AhG/XfPjUpJI+kYP3uOxvIQkD6k53Cjj20xDCMOG3XWUzZjBd2XxldQPS
	QMFzniKV1L3Wie3J1MkV1G7kDAT5vkAlR/DH5pHHHbfbzLarDI078+oDVzcQeKySrMA8dPbakNY
	LkGFRIxCfd42ogK3y3cx8kR4J/bzSdMaCtF45YKVgNoTj+lfa1ogwW//pnBwUPWezNECoulcukj
	QRNzQsaeg9r0MRxyqIDFlExZMT7RPwspEeWBU8tcgHHJSCO+og==
X-Google-Smtp-Source: AGHT+IEQNloH5xtDspYTdvvfJ5kpHsMIWx4087v+Rihps/aVehN29sWm1+PL/d+rkL7HCHeKzHN2+g==
X-Received: by 2002:a2e:be10:0:b0:309:22dc:6917 with SMTP id 38308e7fff4ca-30d7d9aaec8mr9933981fa.19.1742550838798;
        Fri, 21 Mar 2025 02:53:58 -0700 (PDT)
Received: from [172.16.6.176] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7fe799sm2056961fa.51.2025.03.21.02.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 02:53:57 -0700 (PDT)
Message-ID: <e198791b-f3fc-4865-b038-1e4b8c874db0@gmail.com>
Date: Fri, 21 Mar 2025 10:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH v3] python3-varlink: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 "Marko, Peter" <Peter.Marko@siemens.com>
References: <20250321084632.1889809-1-omri.sarig13@gmail.com>
 <CAMKF1sqhQ=SuV2Je2T3NsZV-YZjGtmr3eAqKWC8=ttXUxfQieQ@mail.gmail.com>
Content-Language: en-US
From: Omri Sarig <omri.sarig13@gmail.com>
In-Reply-To: <CAMKF1sqhQ=SuV2Je2T3NsZV-YZjGtmr3eAqKWC8=ttXUxfQieQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 09:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116178


On 3/21/25 10:40, Khem Raj wrote:
> On Fri, Mar 21, 2025 at 1:47 AM Omri Sarig via lists.openembedded.org
> <omri.sarig13=gmail.com@lists.openembedded.org> wrote:
>> Add a python recipe to install the python implementation for the varlink
>> interface.
>>
>> The recipe is using the current master head, instead of the version from
>> pypi or a tagged version. This is done as the pypi and tagged versions
>> are quite old, while the master is continuously maintained in GitHub.
>> The version set for the package is based upon the last tagged commit in
>> the tree, with the addition of git.
>> As the last tagged version is old, the recipe name is based over git,
>> instead of adding the old tag version to the file name.
>>
>> The runtime dependencies were created by looking at all the import
>> statement in the installed files of the repository and taking the
>> relevant packages from the python3 manifest file in meta-poky.
>> Unfortunately, python-varlink does not have different installation
>> candidates for testing or example code - meaning that when the package
>> is install through setuptools, the test code is part of the target
>> system.
>> This causes the runtime dependencies to contain some packages (like
>> python3-unittest) which are not needed during regular operation of the
>> system, assuming the user will not want to run test or example code.
>> However, as these files are installed in the system, and are used as the
>> reference example, we've decided to keep the runtime dependencies as-is.
>> Future work on this package can be done to split the runtime
>> dependencies to different parts (main and test for example), and modify
>> the installed files on the system according to the user wishes.
>>
>> Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
>> ---
>>   .../ptest-packagelists-meta-python.inc        |  1 +
>>   .../python/python3-varlink_git.bb             | 30 +++++++++++++++++++
>>   2 files changed, 31 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-varlink_git.bb
>>
>> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> index 3a1fb13ba7..40df4f08f3 100644
>> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> @@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON = "\
>>       python3-unidiff \
>>       python3-uritemplate \
>>       python3-validators \
>> +    python3-varlink \
>>       python3-wrapt \
>>       python3-wsproto \
>>       python3-xlrd \
>> diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b/meta-python/recipes-devtools/python/python3-varlink_git.bb
>> new file mode 100644
>> index 0000000000..b50bfac379
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
>> @@ -0,0 +1,30 @@
>> +SUMMARY = " Python implementation of the Varlink protocol"
>> +HOMEPAGE = "https://varlink.org/python/"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
>> +
>> +SRC_URI = "git://github.com/varlink/python.git;protocol=https;branch=master"
>> +
>> +SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
>> +
>> +PV = "30.3.1+git"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit python_setuptools_build_meta ptest-python-pytest
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
> I think some of the rdeps here are only needed to run ptests, they
> should be moved to RDEPENDS:${PN}-ptest rdeps

Thanks for the fast reply.

The problem is that the python-varlink repository installs the test 
files as part of the package (so it'll be available in 
`/usr/lib/python3.12/site-packages/varlink/tests/` on the target), and 
these files also contains the example code for the repository.

I've discussed exactly that issue with @peter marko on the second 
version of the patch here:
https://lists.openembedded.org/g/openembedded-devel/message/116172

If you still think that we should split that, and have some solution for 
the installed tests directory (either leave it there, without allowing 
the user to run-it, or manually remove them from the installation), I 
can do that. Please let me know.

>
>
>> +
>> +PTEST_PYTEST_DIR = "varlink/tests"
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#116174): https://lists.openembedded.org/g/openembedded-devel/message/116174
>> Mute This Topic: https://lists.openembedded.org/mt/111824890/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

