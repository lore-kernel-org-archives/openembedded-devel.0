Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FF7C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 18:21:44 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.896.1673374896737985934
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 10:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W5Z3BI/M;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-12c8312131fso13022147fac.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6ujH7IHJC+jqTf5OcGmpWMRc5SBdDlRYLRynFUyq5M=;
        b=W5Z3BI/MgztNEBvi7wRAIMrWmGoWEqZCGpL8hhEHFOcP1OyOhBHNEob66HYf2ejbCa
         D6Dh+qxujNotO1iX9W3FKtGr6Gj6nSiWTePTYv60aAsefbOaPlVni7o2T7TbyGp7m8XQ
         q/ccBWFNl8W+PhL+SnHJPC4t++Yz8vi5MZH/KBF0u3t79lcZusInO1d7xoVy+FsT8nYG
         17GGoUM34r4vIdvo1E8JqJDxlV7Yl0XiFJSXVC09OOiRJjPcCBIz49ner0BEY3jIXhqq
         WCnx+jDj/SDWqFjplPhi0G6a2dvMX/ZjMdr3AejVzfKtj7psvP598f6+6RAntOAFaBpa
         Dpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6ujH7IHJC+jqTf5OcGmpWMRc5SBdDlRYLRynFUyq5M=;
        b=fOqUfcNrKo0u/KxEJhG9Ac9xhlt13lNKJMDSoqIoBKn1Ug5ca6zgsXW6/6bYmiRpUq
         lJ3A3uIV1RB99OraMfLjuN/d9XRpgAv1GTm7xhz4juraYsGPrO45ecpFuT/xvOXktceb
         N+epcT3kytrJQlj1Mp5AFRW6at4L6KuMRirTLwRpwOa3tNQ2EebEkwWOIfqnTBo9O75I
         Wd2uT99MeeDrI0zUG16qicsNttpiE8J8Zg559GlFjPmpGqBu2DsXD6WK+mri5ZnD7MKs
         44CN042CihpAu8+iGzHOeITWkDW/A6OdgVnM3EGlUMryqU3ceatp1B6X1AUXN+JZ2ZbV
         /zyA==
X-Gm-Message-State: AFqh2kojj/YXPUrLzqoLZl6YAf/lWPj6ACPDzX3N+oOd+573pQDMFVVg
	O99Gqx8ACY8jxySKjgMTjh4=
X-Google-Smtp-Source: AMrXdXusSbPbXKnWqqarMKZw9FV3MqvZMbPWiWtDuG9wprgCer9t5nucJnbgQp6WGYO7f/c4i2SVsw==
X-Received: by 2002:a05:6870:3c0c:b0:143:b8bb:f2bf with SMTP id gk12-20020a0568703c0c00b00143b8bbf2bfmr32821894oab.41.1673374895930;
        Tue, 10 Jan 2023 10:21:35 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:826d:df1d:b0a7:6601? ([2600:1700:9190:ba10:826d:df1d:b0a7:6601])
        by smtp.gmail.com with ESMTPSA id q6-20020a4a9606000000b004a388af96f9sm5998609ooi.4.2023.01.10.10.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 10:21:35 -0800 (PST)
Message-ID: <43ed2cf8-aebc-9590-b92d-96df4a1d7d92@gmail.com>
Date: Tue, 10 Jan 2023 13:21:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] Kirkstone merge request: Jan 8th
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Geoff Parker <geoffhp@gmail.com>
Cc: yogita.urade@windriver.com,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Stephanie Lockwood-Childs <sjl@vctlabs.com>
References: <48dfc489-5c28-88bf-f714-a3c4b4cf840f@gmail.com>
 <CAMKF1sp3jzrMqz1n_nTZ=C8Py9sBwWV_e9btzp1FrStJBYNNrg@mail.gmail.com>
 <CAHNuFG+Drd_x2bwtnOMOqkXXnd7QdEA=RoCe6vyKPEvdtstXXw@mail.gmail.com>
 <CAMKF1soKMA93qC-DEyYZsn9pdut4=kSnAPNU+6R873zbb=UKaQ@mail.gmail.com>
 <CAHNuFGKUVw9nm7pRT0WVhN-4=jzLMr276RyUyOraaSZNfv=Pwg@mail.gmail.com>
 <CAMKF1srF9aNRxpNN3FSK2Q9sr94h17JyUyWf18ZEncYSGqCMaw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <CAMKF1srF9aNRxpNN3FSK2Q9sr94h17JyUyWf18ZEncYSGqCMaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 18:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100521

noted

On 1/9/23 10:45 PM, Khem Raj wrote:
> Great, thanks for testing. I am sure Armin will get this sorted soon
>
> On Mon, Jan 9, 2023 at 6:24 PM Geoff Parker <geoffhp@gmail.com> wrote:
>> Hi Khem,
>>
>> Stephanie's patch worked for me.
>>
>> On Mon, Jan 9, 2023 at 5:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>>> Can you try https://patchwork.yoctoproject.org/project/oe/patch/20230110002358.GC1773006@codepurple/
>>>
>>> On Mon, Jan 9, 2023 at 3:31 PM Geoff Parker <geoffhp@gmail.com> wrote:
>>>> Since the merge of
>>>> .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb  CVE fix,
>>>> I've been getting build failures on my kirkstone builds due to this
>>>> do_package_qa Error.
>>>>
>>>> ERROR: multipath-tools-0.8.4-r0 do_package_qa: QA Issue: non
>>>> -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink .so
>>>> '/usr/lib/libdmmp.so'
>>>> non -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink
>>>> .so '/usr/lib/libmpathcmd.so'
>>>> non -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink
>>>> .so '/usr/lib/libmultipath.so'
>>>> non -dev/-dbg/nativesdk- package multipath-tools-libs contains symlink
>>>> .so '/usr/lib/libmpathpersist.so' [dev-so]
>>>> ERROR: multipath-tools-0.8.4-r0 do_package_qa: Fatal QA errors were
>>>> found, failing task.
>>>>
>>>> The only ways I've been able to resolve the QA Error is to either
>>>> revert the multipath-tools CVE fix commit, or add
>>>> 'INSANE_SKIP:${PN}-libs = "dev-so" '  to a .bbappend.
>>>>
>>>> I'm happy to send a patch for the INSSANE_SKIP work-around, but I'm
>>>> not sure this is a proper fix to this or not.
>>>>
>>>> On Sun, Jan 8, 2023 at 7:54 AM Khem Raj <raj.khem@gmail.com> wrote:
>>>>> merged thanks.
>>>>>
>>>>> On Sun, Jan 8, 2023 at 7:32 AM akuster808 <akuster808@gmail.com> wrote:
>>>>>> The following changes since commit a8055484f2829e8dfd03d5c8520b2c611aa7ebd2:
>>>>>>
>>>>>>     dool: Add patch to fix rebuild (2022-12-11 16:18:53 -0500)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>     https://git.openembedded.org/meta-openembedded kirkstone-next
>>>>>>
>>>>>> for you to fetch changes up to a9c25bef8882a69fd35ea7dbac3d978ce440fe06:
>>>>>>
>>>>>>     mariadb: Upgrade to 10.7.7 (2023-01-04 11:46:45 -0500)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Archana Polampalli (1):
>>>>>>         Nodejs: Fixed python3 DeprecationWarning
>>>>>>
>>>>>> Mingli Yu (3):
>>>>>>         php: Upgrade to 8.1.12
>>>>>>         mariadb: not use qemu to run cross-compiled binaries
>>>>>>         mariadb: Upgrade to 10.7.7
>>>>>>
>>>>>> Narpat Mali (1):
>>>>>>         Fix collections.abc deprecation warning in downloadutils Warning
>>>>>> appears as:
>>>>>>
>>>>>> Polampalli, Archana (1):
>>>>>>         xfce4-settings: 4.16.2 -> 4.16.5
>>>>>>
>>>>>> Siddharth Doshi (1):
>>>>>>         xterm : Fix CVE-2022-45063 code execution via OSC 50 input
>>>>>> sequences] CVE-2022-45063
>>>>>>
>>>>>> Yogita Urade (1):
>>>>>>         multipath-tools:fix CVE-2022-41973
>>>>>>
>>>>>>    .../{mariadb-native_10.7.4.bb => mariadb-native_10.7.7.bb} |   4 +-
>>>>>>    meta-oe/recipes-dbs/mysql/mariadb.inc                           | 23 +-
>>>>>>    .../0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch    | 69 +++
>>>>>>    meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch         | 34 ++
>>>>>>    meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch        | 416
>>>>>> ---------------
>>>>>>    .../recipes-dbs/mysql/{mariadb_10.7.4.bb => mariadb_10.7.7.bb} |   6 +-
>>>>>>    .../nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch     | 35 ++
>>>>>>    meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb               | 3 +-
>>>>>>    meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} |   2 +-
>>>>>>    meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch    | 782
>>>>>> ++++++++++++++++++++++++++++
>>>>>>    meta-oe/recipes-graphics/xorg-app/xterm_372.bb                  | 1 +
>>>>>>    .../files/0001-multipath-tools-use-run-instead-of-dev-shm.patch | 159
>>>>>> ++++++
>>>>>>    .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 4 +
>>>>>>    ...1-Fix-collections.abc-deprecation-warning-in-downloadu.patch | 41 ++
>>>>>>    .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb  | 5 +-
>>>>>>    .../{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb} |   2 +-
>>>>>>    16 files changed, 1147 insertions(+), 439 deletions(-)
>>>>>>    rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.4.bb =>
>>>>>> mariadb-native_10.7.7.bb} (93%)
>>>>>>    create mode 100644
>>>>>> meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>>>>>>    create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>>>>>>    delete mode 100644
>>>>>> meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
>>>>>>    rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.4.bb =>
>>>>>> mariadb_10.7.7.bb} (81%)
>>>>>>    create mode 100644
>>>>>> meta-oe/recipes-devtools/nodejs/nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch
>>>>>>    rename meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} (99%)
>>>>>>    create mode 100644
>>>>>> meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
>>>>>>    create mode 100644
>>>>>> meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch
>>>>>>    create mode 100644
>>>>>> meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
>>>>>>    rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb
>>>>>> => xfce4-settings_4.16.5.bb} (93%)
>>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#100476): https://lists.openembedded.org/g/openembedded-devel/message/100476
>>>>> Mute This Topic: https://lists.openembedded.org/mt/96132811/141655
>>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [geoffhp@gmail.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>


