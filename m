Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.6498.1592865710291472781
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=nhpRGbAJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.246] (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id E048A20B4780;
	Mon, 22 Jun 2020 15:41:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E048A20B4780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1592865709;
	bh=c7kxplLAAIGKNk7SIZungailqP3BdEMheWLUxPiElmo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=nhpRGbAJHqStP31tLVPL33y7asNVxWeqxARU+mjQIzUCxXZsCGgQNV5PxEJj4kmUM
	 bscQueDHM3FCG8uXj0vE8JFW1ITyXQpusEKLqeggZ9AqkA8ctQ1GoPHF0Zt1YnMEOo
	 UD0Yf8RL3BoRCeIimQCsN0qA6NNMqDd3UL+yxmD0=
Subject: Re: [oe] [meta-browser][PATCH] chromium.inc: Use python3native.bbclass instead of pythonnative.bbclass
To: Denys Dmytriyenko <denis@denix.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Chandana kalluri <ckalluri@xilinx.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
References: <1592863740-4473-1-git-send-email-chandana.kalluri@xilinx.com>
 <CANNYZj-irMbwZptvXfiT047fNwzzgK98z04kLoDRAO=aPM1xKA@mail.gmail.com>
 <20200622223220.GJ17660@denix.org>
From: "Alejandro Hernandez" <alhe@linux.microsoft.com>
Message-ID: <b0a58e1f-04e4-44f5-62ff-a4810826e578@linux.microsoft.com>
Date: Mon, 22 Jun 2020 15:41:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622223220.GJ17660@denix.org>
Content-Type: multipart/alternative;
 boundary="------------153C02D51A880823CD96B5B1"
Content-Language: en-US

--------------153C02D51A880823CD96B5B1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Some of it is already ported, but it doesn't look like it will be fixed 
soon, its easier to depend on python-native but that creates a 
dependency on meta-python as well as it uses EOL code.

If you do that you have to manually patch lots of stuff on the v8 engine 
(and other components) which try calling /usr/bin/python specifically, 
but it will work.

Alejandro

On 6/22/20 3:32 PM, Denys Dmytriyenko wrote:
> Yeah, not gonna work - many people are waiting for this to happen, but alas:
>
> https://bugs.chromium.org/p/chromium/issues/detail?id=942720
>
>
> On Tue, Jun 23, 2020 at 12:16:51AM +0200, Alexander Kanavin wrote:
>> Wait, did you actually test this? Chromium is not yet ready for python3,
>> and builds will fail.
>>
>> Alex
>>
>> On Tue, 23 Jun 2020 at 00:09, Chandana kalluri <ckalluri@xilinx.com> wrote:
>>
>>>  From dunfell onwards, python2 recipes and classes are not supported.
>>> Inherit
>>> python3native.bbclass for chromium instead of pythonnative.bbclass
>>>
>>> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
>>> ---
>>>   recipes-browser/chromium/chromium.inc | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-browser/chromium/chromium.inc
>>> b/recipes-browser/chromium/chromium.inc
>>> index 14d762f..a483ec4 100644
>>> --- a/recipes-browser/chromium/chromium.inc
>>> +++ b/recipes-browser/chromium/chromium.inc
>>> @@ -18,7 +18,7 @@ TOOLCHAIN = "clang"
>>>   # to build the native recipes (e.g. GN) with clang too.
>>>   TOOLCHAIN_class-native = "clang"
>>>
>>> -inherit pythonnative setuptools
>>> +inherit python3native setuptools
>>>
>>>   # Chromium itself is licensed under the 3-clause BSD license. However, it
>>>   # depends upon several other projects whose copyright files are listed in
>>> --
>>> 2.7.4
>>>
>>>
>>>
>
> 

--------------153C02D51A880823CD96B5B1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Some of it is already ported, but it doesn't look like it will be
      fixed soon, its easier to depend on python-native but that creates
      a dependency on meta-python as well as it uses EOL code.<br>
    </p>
    <p>If you do that you have to manually patch lots of stuff on the v8
      engine (and other components) which try calling /usr/bin/python
      specifically, but it will work.</p>
    <p>Alejandro<br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 3:32 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622223220.GJ17660@denix.org">
      <pre class="moz-quote-pre" wrap="">Yeah, not gonna work - many people are waiting for this to happen, but alas:

<a class="moz-txt-link-freetext" href="https://bugs.chromium.org/p/chromium/issues/detail?id=942720">https://bugs.chromium.org/p/chromium/issues/detail?id=942720</a>


On Tue, Jun 23, 2020 at 12:16:51AM +0200, Alexander Kanavin wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Wait, did you actually test this? Chromium is not yet ready for python3,
and builds will fail.

Alex

On Tue, 23 Jun 2020 at 00:09, Chandana kalluri <a class="moz-txt-link-rfc2396E" href="mailto:ckalluri@xilinx.com">&lt;ckalluri@xilinx.com&gt;</a> wrote:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From dunfell onwards, python2 recipes and classes are not supported.
Inherit
python3native.bbclass for chromium instead of pythonnative.bbclass

Signed-off-by: Sai Hari Chandana Kalluri <a class="moz-txt-link-rfc2396E" href="mailto:chandana.kalluri@xilinx.com">&lt;chandana.kalluri@xilinx.com&gt;</a>
---
 recipes-browser/chromium/chromium.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc
b/recipes-browser/chromium/chromium.inc
index 14d762f..a483ec4 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -18,7 +18,7 @@ TOOLCHAIN = "clang"
 # to build the native recipes (e.g. GN) with clang too.
 TOOLCHAIN_class-native = "clang"

-inherit pythonnative setuptools
+inherit python3native setuptools

 # Chromium itself is licensed under the 3-clause BSD license. However, it
 # depends upon several other projects whose copyright files are listed in
--
2.7.4



</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------153C02D51A880823CD96B5B1--
