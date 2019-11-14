Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1BC7FA37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 21:13:29 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k13so4586255pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 13:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gDNScsO5no3eBh8Ml/4LmPJcxK30W3YjLmEGJsSz0P4=;
	b=oAbp1t0fA3+K3uNPSbu+2JKKKZvDzjc/e83B3PrS96a19Bo9kt/yxqY+8dahnr9183
	hmY6ORpHk1mvWhD+FSd+EhkMrF1yIi4O5KMwrLJSDZtA/+EBlYB0RTpPqL+M4x2zB9j2
	AehBXjpjTw4EEsArO6pdwO3Qk+Rk7P3muoYQo3h0Pezg9nDipG8y7Gtl7AoqIutiCg6J
	CHUZEgqkwksTavcaSZO+SdyHHIH5f0qvCNgZFTvu3igWR/VUOKBgfmApcqcbh865Rry+
	ZcnMrNKf/fWUhBlX4Zz83GdD7RoowrA779B5HnHgr8Z8o0B7ap77Wm5HAy8LxbCF2Kcu
	2ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=gDNScsO5no3eBh8Ml/4LmPJcxK30W3YjLmEGJsSz0P4=;
	b=ryJ7RIIsXaXeLYEyilR5fKk1w6lN5a0tCn9I47t4YY4R4EqdwtEJTLuB6eiggj8vhN
	+MZjvTyLCyrMClGpA3uXSb4aUmEuYOW1GeuAhcwmWSNf91LHiXxPwlVyql9aO988fI8T
	lxmuN7Q97kninUyYiy/RIuKaDlQhookIb/RknaZ6XVJwAWj8sBZ386/1/wbOvIv7pGn8
	zt5AU5Sl9UNZhDOxccXFROnbGBtRdUWWf2cfWKV9s9VxHlQz159nXyncg6PeRgoDppuW
	NS4mNBpFeYmFqOyOaygCo9Rdowdp6tQqXbcvysFp0gUr4F9qd2klD+k2HSkiVamwmn9z
	DxpQ==
X-Gm-Message-State: APjAAAXamWqL0li19SxkrX2v8CpcNU25Lj9og4GlzTLB/vNWmNnAhKBS
	RA8zC8icX5PIaNnqphDYQbGAiS01
X-Google-Smtp-Source: APXvYqwxY+vkn/wfxvBDTDLXGbabqZBvc4uZAsTs5kgwxrWsQqdV10hEPypZEP3/EKqHiUA3Mg/5aA==
X-Received: by 2002:a17:90a:1a52:: with SMTP id
	18mr14423508pjl.26.1573766009859; 
	Thu, 14 Nov 2019 13:13:29 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:90e5:8f1e:65b9:f435?
	([2601:202:4180:a5c0:90e5:8f1e:65b9:f435])
	by smtp.gmail.com with ESMTPSA id
	a66sm7948705pfb.166.2019.11.14.13.13.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2019 13:13:29 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
	<CAMKF1sqtcxZjwRk+Zuqgf0UqiDm98NmCjaZbSsSNT0Y=eZY4BA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fb65906f-a9b9-43b8-57ed-fa4e02ef2e68@gmail.com>
Date: Thu, 14 Nov 2019 13:13:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqtcxZjwRk+Zuqgf0UqiDm98NmCjaZbSsSNT0Y=eZY4BA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Thu, 14 Nov 2019 21:13:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/14/19 11:10 AM, Khem Raj wrote:
> On Thu, Nov 14, 2019 at 10:53 AM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 11/14/19 9:20 AM, Leon Anavi wrote:
>>> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
>> shouldn't this go into the meta-webserver layer ?
> perhaps but its the browser
hehe, your right..
>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> ---
>>>  .../0001-config.mk-Fix-compiler-and-linker.patch   | 36 ++++++++++++++++++++++
>>>  meta-oe/recipes-graphics/surf/surf_2.0.bb          | 30 ++++++++++++++++++
>>>  2 files changed, 66 insertions(+)
>>>  create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>>>  create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
>>>
>>> diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>>> new file mode 100644
>>> index 0000000..a3e33ea
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>>> @@ -0,0 +1,36 @@
>>> +From df199f82752398f86d2332dce53f52e2cfb50c87 Mon Sep 17 00:00:00 2001
>>> +From: Leon Anavi <leon.anavi@konsulko.com>
>>> +Date: Thu, 14 Nov 2019 14:28:39 +0000
>>> +Subject: [PATCH] config.mk: Fix compiler and linker
>>> +
>>> +Do not set explicitly compiler and linker.
>>> +
>>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> +---
>>> + config.mk | 6 +++---
>>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/config.mk b/config.mk
>>> +index df6e812..bf07406 100644
>>> +--- a/config.mk
>>> ++++ b/config.mk
>>> +@@ -15,8 +15,8 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`
>>> + GTKLIB = `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
>>> +
>>> + # includes and libs
>>> +-INCS = -I. -I/usr/include -I${X11INC} ${GTKINC}
>>> +-LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
>>> ++INCS = ${GTKINC}
>>> ++LIBS = -lc -lX11 ${GTKLIB} -lgthread-2.0
>>> +
>>> + # flags
>>> + CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBEXTDIR=\"${LIBPREFIX}\" -D_DEFAULT_SOURCE
>>> +@@ -28,4 +28,4 @@ LDFLAGS = -s ${LIBS}
>>> + #LDFLAGS = ${LIBS}
>>> +
>>> + # compiler and linker
>>> +-CC = cc
>>> ++#CC = cc
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.0.bb
>>> new file mode 100644
>>> index 0000000..98d3b23
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
>>> @@ -0,0 +1,30 @@
>>> +SUMMARY = "Simple web browser"
>>> +DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
>>> +HOMEPAGE = "https://surf.suckless.org/"
>>> +SECTION = "x11/graphics"
>>> +LICENSE = "MIT"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
>>> +
>>> +DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0 xserver-nodm-init"
>>> +
>>> +REQUIRED_DISTRO_FEATURES = "x11"
>>> +
>>> +SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
>>> +           file://0001-config.mk-Fix-compiler-and-linker.patch \
>>> +"
>>> +SRCREV = "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +inherit pkgconfig
>>> +
>>> +TARGET_CC_ARCH += "${LDFLAGS}"
>>> +
>>> +do_install () {
>>> +     install -d ${D}${bindir}
>>> +     install -m 0644 ${S}/surf ${D}${bindir}
>>> +     chmod +x ${D}${bindir}/surf
>>> +}
>>> +
>>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>> +INHIBIT_PACKAGE_STRIP = "1"
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


