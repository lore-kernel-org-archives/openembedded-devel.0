Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AEAC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 10:53:15 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.10881.1699440794663883533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 02:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fKruxq6O;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9dd6dc9c00cso759546866b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 02:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699440793; x=1700045593; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42zt1k1E6M4x1Jm8WOBqW3Z0HRb3hzvCedEWi8wFKk8=;
        b=fKruxq6OUB5UmdVUcdTlX7tADqVqSome6M7acXn9IsdFQ4bjYMo+tR6yGTRzfiRyxg
         M5pIhPjwg+U8X8xqBU1kxtW0BtJYWIEqnbDqgUtx2EyBauAkvl0a26+3px7AIPCvJAVl
         m1bftnOl3RIgP/d+6axPIt32H0FcxuHjqrOSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440793; x=1700045593;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42zt1k1E6M4x1Jm8WOBqW3Z0HRb3hzvCedEWi8wFKk8=;
        b=gW2f7brOdfu7LLI9qSjxVP50XBtCAafirtRZmQ6Uw/+VFuvLMuq2tS9dbEaQ9029rv
         ujEKGvkHODwCy1gD1abh2IlS3L3gt6gCFvskJQNwULsE9F21rN/QYDOt0qCQGhmx6iIj
         plv629/yB5ohqOHSE9aYK5lPOo2+/g9nLlCJeiQeZD1n42z/4EUhBlNW9StZaYzJHG97
         SjeCdLcbQez/PRaIHBRQn7yiSSgocKcsbj4vHPLqCj7IYEy0QQMY4PR5XXbbTuHjUtiR
         yjvzcnO955qL74XWkZ9VbEJ3t+oiVorpwrCTiLFnY/wPjtjn1q43CiFBSLomjrdL/MH1
         um0Q==
X-Gm-Message-State: AOJu0YwIbl+hhfOh7GxGfhNJFxPEO1mNpXNz5QvrL0mtSD5lB0adSvnH
	xM854CtpknFlvvfdPeEIV0QEhg==
X-Google-Smtp-Source: AGHT+IGJ/NqsL5vSAFTsH/bNa5EOo7t5Ij3NwZuLKPVz3RsoXykp+bwxCduAY5dDV84fjmPFToYKow==
X-Received: by 2002:a17:907:94d5:b0:9bf:2f84:5de7 with SMTP id dn21-20020a17090794d500b009bf2f845de7mr1168205ejc.4.1699440792481;
        Wed, 08 Nov 2023 02:53:12 -0800 (PST)
Received: from [192.168.5.224] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id cd18-20020a170906b35200b009c4cb1553edsm858778ejb.95.2023.11.08.02.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 02:53:12 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------L0hFx4hDv4oskwJOP0s19Tr7"
Message-ID: <e028935a-e1e5-4724-9839-140cee0adf67@konsulko.com>
Date: Wed, 8 Nov 2023 12:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/3] qpdf: Update 10.6.3 -> 11.6.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20231107152239.2219002-1-leon.anavi@konsulko.com>
 <20231107152239.2219002-2-leon.anavi@konsulko.com>
 <CAMKF1sqvRNDFV7gi9Z1N_EeOJHX6MQJLxQYHpQ_DkV5b6D+c-A@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1sqvRNDFV7gi9Z1N_EeOJHX6MQJLxQYHpQ_DkV5b6D+c-A@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 10:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106472

This is a multi-part message in MIME format.
--------------L0hFx4hDv4oskwJOP0s19Tr7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

Thank you for the feedback.

On 8.11.23 г. 9:08 ч., Khem Raj wrote:
> seeing this error
>
> WARNING: qpdf-11.6.3-r0 do_package_qa: QA Issue: File
> /usr/lib/cmake/qpdf/libqpdfTargets.cmake in package qpdf-dev contains
> reference to TMPDIR [bu
> ildpaths]

The sed command in do_install:append should fix this warning. I also 
inspected to /usr/lib/cmake/qpdf/libqpdfTargets.cmake on the booted 
target device and the paths look OK. I am wondering why does this 
warning appear on your build setup?

> ERROR: qpdf-11.6.3-r0 do_package_qa: QA Issue:
> /usr/lib/libqpdf.so.29.6.3 contained in package libqpdf requires
> libgnutls.so.30(GNUTLS_3_4)(64bit),
>   but no providers found in RDEPENDS:libqpdf? [file-rdeps]
> ERROR: qpdf-11.6.3-r0 do_package_qa: QA Issue:
> /usr/lib/libqpdf.so.29.6.3 contained in package libqpdf requires
> libgnutls.so.30()(64bit), but no pr
> oviders found in RDEPENDS:libqpdf? [file-rdeps]

I can't reproduce these errors on my side. Could you please provide any 
hints how to reproduce them?

Best regards,
Leon

> ERROR: qpdf-11.6.3-r0 do_package_qa: Fatal QA errors were found, failing task.
> ERROR: Logfile of failure stored in:
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/qpdf/11.6.3/temp/log.do_package_qa.3501227
>
> On Tue, Nov 7, 2023 at 7:22 AM Leon Anavi<leon.anavi@konsulko.com>  wrote:
>> Update to version 11.6.3:
>>
>> - Fix a bug in which qpdf could potentially discard a character
>>    in a binary string if that character was preceded by an octal
>>    escaped string with fewer than three digits. This bug was
>>    introduced in the 11.0.0 release. The bug would not apply to
>>    content streams with default settings.
>> - The linearization specification precludes linearized files that
>>    require offets past the 4 GB mark. A bug in qpdf was preventing
>>    it from working when offsets had to pass the 2 GB mark. This has
>>    been corrected.
>>
>> Switch to cmake. Use /dev/random to perform encryption securely.
>> Change the fully defined path on the target to about buildpaths
>> QA issues with libqpdfTargets.cmake.
>>
>> This work was sponsored by GOVCERT.LU.
>>
>> Signed-off-by: Leon Anavi<leon.anavi@konsulko.com>
>> ---
>>   .../qpdf/{qpdf_10.6.3.bb => qpdf_11.6.3.bb}         | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>   rename meta-oe/recipes-printing/qpdf/{qpdf_10.6.3.bb => qpdf_11.6.3.bb} (67%)
>>
>> diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
>> similarity index 67%
>> rename from meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
>> rename to meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
>> index fa33daf52..17a65acc6 100644
>> --- a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
>> +++ b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
>> @@ -2,14 +2,14 @@ DESCRIPTION = "PDF transformation/inspection software"
>>   HOMEPAGE ="http://qpdf.sourceforge.net"
>>   LICENSE = "Artistic-2.0"
>>   SECTION = "libs"
>> -DEPENDS = "libpcre zlib libjpeg-turbo"
>> +DEPENDS = "libpcre zlib libjpeg-turbo openssl"
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
>> -SRC_URI[sha256sum] = "e8fc23b2a584ea68c963a897515d3eb3129186741dd19d13c86d31fa33493811"
>> +SRC_URI[sha256sum] = "c394b1b0cff4cd9d13b0f5e16bdf3cf54da424dc434f9d40264b7fe67acd90bc"
>>
>>   LIC_FILES_CHKSUM ="file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
>>
>> -inherit autotools-brokensep gettext
>> +inherit cmake gettext
>>
>>   # disable random file detection for cross-compile
>>   EXTRA_OECONF = "--without-random \
>> @@ -17,11 +17,18 @@ EXTRA_OECONF = "--without-random \
>>                   --disable-check-autofiles \
>>                   "
>>
>> +EXTRA_OECMAKE = '-DRANDOM_DEVICE="/dev/random"'
>> +
>>   LDFLAGS:append:mipsarch = " -latomic"
>>   LDFLAGS:append:riscv32 = " -latomic"
>>
>>   S="${WORKDIR}/${BPN}-${PV}"
>>
>> +do_install:append() {
>> +    # Change the fully defined path on the target
>> +    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/${BPN}/libqpdfTargets.cmake
>> +}
>> +
>>   # avoid Makefile returning error on 'make clean' before configure was run
>>   CLEANBROKEN = "1"
>>
>> --
>> 2.39.2
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#106465):https://lists.openembedded.org/g/openembedded-devel/message/106465
>> Mute This Topic:https://lists.openembedded.org/mt/102444518/2167311
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [leon.anavi@konsulko.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------L0hFx4hDv4oskwJOP0s19Tr7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Khem,<br>
      <br>
      Thank you for the feedback.<br>
    </p>
    <div class="moz-cite-prefix">On 8.11.23 г. 9:08 ч., Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sqvRNDFV7gi9Z1N_EeOJHX6MQJLxQYHpQ_DkV5b6D+c-A@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">seeing this error

WARNING: qpdf-11.6.3-r0 do_package_qa: QA Issue: File
/usr/lib/cmake/qpdf/libqpdfTargets.cmake in package qpdf-dev contains
reference to TMPDIR [bu
ildpaths]</pre>
    </blockquote>
    <br>
    The sed command in do_install:append should fix this warning. I also
    inspected to <span style="white-space: pre-wrap">/usr/lib/cmake/qpdf/libqpdfTargets.cmake</span>
    on the booted target device and the paths look OK. I am wondering
    why does this warning appear on your build setup?<br>
    <br>
    <blockquote type="cite"
cite="mid:CAMKF1sqvRNDFV7gi9Z1N_EeOJHX6MQJLxQYHpQ_DkV5b6D+c-A@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
ERROR: qpdf-11.6.3-r0 do_package_qa: QA Issue:
/usr/lib/libqpdf.so.29.6.3 contained in package libqpdf requires
libgnutls.so.30(GNUTLS_3_4)(64bit),
 but no providers found in RDEPENDS:libqpdf? [file-rdeps]
ERROR: qpdf-11.6.3-r0 do_package_qa: QA Issue:
/usr/lib/libqpdf.so.29.6.3 contained in package libqpdf requires
libgnutls.so.30()(64bit), but no pr
oviders found in RDEPENDS:libqpdf? [file-rdeps]</pre>
    </blockquote>
    <br>
    I can't reproduce these errors on my side. Could you please provide
    any hints how to reproduce them?<br>
    <br>
    Best regards,<br>
    Leon<br>
    <br>
    <blockquote type="cite"
cite="mid:CAMKF1sqvRNDFV7gi9Z1N_EeOJHX6MQJLxQYHpQ_DkV5b6D+c-A@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
ERROR: qpdf-11.6.3-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in:
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/qpdf/11.6.3/temp/log.do_package_qa.3501227

On Tue, Nov 7, 2023 at 7:22 AM Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Update to version 11.6.3:

- Fix a bug in which qpdf could potentially discard a character
  in a binary string if that character was preceded by an octal
  escaped string with fewer than three digits. This bug was
  introduced in the 11.0.0 release. The bug would not apply to
  content streams with default settings.
- The linearization specification precludes linearized files that
  require offets past the 4 GB mark. A bug in qpdf was preventing
  it from working when offsets had to pass the 2 GB mark. This has
  been corrected.

Switch to cmake. Use /dev/random to perform encryption securely.
Change the fully defined path on the target to about buildpaths
QA issues with libqpdfTargets.cmake.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
---
 .../qpdf/{qpdf_10.6.3.bb =&gt; qpdf_11.6.3.bb}         | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_10.6.3.bb =&gt; qpdf_11.6.3.bb} (67%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
similarity index 67%
rename from meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
index fa33daf52..17a65acc6 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "PDF transformation/inspection software"
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://qpdf.sourceforge.net">"http://qpdf.sourceforge.net"</a>
 LICENSE = "Artistic-2.0"
 SECTION = "libs"
-DEPENDS = "libpcre zlib libjpeg-turbo"
+DEPENDS = "libpcre zlib libjpeg-turbo openssl"

 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e8fc23b2a584ea68c963a897515d3eb3129186741dd19d13c86d31fa33493811"
+SRC_URI[sha256sum] = "c394b1b0cff4cd9d13b0f5e16bdf3cf54da424dc434f9d40264b7fe67acd90bc"

 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3">"file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"</a>

-inherit autotools-brokensep gettext
+inherit cmake gettext

 # disable random file detection for cross-compile
 EXTRA_OECONF = "--without-random \
@@ -17,11 +17,18 @@ EXTRA_OECONF = "--without-random \
                 --disable-check-autofiles \
                 "

+EXTRA_OECMAKE = '-DRANDOM_DEVICE="/dev/random"'
+
 LDFLAGS:append:mipsarch = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"

 S="${WORKDIR}/${BPN}-${PV}"

+do_install:append() {
+    # Change the fully defined path on the target
+    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/${BPN}/libqpdfTargets.cmake
+}
+
 # avoid Makefile returning error on 'make clean' before configure was run
 CLEANBROKEN = "1"

--
2.39.2




</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
        <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#106465): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/106465">https://lists.openembedded.org/g/openembedded-devel/message/106465</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/102444518/2167311">https://lists.openembedded.org/mt/102444518/2167311</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:leon.anavi@konsulko.com">leon.anavi@konsulko.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------L0hFx4hDv4oskwJOP0s19Tr7--

