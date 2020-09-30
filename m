Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.6562.1601504163240949848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UDOT1PP/;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 16so3242179qkf.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=K8nul8fGbc3VA4wEoODYjKBQv8nkxx+zCxIjuEVUQ8Q=;
        b=UDOT1PP/7yGTreJmG4WJtEGH9xslQesnl0S9IQ28zn7k/Y/tfyCKTrcOC4BsCXcN8y
         ELpz7NruMclK4SUagPD5af/XBTrhweUpGkUaIMpPuaLcJ/Nmo70s8S8GBHUPHHuRzzmS
         qqqmrps5NUyj8Er5U64V+pX1aGY1q8QJ8qCvsy0onuaPvV9OnvqOFV70AR07fZZFnWl3
         clYdfh1aY8KpeeEP4oi0PZ7tFjTDz4au235GpOIfD6z3A7Vro1n0EJLQBcrOj9YvXU8M
         96KrcFcckR00ajpZuuFvzo/5SX8mNBukBe+Ob6YmRysOsKMpoCIbImbIN96oE6x17j5i
         cGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=K8nul8fGbc3VA4wEoODYjKBQv8nkxx+zCxIjuEVUQ8Q=;
        b=n+bNqhbnlVDdbCp+34WCtTj/rm7JANXemVs2qvgUCXvvdCBVSRLZg+pUoEX+WWqE4z
         xFZfebeguhEQ6xo0Lf3lqdcEbZul7cIq4Qey5wdz1k9OwgA6WM0d73f6fajy5Rl2ckmZ
         ynnCJKzpCBdbtknAXuaGVoAUe/ViUgBz/TMaEOWHVgYSsGhp7VbWbrdh0SVDj44vUkuH
         U0mA6O1nkoC73EcbIFNb27Z7uVgUR+86VEpnUBtv37/9e4H4mxPrVgFBtFyXOw/3c7Dr
         JUS4p7geCFZSTywjvtAts/GA46+raElEJKNJIX1DVJTTI6JAWzRF+uHSI026TBnKv8qB
         vt7A==
X-Gm-Message-State: AOAM531xCdboTeCn5jEOd6chSUGOKfIRlH4U4Fdma+jJqbw9OJF38O/2
	YW3zfNyhXzCqvFtito8qtLHilGpOllfurw==
X-Google-Smtp-Source: ABdhPJz5rZvp2UDpGal3JkarAkD4fbrj9Ws7I00lUGUtV0uxB+CDAM9UVwpsehJ6NE6jinxqZHShjQ==
X-Received: by 2002:a05:620a:1381:: with SMTP id k1mr4872948qki.140.1601504162052;
        Wed, 30 Sep 2020 15:16:02 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id 196sm3634065qkm.49.2020.09.30.15.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:16:01 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 2/6] python3-beautifulsoup4: Upgrade 4.9.1 -> 4.9.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
 <20200928080059.18929-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <chaoscodecircuits@gmail.com>
Message-ID: <d9267549-e952-900e-2b89-41e5fcd9dda3@gmail.com>
Date: Wed, 30 Sep 2020 18:16:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200928080059.18929-2-leon.anavi@konsulko.com>
Content-Type: multipart/alternative;
 boundary="------------4054B4BE78B00E8D1ECC74D4"
Content-Language: en-US

--------------4054B4BE78B00E8D1ECC74D4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/28/20 4:00 AM, Leon Anavi wrote:
> - Fixed a bug that caused too many tags to be popped from the tag
>    stack during tree building, when encountering a closing tag that
>    had no matching opening tag.
> - Fixed a bug that inconsistently moved elements over when passing
>    a Tag, rather than a list, into Tag.extend().
> - Specify the soupsieve dependency in a way that complies with
>    PEP 508.
> - Change the signatures for BeautifulSoup.insert_before and
>    insert_after (which are not implemented) to match
>    PageElement.insert_before and insert_after, quieting warnings in
>    some IDEs.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...eautifulsoup4_4.9.1.bb => python3-beautifulsoup4_4.9.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.9.1.bb => python3-beautifulsoup4_4.9.2.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
> rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
> index 910de12f8a..fb5fb1a6b8 100644
> --- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
>   
> -SRC_URI[md5sum] = "57502b5b34ccfd97b180260071f5799a"
> -SRC_URI[sha256sum] = "73cc4d115b96f79c7d77c1c7f7a0a8d4c57860d1041df407dd1aae7f07a77fd7"
> +SRC_URI[md5sum] = "5672f9b9bdfb0c6ab3ef074396bf59aa"
> +SRC_URI[sha256sum] = "1edf5e39f3a5bc6e38b235b369128416c7239b34f692acccececb040233032a1"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------4054B4BE78B00E8D1ECC74D4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/28/20 4:00 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200928080059.18929-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed a bug that caused too many tags to be popped from the tag
  stack during tree building, when encountering a closing tag that
  had no matching opening tag.
- Fixed a bug that inconsistently moved elements over when passing
  a Tag, rather than a list, into Tag.extend().
- Specify the soupsieve dependency in a way that complies with
  PEP 508.
- Change the signatures for BeautifulSoup.insert_before and
  insert_after (which are not implemented) to match
  PageElement.insert_before and insert_after, quieting warnings in
  some IDEs.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite"
      cite="mid:20200928080059.18929-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...eautifulsoup4_4.9.1.bb =&gt; python3-beautifulsoup4_4.9.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.9.1.bb =&gt; python3-beautifulsoup4_4.9.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
index 910de12f8a..fb5fb1a6b8 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.crummy.com/software/BeautifulSoup/bs4">" https://www.crummy.com/software/BeautifulSoup/bs4"</a>
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1">"file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"</a>
 
-SRC_URI[md5sum] = "57502b5b34ccfd97b180260071f5799a"
-SRC_URI[sha256sum] = "73cc4d115b96f79c7d77c1c7f7a0a8d4c57860d1041df407dd1aae7f07a77fd7"
+SRC_URI[md5sum] = "5672f9b9bdfb0c6ab3ef074396bf59aa"
+SRC_URI[sha256sum] = "1edf5e39f3a5bc6e38b235b369128416c7239b34f692acccececb040233032a1"
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4054B4BE78B00E8D1ECC74D4--
