Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.4238.1591331350147974448
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 21:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EuMbufCT;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id u5so4560403pgn.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2020 21:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=IIUC+bQvQX8Oz5E9ySg/zlfaz15RUQSd45KDq/6dkrA=;
        b=EuMbufCTIt4oB8XwzWmSNBatUBTLIuKPU/BQ7Fou+1UT0IPYLncanD3csLKE5wBg2y
         9bU+fNjo0gNxww/QaNL3QvEXPZyehwQ47XnKuUGFi5PxCZEdakpkay7p234xn36qmXvf
         6uO5ZBE4IzcwOe3WCWUdcrfLK3cU2AUFF0dCWYTrpb2thOnIFn5YuWvTKYOHm4Ixhp/O
         R0Dk9Ako0LB7JMnHBsNYhIIqfla5h5HfuvMRY0RdqYSCPg/aksKuBncr99r1RJ5MnGe/
         X5oLxZW01OQ8DEYmOjuDmPeV3CRtthqa307GifawEZMDzt3xTvp+Od9XNXkwChdRXkV9
         XOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=IIUC+bQvQX8Oz5E9ySg/zlfaz15RUQSd45KDq/6dkrA=;
        b=g+sKm7zp/E26193VVS6PDCmIX/J0fbm7L5OcNnV22fmNoVPqjfalpuK7aYk5/BYZhH
         J1K8nBPZhpvUj174ZL6XWwEmrWxCg7ZqVn7Kvgo8Hd/2aQC9DUvVqAosGjzRTAvPjgNq
         g80cEh/kDRXjl67w2NO1Tqsc4/lMhmXAfktsnIXsKJAwUeQAqoVjrIlxg6xq7RXTlwqf
         1b2bIYuCgAUBBhfHie3X2l29WQoqCFPfchoJTPqKweeZ1ZBWoJPaHJL2g3Jz8rTktI3f
         Fn8gTzIMtJPbIHpusmMRi+nHRv6FLfAB3iohs+3t+tVnf97Gq4YDcUupyw2nq/1psEnV
         NKkw==
X-Gm-Message-State: AOAM531p5WIFfwp5twcQRDhJGO2v2u1CFlu+j3kBlreW/Z/J1hfJZJSL
	ZLrUAlE4aQHpiKjg8orO9vZ4nCMI
X-Google-Smtp-Source: ABdhPJxUkr89PwzpjYrXzdw6iDbflb3OuaXbvSjpL/AEvWkGaGt9Ky/bKV5A6OeHFW+aTG0rDdI0hQ==
X-Received: by 2002:a62:2bc6:: with SMTP id r189mr6502555pfr.11.1591331349478;
        Thu, 04 Jun 2020 21:29:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ed8b:1e5d:5477:19f4? ([2601:202:4180:a5c0:ed8b:1e5d:5477:19f4])
        by smtp.gmail.com with ESMTPSA id u21sm5784338pfn.123.2020.06.04.21.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 21:29:08 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCHv3] meta-python: depend on core version 12 or higher
To: Denys Dmytriyenko <denis@denix.org>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20200604121311.7519-1-Martin.Jansa@gmail.com>
 <20200604172206.GB17660@denix.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <b43d3753-0221-4dae-86c3-bbd246813331@gmail.com>
Date: Thu, 4 Jun 2020 21:29:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200604172206.GB17660@denix.org>
Content-Type: multipart/alternative;
 boundary="------------A75F1802740E2B78CA515770"
Content-Language: en-US

--------------A75F1802740E2B78CA515770
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 6/4/20 10:22 AM, Denys Dmytriyenko wrote:
> On Thu, Jun 04, 2020 at 02:13:11PM +0200, Martin Jansa wrote:
>> * python3-pyelftools and python3-pycryptodome(x) recipes were recently
>>   moved from meta-python to oe-core in:
>>   https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
>>   https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
>> * core version was bumped now:
>>   https://git.openembedded.org/openembedded-core/commit/?id=2d503b27e7c88cee9a37c79c4605c77b11f230b6
>> * this dependency will make sure that people do upgrade oe-core when they do
>>   upgrade meta-python past these revisions, so the recipes won't suddenly
>>   disappear as a bonus they will get slightly newer version which are now
>>   in oe-core
>>   python3-pycryptodome(x) from 3.9.4 to 3.9.7:
>>   https://www.pycryptodome.org/en/latest/src/changelog.html#february-2020
>>   python2-pyelftools from 0.25 to 0.26:
>>   https://github.com/eliben/pyelftools/commit/8a40f295bc36f96efeb8633dc4a5314f6077d0bf#diff-e4eb329834da3d36278b1b7d943b3bc9
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Reviewed-by: Denys Dmytriyenko <denys@ti.com>
>
Mit Backport?

-armin
>> v3: typo in commit messages "versionw" fixed
> Thanks!
>
>
>>  meta-python/conf/layer.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
>> index 7cfeafe599..0dbc4296eb 100644
>> --- a/meta-python/conf/layer.conf
>> +++ b/meta-python/conf/layer.conf
>> @@ -12,7 +12,7 @@ BBFILE_PRIORITY_meta-python = "7"
>>  # cause compatibility issues with other layers
>>  LAYERVERSION_meta-python = "1"
>>  
>> -LAYERDEPENDS_meta-python = "core openembedded-layer"
>> +LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
>>  
>>  LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
>>  
>> -- 
>> 2.25.1
>>
>
> 


--------------A75F1802740E2B78CA515770
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/4/20 10:22 AM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200604172206.GB17660@denix.org">
      <pre class="moz-quote-pre" wrap="">On Thu, Jun 04, 2020 at 02:13:11PM +0200, Martin Jansa wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">* python3-pyelftools and python3-pycryptodome(x) recipes were recently
  moved from meta-python to oe-core in:
  <a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3">https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3</a>
  <a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca">https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca</a>
* core version was bumped now:
  <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=2d503b27e7c88cee9a37c79c4605c77b11f230b6">https://git.openembedded.org/openembedded-core/commit/?id=2d503b27e7c88cee9a37c79c4605c77b11f230b6</a>
* this dependency will make sure that people do upgrade oe-core when they do
  upgrade meta-python past these revisions, so the recipes won't suddenly
  disappear as a bonus they will get slightly newer version which are now
  in oe-core
  python3-pycryptodome(x) from 3.9.4 to 3.9.7:
  <a class="moz-txt-link-freetext" href="https://www.pycryptodome.org/en/latest/src/changelog.html#february-2020">https://www.pycryptodome.org/en/latest/src/changelog.html#february-2020</a>
  python2-pyelftools from 0.25 to 0.26:
  <a class="moz-txt-link-freetext" href="https://github.com/eliben/pyelftools/commit/8a40f295bc36f96efeb8633dc4a5314f6077d0bf#diff-e4eb329834da3d36278b1b7d943b3bc9">https://github.com/eliben/pyelftools/commit/8a40f295bc36f96efeb8633dc4a5314f6077d0bf#diff-e4eb329834da3d36278b1b7d943b3bc9</a>

Signed-off-by: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Reviewed-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>

</pre>
    </blockquote>
    Mit Backport?<br>
    <br>
    -armin<br>
    <blockquote type="cite" cite="mid:20200604172206.GB17660@denix.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">v3: typo in commit messages "versionw" fixed
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks!


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> meta-python/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 7cfeafe599..0dbc4296eb 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -12,7 +12,7 @@ BBFILE_PRIORITY_meta-python = "7"
 # cause compatibility issues with other layers
 LAYERVERSION_meta-python = "1"
 
-LAYERDEPENDS_meta-python = "core openembedded-layer"
+LAYERDEPENDS_meta-python = "core (&gt;= 12) openembedded-layer"
 
 LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
 
-- 
2.25.1

</pre>
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
    <br>
  </body>
</html>

--------------A75F1802740E2B78CA515770--
