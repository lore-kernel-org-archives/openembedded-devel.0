Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.14997.1593522775877130452
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=V71uTr2a;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id f18so19551669wml.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=HtyktYEXO6DWEzVK4i3EqshPOpHOEMHYlD8o/QD/g+c=;
        b=V71uTr2as511PvXT6fR05ol3NZvNdTSpL/i7uAyS+r88pxcKDQg2JY268but4Zqlyn
         8s6w/8UEi75MpZsSDuy8HX89NaLZ5zeJhbvX2bGHcWwA+y3vnuh2UcGiccvaHrWVRd7C
         +vdytFlicN0OmfMO/mhmrJmQCYQYi+k7elmbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HtyktYEXO6DWEzVK4i3EqshPOpHOEMHYlD8o/QD/g+c=;
        b=gH/1RD1mcK+EpKOqSHOAO44Nv9OCr0euaSyIBlwjGPc9+4tyMC2KLT1nMUqsqEixLs
         P7Z0j0qEb/kFbr9grcG0wxcVlduwQuCdW1PGrUbPfujw4vWwQSubRMpyUn9j94gZk5Cl
         zno3+/NexwfYDNBnP2P2j86vsniJrw38iD7xbJ+U77nrDjWx04ONg1Jnk7Y+05K7GZvt
         UgUekZD3540neTUXcxF/V6tudZGJu8ta2fhDO4PJWNks8Xco5ZtZc1LHm/hsj/f3TArO
         4COckpbrYF6AgLLBOqUE95Djieacqa9/jOlgurSsWpghazfAuGMLClxxyD/N8RZUpq2n
         4U8g==
X-Gm-Message-State: AOAM532nI3yihylZ6eMhEB808M+UtALa3LBiZK9jwK3QTulZMDRLAJV3
	jVmd/bqKolu2N8fVBz1APYZa9fcXvJs=
X-Google-Smtp-Source: ABdhPJz7ufcUwnKkWffKSYgWE5UFJg/14bx9o0e++kyAy8QL51zp+HLC3OBXgfRG1LVnp0oNvOOH7g==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr22401651wmb.92.1593522773963;
        Tue, 30 Jun 2020 06:12:53 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id r11sm3495937wmh.1.2020.06.30.06.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 06:12:53 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 12/12] python3-pybind11: Upgrade 2.4.3 -> 2.5.0
To: Philip Balister <philip@balister.org>,
 Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-12-leon.anavi@konsulko.com>
 <92b4e917-cdda-8da2-d518-d43d0d6f324f@windriver.com>
 <fe78c5ba-f2d8-e031-8c34-168f5697ce7d@balister.org>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <8583893a-ae78-aee7-8cc3-fd580781a952@konsulko.com>
Date: Tue, 30 Jun 2020 16:12:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <fe78c5ba-f2d8-e031-8c34-168f5697ce7d@balister.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Philip,

On 29.06.20 г. 20:44 ч., Philip Balister wrote:
> I just did some work that needed adding a BBCLASSEXTEND = "native", with
> this I had to use cmake to build the packages since pypi doesn't instal
> the cmake files for development. There is an open bug about this in the
> pybind bug tracker.
Should we also add BBCLASSEXTEND = "native" to the recipe in 
meta-python? Could you please share a link to this open bug related to 
cmake?

Thanks,
Leon
>
> Philip
>
> On 6/29/20 10:53 AM, Trevor Gamblin wrote:
>> On 6/26/20 7:29 AM, Leon Anavi wrote:
>>> Upgrade to release 2.5.0:
>>>
>>> - Use C++17 fold expressions in type casters, if available. This
>>>     can improve performance during overload resolution when
>>>     functions have multiple arguments.
>>> - Changed include directory resolution in pybind11/__init__.py and
>>>     installation in setup.py. This fixes a number of open issues
>>>     where pybind11 headers could not be found in certain environments.
>>> - C++20 char8_t and u8string support.
>>> - CMake: search for Python 3.9.
>>> - Fixes for MSYS-based build environments.
>>> - STL bindings for std::vector<...>::clear.
>>> - Read-only flag for py::buffer.
>>> - Exception handling during module initialization.
>>> - Support linking against a CPython debug build.
>>> - Fixed issues involving the availability and use of aligned new
>>>     and delete.
>>> - Fixed a resource leak upon interpreter shutdown.
>>> - Fixed error handling in the boolean caster.
>>>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>> ---
>>>    .../{python3-pybind11_2.4.3.bb => python3-pybind11_2.5.0.bb}  | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>    rename
>>> meta-python/recipes-devtools/python/{python3-pybind11_2.4.3.bb =>
>>> python3-pybind11_2.5.0.bb} (62%)
>>>
>>> diff --git
>>> a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
>>> b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
>>> similarity index 62%
>>> rename from meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
>>> rename to meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
>>> index 9efa2db75..dc3b8f6ad 100644
>>> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
>>> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
>>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
>>>    LICENSE = "BSD-2-Clause"
>>>    LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
>>>    -SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
>>> -SRC_URI[sha256sum] =
>>> "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
>>> +SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
>>> +SRC_URI[sha256sum] =
>>> "ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
>>>      inherit pypi setuptools3
>>>
>>>
>>
>> 
>>
-- 
Leon Anavi
Software Engineer
konsulko.com

