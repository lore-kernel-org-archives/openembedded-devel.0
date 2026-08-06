Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E4CC56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 18:20:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26435.1786040400934538238
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 11:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ltlyGce1;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49802c418b5so24410945e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 11:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786040399; x=1786645199; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qlLaiG6wapZk3jtwA1eKO252lOXBOvRgSH5B/dgO/gM=;
        b=ltlyGce1SeWCfrt+YK10l+uXQrts7GasYAdWY/f/cUqhGvy92e7mqKT5+XCQjm5/ji
         Z7Zc9j0+0tSRccWJbpyoQOkNu47MkP/MmSqoj3DxniSfn0F2Cn9HcA986DfcosAOwgjc
         f2/ApQ+D8tLrXloAH8BwSlTjR8Jl996jIZD5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040399; x=1786645199;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlLaiG6wapZk3jtwA1eKO252lOXBOvRgSH5B/dgO/gM=;
        b=X1lSOruxgcf+W9yfpomaJ/p1jprVFM8PUngfox9kcrbyLEEmX1DscKlnBQIniTYl1z
         27jeGhGyE8zK3cZrGLqXNWi7+u59ReV8XY8vkj9sApMvN7qq3qvVcC380n7dvs+hS41c
         93O1Ei2igBphPIeP1XqhDReQDpemCGDOa+LOyrVskCzYPKQ896SqNgrCRONmhBolkw4f
         ke0K4Wh/OUBVoHm/suEeCKP5+PNhP6xFhAi+wJx7eQyzPy2LV0Eku6Ts/7tC1e7aG9iZ
         7hRMidDtZhkWnReLM4wkIyq6kZCbxRTBhyIkPsgpu3eRT5NXPZsz54M9DAGd64Q5TBP3
         sHKA==
X-Gm-Message-State: AOJu0YxSqyJJXMZ7X1R3LK5am6mwiObDacXirMw5eT0jiTnGt2lFB5kt
	HUcx0LtqpMQHlnvM3Mp5+zlBuz6N5lGlydWFtYXaGPV07rdk7fJLds5Z9Sk71PcM6UA=
X-Gm-Gg: AR+sD10QTwFRg2MQU/m8mk4qWo2rVasTnMH9uaPuq5DJaYLmJ2HSnD9RYwyyRHLr3AV
	LZ0f3L2rCUPI0TdGf/8ZvSZiiwK84g3E1znjgnvnnfwwUUMc/mIRSvIJm9d6+KLorwq/pGps6pU
	bDqgsKbgUBjLDYdihUYKfUmffoPCxARrP6XTtKRDCY9/BVCCeWQRWGSsVOsshpR91neRvedne2p
	9E7Al5CjcdOxICd51jnM7l/Nf42VABY3REbzuhd+LRj29wAPmbjZ5mwM2YNizXkcRDS03urzVyp
	mHX+8bP0FTkVNLmVuCKPpp9YV5Bt+lWc8+P14GngSJac9OM+T3alkChUi0K3FQAmWtJo82tUdmb
	hH/NKgi2OcwTivjoK5FKKpyF3XITyJ+NRL/vjAkY9uVRDS5bbQhzqRluLofA9rtE7KMtMAqG3uu
	ksMygRLJJupNJUAzJrjSg7pTZ846IMXFjNhedyxNQ7C0l0IP09JVdHPPLXSl+r0yGRhr/IEn2Zg
	cR8kd5WeDoltwopumCYzT8xEnYyf6sOOgBQruK9oziKmMYlxDIGk4N05TLLgj0iig3yLz/Rcw5I
	rsvbDnHVw2Ke61sZyQ==
X-Received: by 2002:a05:600c:354c:b0:499:51cc:4e57 with SMTP id 5b1f17b1804b1-49951cc6d0fmr162495685e9.0.1786040398682;
        Thu, 06 Aug 2026 11:19:58 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e98fdedsm148227715e9.4.2026.08.06.11.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:19:58 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------wX0PpDCgNXcAFcden8290q4y"
Message-ID: <e603af2c-5081-4783-9607-23b8b1faed11@konsulko.com>
Date: Thu, 6 Aug 2026 21:19:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] exempi: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <20260806085958.3886559-1-leon.anavi@konsulko.com>
 <CAMKF1srmwzD0ZMH9sTKd7jfbUYqUtaKXAfF88GjN6WMZjo_YpA@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1srmwzD0ZMH9sTKd7jfbUYqUtaKXAfF88GjN6WMZjo_YpA@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 18:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128851

This is a multi-part message in MIME format.
--------------wX0PpDCgNXcAFcden8290q4y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 8/6/26 20:23, Khem Raj wrote:
>
>
> On Thu, Aug 6, 2026, 2:00 AM Leon Anavi via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>
>     Add recipe for exempi, an implementation of XMP based on Adobe XMP
>     SDK and released under a BSD-style license like Adobe's.
>
>     This work was sponsored by GOVCERT.LU <http://GOVCERT.LU>.
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>     ---
>      .../recipes-support/exempi/exempi_2.6.6.bb
>     <http://exempi_2.6.6.bb>    | 24 +++++++++++++++++++
>      1 file changed, 24 insertions(+)
>      create mode 100644 meta-oe/recipes-support/exempi/exempi_2.6.6.bb
>     <http://exempi_2.6.6.bb>
>
>     diff --git a/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
>     <http://exempi_2.6.6.bb>
>     b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
>     <http://exempi_2.6.6.bb>
>     new file mode 100644
>     index 0000000000..711f54f552
>     --- /dev/null
>     +++ b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
>     <http://exempi_2.6.6.bb>
>     @@ -0,0 +1,24 @@
>     +SUMMARY = "An implementation of XMP"
>     +DESCRIPTION = "An implementation of XMP based on Adobe XMP SDK\
>     +and released under a BSD-style license like Adobe's."
>     +HOMEPAGE = "https://libopenraw.freedesktop.org/exempi/"
>     +LICENSE = "BSD-3-Clause"
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=f816aac8b22d16134477b8e156f0a0f4"
>     +
>     +SRC_URI =
>     "https://libopenraw.freedesktop.org/download/${BPN}-${PV}.tar.xz
>     <https://libopenraw.freedesktop.org/download/$%7BBPN%7D-$%7BPV%7D.tar.xz>"
>     +SRC_URI[sha256sum] =
>     "900fb9957be2095c78e5111b99c49378adac58161a358f52f93c55126f34eb8f"
>     +
>     +S = "${UNPACKDIR}/${BPN}-${PV}"
>     +
>
>
> Isnt this the default ?

Yes, sorry, I've just sent v2 of the patch. Thank you for the code review.

Btw this exempi recipe is required for my subsequent patches in 
meta-python for adding python3-python-xmp-toolkit and enabling the tests 
for python3-pikepdf. It is part of the runtime dependency chain.

Thanks, Leon

>
>     +inherit autotools pkgconfig
>     +
>     +DEPENDS = "expat zlib"
>     +
>     +EXTRA_OECONF = "--disable-samples --disable-unittest"
>     +
>     +PACKAGES =+ "${PN}-bin"
>     +FILES:${PN}-bin = "${bindir}/exempi"
>     +FILES:${PN} = "${libdir}/lib*${SOLIBS}"
>     +FILES:${PN}-dev += "${libdir}/lib*${SOLIBSDEV}
>     ${libdir}/pkgconfig ${includedir}"
>     +
>     +BBCLASSEXTEND = "native nativesdk"
>     -- 
>     2.47.3
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#128839):
>     https://lists.openembedded.org/g/openembedded-devel/message/128839
>     Mute This Topic: https://lists.openembedded.org/mt/120623792/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
--------------wX0PpDCgNXcAFcden8290q4y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Khem,</p>
    <div class="moz-cite-prefix">On 8/6/26 20:23, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1srmwzD0ZMH9sTKd7jfbUYqUtaKXAfF88GjN6WMZjo_YpA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div><br>
          <br>
          <div class="gmail_quote gmail_quote_container">
            <div dir="ltr" class="gmail_attr">On Thu, Aug 6, 2026,
              2:00 AM Leon Anavi via <a
                href="http://lists.openembedded.org"
                moz-do-not-send="true">lists.openembedded.org</a>
              &lt;leon.anavi=<a
                href="mailto:konsulko.com@lists.openembedded.org"
                moz-do-not-send="true" class="moz-txt-link-freetext">konsulko.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
              recipe for exempi, an implementation of XMP based on Adobe
              XMP<br>
              SDK and released under a BSD-style license like Adobe's.<br>
              <br>
              This work was sponsored by <a href="http://GOVCERT.LU"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">GOVCERT.LU</a>.<br>
              <br>
              Signed-off-by: Leon Anavi &lt;<a
                href="mailto:leon.anavi@konsulko.com" target="_blank"
                rel="noreferrer" moz-do-not-send="true"
                class="moz-txt-link-freetext">leon.anavi@konsulko.com</a>&gt;<br>
              ---<br>
               .../recipes-support/exempi/<a
                href="http://exempi_2.6.6.bb"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">exempi_2.6.6.bb</a>    | 24
              +++++++++++++++++++<br>
               1 file changed, 24 insertions(+)<br>
               create mode 100644 meta-oe/recipes-support/exempi/<a
                href="http://exempi_2.6.6.bb"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">exempi_2.6.6.bb</a><br>
              <br>
              diff --git a/meta-oe/recipes-support/exempi/<a
                href="http://exempi_2.6.6.bb"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">exempi_2.6.6.bb</a>
              b/meta-oe/recipes-support/exempi/<a
                href="http://exempi_2.6.6.bb"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">exempi_2.6.6.bb</a><br>
              new file mode 100644<br>
              index 0000000000..711f54f552<br>
              --- /dev/null<br>
              +++ b/meta-oe/recipes-support/exempi/<a
                href="http://exempi_2.6.6.bb"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">exempi_2.6.6.bb</a><br>
              @@ -0,0 +1,24 @@<br>
              +SUMMARY = "An implementation of XMP"<br>
              +DESCRIPTION = "An implementation of XMP based on Adobe
              XMP SDK\<br>
              +and released under a BSD-style license like Adobe's."<br>
              +HOMEPAGE = "<a
                href="https://libopenraw.freedesktop.org/exempi/"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://libopenraw.freedesktop.org/exempi/</a>"<br>
              +LICENSE = "BSD-3-Clause"<br>
              +LIC_FILES_CHKSUM =
              <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=f816aac8b22d16134477b8e156f0a0f4">"file://COPYING;md5=f816aac8b22d16134477b8e156f0a0f4"</a><br>
              +<br>
              +SRC_URI = "<a
href="https://libopenraw.freedesktop.org/download/$%7BBPN%7D-$%7BPV%7D.tar.xz"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">https://libopenraw.freedesktop.org/download/${BPN}-${PV}.tar.xz</a>"<br>
              +SRC_URI[sha256sum] =
              "900fb9957be2095c78e5111b99c49378adac58161a358f52f93c55126f34eb8f"<br>
              +<br>
              +S = "${UNPACKDIR}/${BPN}-${PV}"<br>
              +<br>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Isnt this the default ?</div>
      </div>
    </blockquote>
    <br>
    Yes, sorry, I've just sent v2 of the patch. Thank you for the code
    review.<br>
    <br>
    Btw this exempi recipe is required for my subsequent patches in
    meta-python for adding python3-python-xmp-toolkit and enabling the
    tests for python3-pikepdf. It is part of the runtime dependency
    chain.<br>
    <br>
    Thanks, Leon<br>
    <br>
    <blockquote type="cite"
cite="mid:CAMKF1srmwzD0ZMH9sTKd7jfbUYqUtaKXAfF88GjN6WMZjo_YpA@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote gmail_quote_container">
            <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              +inherit autotools pkgconfig<br>
              +<br>
              +DEPENDS = "expat zlib"<br>
              +<br>
              +EXTRA_OECONF = "--disable-samples --disable-unittest"<br>
              +<br>
              +PACKAGES =+ "${PN}-bin"<br>
              +FILES:${PN}-bin = "${bindir}/exempi"<br>
              +FILES:${PN} = "${libdir}/lib*${SOLIBS}"<br>
              +FILES:${PN}-dev += "${libdir}/lib*${SOLIBSDEV}
              ${libdir}/pkgconfig ${includedir}"<br>
              +<br>
              +BBCLASSEXTEND = "native nativesdk"<br>
              -- <br>
              2.47.3<br>
              <br>
              <br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#128839): <a
href="https://lists.openembedded.org/g/openembedded-devel/message/128839"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/message/128839</a><br>
              Mute This Topic: <a
href="https://lists.openembedded.org/mt/120623792/1997914"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/mt/120623792/1997914</a><br>
              Group Owner: <a
href="mailto:openembedded-devel%2Bowner@lists.openembedded.org"
                target="_blank" rel="noreferrer" moz-do-not-send="true">openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a
href="https://lists.openembedded.org/g/openembedded-devel/unsub"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
              [<a href="mailto:raj.khem@gmail.com" target="_blank"
                rel="noreferrer" moz-do-not-send="true"
                class="moz-txt-link-freetext">raj.khem@gmail.com</a>]<br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------wX0PpDCgNXcAFcden8290q4y--

