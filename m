Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3036.1592345481160063053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 15:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n5dgB4Cd;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id 23so88082pfw.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2020 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=n1SQxQN9tuM4GMVy5F3LM9RYjhU+plUq6lIcUL5xB8c=;
        b=n5dgB4CdHAgRUXVf+XgPLmQgLWU3cOMmVjYeTUcRv7YXvnu5PVzsXgJdD2SQ8GtaRa
         7IKBsVTn8I2da8j00ikbf52vrN2lZtP9KhlZSvQeBBdAD5c1dH9w5PaXFywywk8D4dGC
         GDx8/dZ7BND+/nXxAdaq+jJ+RgszhTFpVzgxBBxNMUISWESpluDFJCKf2f7S/lTAOPlS
         B9l0wCUR5GRuJWVBKodVorgSSulchrx02UCT/TnmikW6JdLf275c9Q351TVE3nzV1Iii
         uO9eXEYkg6hL1XCQq+6SmEDm4VGHjOa0tKEN8QsVaHt6xd4OE99S6qOHEnWNuf2iLOJC
         ZOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=n1SQxQN9tuM4GMVy5F3LM9RYjhU+plUq6lIcUL5xB8c=;
        b=GZ1oKiX5t4E4wZ1cqgxJqIRyKs7GjXw/ESHzfiW1WEcvdOWLZ0k7sbqkP1UyMCzMVJ
         LHvPHcJGReHW/GRQS5Y3hX7RedqZFrEB7ThQkrj0SiGEtWWitATCDtxw45/92L/x11Qm
         5u7Yh/VImyRo+n+WTo4D/Xg2tZnEmV7BeK7nOqiiWLDUxRliMag3/AZ6cFwhTEyGIt0R
         zoRjPoEmvLN4miZv47SmsVkv6Q5c4Te2yzuj71Bjxu5O3cUyY1/3tqCziTEF9wQACQqb
         8m6NWYMYDkGn00XSlng8F+MHVc3K446wIZ8k5TkhaySo/ueENYcBsMxrhvdFYsVPgv2e
         isxg==
X-Gm-Message-State: AOAM533l4Z8UPfzF1kjoPRwdwiJxVMSok+x2rquWIBB3XXWFxPPwq+wG
	XetQs43PCi70EQZ+J2bK8NX1kpi9
X-Google-Smtp-Source: ABdhPJwLYSRXHiBuNKxGUq9kq4I9hnvp2mocftXL/cXet0sllgZKY+Iqw4wrsErq1tq4+U1jiGekPw==
X-Received: by 2002:a63:5a66:: with SMTP id k38mr3646207pgm.240.1592345480373;
        Tue, 16 Jun 2020 15:11:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:468:ee15:d722:3a6e? ([2601:202:4180:a5c0:468:ee15:d722:3a6e])
        by smtp.gmail.com with ESMTPSA id y69sm13674034pfg.207.2020.06.16.15.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 15:11:19 -0700 (PDT)
Subject: Re: [oe] standardizing HOMEPAGE values in python3 recipes
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Adrian Bunk <bunk@stusta.de>
Cc: OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
References: <alpine.LFD.2.21.2006160631480.7747@localhost.localdomain>
 <20200616194348.GG14969@localhost>
 <alpine.LFD.2.21.2006161807070.7432@localhost.localdomain>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f5d64627-7b4a-94df-d487-e578cd62fc41@gmail.com>
Date: Tue, 16 Jun 2020 15:11:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2006161807070.7432@localhost.localdomain>
Content-Type: multipart/alternative;
 boundary="------------CB9FC5CFFBEB620947C34FF7"
Content-Language: en-US

--------------CB9FC5CFFBEB620947C34FF7
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 6/16/20 3:08 PM, Robert P. J. Day wrote:
> On Tue, 16 Jun 2020, Adrian Bunk wrote:
>
>> On Tue, Jun 16, 2020 at 06:36:50AM -0400, Robert P. J. Day wrote:
>>>   given the current flurry of python recipe cleanup, just want to
>>> verify a couple things that could/should be standardized.
>>>
>>>   first, HOMEPAGE values of the form:
>>>
>>>   https://pypi.python.org/pypi/astroid
>>>
>>> can be adjusted to reflect the result of the redirection, as in:
>>>
>>>   https://pypi.org/project/astroid
>>>
>>> also, as i read it, recipe HOMEPAGE values should *not* refer to the
>>> pypi page, as that is already set automatically by pypi.bbclass.
>>> rather, the HOMEPAGE should refer to the actual source home page,
>>> which in the case of the astroid package would be:
>>>
>>>   https://github.com/PyCQA/astroid
>>>
>>> does this make sense?
>> When the source is on github this is supposed to be linked from
>> PyPi.
>>
>> My personal impression is that meta data like the HOMEPAGE field is
>> usually poorly maintained, keeping an automatically set "good
>> enough" value (the PyPi link) would IMHO be the best default option.
>   i'm inclined to agree, but i will at least lay down some standards
> for a few people as to how to craft recipes from now on.

Beyond: http://www.openembedded.org/wiki/Styleguide ?
>
> rday
>
> 


--------------CB9FC5CFFBEB620947C34FF7
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/16/20 3:08 PM, Robert P. J. Day
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:alpine.LFD.2.21.2006161807070.7432@localhost.localdomain">
      <pre class="moz-quote-pre" wrap="">On Tue, 16 Jun 2020, Adrian Bunk wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, Jun 16, 2020 at 06:36:50AM -0400, Robert P. J. Day wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
  given the current flurry of python recipe cleanup, just want to
verify a couple things that could/should be standardized.

  first, HOMEPAGE values of the form:

  <a class="moz-txt-link-freetext" href="https://pypi.python.org/pypi/astroid">https://pypi.python.org/pypi/astroid</a>

can be adjusted to reflect the result of the redirection, as in:

  <a class="moz-txt-link-freetext" href="https://pypi.org/project/astroid">https://pypi.org/project/astroid</a>

also, as i read it, recipe HOMEPAGE values should *not* refer to the
pypi page, as that is already set automatically by pypi.bbclass.
rather, the HOMEPAGE should refer to the actual source home page,
which in the case of the astroid package would be:

  <a class="moz-txt-link-freetext" href="https://github.com/PyCQA/astroid">https://github.com/PyCQA/astroid</a>

does this make sense?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
When the source is on github this is supposed to be linked from
PyPi.

My personal impression is that meta data like the HOMEPAGE field is
usually poorly maintained, keeping an automatically set "good
enough" value (the PyPi link) would IMHO be the best default option.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
  i'm inclined to agree, but i will at least lay down some standards
for a few people as to how to craft recipes from now on.</pre>
    </blockquote>
    <br>
    Beyond: <a class="moz-txt-link-freetext" href="http://www.openembedded.org/wiki/Styleguide">http://www.openembedded.org/wiki/Styleguide</a> ?<br>
    <blockquote type="cite"
      cite="mid:alpine.LFD.2.21.2006161807070.7432@localhost.localdomain">
      <pre class="moz-quote-pre" wrap="">

rday
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CB9FC5CFFBEB620947C34FF7--
