Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CACCCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 08:15:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.10081.1760429716916102675
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 01:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R+yM4tp1;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso3123280f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 01:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1760429715; x=1761034515; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLhnqx51asZ66JSRZzjWRCaEz6tJvgJd6tfGku9VdUI=;
        b=R+yM4tp1pkSP4HVJOI/1k39LtK1vsYc22fIv2pzzGDOPkUG1xGz/Ws196Z+4yMCrOD
         MU+3RSEhkJcor8fnUy240zWzqRl7FFUmmDQFp/9fs8JL4frHdE3Rwao7VG2d4GAx6DjO
         iAZB0i5NrVtX7czT1A5oxqbIBV6+3GvrcneMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429715; x=1761034515;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uLhnqx51asZ66JSRZzjWRCaEz6tJvgJd6tfGku9VdUI=;
        b=D+GtuQ2r6ILwLrUSvenFLizMzUTQ4aEp/ffwfO2C7kslA0WZ1didKwXxiOfySRLVWO
         Dmt+gkOaL4wCnNOAM7sdbRxsVOIJWQ+kjalu5anTBwdmWqdon1Pi3CZXqvTXRjN0z9ZK
         NthRR6SbSgOLdfYyklfdD4/V2JPV0fI+s8zHSlC3l6nfmax3/3Y94bqvuQH3n5my1vMQ
         8JWORsx8RIzY+LCbz5969ggltCghWjMpLUG7CYx/19MkalLALzV1oD57zegevqq95mih
         aR37o212N172CQUlVplPJWIMzJMTa1V8FZUdBwOq57OYzQUZLm62V6KC3SHsBkrbXZbY
         RKdA==
X-Gm-Message-State: AOJu0YydG62+ekcG6cM4V72CWGoxf3+efjfnXyh0XJXQYuHYI0JOjUMf
	nM19/9GlTq3ERQOe7DzV3Oa30XQJE+MxJVbAD2yVHFfr8FkeG6gz6woDEbTWcjCqe8Y=
X-Gm-Gg: ASbGncu/VBE8bTsh8dxdb89u8DG1qhnoHqn9Hn4LNkjZXmP/PlqXjPHNT13dYAd/yHV
	jEicw0nrvhNfYcNEj3sb25/cgn40Uc+bVD6AqFDtaRMdj2Ey/wztkOqNSlKR38BXZ2J49EMisoY
	1l20zBS8sL26taVrglwC7Y5BE8YNFmAV83uADbO8exYw5jCqKGrTpCyW64NrTOSYW9jaTICyimH
	0thuY4JyROE65ST2Gp+RBtAm1MKU+SuyKDjBd0xtbJ9lbbdsF/J+lJl+PoQrvFl02bdgp8WLPWi
	hl5fdJVv5SL//UZ4tt8F6bCD1jz/4ZMrc7IIzu2d5ZLpj+ixjJZVB9FytJVFKJ3FdyPpUfCkRdO
	FVUUFm0UaC3UrUdIWGq3Gs+rPzi94in1WEFIVCW6D3LsPOEda
X-Google-Smtp-Source: AGHT+IH1p4Ca3EombqMOAKDWYs9lFXvl80jrIss/kAojSMUf9uo81ohq+AMVhmyPNKx8TGMCb9/N+w==
X-Received: by 2002:a05:6000:2305:b0:3e9:b7a5:5dc9 with SMTP id ffacd0b85a97d-4266e7d6bb2mr14366717f8f.23.1760429713426;
        Tue, 14 Oct 2025 01:15:13 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5825aasm21963013f8f.14.2025.10.14.01.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:15:12 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------IEyzzTNU60iqrFQcjgb0GIQg"
Message-ID: <238e053a-f270-46ff-9976-2c1830b772b1@konsulko.com>
Date: Tue, 14 Oct 2025 11:15:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 4/4] pydantic: Upgrade 2.11.7 -> 2.12.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251013131725.2583786-1-leon.anavi@konsulko.com>
 <20251013131725.2583786-4-leon.anavi@konsulko.com>
 <CAMKF1sqG+hC0F5tiH8drCVocT3V4O54UrhV6=x_b9DD4qvy+Og@mail.gmail.com>
 <CAMKF1soJ5_bZi+k6C9DbBTfnSLTJ4Z3B4tA=44TL5TKby8omjg@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1soJ5_bZi+k6C9DbBTfnSLTJ4Z3B4tA=44TL5TKby8omjg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 08:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120557

This is a multi-part message in MIME format.
--------------IEyzzTNU60iqrFQcjgb0GIQg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 10/14/25 07:27, Khem Raj wrote:
> On Mon, Oct 13, 2025 at 9:12 PM Khem Raj<raj.khem@gmail.com> wrote:
>> On Mon, Oct 13, 2025 at 6:17 AM Leon Anavi via lists.openembedded.org
>> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>>> Upgrade to release 2.12.0:
>>>
>>> - Update V1 copy to v1.10.24
>>> - Add extra parameter to the validate functions
>>> - Add exclude_computed_fields serialization option
>>> - Add preverse_empty_path URL options
>>> - Add union_format parameter to JSON Schema generation
>>> - Add __qualname__ parameter for create_model
>>> - Do not try to infer name from lambda definitions in pipelines API
>>> - Use proper namespace for functions in TypeAdapter
>>> - Use Any for context type annotation in TypeAdapter
>>> - Expose FieldInfo in pydantic.fields.__all__
>>> - Respect validation_alias in @validate_call
>>> - Use Any as context annotation in plugin API
>>> - Use proper stacklevel in warnings when possible
>>>
>> We need to fix python3-lief recipe as to reflect this dependency as
>> well. It currently has a patch that only handles 2.11
>> there is upgrade for lief module available too, please address that
>> recipe along with this change set as well.
> Well, I got hold of it. patches are on ml
Thank you for taking care of the related python3-lief upgrade. Thanks, Leon
>
>>> Signed-off-by: Leon Anavi<leon.anavi@konsulko.com>
>>> ---
>>>   .../{python3-pydantic_2.11.7.bb => python3-pydantic_2.12.0.bb}  | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>   rename meta-python/recipes-devtools/python/{python3-pydantic_2.11.7.bb => python3-pydantic_2.12.0.bb} (97%)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
>>> similarity index 97%
>>> rename from meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
>>> rename to meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
>>> index e603e7dccd..8016b55dfe 100644
>>> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
>>> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
>>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM ="file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
>>>
>>>   inherit python_hatchling ptest-python-pytest
>>>
>>> -SRCREV = "9b52422377d974ffc3de4e8b0bf7faab1acf2ec4"
>>> +SRCREV = "a7928e692e5a7841c4379d1af1fd37966941dade"
>>>   PV .= "+git"
>>>   SRC_URI ="git://github.com/pydantic/pydantic;protocol=https;branch=main"
>>>   DEPENDS += "python3-hatch-fancy-pypi-readme-native"
>>> --
>>> 2.47.3
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#120531):https://lists.openembedded.org/g/openembedded-devel/message/120531
>>> Mute This Topic:https://lists.openembedded.org/mt/115733948/1997914
>>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
--------------IEyzzTNU60iqrFQcjgb0GIQg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Khem,</p>
    <div class="moz-cite-prefix">On 10/14/25 07:27, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1soJ5_bZi+k6C9DbBTfnSLTJ4Z3B4tA=44TL5TKby8omjg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Mon, Oct 13, 2025 at 9:12 PM Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On Mon, Oct 13, 2025 at 6:17 AM Leon Anavi via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi=konsulko.com@lists.openembedded.org">&lt;leon.anavi=konsulko.com@lists.openembedded.org&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
Upgrade to release 2.12.0:

- Update V1 copy to v1.10.24
- Add extra parameter to the validate functions
- Add exclude_computed_fields serialization option
- Add preverse_empty_path URL options
- Add union_format parameter to JSON Schema generation
- Add __qualname__ parameter for create_model
- Do not try to infer name from lambda definitions in pipelines API
- Use proper namespace for functions in TypeAdapter
- Use Any for context type annotation in TypeAdapter
- Expose FieldInfo in pydantic.fields.__all__
- Respect validation_alias in @validate_call
- Use Any as context annotation in plugin API
- Use proper stacklevel in warnings when possible

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
We need to fix python3-lief recipe as to reflect this dependency as
well. It currently has a patch that only handles 2.11
there is upgrade for lief module available too, please address that
recipe along with this change set as well.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, I got hold of it. patches are on ml</pre>
    </blockquote>
    Thank you for taking care of the related <span
    style="white-space: pre-wrap">python3-lief upgrade.

Thanks,
Leon</span>
    <blockquote type="cite"
cite="mid:CAMKF1soJ5_bZi+k6C9DbBTfnSLTJ4Z3B4tA=44TL5TKby8omjg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
---
 .../{python3-pydantic_2.11.7.bb =&gt; python3-pydantic_2.12.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.11.7.bb =&gt; python3-pydantic_2.12.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
index e603e7dccd..8016b55dfe 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6">"file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"</a>

 inherit python_hatchling ptest-python-pytest

-SRCREV = "9b52422377d974ffc3de4e8b0bf7faab1acf2ec4"
+SRCREV = "a7928e692e5a7841c4379d1af1fd37966941dade"
 PV .= "+git"
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="git://github.com/pydantic/pydantic;protocol=https;branch=main">"git://github.com/pydantic/pydantic;protocol=https;branch=main"</a>
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
--
2.47.3


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#120531): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/120531">https://lists.openembedded.org/g/openembedded-devel/message/120531</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115733948/1997914">https://lists.openembedded.org/mt/115733948/1997914</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------IEyzzTNU60iqrFQcjgb0GIQg--

