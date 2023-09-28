Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257FAE732E1
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 15:03:38 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.15594.1695913416388883329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 08:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PuYqJFv8;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so31020359a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695913415; x=1696518215; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voaKnybJGylUpavbWRdegip5BG8R5Mqg/CnEO0cV8o4=;
        b=PuYqJFv8N/4iok+TggDA6K0wON8nfR3SaV/a+w+esMx41xWNQgLwjcEPnnk9AiQFl8
         I8FAZ+VyvryQeimG7EsD5P3Q7siCCldj2RiWYAOUMIm8+qBmKutAREe0sDN3xoEtVvex
         mvq9C0FrHWU5FyM+Q/NqCwFHtB1NsDlP8//WhTnKzsBG+ZGjwlFeTitFztfDeEHTYaZt
         IegrlmIOq6atksmRtTgYR7ne/QLozj1Nzv2lJ0rAJ/i229TNytGt8PBve/UZX28Tt+4u
         ahRhn+aPw89cWmcjhsfpSVxZhDiLC8mD6M46BqU9Lyv7M9CfkiIGoosTksbIzNey3At7
         Z+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913415; x=1696518215;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=voaKnybJGylUpavbWRdegip5BG8R5Mqg/CnEO0cV8o4=;
        b=lc9A71M5t8oABI2cywm0X68JI/py8ELqmwAdgEsUFtANlcljUwQJ9oPPdT/fOp/M65
         Aikj+oHkn1l1L/xZQ0WkYbPb9GutkHRA3x7yBXcbMMme5+no8r/mC5llnOBhFCYWQEAn
         p4dM7QsUYUOrU5W78uR+ldqxRXLKVUEWFvIMaRxL8xrhBW+FYBV6iv54KQfhikp+WoOf
         SLOSnc8muabDQulfTqwzUB97l3J78n2VsUJiFxjIHWtlW31aEFQn6bmSCLk2PcXVSeZD
         lRwpYFLHFdZitolbLt/EBiz060Kogz1UY0pGFnEp+HZatZIDrke6IeHBm5Ne4Qe+fsXD
         PQjw==
X-Gm-Message-State: AOJu0YwHmJqc+Jf6K01Bbvsrmv21kN1DrvlBDRrv8CZ6WVA5ueF3b4dX
	kmXvnliJ+R2EculjsVsYAZk=
X-Google-Smtp-Source: AGHT+IEWrYbpMqv3har9FA7OIWeAXtL3/FOLM5JHECObrGC4hM+T89AHeUTPRv8eQ6PETxOHTgudRQ==
X-Received: by 2002:a05:6402:1d4d:b0:533:4a89:5b2e with SMTP id dz13-20020a0564021d4d00b005334a895b2emr1551198edb.1.1695913414433;
        Thu, 28 Sep 2023 08:03:34 -0700 (PDT)
Received: from [10.134.45.197] ([89.249.73.139])
        by smtp.gmail.com with ESMTPSA id ek10-20020a056402370a00b00533dd4d2947sm6606166edb.74.2023.09.28.08.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 08:03:34 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------eBTxPIGul0VVmRlx01Gg5erm"
Message-ID: <f1f80ad8-bb44-4d7c-9be3-aa5c727fcc85@gmail.com>
Date: Thu, 28 Sep 2023 17:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
Content-Language: en-US
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <1788A95F04E8B4F0.25618@lists.openembedded.org>
 <CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 15:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105224

This is a multi-part message in MIME format.
--------------eBTxPIGul0VVmRlx01Gg5erm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I think I was the one who originally removed protoc, because it's not 
useful in the sysroot. Even if you satisfy cmake so it can find protoc 
target, the next step is that it will try to use it, which will 
obviously fail.

The only reason to put it on the target sysroot would be if you really 
going to use it _on the target_. But I guess this can be done via 
bbappend in the user layer.

Vyacheslav

On 27.09.2023 07:19, Samuli Piippo wrote:
> Re-applying this patch as it got removed in 
> https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/
>
> On Wed, 27 Sept 2023 at 08:11, Samuli Piippo via 
> lists.openembedded.org <http://lists.openembedded.org> 
> <samuli.piippo=gmail.com@lists.openembedded.org> wrote:
>
>     From: Samuli Piippo <samuli.piippo@gmail.com>
>
>     If protoc is enabled for the build, recipes using protobuf will
>     fail when protoc is not available in the recipe sysroot:
>
>     |   The imported target "protobuf::protoc" references the file
>     |
>     |
>     ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
>     |
>     |   but this file does not exist.  Possible reasons include:
>     |
>     |   * The file was deleted, renamed, or moved to another location.
>     |
>     |   * An install or uninstall procedure did not complete successfully.
>     |
>     |   * The installation package was faulty and contained
>     |
>     |
>     ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
>     |
>     |   but not all the files it references.
>
>     Use SYSROOT_DIRS to stage the binary to sysroot so it's always
>     available for other recipes.
>
>     Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     ---
>      meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>     <http://protobuf_3.21.12.bb> | 3 +++
>      1 file changed, 3 insertions(+)
>
>     diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>     <http://protobuf_3.21.12.bb>
>     b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>     <http://protobuf_3.21.12.bb>
>     index d95e1c20f..06b21a0d6 100644
>     --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>     <http://protobuf_3.21.12.bb>
>     +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>     <http://protobuf_3.21.12.bb>
>     @@ -92,6 +92,9 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
>      FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
>      FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
>
>     +# CMake requires binaries to exist in sysroot, even if they have
>     wrong architecture.
>     +SYSROOT_DIRS += "${bindir}"
>     +
>      RDEPENDS:${PN}-compiler = "${PN}"
>      RDEPENDS:${PN}-dev += "${PN}-compiler"
>      RDEPENDS:${PN}-ptest = "bash
>     ${@bb.utils.contains('PACKAGECONFIG', 'python',
>     'python3-protobuf', '', d)}"
>     -- 
>     2.25.1
>
>
>
>

--------------eBTxPIGul0VVmRlx01Gg5erm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">I think I was the one who originally
      removed protoc, because it's not useful in the sysroot. Even if
      you satisfy cmake so it can find protoc target, the next step is
      that it will try to use it, which will obviously fail.<br>
      <br>
      The only reason to put it on the target sysroot would be if you
      really going to use it _on the target_. But I guess this can be
      done via bbappend in the user layer.<br>
      <br>
      Vyacheslav<br>
      <br>
      On 27.09.2023 07:19, Samuli Piippo wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Re-applying this patch as it got removed in <a
href="https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/"
          moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/</a></div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, 27 Sept 2023 at 08:11,
          Samuli Piippo via <a href="http://lists.openembedded.org"
            moz-do-not-send="true">lists.openembedded.org</a>
          &lt;samuli.piippo=<a
            href="mailto:gmail.com@lists.openembedded.org"
            moz-do-not-send="true" class="moz-txt-link-freetext">gmail.com@lists.openembedded.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Samuli Piippo &lt;<a href="mailto:samuli.piippo@gmail.com"
            target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">samuli.piippo@gmail.com</a>&gt;<br>
          <br>
          If protoc is enabled for the build, recipes using protobuf
          will<br>
          fail when protoc is not available in the recipe sysroot:<br>
          <br>
          |   The imported target "protobuf::protoc" references the file<br>
          |<br>
          |     
".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"<br>
          |<br>
          |   but this file does not exist.  Possible reasons include:<br>
          |<br>
          |   * The file was deleted, renamed, or moved to another
          location.<br>
          |<br>
          |   * An install or uninstall procedure did not complete
          successfully.<br>
          |<br>
          |   * The installation package was faulty and contained<br>
          |<br>
          |     
".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"<br>
          |<br>
          |   but not all the files it references.<br>
          <br>
          Use SYSROOT_DIRS to stage the binary to sysroot so it's always<br>
          available for other recipes.<br>
          <br>
          Signed-off-by: Samuli Piippo &lt;<a
            href="mailto:samuli.piippo@qt.io" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">samuli.piippo@qt.io</a>&gt;<br>
          Signed-off-by: Khem Raj &lt;<a
            href="mailto:raj.khem@gmail.com" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">raj.khem@gmail.com</a>&gt;<br>
          ---<br>
           meta-oe/recipes-devtools/protobuf/<a
            href="http://protobuf_3.21.12.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">protobuf_3.21.12.bb</a>
          | 3 +++<br>
           1 file changed, 3 insertions(+)<br>
          <br>
          diff --git a/meta-oe/recipes-devtools/protobuf/<a
            href="http://protobuf_3.21.12.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">protobuf_3.21.12.bb</a>
          b/meta-oe/recipes-devtools/protobuf/<a
            href="http://protobuf_3.21.12.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">protobuf_3.21.12.bb</a><br>
          index d95e1c20f..06b21a0d6 100644<br>
          --- a/meta-oe/recipes-devtools/protobuf/<a
            href="http://protobuf_3.21.12.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">protobuf_3.21.12.bb</a><br>
          +++ b/meta-oe/recipes-devtools/protobuf/<a
            href="http://protobuf_3.21.12.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">protobuf_3.21.12.bb</a><br>
          @@ -92,6 +92,9 @@ PACKAGE_BEFORE_PN = "${PN}-compiler
          ${PN}-lite"<br>
           FILES:${PN}-compiler = "${bindir}
          ${libdir}/libprotoc${SOLIBS}"<br>
           FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"<br>
          <br>
          +# CMake requires binaries to exist in sysroot, even if they
          have wrong architecture.<br>
          +SYSROOT_DIRS += "${bindir}"<br>
          +<br>
           RDEPENDS:${PN}-compiler = "${PN}"<br>
           RDEPENDS:${PN}-dev += "${PN}-compiler"<br>
           RDEPENDS:${PN}-ptest = "bash
          ${@bb.utils.contains('PACKAGECONFIG', 'python',
          'python3-protobuf', '', d)}"<br>
          -- <br>
          2.25.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------eBTxPIGul0VVmRlx01Gg5erm--

