Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.22857.1593613018692359030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iY/PRAIR;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id z13so24058607wrw.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2020 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=6e3PW3ySyaR9ebb+Pwx5m3SfWbDULG+39MI6FhZcIis=;
        b=iY/PRAIRGkSDmSLMbpuFw//97HuAGIwJzVqR8Jgc4iYjzMpvAbu4T4VETymDn/lkK8
         /kbeb7830QsWHxPkR3iHFcT1eudFkw6GeQCRHiDGLNWTHDohsM0Y4cv35xvRmSwjBGvt
         daaUQyWy4Ky4wWdoNXPSowBaDxg783MGKhru0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=6e3PW3ySyaR9ebb+Pwx5m3SfWbDULG+39MI6FhZcIis=;
        b=s+4xPT15Rx2oSn/LrUHx/NGeq2GEbrNuLtZsomdW8SteJTejwcReGSqTvzABdhFGSw
         nesh2c6IC33GQ24rzsvKzI/zliPEEDLS8o9aKfF7jdDxNTPUyU0yevhGv38o6URmGD/y
         EB4+IJ7Bgk6rDD1G0ll4x7oGWWKqf6JNDKVg+L+chjIXzBMX6qGQOz2V++SZQKUJol2X
         k8dA+fWW0+I7ePUX4Y39cQ56A6p5kII8cHmE8LklDg3evvEjQ/OvKVHZZR9AHePYsGAV
         TyAixQ8wsWz5ojusByOJ59Qe6o8rgRBSPNopmk2/346SCtihEBWty/RcM0NStTytCclI
         8Lgg==
X-Gm-Message-State: AOAM532RJwzaMIP+N2p/hSPECuJbNHRdUCwwmSfwgWpHLCd0teUL3im7
	Vwxm6bH6Y4j5Dgeh9wml+pQAdEpHmnE=
X-Google-Smtp-Source: ABdhPJzbMeEnDogF2PiJLgOH9zmJ/lWrYG51yrBB2MpFZGRqS1Pm3O6+G8lVFPgfh7ySX2An8fUcqg==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr27981062wrn.185.1593613016832;
        Wed, 01 Jul 2020 07:16:56 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id u15sm8071058wrm.64.2020.07.01.07.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 07:16:56 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 12/12] python3-pybind11: Upgrade 2.4.3 -> 2.5.0
To: Philip Balister <philip@balister.org>,
 Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-12-leon.anavi@konsulko.com>
 <92b4e917-cdda-8da2-d518-d43d0d6f324f@windriver.com>
 <fe78c5ba-f2d8-e031-8c34-168f5697ce7d@balister.org>
 <8583893a-ae78-aee7-8cc3-fd580781a952@konsulko.com>
 <04fa1077-bfcd-dfd5-825b-20939549224c@balister.org>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <08a2916f-15b0-e0a7-81c4-d585549d1d24@konsulko.com>
Date: Wed, 1 Jul 2020 17:16:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <04fa1077-bfcd-dfd5-825b-20939549224c@balister.org>
Content-Type: multipart/alternative;
 boundary="------------ACC5E3A31AB8CAF3E0A72941"
Content-Language: en-US

--------------ACC5E3A31AB8CAF3E0A72941
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Philip,

On 1.07.20 г. 1:04 ч., Philip Balister wrote:
> Let's get the version updat ein and I can send in the BBCLASSEXTEND and
> switch to building with cmake.

OK, thanks! This upgrade to 2.5.0 has been already merged in master:
http://git.openembedded.org/meta-openembedded/commit/?id=e8cb41c0866568fa31271ed8bfe96b0335a9456f&h=master

Best regards,
Leon

>
> https://github.com/pybind/pybind11/issues/1628
> https://github.com/pybind/pybind11/issues/1379
>
> Philip
>
> On 6/30/20 9:12 AM, Leon Anavi wrote:
>> Hi Philip,
>>
>> On 29.06.20 г. 20:44 ч., Philip Balister wrote:
>>> I just did some work that needed adding a BBCLASSEXTEND = "native", with
>>> this I had to use cmake to build the packages since pypi doesn't instal
>>> the cmake files for development. There is an open bug about this in the
>>> pybind bug tracker.
>> Should we also add BBCLASSEXTEND = "native" to the recipe in
>> meta-python? Could you please share a link to this open bug related to
>> cmake?
>>
>> Thanks,
>> Leon
>>> Philip
>>>
>>> On 6/29/20 10:53 AM, Trevor Gamblin wrote:
>>>> On 6/26/20 7:29 AM, Leon Anavi wrote:
>>>>> Upgrade to release 2.5.0:
>>>>>
>>>>> - Use C++17 fold expressions in type casters, if available. This
>>>>>      can improve performance during overload resolution when
>>>>>      functions have multiple arguments.
>>>>> - Changed include directory resolution in pybind11/__init__.py and
>>>>>      installation in setup.py. This fixes a number of open issues
>>>>>      where pybind11 headers could not be found in certain environments.
>>>>> - C++20 char8_t and u8string support.
>>>>> - CMake: search for Python 3.9.
>>>>> - Fixes for MSYS-based build environments.
>>>>> - STL bindings for std::vector<...>::clear.
>>>>> - Read-only flag for py::buffer.
>>>>> - Exception handling during module initialization.
>>>>> - Support linking against a CPython debug build.
>>>>> - Fixed issues involving the availability and use of aligned new
>>>>>      and delete.
>>>>> - Fixed a resource leak upon interpreter shutdown.
>>>>> - Fixed error handling in the boolean caster.
>>>>>
>>>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>>> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>>> ---
>>>>>     .../{python3-pybind11_2.4.3.bb => python3-pybind11_2.5.0.bb}  | 4
>>>>> ++--
>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>     rename
>>>>> meta-python/recipes-devtools/python/{python3-pybind11_2.4.3.bb =>
>>>>> python3-pybind11_2.5.0.bb} (62%)
>>>>>
>>>>> diff --git
>>>>> a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
>>>>> b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
>>>>> similarity index 62%
>>>>> rename from
>>>>> meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
>>>>> rename to meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
>>>>> index 9efa2db75..dc3b8f6ad 100644
>>>>> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
>>>>> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
>>>>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
>>>>>     LICENSE = "BSD-2-Clause"
>>>>>     LIC_FILES_CHKSUM =
>>>>> "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
>>>>>     -SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
>>>>> -SRC_URI[sha256sum] =
>>>>> "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
>>>>> +SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
>>>>> +SRC_URI[sha256sum] =
>>>>> "ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
>>>>>       inherit pypi setuptools3
>>>>>
>>>>>
>>>>
>>>>
>>>>
>>>> 

-- 
Leon Anavi
Software Engineer
konsulko.com


--------------ACC5E3A31AB8CAF3E0A72941
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Philip,</p>
    <div class="moz-cite-prefix">On 1.07.20 г. 1:04 ч., Philip Balister
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:04fa1077-bfcd-dfd5-825b-20939549224c@balister.org">
      <pre class="moz-quote-pre" wrap="">Let's get the version updat ein and I can send in the BBCLASSEXTEND and
switch to building with cmake.</pre>
    </blockquote>
    <p>OK, thanks! This upgrade to 2.5.0 has been already merged in
      master:<a
href="http://git.openembedded.org/meta-openembedded/commit/?id=e8cb41c0866568fa31271ed8bfe96b0335a9456f&amp;h=master"><br>
http://git.openembedded.org/meta-openembedded/commit/?id=e8cb41c0866568fa31271ed8bfe96b0335a9456f&amp;h=master</a></p>
    <p>Best regards,<br>
      Leon<br>
    </p>
    <blockquote type="cite"
      cite="mid:04fa1077-bfcd-dfd5-825b-20939549224c@balister.org">
      <pre class="moz-quote-pre" wrap="">

<a class="moz-txt-link-freetext" href="https://github.com/pybind/pybind11/issues/1628">https://github.com/pybind/pybind11/issues/1628</a>
<a class="moz-txt-link-freetext" href="https://github.com/pybind/pybind11/issues/1379">https://github.com/pybind/pybind11/issues/1379</a>

Philip

On 6/30/20 9:12 AM, Leon Anavi wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Philip,

On 29.06.20 г. 20:44 ч., Philip Balister wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I just did some work that needed adding a BBCLASSEXTEND = "native", with
this I had to use cmake to build the packages since pypi doesn't instal
the cmake files for development. There is an open bug about this in the
pybind bug tracker.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Should we also add BBCLASSEXTEND = "native" to the recipe in
meta-python? Could you please share a link to this open bug related to
cmake?

Thanks,
Leon
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Philip

On 6/29/20 10:53 AM, Trevor Gamblin wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 6/26/20 7:29 AM, Leon Anavi wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Upgrade to release 2.5.0:

- Use C++17 fold expressions in type casters, if available. This
    can improve performance during overload resolution when
    functions have multiple arguments.
- Changed include directory resolution in pybind11/__init__.py and
    installation in setup.py. This fixes a number of open issues
    where pybind11 headers could not be found in certain environments.
- C++20 char8_t and u8string support.
- CMake: search for Python 3.9.
- Fixes for MSYS-based build environments.
- STL bindings for std::vector&lt;...&gt;::clear.
- Read-only flag for py::buffer.
- Exception handling during module initialization.
- Support linking against a CPython debug build.
- Fixed issues involving the availability and use of aligned new
    and delete.
- Fixed a resource leak upon interpreter shutdown.
- Fixed error handling in the boolean caster.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">---
   .../{python3-pybind11_2.4.3.bb =&gt; python3-pybind11_2.5.0.bb}  | 4
++--
   1 file changed, 2 insertions(+), 2 deletions(-)
   rename
meta-python/recipes-devtools/python/{python3-pybind11_2.4.3.bb =&gt;
python3-pybind11_2.5.0.bb} (62%)

diff --git
a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
similarity index 62%
rename from
meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index 9efa2db75..dc3b8f6ad 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wjakob/pybind11">"https://github.com/wjakob/pybind11"</a>
   LICENSE = "BSD-2-Clause"
   LIC_FILES_CHKSUM =
<a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62">"file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"</a>
   -SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
-SRC_URI[sha256sum] =
"72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
+SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
+SRC_URI[sha256sum] =
"ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
     inherit pypi setuptools3


</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">


</pre>
            <br>
            <fieldset class="mimeAttachmentHeader"></fieldset>
            <pre class="moz-quote-pre" wrap="">
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Leon Anavi
Software Engineer
konsulko.com</pre>
  </body>
</html>

--------------ACC5E3A31AB8CAF3E0A72941--
