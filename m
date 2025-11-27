Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BB0D11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 13:22:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18233.1764249752245197535
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 05:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=b9uRzOVL;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b73545723ebso173047966b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 05:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764249751; x=1764854551; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQqVAs9wKB1inDhEX3juPennJo9wqXNe0fbkuBeCig4=;
        b=b9uRzOVL2Ou9yw7rqxQpIuzimieTE93+qQ0D+ooKGXHpZaV1wu49UpHUdoYzV4PvA4
         5jsg2dQ9MpJU0P6FWDZAy5KPUo6pRRKIBuhJD/lCt6q0PSsV3mLx0PjV8pNqhwCLCkhm
         Vdo1suWS9V1wUVyRbubqvsmonAPXJ5MX6GBrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764249751; x=1764854551;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQqVAs9wKB1inDhEX3juPennJo9wqXNe0fbkuBeCig4=;
        b=Yvxt814fgyZCHy5bqAlLSKCeowmBNjUj8uA7VzQlIZMiQch0rPXcADIOQUqMVf1MlB
         KBs+joM45x0dhAtEzJtnXfCIadrUV/CMKvcF/s7C3GiWmD3kP+OIed3zTN1zJvAJ0GGC
         LxIs6X1IOMiJlfqBfoKNbnsd3hehLyBJBn/0HWhDA9vPACCDNI9RjY1caELZf6rnXULB
         4ZbVMuNJ1zjddOjIXHlrSOl96QjiDz//WBFkVRXOFZztG7VxCOc1LYhrT0iDcaQoj5hD
         jkjbUK21j671qWrvNoquaXiUWco8E24DOKjy7oQZXstOeVQnAwoP1OQd9xeDrJ7/dX6Y
         S1iw==
X-Gm-Message-State: AOJu0Yz8VGCe5ll7d/dUDYINoxzHhEGC4ujaSdP2TLtVFU39/JboinN6
	5JtHndQt5+pCtm/9K2Onb7GPbX5QJxxx79OhQNXWOV5J/Fw91dw3+Ekrj0d0EPoc0S68rtMS1Vz
	U92iS
X-Gm-Gg: ASbGncsQAYHt790ol+jbt9/7bA3CGF8d9CsCksgHcoiuCqnP+rTIu0eXjRPfHp5zwOW
	dPzInDJ5y5zrEbla2nBFxBq82h+QGtmONsh/nrYyq3hCc1W/GoX2ECZeHwwWA1nG0K8AZ+r+5ED
	Im4TmaH29L5W7uzhg48WKuvL6ffkXBw7UUsiwP7gzmWP5d2vYBDKl/e7HZavSxeDKv34YzpBo7y
	gvMuBTc7c98o9buS8ellIdvEaPgcvjJe0XSZSre3K6LQ3+b6gI04bEJX7TMjJ+bPoOJ46cSDIFr
	VGKSFdGmiDUhUt7TcAZ6xP4vJjPookG1mZ21qeIlYZbsYGKH7rlRFp4RipBLULCC++w9ZWZSGzR
	Y1wuB+v+r5O/R1B4jpThyrhQMMsmzhjMSVMzGTljxNhrnH5G0K4a1m9z16mC1TjnpcLb4hW1mBU
	ytBnoittLzUB7nbZT0vw==
X-Google-Smtp-Source: AGHT+IE5Zcl0aOjx80JOKDtiehPh2J3R/FK7SapK4V17tJj22Y/Cf6raZ/0mYNrCIf8mNuRJP8Pqkg==
X-Received: by 2002:a17:906:1659:b0:b76:be6f:291f with SMTP id a640c23a62f3a-b76be6f2932mr850923166b.8.1764249750290;
        Thu, 27 Nov 2025 05:22:30 -0800 (PST)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a6a74sm162970166b.45.2025.11.27.05.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:22:29 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------o0nRvb9qVB64A003THLeJiAf"
Message-ID: <8ac90e7d-9cda-4b32-b75c-0aeecab746e8@konsulko.com>
Date: Thu, 27 Nov 2025 15:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pikepdf: Add recipe
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
References: <20251124115258.3337453-1-leon.anavi@konsulko.com>
 <20251124115258.3337453-2-leon.anavi@konsulko.com>
 <CAMSfU+70YVWOWjQBVZyoK8QXvekbJ52WoF5A9Q8jBwyijauCVw@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMSfU+70YVWOWjQBVZyoK8QXvekbJ52WoF5A9Q8jBwyijauCVw@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 13:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122108

This is a multi-part message in MIME format.
--------------o0nRvb9qVB64A003THLeJiAf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yoann,

On 11/26/25 12:18, Yoann Congal wrote:
> Le lun. 24 nov. 2025 à 12:53, Leon Anavi via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <leon.anavi=konsulko.com@lists.openembedded.org> a écrit :
>
>     Add recipe for v10.0.2:
>
>     - Fixed presentation of strings using unparse_content_stream -
>       if the stream can be represented using PdfDocEncoding, it is
>       rendered in that way for ease of reading.
>     - Reformatted C++ source.
>
>     This work was sponsored by GOVCERT.LU <http://GOVCERT.LU>.
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>     ---
>      .../python/python3-pikepdf_10.0.2.bb
>     <http://python3-pikepdf_10.0.2.bb>         | 22 +++++++++++++++++++
>      1 file changed, 22 insertions(+)
>      create mode 100644
>     meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
>     <http://python3-pikepdf_10.0.2.bb>
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
>     <http://python3-pikepdf_10.0.2.bb>
>     b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
>     <http://python3-pikepdf_10.0.2.bb>
>     new file mode 100644
>     index 0000000000..4821e273d8
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
>     <http://python3-pikepdf_10.0.2.bb>
>     @@ -0,0 +1,22 @@
>     +SUMMARY = "Read and write PDFs with Python, powered by qpdf"
>     +HOMEPAGE = "https://github.com/pikepdf/pikepdf"
>     +LICENSE = "MPL-2.0"
>     +LIC_FILES_CHKSUM =
>     "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
>     +
>     +SRC_URI[sha256sum] =
>     "7c85a2526253e35575edb2e28cdc740d004be4b7c5fda954f0e721ee1c423a52"
>     +
>     +inherit pypi python_setuptools_build_meta
>     +
>     +PYPI_PACKAGE = "pikepdf"
>     +
>     +DEPENDS += " \
>     +       python3-pybind11-native \
>     +       qpdf \
>     +"
>     +
>     +RDEPENDS:${PN} += " \
>     +       python3-pillow \
>     +       python3-lxml \
>     +"
>     +
>     +BBCLASSEXTEND = "native nativesdk"
>
>
> That creates warnings in CI:
> stdio: WARNING: Nothing PROVIDES 'nativesdk-qpdf' (but 
> virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb 
> <http://python3-pikepdf_10.0.2.bb> DEPENDS on or otherwise requires 
> it). Close matches:
> stdio: WARNING: Nothing PROVIDES 'qpdf-native' (but 
> virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb 
> <http://python3-pikepdf_10.0.2.bb> DEPENDS on or otherwise requires 
> it). Close matches:
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pillow' (but 
> virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb 
> <http://python3-pikepdf_10.0.2.bb> RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pikepdf' (but 
> virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb 
> <http://python3-pikepdf_10.0.2.bb> RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pikepdf-dev' (but 
> virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb 
> <http://python3-pikepdf_10.0.2.bb> RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'python3-pikepdf-native' (but 
> virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb 
> <http://python3-pikepdf_10.0.2.bb> RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'python3-pikepdf-dev-native' (but 
> virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb 
> <http://python3-pikepdf_10.0.2.bb> RDEPENDS on or otherwise requires it)
> From 
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/82/builds/526/steps/13/logs/stdio
>
> Leon, can you look into it? (I guess some dependencies lack their 
> BBCLASSEXTEND)

Yes, thank you for pointing out these warnings. I have just submitted 
three patches that add native and nativesdk to BBCLASSEXTEND of the 
required python3-pikepdf dependencies.

Best regards, Leon

--------------o0nRvb9qVB64A003THLeJiAf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Yoann,</p>
    <div class="moz-cite-prefix">On 11/26/25 12:18, Yoann Congal wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMSfU+70YVWOWjQBVZyoK8QXvekbJ52WoF5A9Q8jBwyijauCVw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Le lun. 24 nov. 2025 à 12:53, Leon Anavi via <a
            href="http://lists.openembedded.org" moz-do-not-send="true">lists.openembedded.org</a>
          &lt;leon.anavi=<a
            href="mailto:konsulko.com@lists.openembedded.org"
            moz-do-not-send="true" class="moz-txt-link-freetext">konsulko.com@lists.openembedded.org</a>&gt;
          a écrit :</div>
        <div class="gmail_quote gmail_quote_container">
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
            recipe for v10.0.2:<br>
            <br>
            - Fixed presentation of strings using unparse_content_stream
            -<br>
              if the stream can be represented using PdfDocEncoding, it
            is<br>
              rendered in that way for ease of reading.<br>
            - Reformatted C++ source.<br>
            <br>
            This work was sponsored by <a href="http://GOVCERT.LU"
              rel="noreferrer" target="_blank" moz-do-not-send="true">GOVCERT.LU</a>.<br>
            <br>
            Signed-off-by: Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">leon.anavi@konsulko.com</a>&gt;<br>
            ---<br>
             .../python/<a href="http://python3-pikepdf_10.0.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a> 
                    | 22 +++++++++++++++++++<br>
             1 file changed, 22 insertions(+)<br>
             create mode 100644 meta-python/recipes-devtools/python/<a
              href="http://python3-pikepdf_10.0.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a><br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a
              href="http://python3-pikepdf_10.0.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a>
            b/meta-python/recipes-devtools/python/<a
              href="http://python3-pikepdf_10.0.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a><br>
            new file mode 100644<br>
            index 0000000000..4821e273d8<br>
            --- /dev/null<br>
            +++ b/meta-python/recipes-devtools/python/<a
              href="http://python3-pikepdf_10.0.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a><br>
            @@ -0,0 +1,22 @@<br>
            +SUMMARY = "Read and write PDFs with Python, powered by
            qpdf"<br>
            +HOMEPAGE = "<a href="https://github.com/pikepdf/pikepdf"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://github.com/pikepdf/pikepdf</a>"<br>
            +LICENSE = "MPL-2.0"<br>
            +LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3">"file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"</a><br>
            +<br>
            +SRC_URI[sha256sum] =
            "7c85a2526253e35575edb2e28cdc740d004be4b7c5fda954f0e721ee1c423a52"<br>
            +<br>
            +inherit pypi python_setuptools_build_meta<br>
            +<br>
            +PYPI_PACKAGE = "pikepdf"<br>
            +<br>
            +DEPENDS += " \<br>
            +       python3-pybind11-native \<br>
            +       qpdf \<br>
            +"<br>
            +<br>
            +RDEPENDS:${PN} += " \<br>
            +       python3-pillow \<br>
            +       python3-lxml \<br>
            +"<br>
            +<br>
            +BBCLASSEXTEND = "native nativesdk"<br>
          </blockquote>
          <div><br>
          </div>
          <div>That creates warnings in CI:</div>
          <div>
            <div>
              <pre
class="gmail-bb-log-preview-contents gmail-select-content gmail-log"><div
              class="gmail-logline"><span class="gmail-log_o"><span>stdio: WARNING: Nothing PROVIDES 'nativesdk-qpdf' (but <a class="moz-txt-link-freetext" href="virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/">virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a
              href="http://python3-pikepdf_10.0.2.bb"
              moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a> DEPENDS on or otherwise requires it). Close matches:</span></span></div><div
              class="gmail-logline"><span class="gmail-log_o"><span>stdio: WARNING: Nothing PROVIDES 'qpdf-native' (but <a class="moz-txt-link-freetext" href="virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/">virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a
              href="http://python3-pikepdf_10.0.2.bb"
              moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a> DEPENDS on or otherwise requires it). Close matches:</span></span></div><div
              class="gmail-logline"><span class="gmail-log_o"><span>stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pillow' (but <a class="moz-txt-link-freetext" href="virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/">virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a
              href="http://python3-pikepdf_10.0.2.bb"
              moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></span></div><div
              class="gmail-logline"><span class="gmail-log_o"><span>stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pikepdf' (but <a class="moz-txt-link-freetext" href="virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/">virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a
              href="http://python3-pikepdf_10.0.2.bb"
              moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></span></div><div
              class="gmail-logline"><span class="gmail-log_o"><span>stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pikepdf-dev' (but <a class="moz-txt-link-freetext" href="virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/">virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a
              href="http://python3-pikepdf_10.0.2.bb"
              moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></span></div><div
              class="gmail-logline"><span class="gmail-log_o"><span>stdio: WARNING: Nothing RPROVIDES 'python3-pikepdf-native' (but <a class="moz-txt-link-freetext" href="virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/">virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a
              href="http://python3-pikepdf_10.0.2.bb"
              moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></span></div><div
              class="gmail-logline"><span class="gmail-log_o"><span>stdio: WARNING: Nothing RPROVIDES 'python3-pikepdf-dev-native' (but <a class="moz-txt-link-freetext" href="virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/">virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a
              href="http://python3-pikepdf_10.0.2.bb"
              moz-do-not-send="true">python3-pikepdf_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></span></div></pre>
            </div>
          </div>
          <div>From <a
href="https://autobuilder.yoctoproject.org/valkyrie/?#/builders/82/builds/526/steps/13/logs/stdio"
              moz-do-not-send="true" class="moz-txt-link-freetext">https://autobuilder.yoctoproject.org/valkyrie/?#/builders/82/builds/526/steps/13/logs/stdio</a></div>
          <div><br>
          </div>
          <div>Leon, can you look into it? (I guess some dependencies
            lack their BBCLASSEXTEND)</div>
        </div>
      </div>
    </blockquote>
    <p>Yes, thank you for pointing out these warnings. I have just
      submitted three patches that add native and nativesdk to
      BBCLASSEXTEND of the required python3-pikepdf dependencies.<br>
      <br>
      Best regards, Leon</p>
  </body>
</html>

--------------o0nRvb9qVB64A003THLeJiAf--

