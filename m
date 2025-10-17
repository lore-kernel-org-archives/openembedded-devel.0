Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14539CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:40:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.3237.1760733644648884201
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AvxqJo1k;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-427015003eeso1539221f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 13:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760733643; x=1761338443; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqHXS5F4YAfsJb2j0lrmc6sMK9BEIkEH7I5oxqn74Rs=;
        b=AvxqJo1kIrGYF+Jqm1NpQ9kH/QpeRVdxzw14sAgDBs1eKoZeRXn/M9tOTrOpIiXtgJ
         7r5BkXnWZ8hybfGer8l/75nx8UTtZZgA1kwhIQ/70GvHJqcopL0X9Vt5+10Fg8xP3Tl9
         1sdUx4u002yPrw+w4AQQHfjIdpsMo3nDnm+w5aajpmHgWEUJMSdXHhlJG/F3CjKuqpzH
         HITaTI4OH4AZYryzFLB1fSQo3Y+TIGCsdaPfrDkeD1NML26FkxEZlEg24iYFBHN5Y0UL
         E+3HSw/NfYLMbulD3qmjCgJapwkC2VpFEdT38HmTqG8pUoBazEs2IETZGjmHU90Bm0R8
         fl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733643; x=1761338443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqHXS5F4YAfsJb2j0lrmc6sMK9BEIkEH7I5oxqn74Rs=;
        b=HOkDUVsitV0Rv8l7pRQRB/5BJXEt4z64kTN5Sb9dJKtjBmPepwu+wU5TMLYKn4ggKp
         vSSe/CDKeQp6qosH6od5ui/8vv0p+p8iNDSfGztyM+WgX0VKHGDioWc4/DlqFh5Wfjpj
         NsXDmjz61WFNG2kCXB/c/4Bfrb4zRXi2We353o+NjF8mBiATU06I+ITkwyMvVDqLsrJB
         YWb31OIgABq8fF+gyVqVWh/EegmOb+K7YUIxqB+f7TeZN3UQ9RIU1mBKYKqVzyiyE6OM
         5b57taZhNbLjMQB6U2vrp6TlPpZ0ZBTpAaWl6fuDPlKkmj4HKHaxfj9M5Yc+rcWj9PuF
         gc8A==
X-Gm-Message-State: AOJu0YxyeLY81u0bIHHCYBaRZu+bXBLas1IUEvCx1NbRfbZ/GyBhPE4h
	5mZzB7+g/p/EbwUX9/JfuKvYunSACDovmZLEpHduDPjjiIF6opBMsxez2iF7xw==
X-Gm-Gg: ASbGncsJhf5AbhnI48wR6cck1WxEbKDMcbfNO2b6BuYkn1UP+gf+qESI0v5Voc8BU1e
	770R0hwYMQ5/RTqZwEF0Y8OuuXmFLASkZ19wApcYYvsXn2UZMETMM0B3btGmMdJcM5R4JVgzFzA
	LlVPGezhj/MzwHOEt6Fy81s2a4EE1GRyNiZhqHV8k7QYIDIIbciYUR+paRttIVWQqOKHv4JMw6N
	WbGgnLB6167VvJq7gq+dJGLamA5UyZoyukZtoHDUG37ylGDrrfi614o7BBxQxTgygGHe6CJw3TM
	3EeunyU6TZK2V4BDm2L6Puu1GXNowKSPHfHLDBbWgEzceyTDczqM9p4nLNYLjmUvYrCob66Hbh+
	dIHt+POVYJlPupU7dghBiLOutfoE2rw6xaNdopQjVOhlIhDomu2OSWPW/ssg4eQTY9DIRKBjJO6
	SdMUyf1i5P
X-Google-Smtp-Source: AGHT+IGTJbNXynDJUWnGDjKX+sY+M3xDXZ8fBlURsjQOt5sxhMCB40N0xJIVxBbJTgJgR+njgj4fkg==
X-Received: by 2002:a05:6000:612:b0:427:151:3d9c with SMTP id ffacd0b85a97d-42704d8df8cmr3887076f8f.16.1760733642791;
        Fri, 17 Oct 2025 13:40:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ba070sm1057858f8f.42.2025.10.17.13.40.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:40:41 -0700 (PDT)
Message-ID: <50c50650-8297-4f39-8a61-2cf9f64f9bbb@gmail.com>
Date: Fri, 17 Oct 2025 22:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libmanette: fix ptests
To: openembedded-devel@lists.openembedded.org
References: <186F61C307482C74.1873@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <186F61C307482C74.1873@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 20:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120779

On 10/17/25 22:37, Gyorgy Sarvari via lists.openembedded.org wrote:
> The original content of the ptest package, manette-test, is a helper demo
> application (like evtest), and not a test suite. Also, the recipe did not
> provide a run-ptest script.
>
> Fix it by installing the actual tests, and adding a run-ptest script.
>
> Note that the test folder structure looks like a gnome desktop test suite
> (and the application is under the gnome umbrella), however the project
> doesn't provide all necessary scaffolding for gnome-desktop-test to work, so
> the tests are executed directly from the run-ptest script.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../recipes-support/libmanette/libmanette/run-ptest    | 10 ++++++++++
>  meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb |  7 +++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/libmanette/libmanette/run-ptest
>
> diff --git a/meta-oe/recipes-support/libmanette/libmanette/run-ptest b/meta-oe/recipes-support/libmanette/libmanette/run-ptest
> new file mode 100644
> index 0000000000..3c937825d1
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmanette/libmanette/run-ptest
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +if [ -d /usr/libexec/installed-tests/manette-0.2 ]; then
> +	cd /usr/libexec/installed-tests/manette-0.2
> +	for t in ./*; do
> +		$t && echo PASS: $t || echo FAIL: $t
> +	done
> +	cd -
> +else
> +	echo FAIL: no tests found
> +fi
> diff --git a/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb b/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
> index 5509b0bb09..4375e4db9a 100644
> --- a/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
> +++ b/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
> @@ -7,10 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  
>  DEPENDS = "libevdev libgudev"
>  
> -SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz"
> +SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz \
> +           file://run-ptest"
>  SRC_URI[sha256sum] = "63653259a821ec7d90d681e52e757e2219d462828c9d74b056a5f53267636bac"
>  
>  inherit meson pkgconfig gobject-introspection ptest vala
>  
> -FILES:${PN}-ptest =+ "${bindir}/manette-test"
>  FILES:${PN}-dev =+ "${libdir}/girepository-1.0"
> +FILES:${PN}-ptest += "${libexecdir}/installed-tests"
> +
> +EXTRA_OEMESON += "${@bb.utils.contains('PTEST_ENABLED', '1', '-Dinstall-tests=true', '', d)}"
>

Probably it would be nicer to have this as a PACKAGECONFIG, but didn't
want to introduce it in Kirkstone... but if there is anyone who'd prefer
having it like that, then I don't plan to die on this hill.

