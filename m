Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B795BD2F7C3
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:46:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1472.1764924404288694735
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:46:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VtiWaUmI;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477a1c28778so25475365e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 00:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764924403; x=1765529203; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNUO4O36S6o3XJCv+IAn7mml1qCYpL0iL7LVGBJiZfI=;
        b=VtiWaUmICgy0thaP19sFDODdGF9X0nGUK0zF1vG2/YLBWxxWx0AxqalrI3eASHx0oI
         myNxfViJgbLUlKn7213cSDnWcxOd09f/8xeXd5jmmoBS3gSwzsqP+/oktNKvwlTAXNTg
         nCHUjbzSqhg2+CXgrTZu2euFXnKzQvI8ADr8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764924403; x=1765529203;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rNUO4O36S6o3XJCv+IAn7mml1qCYpL0iL7LVGBJiZfI=;
        b=S4ihnY2qaCBk9gTGElKYw+LYmJYvov75Jq+JTcwzEHrjODjRczSB2Q8DdVGrrQfrB1
         9G3p+9TYtngj721sJ/swGKThxVnUAojO3D2F687yDu06eSN36yVJqmZhXdQw83Fg/ePT
         LkAGiOwjo0WFB3OBpguH/Vx8egjVo3MYYtvxnh8Huuyc9NhUyd8ndMdaybWGKf+KCCEk
         BJXCc0xcRWAJFugw/5LzsYTDvDSfHW8dZMj+D7N1SpeJHYkeHJ7BneF2Oyjyv2aD05eN
         E2fuSCeZHboahoh80KqNhRMuXtzuwlBvTZLReSMSkSFGp4og36s/SmNwZUAsFB+buUyc
         Mjfw==
X-Gm-Message-State: AOJu0YycbTyEGijyJgK5xRGe41P4ffZ3WtzI/vkUg2m85UlkTgh1k1tA
	5bKRYeYk+RbCC4d+uLXv6NeMc2tS6BvSXAeXSzcVcJbJ7Q6LMKREzMxkBe3YIYft+WXa1BKiOjf
	o1C9G
X-Gm-Gg: ASbGncuZvxSdDYzNEGGl3HhoHw0TErwGKZddeH8xAgHfhLmqiDGfub2kNDILKp0Hsjv
	LFFQH5yqvM8fYlLvEhpRM6wYXtIQ32fxERxPaHWtNjK2/reQ2NBeqHT1vx9db8YXIHQSrXIqjdB
	/CUMRbidH1fYZ0rFFfzj3p4APdbkiQ5zZ9QraWivPNToxbaSTQoEusGeIxZHQ+WzOlOip5gKT5X
	r22y2RJIEh7j360eOKnxz7d7t+kRCvyGyYbIjPFbh+FNxKOPd/t5dz/eKRfYLPNIUNs3RimA/Gb
	/K3WFBvCyca2ast4mJeOe5GUOkTrL1FfB/2t0lxqUIVboj35qLAFOJpqM1OHebWVK/+YXyCCQD+
	zNTh6YvBQvqgk2iaSTF+AyJwiMojCXN2lLDHZEMPobb/CQA7SR43RFm3yFBMHSxq6oEvAZx2h4t
	SB8QzkYCW9FaEbnNLH+g==
X-Google-Smtp-Source: AGHT+IHt+v59uiVrbzdbBiI2eg34Ds2d/O/XfUyy4Dg4fWZsi56iNCzmtrtltBBI4D87C68gWdPBTw==
X-Received: by 2002:a05:600c:1c27:b0:477:6e02:54a5 with SMTP id 5b1f17b1804b1-4792f387211mr51292815e9.18.1764924402538;
        Fri, 05 Dec 2025 00:46:42 -0800 (PST)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311ee44csm69759685e9.14.2025.12.05.00.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 00:46:42 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------6dC98OtF09dsaTA7Y1Qp0Yrz"
Message-ID: <80b703f2-5da1-46d0-8324-0dc9d72f450b@konsulko.com>
Date: Fri, 5 Dec 2025 10:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-autobahn: Upgrade 24.4.2 ->
 25.11.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251204102556.1702492-1-leon.anavi@konsulko.com>
 <20251204102556.1702492-2-leon.anavi@konsulko.com>
 <CAMKF1spvg6nB_qZAG17ZbJnn=v-MswWeLTXvz-8Ab-kkqSt=MQ@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1spvg6nB_qZAG17ZbJnn=v-MswWeLTXvz-8Ab-kkqSt=MQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 08:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122343

This is a multi-part message in MIME format.
--------------6dC98OtF09dsaTA7Y1Qp0Yrz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 12/5/25 00:18, Khem Raj wrote:
> I am seeing
>
> stdio: WARNING: python3-autobahn-25.11.1-r0 do_check_backend: QA 
> Issue: inherits setuptools3 but has pyproject.toml with 
> setuptools.build_meta, use the correct class [pep517-backend]
>
> While at it, Would you address this as well please?

Yes, of course. Sorry, I didn't notice the warning at first. I have just 
sent v2 of the patch.

Btw thank you for your presentation at the Yocto Virtual Summit 2025.12 
yesterday and for sharing your insights and perspectives during the 
informal discussions afterward. I really enjoyed it.

Best regards,
Leon

>
> On Thu, Dec 4, 2025 at 2:26 AM Leon Anavi via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>
>     Upgrade to release 25.11.1:
>
>     - WAMP Flatbuffers serialization test coverage; WAMP message
>       classes refactoring
>     - Add WAMP serdes functional and benchmark testing;
>       WAMP-Flatbuffers; WAMP Serializer Composition (transport/payload)
>     - Add vendored Flatbuffers
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>     ---
>      .../{python3-autobahn_24.4.2.bb
>     <http://python3-autobahn_24.4.2.bb> => python3-autobahn_25.11.1.bb
>     <http://python3-autobahn_25.11.1.bb>} | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>      rename
>     meta-python/recipes-devtools/python/{python3-autobahn_24.4.2.bb
>     <http://python3-autobahn_24.4.2.bb> => python3-autobahn_25.11.1.bb
>     <http://python3-autobahn_25.11.1.bb>} (84%)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
>     <http://python3-autobahn_24.4.2.bb>
>     b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
>     <http://python3-autobahn_25.11.1.bb>
>     similarity index 84%
>     rename from
>     meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
>     <http://python3-autobahn_24.4.2.bb>
>     rename to
>     meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
>     <http://python3-autobahn_25.11.1.bb>
>     index d785a76cc7..69613313d7 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
>     <http://python3-autobahn_24.4.2.bb>
>     +++
>     b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
>     <http://python3-autobahn_25.11.1.bb>
>     @@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
>      LICENSE = "MIT"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
>
>     -SRC_URI[sha256sum] =
>     "a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9"
>     +SRC_URI[sha256sum] =
>     "52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1"
>
>      inherit pypi setuptools3
>
>     -- 
>     2.47.3
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#122316):
>     https://lists.openembedded.org/g/openembedded-devel/message/122316
>     Mute This Topic: https://lists.openembedded.org/mt/116609979/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
--------------6dC98OtF09dsaTA7Y1Qp0Yrz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Khem,</p>
    <div class="moz-cite-prefix">On 12/5/25 00:18, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1spvg6nB_qZAG17ZbJnn=v-MswWeLTXvz-8Ab-kkqSt=MQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">I am seeing
        <div><br>
        </div>
        <div>stdio: WARNING: python3-autobahn-25.11.1-r0
          do_check_backend: QA Issue: inherits setuptools3 but has
          pyproject.toml with setuptools.build_meta, use the correct
          class [pep517-backend]<br>
        </div>
        <div><br>
        </div>
        <div>While at it, Would you address this as well please?</div>
      </div>
    </blockquote>
    <br>
    Yes, of course. Sorry, I didn't notice the warning at first. I have
    just sent v2 of the patch.<br>
    <br>
    Btw thank you for your presentation at the Yocto Virtual Summit
    2025.12 yesterday and for sharing your insights and perspectives
    during the informal discussions afterward. I really enjoyed it.<br>
    <br>
    Best regards,<br>
    Leon<br>
    <br>
    <blockquote type="cite"
cite="mid:CAMKF1spvg6nB_qZAG17ZbJnn=v-MswWeLTXvz-8Ab-kkqSt=MQ@mail.gmail.com"><br>
      <div class="gmail_quote gmail_quote_container">
        <div dir="ltr" class="gmail_attr">On Thu, Dec 4, 2025 at 2:26 AM
          Leon Anavi via <a href="http://lists.openembedded.org"
            moz-do-not-send="true">lists.openembedded.org</a>
          &lt;leon.anavi=<a
            href="mailto:konsulko.com@lists.openembedded.org"
            moz-do-not-send="true" class="moz-txt-link-freetext">konsulko.com@lists.openembedded.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade
          to release 25.11.1:<br>
          <br>
          - WAMP Flatbuffers serialization test coverage; WAMP message<br>
            classes refactoring<br>
          - Add WAMP serdes functional and benchmark testing;<br>
            WAMP-Flatbuffers; WAMP Serializer Composition
          (transport/payload)<br>
          - Add vendored Flatbuffers<br>
          <br>
          Signed-off-by: Leon Anavi &lt;<a
            href="mailto:leon.anavi@konsulko.com" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">leon.anavi@konsulko.com</a>&gt;<br>
          ---<br>
           .../{<a href="http://python3-autobahn_24.4.2.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">python3-autobahn_24.4.2.bb</a>
          =&gt; <a href="http://python3-autobahn_25.11.1.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">python3-autobahn_25.11.1.bb</a>}
          | 2 +-<br>
           1 file changed, 1 insertion(+), 1 deletion(-)<br>
           rename meta-python/recipes-devtools/python/{<a
            href="http://python3-autobahn_24.4.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3-autobahn_24.4.2.bb</a>
          =&gt; <a href="http://python3-autobahn_25.11.1.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">python3-autobahn_25.11.1.bb</a>}
          (84%)<br>
          <br>
          diff --git a/meta-python/recipes-devtools/python/<a
            href="http://python3-autobahn_24.4.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3-autobahn_24.4.2.bb</a>
          b/meta-python/recipes-devtools/python/<a
            href="http://python3-autobahn_25.11.1.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3-autobahn_25.11.1.bb</a><br>
          similarity index 84%<br>
          rename from meta-python/recipes-devtools/python/<a
            href="http://python3-autobahn_24.4.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3-autobahn_24.4.2.bb</a><br>
          rename to meta-python/recipes-devtools/python/<a
            href="http://python3-autobahn_25.11.1.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3-autobahn_25.11.1.bb</a><br>
          index d785a76cc7..69613313d7 100644<br>
          --- a/meta-python/recipes-devtools/python/<a
            href="http://python3-autobahn_24.4.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3-autobahn_24.4.2.bb</a><br>
          +++ b/meta-python/recipes-devtools/python/<a
            href="http://python3-autobahn_25.11.1.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3-autobahn_25.11.1.bb</a><br>
          @@ -3,7 +3,7 @@ HOMEPAGE = "<a
            href="http://crossbar.io/autobahn" rel="noreferrer"
            target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">http://crossbar.io/autobahn</a>"<br>
           LICENSE = "MIT"<br>
           LIC_FILES_CHKSUM =
          <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40">"file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"</a><br>
          <br>
          -SRC_URI[sha256sum] =
          "a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9"<br>
          +SRC_URI[sha256sum] =
          "52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1"<br>
          <br>
           inherit pypi setuptools3<br>
          <br>
          -- <br>
          2.47.3<br>
          <br>
          <br>
          -=-=-=-=-=-=-=-=-=-=-=-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#122316): <a
href="https://lists.openembedded.org/g/openembedded-devel/message/122316"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/message/122316</a><br>
          Mute This Topic: <a
            href="https://lists.openembedded.org/mt/116609979/1997914"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://lists.openembedded.org/mt/116609979/1997914</a><br>
          Group Owner: <a
href="mailto:openembedded-devel%2Bowner@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">openembedded-devel+owner@lists.openembedded.org</a><br>
          Unsubscribe: <a
href="https://lists.openembedded.org/g/openembedded-devel/unsub"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
          [<a href="mailto:raj.khem@gmail.com" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">raj.khem@gmail.com</a>]<br>
          -=-=-=-=-=-=-=-=-=-=-=-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------6dC98OtF09dsaTA7Y1Qp0Yrz--

