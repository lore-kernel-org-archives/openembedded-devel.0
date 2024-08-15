Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C1AC3DA7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 09:17:58 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.118901.1723713461567005680
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 02:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=psLymQdY;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso888419a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723713460; x=1724318260; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6g8/VIYs3kHThQ0W+9zh44uTEh0Tgfpz0u5eUUrv4E=;
        b=psLymQdY9aj1IgtikI+ydOjGu0lLxlPoNtLLMZLEfF6LetlQA7afrxGQnX7G9UNSa8
         iJSuKh7JT01XxxKwNNI9BuQDptKp4RVTLAGHRyAv0UEGpHGcQADl1sa1Kak8D+Ac4+Ta
         iSdsd49QOIqvfPdEp4y6KxaeVdcc+Dbr4usws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723713460; x=1724318260;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M6g8/VIYs3kHThQ0W+9zh44uTEh0Tgfpz0u5eUUrv4E=;
        b=wTTgfCeppLFWuvmfMhjcBYIElun5faX6pCg3r3jMClWietZH7oEUDUgNIBpCNYShQC
         q5yt++uljka+g20UfAThjddH/DNyJAGj6qHXBIHNFM4YGZdklaI5EEpyeV1COQQipevK
         iZp1LEhNYJCWs46+XLx78b6duXCnf8XNdTWqrc0Y55UzbMWhAPQqRybwQ+7tpsrA95yt
         xIsPbkwbo6KL6mtyVIviewgFw+xzksNIlACOYBKPgTffAjxcSxqK0nzdVpjXOF2VAVow
         XWr2bCPs9E9scs8o7MudbLgsr2ZMIUNeApdPeKVHuzeUm6beC+2ISNzf583wDFOBD5UU
         FPRw==
X-Gm-Message-State: AOJu0YzSHt1S+E1qWZKuz9dPaJ6KmUaS9zRewrxNPnYVClboTgKflDho
	y3Eiro/nsZ9iBHjq8T8glbPogxBZ+PxDQT/FSvOzlKq6zxklqBLVisA4hfKaHMk=
X-Google-Smtp-Source: AGHT+IFQIbJr95ENIldHRUjtSj6YhkpmexWQWFWVQEisxAT1jZzY2rZxm9gbeMa2dc6ZrLUxAUTOtQ==
X-Received: by 2002:a50:cc4c:0:b0:5be:ae21:33a8 with SMTP id 4fb4d7f45d1cf-5beae213573mr2090530a12.2.1723713459536;
        Thu, 15 Aug 2024 02:17:39 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbbe2734sm640761a12.2.2024.08.15.02.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 02:17:39 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------cVqVzTdNKi1cHmkBlu1WNoEg"
Message-ID: <59c7125c-487a-49b4-bba2-61fd40f6e6f1@konsulko.com>
Date: Thu, 15 Aug 2024 12:17:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-fastjsonschema: Upgrade
 2.18.0 -> 2.20.0
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240814115435.808089-1-leon.anavi@konsulko.com>
 <20240814115435.808089-3-leon.anavi@konsulko.com>
 <CANx9H-C0d3GXgyZrfc_S1MgHK76fKUT792Js==VUyPwZoLnvpQ@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CANx9H-C0d3GXgyZrfc_S1MgHK76fKUT792Js==VUyPwZoLnvpQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 09:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111821

This is a multi-part message in MIME format.
--------------cVqVzTdNKi1cHmkBlu1WNoEg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tim,

On 15.08.24 г. 4:59 ч., Tim Orling wrote:
> Did you double check the tests are included in the sdist tarball? That 
> is why it was git fetcher.

Yes, fastjsonschema-2.20.0.tar.gz includes directory "tests".
>
> In other words did you build meta-Python-image-ptest-python3-fastjson 
> and run -c testimage?
No, but I tested manually with core-image-minimal that includes 
python3-fastjsonschema.

Best regards,
Leon

>
> On Wed, Aug 14, 2024 at 4:54 AM Leon Anavi via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>
>     Upgrade to release 2.20.0. Added validations at compile time:
>
>     - required must have unique items
>     - checking if schema is not allowing required items (item is
>       required, but is not listed in properties)
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>     ---
>      ...jsonschema_2.18.0.bb <http://jsonschema_2.18.0.bb> =>
>     python3-fastjsonschema_2.20.0.bb
>     <http://python3-fastjsonschema_2.20.0.bb>} | 5 +----
>      1 file changed, 1 insertion(+), 4 deletions(-)
>      rename
>     meta-python/recipes-devtools/python/{python3-fastjsonschema_2.18.0.bb
>     <http://python3-fastjsonschema_2.18.0.bb> =>
>     python3-fastjsonschema_2.20.0.bb
>     <http://python3-fastjsonschema_2.20.0.bb>} (84%)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
>     <http://python3-fastjsonschema_2.18.0.bb>
>     b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
>     <http://python3-fastjsonschema_2.20.0.bb>
>     similarity index 84%
>     rename from
>     meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
>     <http://python3-fastjsonschema_2.18.0.bb>
>     rename to
>     meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
>     <http://python3-fastjsonschema_2.20.0.bb>
>     index b2e969c5c..0524a73b6 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
>     <http://python3-fastjsonschema_2.18.0.bb>
>     +++
>     b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
>     <http://python3-fastjsonschema_2.20.0.bb>
>     @@ -6,15 +6,12 @@ HOMEPAGE =
>     "https://github.com/seznam/python-fastjsonschema"
>      LICENSE = "BSD-3-Clause"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
>
>     -SRCREV = "756540088687cda351390f687b92e602feaa7dc6"
>     -PYPI_SRC_URI =
>     "git://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master
>     <http://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master>"
>     +SRC_URI[sha256sum] =
>     "3d48fc5300ee96f5d116f10fe6f28d938e6008f59a6a025c2649475b87f76a23"
>
>      SRC_URI += "file://run-ptest"
>
>      inherit ptest pypi setuptools3
>
>     -S = "${WORKDIR}/git"
>     -
>      do_install_ptest() {
>             install -d ${D}${PTEST_PATH}/tests
>             cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>     -- 
>     2.39.2
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#111803):
>     https://lists.openembedded.org/g/openembedded-devel/message/111803
>     Mute This Topic: https://lists.openembedded.org/mt/107893158/924729
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [ticotimo@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
--------------cVqVzTdNKi1cHmkBlu1WNoEg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Tim,<br>
    </p>
    <div class="moz-cite-prefix">On 15.08.24 г. 4:59 ч., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANx9H-C0d3GXgyZrfc_S1MgHK76fKUT792Js==VUyPwZoLnvpQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">Did you double check the tests are included in the
        sdist tarball? That is why it was git fetcher.</div>
    </blockquote>
    <br>
    Yes, fastjsonschema-2.20.0.tar.gz includes directory "tests".<br>
    <blockquote type="cite"
cite="mid:CANx9H-C0d3GXgyZrfc_S1MgHK76fKUT792Js==VUyPwZoLnvpQ@mail.gmail.com">
      <div dir="auto"><br>
      </div>
      <div dir="auto">In other words did you build
        meta-Python-image-ptest-python3-fastjson and run -c testimage?</div>
    </blockquote>
    No, but I tested manually with core-image-minimal that includes
    python3-fastjsonschema.<br>
    <br>
    Best regards,<br>
    Leon<br>
    <br>
    <blockquote type="cite"
cite="mid:CANx9H-C0d3GXgyZrfc_S1MgHK76fKUT792Js==VUyPwZoLnvpQ@mail.gmail.com">
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Aug 14, 2024 at
            4:54 AM Leon Anavi via <a
              href="http://lists.openembedded.org"
              moz-do-not-send="true">lists.openembedded.org</a>
            &lt;leon.anavi=<a
              href="mailto:konsulko.com@lists.openembedded.org"
              moz-do-not-send="true" class="moz-txt-link-freetext">konsulko.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Upgrade
            to release 2.20.0. Added validations at compile time:<br>
            <br>
            - required must have unique items<br>
            - checking if schema is not allowing required items (item is<br>
              required, but is not listed in properties)<br>
            <br>
            Signed-off-by: Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">leon.anavi@konsulko.com</a>&gt;<br>
            ---<br>
             ...<a href="http://jsonschema_2.18.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">jsonschema_2.18.0.bb</a>
            =&gt; <a href="http://python3-fastjsonschema_2.20.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-fastjsonschema_2.20.0.bb</a>}
            | 5 +----<br>
             1 file changed, 1 insertion(+), 4 deletions(-)<br>
             rename meta-python/recipes-devtools/python/{<a
              href="http://python3-fastjsonschema_2.18.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-fastjsonschema_2.18.0.bb</a>
            =&gt; <a href="http://python3-fastjsonschema_2.20.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-fastjsonschema_2.20.0.bb</a>}
            (84%)<br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a
              href="http://python3-fastjsonschema_2.18.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-fastjsonschema_2.18.0.bb</a>
            b/meta-python/recipes-devtools/python/<a
              href="http://python3-fastjsonschema_2.20.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-fastjsonschema_2.20.0.bb</a><br>
            similarity index 84%<br>
            rename from meta-python/recipes-devtools/python/<a
              href="http://python3-fastjsonschema_2.18.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-fastjsonschema_2.18.0.bb</a><br>
            rename to meta-python/recipes-devtools/python/<a
              href="http://python3-fastjsonschema_2.20.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-fastjsonschema_2.20.0.bb</a><br>
            index b2e969c5c..0524a73b6 100644<br>
            --- a/meta-python/recipes-devtools/python/<a
              href="http://python3-fastjsonschema_2.18.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-fastjsonschema_2.18.0.bb</a><br>
            +++ b/meta-python/recipes-devtools/python/<a
              href="http://python3-fastjsonschema_2.20.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-fastjsonschema_2.20.0.bb</a><br>
            @@ -6,15 +6,12 @@ HOMEPAGE = "<a
              href="https://github.com/seznam/python-fastjsonschema"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://github.com/seznam/python-fastjsonschema</a>"<br>
             LICENSE = "BSD-3-Clause"<br>
             LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532">"file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"</a><br>
            <br>
            -SRCREV = "756540088687cda351390f687b92e602feaa7dc6"<br>
            -PYPI_SRC_URI = "git://<a
href="http://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/horejsek/python-fastjsonschema;protocol=https;branch=master</a>"<br>
            +SRC_URI[sha256sum] =
            "3d48fc5300ee96f5d116f10fe6f28d938e6008f59a6a025c2649475b87f76a23"<br>
            <br>
             SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://run-ptest">"file://run-ptest"</a><br>
            <br>
             inherit ptest pypi setuptools3<br>
            <br>
            -S = "${WORKDIR}/git"<br>
            -<br>
             do_install_ptest() {<br>
                    install -d ${D}${PTEST_PATH}/tests<br>
                    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
            -- <br>
            2.39.2<br>
            <br>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#111803): <a
href="https://lists.openembedded.org/g/openembedded-devel/message/111803"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/message/111803</a><br>
            Mute This Topic: <a
              href="https://lists.openembedded.org/mt/107893158/924729"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/mt/107893158/924729</a><br>
            Group Owner: <a
href="mailto:openembedded-devel%2Bowner@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">openembedded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a
href="https://lists.openembedded.org/g/openembedded-devel/unsub"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href="mailto:ticotimo@gmail.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">ticotimo@gmail.com</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------cVqVzTdNKi1cHmkBlu1WNoEg--

