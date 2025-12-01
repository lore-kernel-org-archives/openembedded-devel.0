Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4CAD116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 14:06:10 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22087.1764597968362883502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 06:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Zu+34U8/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso23545505e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 06:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764597967; x=1765202767; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHomkEjXh1rvAfhutOMBTDe4wvTF4XOGjUETGbwHs9I=;
        b=Zu+34U8/hgVgxJeJorpuI2Oox3Cubd8f+cwP0bmgkB7dll8tpru7G92L9vLEHvOAnV
         g4alovbinfABgaAGHqydcG7k5oCnQFGxqgsigLzP1TehestT+gst0kMIY1RUpcLy9uCR
         yTHZ6VuPJkB+7Ldgs+Oq25aIY5yDFMNwI4xU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764597967; x=1765202767;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHomkEjXh1rvAfhutOMBTDe4wvTF4XOGjUETGbwHs9I=;
        b=MwtDiamoZ9frkC0EAF0BWi782aTmFExWq456l4/3dh05y5HsEZRiSkayafsOxkpu6c
         4V6ywJX7Mcev1yvDWBcqcqKRqhqnF5TZGkR6vWas/uQi49EypKs0nk00kOzBdYGKGQXn
         5tIjdoRXM7iPSjfZSMop0/tpFRQ3mMYC0hFgsFMYe2kLF2MMyqppigcejIANDdBQDRe8
         D8M5LT9VQSTcQEe/SwfJQjqskctWnh77AlNisy/+jbSuwOeEbwWqdO3vQBSDKwvA0xnQ
         eAhOlA7YGdD/WjIf0/PhOYn2f/8BbgRL/hBT0qdWaYvhiIivPQJQ2UMqBnLxL0fKx5Cf
         HFjQ==
X-Gm-Message-State: AOJu0Ywczmkng4eliUfiVb5XlNz5wfE5GSJWRuYIUMYvgWCg9bhWASwL
	7T5VaP5tSMYprsHvtgZGnyNCwrIoDHDUNLqKfydDthKdkAfcmfDhue1sSNwXCqmVWNs=
X-Gm-Gg: ASbGncsRa6/Of7F2RpBkzgXTeoCCbSqvEQjA4JbE0/YB2LX1A/WukbgtttTzJlp27Sw
	yRNUSPIwgh+FYRsFi5av5jr7lwcyg+y4hikMD47aCve/1R9BrDWDIW0TIRjAQ3s8teNerrE29IJ
	cBLj4js0KSYC1IpVxhPBcG9r4Jn7rr8Zjyy68ey/qY3JgfxGW4UrqFABXHGNlKM+mqL2MVaeTtP
	Z6NNuPdpEN4cDt6MjYf3HCoDSqbCaJzBofzkrZmo6cyx3OWyuCkaJijPEGWil6eVKgAabM7ll0x
	FZ5zjtMo1qBHT4a5tsAIbzUTRmmBUIZbQC0VtqD8PCl5W230DKtyUbcR+z2i4iUWvw0qTL8dI6e
	AP+fdTrnyMV2e6tVsgPzVSbVS2TH7f43viPx/ghvEl3qJ8Pzi6JXKrRmTrpl8sNrMhgEC1UC79j
	rSxLrb1w6LRUeKMHYD0sr5qvbMjLIs
X-Google-Smtp-Source: AGHT+IGMo0rexo8Zcn3t/A3f9mXZs9k2GkkQ6b3XJZ+2TQGLnQGJc52FV7XkjTEy2TiXorpt25MXoQ==
X-Received: by 2002:a05:600c:470a:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-477c10d49b5mr328097095e9.10.1764597966366;
        Mon, 01 Dec 2025 06:06:06 -0800 (PST)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add608bsm308265025e9.5.2025.12.01.06.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 06:06:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------v0nUp6koQxwiRAWkTwPJeVZq"
Message-ID: <c185456d-2ba0-42d0-a7e5-40e62c990aeb@konsulko.com>
Date: Mon, 1 Dec 2025 16:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-gast: Upgrade 0.6.0 ->
 0.7.0
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
References: <20251201112044.369630-1-leon.anavi@konsulko.com>
 <CAMSfU+5Os9gORnytMLrutAK6sbEtJYbxVLn6RaVL+aTYsajwAQ@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMSfU+5Os9gORnytMLrutAK6sbEtJYbxVLn6RaVL+aTYsajwAQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 14:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122210

This is a multi-part message in MIME format.
--------------v0nUp6koQxwiRAWkTwPJeVZq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yoann,

On 12/1/25 15:21, Yoann Congal wrote:
>
>
> Le lun. 1 déc. 2025 à 12:20, Leon Anavi via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <leon.anavi=konsulko.com@lists.openembedded.org> a écrit :
>
>     Upgrade to release 0.7.0:
>
>     - Update unparser to harmonize output across revisions and handle
>       python 3.12+ features
>     - Fix support for TypeVar, TypeVarTupe and ParamSpec￼
>
>
> FYI, there is a weird unicode character at the end of this line ^

Hm, yes, there was something wrong.

>
> I don't know if that is a problem or not...

I removed the weird unicode character and I sent v2 of the patch. Thank 
you for reporting this issues. We better keep the git history nice and 
tidy :)

Best regards,
Leon

>     - Support t-string from python 3.14
>     - Adjust test incompatible with py2
>     - Support _field_types field for every AST class
>     - Make gast.dump more generic across python version
>     - Only pass existing attributes as keyword parameters in gast_to_ast
>     - Initial oss-fuzz integration
>     - Support [g]ast.get_source_segment
>     - Fix gast.get_docstring implementation
>     - Initialize ast node with known fields to avoid deprecation warning
>       in Python 3.13
>     - Add missing type_params attribute for ClassDef node before
>       Python 3.12
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>     ---
>      .../python/{python3-gast_0.6.0.bb <http://python3-gast_0.6.0.bb>
>     => python3-gast_0.7.0.bb <http://python3-gast_0.7.0.bb>}    | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>      rename meta-python/recipes-devtools/python/{python3-gast_0.6.0.bb
>     <http://python3-gast_0.6.0.bb> => python3-gast_0.7.0.bb
>     <http://python3-gast_0.7.0.bb>} (78%)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
>     <http://python3-gast_0.6.0.bb>
>     b/meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
>     <http://python3-gast_0.7.0.bb>
>     similarity index 78%
>     rename from
>     meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
>     <http://python3-gast_0.6.0.bb>
>     rename to
>     meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
>     <http://python3-gast_0.7.0.bb>
>     index af46c3feb7..93301f0943 100644
>     --- a/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
>     <http://python3-gast_0.6.0.bb>
>     +++ b/meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
>     <http://python3-gast_0.7.0.bb>
>     @@ -4,7 +4,7 @@ SECTION = "devel/python"
>      LICENSE = "BSD-3-Clause"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
>
>     -SRC_URI[sha256sum] =
>     "88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb"
>     +SRC_URI[sha256sum] =
>     "0bb14cd1b806722e91ddbab6fb86bba148c22b40e7ff11e248974e04c8adfdae"
>
>      inherit pypi setuptools3
>
>     -- 
>     2.47.3
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#122202):
>     https://lists.openembedded.org/g/openembedded-devel/message/122202
>     Mute This Topic: https://lists.openembedded.org/mt/116554099/4316185
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [yoann.congal@smile.fr]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> -- 
> Yoann Congal
> Smile ECS
--------------v0nUp6koQxwiRAWkTwPJeVZq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Yoann,</p>
    <div class="moz-cite-prefix">On 12/1/25 15:21, Yoann Congal wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMSfU+5Os9gORnytMLrutAK6sbEtJYbxVLn6RaVL+aTYsajwAQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">Le lun. 1 déc. 2025 à 12:20,
            Leon Anavi via <a href="http://lists.openembedded.org"
              moz-do-not-send="true">lists.openembedded.org</a>
            &lt;leon.anavi=<a
              href="mailto:konsulko.com@lists.openembedded.org"
              moz-do-not-send="true" class="moz-txt-link-freetext">konsulko.com@lists.openembedded.org</a>&gt;
            a écrit :<br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade
            to release 0.7.0:<br>
            <br>
            - Update unparser to harmonize output across revisions and
            handle<br>
              python 3.12+ features<br>
            - Fix support for TypeVar, TypeVarTupe and ParamSpec￼<br>
          </blockquote>
          <div><br>
          </div>
          <div>FYI, there is a weird unicode character at the end of
            this line ^</div>
        </div>
      </div>
    </blockquote>
    <p>Hm, yes, there was something wrong.</p>
    <blockquote type="cite"
cite="mid:CAMSfU+5Os9gORnytMLrutAK6sbEtJYbxVLn6RaVL+aTYsajwAQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div><br>
          </div>
          <div>I don't know if that is a problem or not...</div>
        </div>
      </div>
    </blockquote>
    <p>I removed the weird unicode character and I sent v2 of the patch.
      Thank you for reporting this issues. We better keep the git
      history nice and tidy :)<br>
      <br>
      Best regards,<br>
      Leon</p>
    <blockquote type="cite"
cite="mid:CAMSfU+5Os9gORnytMLrutAK6sbEtJYbxVLn6RaVL+aTYsajwAQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div> </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            - Support t-string from python 3.14<br>
            - Adjust test incompatible with py2<br>
            - Support _field_types field for every AST class<br>
            - Make gast.dump more generic across python version<br>
            - Only pass existing attributes as keyword parameters in
            gast_to_ast<br>
            - Initial oss-fuzz integration<br>
            - Support [g]ast.get_source_segment<br>
            - Fix gast.get_docstring implementation<br>
            - Initialize ast node with known fields to avoid deprecation
            warning<br>
              in Python 3.13<br>
            - Add missing type_params attribute for ClassDef node before<br>
              Python 3.12<br>
            <br>
            Signed-off-by: Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">leon.anavi@konsulko.com</a>&gt;<br>
            ---<br>
             .../python/{<a href="http://python3-gast_0.6.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-gast_0.6.0.bb</a>
            =&gt; <a href="http://python3-gast_0.7.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-gast_0.7.0.bb</a>} 
               | 2 +-<br>
             1 file changed, 1 insertion(+), 1 deletion(-)<br>
             rename meta-python/recipes-devtools/python/{<a
              href="http://python3-gast_0.6.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-gast_0.6.0.bb</a>
            =&gt; <a href="http://python3-gast_0.7.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-gast_0.7.0.bb</a>}
            (78%)<br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a
              href="http://python3-gast_0.6.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-gast_0.6.0.bb</a>
            b/meta-python/recipes-devtools/python/<a
              href="http://python3-gast_0.7.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-gast_0.7.0.bb</a><br>
            similarity index 78%<br>
            rename from meta-python/recipes-devtools/python/<a
              href="http://python3-gast_0.6.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-gast_0.6.0.bb</a><br>
            rename to meta-python/recipes-devtools/python/<a
              href="http://python3-gast_0.7.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-gast_0.7.0.bb</a><br>
            index af46c3feb7..93301f0943 100644<br>
            --- a/meta-python/recipes-devtools/python/<a
              href="http://python3-gast_0.6.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-gast_0.6.0.bb</a><br>
            +++ b/meta-python/recipes-devtools/python/<a
              href="http://python3-gast_0.7.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-gast_0.7.0.bb</a><br>
            @@ -4,7 +4,7 @@ SECTION = "devel/python"<br>
             LICENSE = "BSD-3-Clause"<br>
             LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90">"file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"</a><br>
            <br>
            -SRC_URI[sha256sum] =
            "88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb"<br>
            +SRC_URI[sha256sum] =
            "0bb14cd1b806722e91ddbab6fb86bba148c22b40e7ff11e248974e04c8adfdae"<br>
            <br>
             inherit pypi setuptools3<br>
            <br>
            -- <br>
            2.47.3<br>
            <br>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#122202): <a
href="https://lists.openembedded.org/g/openembedded-devel/message/122202"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/message/122202</a><br>
            Mute This Topic: <a
              href="https://lists.openembedded.org/mt/116554099/4316185"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/mt/116554099/4316185</a><br>
            Group Owner: <a
href="mailto:openembedded-devel%2Bowner@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">openembedded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a
href="https://lists.openembedded.org/g/openembedded-devel/unsub"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href="mailto:yoann.congal@smile.fr" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">yoann.congal@smile.fr</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
        <div><br clear="all">
        </div>
        <br>
        <span class="gmail_signature_prefix">-- </span><br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr"><font face="Raleway, regular">Yoann Congal</font>
            <div><font face="Raleway, regular">Smile ECS</font></div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------v0nUp6koQxwiRAWkTwPJeVZq--

