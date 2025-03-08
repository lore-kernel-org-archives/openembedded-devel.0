Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63968C282EC
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 16:24:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.11920.1741451042570846501
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 08:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=frErSf1v;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bd03ed604so24497205e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 08:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741451041; x=1742055841; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10m+WEnZFkWjFebYrwpqv7yi4EcC7uhKERuDzoCNd1w=;
        b=frErSf1v4h/+de6zqB6fC90oJTxpeD4DaUrU4nya24U7sdng3oBy2mZh+7H1AauSFZ
         w66shp9hvjbGTZThytAPKue8lI/Ke3xd9c9F/30F5ZcnSwSMUjkSSd519DoxXrhh71QP
         GRhbROuVTqAWARriJyQa8YjIxAz2fKT7IosZeEtdfyjrLXg6WcjTFAs/tFnHlZCDn3X9
         8BCatky6hWQFBNUP1KrFP1keDIJzv813HSnNWBKyXk19p1JtbCQECPSWZJzGNfCuiwui
         do74q9dpV8xPikc8rTjr65rRZ0pr/4/D3sEjc9cZT2mwIzVeANn8MJTH1o2HKRys8EiH
         Wrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741451041; x=1742055841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10m+WEnZFkWjFebYrwpqv7yi4EcC7uhKERuDzoCNd1w=;
        b=TRcxg7uLBE18bhpZ+eVCH/YZWViMQQOrkFk1eVEojPB+hYhcWtncn/AEJtIy0mbd78
         wA2gG/ntWBrqFeUPHeCRLhybO432SiFVbdmcFtKY0lD6aIR5CpIVSbi1FiGhFkNtMx65
         2oCsEOA3OLv6GQ+HnksVul9KWdhsxqIglCZnPre1s+MUm4AR+6TCPRfU1avNUJB3To9H
         Mmu40gjzkpNR/QgWr822j1sl4aI4MGYgXEJhEI75S1KiXEuRE4IuFQ4n0a+6XgZBvinB
         NBizY0ImxqW1ke1dyEcD+/DsDJ/a674M2l2lv8UYEtX/Qew5S1P1Vl2RNr0Pc1i6d41n
         T6Cg==
X-Gm-Message-State: AOJu0YzUwwnQVsaDVPV54Ge3uhpFjJGX+Vla3l+sRDI5qdJ0eEDgE/CK
	XTibs7rmSzNVpjIrK9MTHYI75t87VC4WKWU3PreGb/HHWwyz3Zzs
X-Gm-Gg: ASbGncs4rMNZrS75KgkV7Qs3fxoReAUxEzqJ39ayQT90lKXaW0Oxqg+SIa6A+NYqYN5
	cXgoV97HJ/zuWNxaqFJqfmPIu1CBbeJbO1/V0+TGOPhyvVQnjGQQH5z+iHFPccoZd/Lm7Re36ge
	x5ieA/UX7TQQ21KxJYInNKVnH9QsMkkrLKxtplOcZ6sTXwPB0wGhVNcKSNIt3Zt+bGPwhZvV6q2
	+7YtCRZxVS9XJAGbXDYt0n4cLkRLCCtg3z/qtZNcglTkUVJRei2uyr52pm4+bLRJy2td1MW88P2
	e12JGGUOOYvpEU7Wsi1Ea1V/n8K9vMbahcVV2ZkJrcDMBv430A15
X-Google-Smtp-Source: AGHT+IF5fglrSm2nkngMfAb9zq8XeJqOLnIglxfBSpgmqNsgpg+ydWBSa1nrfYktyjJ2bPCqRawXag==
X-Received: by 2002:a05:600c:3b1a:b0:43b:c316:1fee with SMTP id 5b1f17b1804b1-43c601e1134mr51909135e9.15.1741451040434;
        Sat, 08 Mar 2025 08:24:00 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42c6203sm117842765e9.24.2025.03.08.08.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 08:23:59 -0800 (PST)
Message-ID: <a2876316-9a43-45f7-890a-ac1b8d840cf1@gmail.com>
Date: Sat, 8 Mar 2025 17:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python]recipes python3-pandas not getting built
 properly for arm 32 bit
To: prasad.mulay@in.abb.com, Raj Khem <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <PA2PR06MB922472DD11FB75D7BC1C90BDAAD52@PA2PR06MB9224.eurprd06.prod.outlook.com>
 <CAMKF1sq1Gz3=H_FoVjJxRQCt3cT1GQ5_km1CA-QOJxvXZoaK9Q@mail.gmail.com>
 <7A6AC60C-85E3-402E-B66F-F7F1614AE45E@in.abb.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <7A6AC60C-85E3-402E-B66F-F7F1614AE45E@in.abb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 16:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115808

I assume that you are using Scarthgap, based on the versions mentioned
in your logs. The below is most probably not completely valid for
Styhead and newer.
    
My theory: Panda relies fairly heavily on numpy, however the recipe uses
python3-numpy-native as a build time dependency - so 32-bit pandas is
built on top of 64-bit numpy, but at runtime, you are providing 32-bit
numpy. Apparently this is causing issues. (I assume your build host is
x86_64)

Could you please give the following a try? The below is an attempt to
compile pandas against the target version of numpy, not the native. (All
changes are in the pandas recipe)

(If anyone can see something very bad/wrong in the below, please go
ahead and post...)

1. Remove python3-numpy-native from DEPENDS, and add python3-numpy instead

2. Add the following variable declarations/exports to the recipe:
PYTHONPATH:prepend = "${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}:"
export PYTHONPATH
export NUMPY_INCLUDE_DIR =
"${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/core/include"

(We want to the non-native numpy module to use for the compilation, so
prepend pythonpath with non-native pythonpath, and export it. The
NUMPY_INCLUDE_DIR is used by the next step.)

3. Add a small patch[1] to the SRC_URI - setup.py imports numpy to get
the includes' folder only, this is why it required the
python3-numpy-native package as a dependency. However it only needs a
single line, and later it should be able to use the target version. The
above variable contains the value of the get_include() call. Afterwards
it seems to be happy with the target version of numpy.

Please keep in mind that this is untested, and may explode (I did build
it, and it worked, but didn't go farther than your example. If it works,
possibly the changes should/could be limited to class-target still,
etc). If you could validate it with a non-trivial exercise on your end
(and let us know the results), that would be really helpful.

Output on my end, in qemuarm:

root@qemuarm:~# uname -a
Linux qemuarm 6.6.35-yocto-standard #1 SMP PREEMPT Fri Jun 28 17:07:38
UTC 2024 armv7l GNU/Linux
root@qemuarm:~# python3
Python 3.12.4 (main, Jun  6 2024, 18:26:44) [GCC 13.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import pandas as pd
>>> data = [["Alice", 25], ["Bob", 30], ["Carol", 35]]
>>> df = pd.DataFrame(data, columns=["Name", "Age"])
>>> print(df)
    Name  Age
0  Alice   25
1    Bob   30
2  Carol   35
>>>

[1]:
https://gist.github.com/OldManYellsAtCloud/9e935907807b6ddcd0900bfb1455e343

On 08.03.25 02:39, Prasad Mulay via lists.openembedded.org wrote:
> Yes
> Regards 
> Prasad
>
>> On 8 Mar 2025, at 12:49 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> ﻿
>> *BeSecure!* 	This email comes from outside of ABB. Make sure you
>> *verify the sender* before clicking any links or downloading/opening
>> attachments.
>> If this email looks suspicious, *report it* by clicking 'Report
>> Phishing' button in Outlook or raising a ticket on MyIS.
>>
>>
>> is it same as https://github.com/pandas-dev/pandas/issues/55305
>> <https://urldefense.com/v3/__https://github.com/pandas-dev/pandas/issues/55305__;!!NLW3fF9v!OUYYcu2Q4z_H5Rh4neEKv96hYlEy0JMDjitJievvFo0JnWxRJhZoppO4D-z80bb4q9SUXr_oDD0mXTMFqaY$>
>>
>> On Thu, Mar 6, 2025 at 8:23 PM Prasad Mulay via
>> lists.openembedded.org
>> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!NLW3fF9v!OUYYcu2Q4z_H5Rh4neEKv96hYlEy0JMDjitJievvFo0JnWxRJhZoppO4D-z80bb4q9SUXr_oDD0mSnQQb9A$>
>> <prasad.mulay=in.abb.com@lists.openembedded.org> wrote:
>>
>>     Hello
>>
>>     https://github.com/pandas-dev/pandas/issues/55305
>>     <https://urldefense.com/v3/__https://github.com/pandas-dev/pandas/issues/55305__;!!NLW3fF9v!OUYYcu2Q4z_H5Rh4neEKv96hYlEy0JMDjitJievvFo0JnWxRJhZoppO4D-z80bb4q9SUXr_oDD0mXTMFqaY$>
>>
>>     this is reported on pandas repo. looking at the comments looks to
>>     be bug from build system. I have tried the solution specified
>>     there. but still problem is persisting.
>>
>>     I am using custom IMX6 board.
>>
>>      
>>
>>     Below is rspose from my board.
>>
>>     root@imx6dldau:~# python
>>
>>     Python 3.12.6 (main, Sep  6 2024, 19:03:47) [GCC 13.3.0] on linux
>>
>>     Type "help", "copyright", "credits" or "license" for more
>>     information.
>>
>>     >>> import pandas as pd
>>
>>     >>> # Create a list of data
>>
>>     >>> data = [["Alice", 25], ["Bob", 30], ["Carol", 35]]
>>
>>     >>> # Create a Pandas DataFrame from the list of data
>>
>>     >>> df = pd.DataFrame(data, columns=["Name", "Age"])
>>
>>     >>> # Print the DataFrame
>>
>>     >>> print(df)
>>
>>     Traceback (most recent call last):
>>
>>       File "<stdin>", line 1, in <module>
>>
>>       File "/usr/lib/python3.12/site-packages/pandas/core/frame.py",
>>     line 1094, in __repr__
>>
>>         return self.to_string(**repr_params)
>>
>>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>>       File "/usr/lib/python3.12/site-packages/pandas/core/frame.py",
>>     line 1271, in to_string
>>
>>         return fmt.DataFrameRenderer(formatter).to_string(
>>
>>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py",
>>     line 1134, in to_string
>>
>>         string = string_formatter.to_string()
>>
>>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/io/formats/string.py",
>>     line 30, in to_string
>>
>>         text = self._get_string_representation()
>>
>>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/io/formats/string.py",
>>     line 45, in _get_string_representation
>>
>>         strcols = self._get_strcols()
>>
>>                   ^^^^^^^^^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/io/formats/string.py",
>>     line 36, in _get_strcols
>>
>>         strcols = self.fmt.get_strcols()
>>
>>                   ^^^^^^^^^^^^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py",
>>     line 615, in get_strcols
>>
>>         strcols = self._get_strcols_without_index()
>>
>>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py",
>>     line 870, in _get_strcols_without_index
>>
>>         str_columns = self._get_formatted_column_labels(self.tr_frame)
>>
>>                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/io/formats/format.py",
>>     line 949, in _get_formatted_column_labels
>>
>>         dtypes = self.frame.dtypes
>>
>>                  ^^^^^^^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/core/generic.py", line
>>     6158, in dtypes
>>
>>         data = self._mgr.get_dtypes()
>>
>>                ^^^^^^^^^^^^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/core/internals/managers.py",
>>     line 278, in get_dtypes
>>
>>         return dtypes.take(self.blknos)
>>
>>                            ^^^^^^^^^^^
>>
>>       File
>>     "/usr/lib/python3.12/site-packages/pandas/core/internals/managers.py",
>>     line 179, in blknos
>>
>>         self._rebuild_blknos_and_blklocs()
>>
>>       File "pandas/_libs/internals.pyx", line 755, in
>>     pandas._libs.internals.BlockManager._rebuild_blknos_and_blklocs
>>
>>     ValueError: Buffer dtype mismatch, expected 'intp_t' but got
>>     'long long'
>>
>>     >>> 
>>
>>      
>>
>>     Any help would be appreciated.
>>
>>     Thank you
>>
>>     Regards
>>
>>     Prasad Mulay
>>
>>      
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115803): https://lists.openembedded.org/g/openembedded-devel/message/115803
> Mute This Topic: https://lists.openembedded.org/mt/111562623/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

