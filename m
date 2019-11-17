Return-Path: <leon.anavi@konsulko.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 422837F8AE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 19:04:45 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 139so16297666ljf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 11:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=rAph9q1z4pK5tGbhaHmvbu4yV5+4aMm2BUcuvEKvCbc=;
	b=FNKOXT3Wi5i+kKmHPAmYyr31XQyFtvBVep45WNkh8p5hSHoo6xqHgE4IhFpcefb7MG
	JjyKTDd/8Pn17WxKp/huF1X92jHrcCKg6r/PWyH3KD4CMrY8Y4DAzddOrWv3vShNGU5x
	VmbWAj4Wkei7HMFUGU9qkDC/PWozIIdrjhFNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=rAph9q1z4pK5tGbhaHmvbu4yV5+4aMm2BUcuvEKvCbc=;
	b=CEdOmwIjULw42P0OmWtTLbAqqeszEUQRFaMOdiOlh6YZ9y/UKMEs3LsRN/y2JRp55H
	xGPnbKVFTgYEbRHVAP/Mdji+XcWSiD1v1yIYT20P/MjIgukm9z7FfAF4gG3BtsskISH1
	DuEhjr1PfN445y5KGZUHkIb+c8a4cevTrfUJClnNmdwC3ceWqP6A68AA4M/EQTxQJBlU
	sfOYgL0IfYtcSzswadGzj14Z1EqMUDMVp5PYIMFeROjR/gKgGPds/e57/27iR0cbxQi4
	UW5J7mmwJuPUouAiRK+VjVXGmWuNNo3wgW7p9w8GtCdwI0I1JL90wKd+wjzlfqZotVtc
	ovhw==
X-Gm-Message-State: APjAAAX7s4ljYuyiQkdsFED3j6Kc+OGNLPbUI7E8LLvX95gGgncKhkah
	4fMMHuTc65RG5GVkUf0kGt0OGWQmwQY=
X-Google-Smtp-Source: APXvYqxfA+QduI0TJ9DbApaxHbH1yGRshVSFDuBL1ccfE7qEO1oJ8i9JQcaD3S7uWG077dZdjyT5YQ==
X-Received: by 2002:a2e:9947:: with SMTP id r7mr18415627ljj.104.1574017485331; 
	Sun, 17 Nov 2019 11:04:45 -0800 (PST)
Received: from [192.168.4.166] ([78.130.245.67])
	by smtp.gmail.com with ESMTPSA id b4sm7319845ljp.84.2019.11.17.11.04.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2019 11:04:44 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1574015291-12573-1-git-send-email-leon.anavi@konsulko.com>
	<CAMKF1spa+oa376cdaPddWZdqxAXgEhoDF0rdAJNx71UZ5ez9hA@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Message-ID: <fd4741b0-6651-03fd-e769-6a9913b91502@konsulko.com>
Date: Sun, 17 Nov 2019 21:04:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spa+oa376cdaPddWZdqxAXgEhoDF0rdAJNx71UZ5ez9hA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv4] surf: Add a simple web browser
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Nov 2019 19:04:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

On 17.11.19 г. 20:54 ч., Khem Raj wrote:
> On Sun, Nov 17, 2019 at 10:28 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../0001-config.mk-Fix-compiler-and-linker.patch   | 41 ++++++++++++++++++++++
>>   meta-oe/recipes-graphics/surf/surf_2.0.bb          | 26 ++++++++++++++
>>   2 files changed, 67 insertions(+)
>>   create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>>   create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
>>
>> diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>> new file mode 100644
>> index 0000000..fb90432
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>> @@ -0,0 +1,41 @@
>> +From e97bb73851f5bbd94260da553a222526485cdfb1 Mon Sep 17 00:00:00 2001
>> +From: Leon Anavi <leon.anavi@konsulko.com>
>> +Date: Fri, 15 Nov 2019 18:24:42 +0000
>> +Subject: [PATCH] config.mk: Fix compiler and linker
>> +
>> +Do not set explicitly compiler and linker.
>> +
>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> +---
>> + config.mk | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/config.mk b/config.mk
>> +index df6e812..5deb991 100644
>> +--- a/config.mk
>> ++++ b/config.mk
>> +@@ -15,17 +15,17 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`
>> + GTKLIB = `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
>> +
>> + # includes and libs
>> +-INCS = -I. -I/usr/include -I${X11INC} ${GTKINC}
>> +-LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
>> ++INCS = ${GTKINC}
>> ++LIBS = -lc -lX11 ${GTKLIB} -lgthread-2.0
>> +
>> + # flags
>> + CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBEXTDIR=\"${LIBPREFIX}\" -D_DEFAULT_SOURCE
>> + CFLAGS = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
>> +-LDFLAGS = -s ${LIBS}
>> ++LDFLAGS = ${LIBS}
>> +
>> + # Solaris
>> + #CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
>> + #LDFLAGS = ${LIBS}
>> +
>> + # compiler and linker
>> +-CC = cc
>> ++CC ?= cc
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.0.bb
>> new file mode 100644
>> index 0000000..39c0f5e
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
>> @@ -0,0 +1,26 @@
>> +SUMMARY = "Simple web browser"
>> +DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
>> +HOMEPAGE = "https://surf.suckless.org/"
>> +SECTION = "x11/graphics"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
>> +
>> +DEPENDS = "webkitgtk gtk+3 glib-2.0"
>> +
>> +REQUIRED_DISTRO_FEATURES = "x11"
>> +
>> +SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
>> +           file://0001-config.mk-Fix-compiler-and-linker.patch \
>> +"
>> +SRCREV = "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit pkgconfig distro_features_check
>> +
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +
>> +do_install () {
>> +       install -d ${D}${bindir}
>> +       install -m 0755 ${S}/surf ${D}${bindir}
> you could do it with one liner
>
> do_install () {
>      install -D -m 0755 ${S}/surf ${D}${bindir}/surf
> }
OK, let's do it with one liner. I've updated the patch again.

Thanks,
Leon
>> +}
>
>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Leon Anavi
Software Engineer
konsulko.com


