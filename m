Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A965FCCF9EE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 07:01:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9154.1761894065228086344
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 00:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G5HxY4u0;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-421851bcb25so1085259f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761894063; x=1762498863; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ST+cwvIgOCYj3u5SJk0Yk4fLA5pWv8ODGDJEOy3D10Q=;
        b=G5HxY4u0mDHfkf2dmYzlbMq8MA5nTTdyybTPExbKB+sbUMDaAoyBsUX7+FGMzy3LNB
         ZpZgl9AJFtWoxO1hX1mGohO+2kaxuHMXmF3azsQAXxxrtsGe4sNY+nCRKHb3Vk6JiT93
         ENIELUxdFDTQUFFWcKRnClQ+kFf2fN0iJuGVi6UTm4IGBtm4dWklm0Cf7VmLn2Rxwu/U
         iWIlcaTbE9AFvV5BcOuL4fDLKG3On7v0rmbsUUkSXIw5qT154o78GUSpGscq7l2HwACd
         0haOAx+QkY9Bd4t5iDxGN0rvWGaE321pwFcqtSOuW2E12lMhVsNLzODXYh3/MZn4fmqV
         kl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761894063; x=1762498863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ST+cwvIgOCYj3u5SJk0Yk4fLA5pWv8ODGDJEOy3D10Q=;
        b=KHhkGOKAQ31jxHZH0C1eAIH35CLjInYRYqsAZfKRjW/NGkpqFvEV9obca1ZG6dFsnD
         aVlmGUd+bqAEa4Sl2wSmGfvIFypA5OB8mOLDjaZhYDcCsuxQU5LDE+QolxD4mKckHEZC
         4HWzLPRop5L76PuqUGzmBRzzub/EbNc5ogXndJxzMGJHcJ1PIZWJqgXRH5tWy/fsTamo
         leaSOT0OBsP5zFWXlYOEza4kYOQxQc83zc59Cb0SEmgwBApioHZA7L9WadHNzbwDKJvs
         emQK+s+m1Q0MXajLBxkL9Gnklx8wgzPpUalk/diz4CPVzcwbDiesmkUeEe1fxSObIkiG
         Ceyg==
X-Forwarded-Encrypted: i=1; AJvYcCVVSFjqkyLKFc10dCw2YhT/8Kr+1tsXwFAXn5pOFZuLVZLsg+puVpP755lN2mBghImQ7EfMdFDaGXAPKa2w97ryEww=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTL+1+gDI7SRrUOQy0pf5lC6I1wM+SrpRbr+so6li7D4qaZbLv
	+Z+ANJ/XcTLkyBFRIX+W06dAssQZf1Rf44ja7Bi+Pf5sTvnkJl7DfTVU
X-Gm-Gg: ASbGncsJNgIkEP7iMPM91gqGGq/IhQTxq2nhleXomy5Zc7KvAiXW2YdQfGtb9ducvmz
	cD9I+d2HTYAbXMpUu1YBzptGDe9X8SkFHqx6vwkQMu0g0ttmC8xFToJ4fC403wbsFG8YOo10oqL
	vmSl6PFsCCBjYJeoKIVrff4cgGovLxzRy+6/sC5C5yoeUEFZj5H3nRN5xyQNx+voJHOj7kidKJ2
	WCExOwIbshmdBEopg8p8JgSUH3RpStrkyE0XsNH2fbgT/q4HX2oY1MhmszTSo0rl4QvYflIG1PT
	WpLcHLCspfg0738jO+ZIJLkA0aGDL94KE6b/CPB2iFYdwj3xnH9Psg8Ar1zuP/6TwGp/Si3YMDQ
	xdGw7yFAZFecWiH/slgtUUnBMTKNiXcIDR72FADBfZLPR2Z5pSYOgQc9ssay77UVQLOa6R3XjZy
	m0TDtGE0nJ2DjxelvYqBhz2Z13RyM9tA==
X-Google-Smtp-Source: AGHT+IEBzV0IbHuVzOTsyDuWpF2eN8r/rVxM96zDLxGXl/KVt1BLBpZDIq4pBth59EGMDJOzTxxfPw==
X-Received: by 2002:a05:6000:2489:b0:3ee:155e:f61f with SMTP id ffacd0b85a97d-429bd676b41mr1598513f8f.8.1761894063100;
        Fri, 31 Oct 2025 00:01:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13eae16sm1818427f8f.32.2025.10.31.00.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 00:01:02 -0700 (PDT)
Message-ID: <f1b26ecf-3e0f-43f4-8c95-c95424e194a9@gmail.com>
Date: Fri, 31 Oct 2025 08:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][scarthgap][PATCH] inotify-tools: add ptest support for
 inotify-tools
To: nikhil.r@bmwtechworks.in, openembedded-devel@lists.openembedded.org
References: <20251031062405.122538-1-nikhil.r@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251031062405.122538-1-nikhil.r@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 07:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121225

On 10/31/25 07:24, Nikhil R via lists.openembedded.org wrote:
> Add ptest support for inotify-tools by introducing a run-ptest script.
> The ptest verifies the correct functioning of inotify event handling
> and related utilities.
>
> Test coverage includes:
>  - File creation, modification, and deletion event monitoring
>  - Event handling and command-line option parsing
>  - Basic consistency and behavior of inotify event queues
>
> The ptest completes in under 20 seconds
>
> output:
> :~# ptest-runner inotify-tools
> START: ptest-runner
> 2025-10-30T08:38
> BEGIN: /usr/lib/inotify-tools/ptest
> If you want to do a malloc trace, set MALLOC_TRACE to a path for logging.
> event_to_str: test begin
> event_to_str: test end
> event_to_str_sep: test begin
> event_to_str_sep: test end
> str_to_event: test begin
> str_to_event: test end
> str_to_event_sep: test begin
> str_to_event_sep: test end
> basic_watch_info: test begin
> basic_watch_info: test end
> watch_limit: test begin
> watch_limit: Warning, this test may take a while
> watch_limit: test end
> tst_inotifytools_snprintf: test begin
> tst_inotifytools_snprintf: test end
> Out of 362746 tests, 362746 succeeded and 0 failed.
> All tests passed successfully.
> DURATION: 15
> END: /usr/lib/inotify-tools/ptest
> 2025-10-30T08:38
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0

It seems this has no PASS/FAIL status:
https://wiki.yoctoproject.org/wiki/Ptest#Implementing_ptest_in_a_package_recipe
Due to this it can't be evaluated in an automated way.

> Verified that enabling ptest does not modify existing package contents
> for inotify-tools
>
> Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
> ---
>  .../inotify-tools/inotify-tools/run-ptest     | 21 +++++++++++++++++++
>  .../inotify-tools/inotify-tools_3.22.6.0.bb   | 16 +++++++++++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
>
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
> new file mode 100644
> index 0000000000..1bd51248d8
> --- /dev/null
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
> @@ -0,0 +1,21 @@
> +#!/bin/sh
> +# run-ptest for inotify-tools
> +
> +set -e
> +
> +# Run the test binary and capture output
> +output=$(./test 2>&1)
> +status=$?
> +
> +# Print the output for logging
> +echo "$output"
> +

I don't really understand this, why is the output buffered in a
variable? Also, due to "set -e" the output won't be visible if the test
fails.
Am I missing something?

> +# Evaluate result based on exit code
> +if [ $status -eq 0 ]; then
> +    echo "All tests passed successfully."
> +    exit 0
> +else
> +    echo "Test program exited with status $status."
> +    echo "Some tests may have failed. See output above for details."
> +    exit 1
> +fi
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
> index 8a0ae17ad7..3629ce45b2 100644
> --- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
> @@ -10,11 +10,12 @@ SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
>             file://0002-libinotifytools-Bridge-differences-between-musl-glib.patch \
>             file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch \
>             file://0003-replace-stat64-lstat64-with-stat-lstat.patch \
> +           file://run-ptest \
>             "
>  
>  S = "${WORKDIR}/git"
>  
> -inherit autotools
> +inherit autotools ptest
>  
>  EXTRA_OECONF = "--disable-doxygen"
>  
> @@ -25,3 +26,16 @@ CFLAGS += "-Wno-error"
>  PACKAGES =+ "libinotifytools"
>  
>  FILES:libinotifytools = "${libdir}/lib*.so.*"
> +
> +do_compile_ptest() {
> +        cd libinotifytools/src
> +        oe_runmake
> +        oe_runmake test
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    cp -r ${B}/libinotifytools/src/.libs/test ${D}${PTEST_PATH}/
> +}
> +
> +FILES:${PN}-ptest += "${PTEST_PATH}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121224): https://lists.openembedded.org/g/openembedded-devel/message/121224
> Mute This Topic: https://lists.openembedded.org/mt/116044057/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


