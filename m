Return-Path: <leon.anavi@konsulko.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 23B4C7F997
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 20:53:34 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 139so8221723ljf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 12:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=HVSY3V5nLsu6/PVYMeW0YZGpi+S5slGqFjQySqLWDOw=;
	b=NjxInhWFjW1bpAOU/FsqBTkB8fskmJk+nq4w/xj1rPpuYDiN9AKOLQCpYCTrq72d+i
	HKVwFap+5GzKZdfHMUKouomV0aPSoYFdOjrBfJA6qoGqb+kg668fKmZSLgTC09ER/Vg/
	tNHhpcZjiQ5W6Z8A1yjQo7ex9B9S/P75bF3X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=HVSY3V5nLsu6/PVYMeW0YZGpi+S5slGqFjQySqLWDOw=;
	b=rt4Mc9Yi7uqo2F96rIbd+YSUDLLRLdBDUq/T5gdunMTZkuC+XYIcyQ7kz8vR9ij0rw
	0LcVy1N+TBXJCXTeyRyLMCTg/lG3ThH3NnCI9TJwSUjEwUV6X/egrTv9hrkh5pQVR8xL
	uahAFrEAPjd2iHE1M47MwsGjkwLO3FSuUkYdDiZXeDCjB4jbCM5ANFHV4t4Fx1+JqoA2
	L46FQxVpd8nzjG7VUgT6yhseZiIzDQkCEflbJ0/H5N4FFyFNmQnOHbVpH2i6w0GdBAd3
	H4fPTxd+dVCLIV1PZOepUqpSCSxT6J3OWRDUXkvvlxAyHiUaEEJai5fn1lWMDHZZfhLT
	2LRA==
X-Gm-Message-State: APjAAAWg2JX95BKAuqXKWBP075JVWJKbM7ZQCfYeQeHab+BX4Ld6jzfY
	dFG61AP2NaoUsR4qYZtkKqLE31a1Y+0=
X-Google-Smtp-Source: APXvYqz6khxDV/rvQef/DBzuF7bEk8FVRgZ7avzEytNnlzVx23IoV1QzG/OjmCTDps90ZMwSHRT9yw==
X-Received: by 2002:a2e:97d8:: with SMTP id m24mr8655005ljj.62.1573764815273; 
	Thu, 14 Nov 2019 12:53:35 -0800 (PST)
Received: from [192.168.4.166] ([78.130.245.67])
	by smtp.gmail.com with ESMTPSA id a5sm2787403ljm.56.2019.11.14.12.53.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2019 12:53:34 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
	<CAMKF1sqtcxZjwRk+Zuqgf0UqiDm98NmCjaZbSsSNT0Y=eZY4BA@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Message-ID: <77b2e088-1b0d-2748-274e-5a3e25b29381@konsulko.com>
Date: Thu, 14 Nov 2019 22:53:33 +0200
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
X-List-Received-Date: Thu, 14 Nov 2019 20:53:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Armin, Khem,

On 14.11.19 г. 21:10 ч., Khem Raj wrote:
> On Thu, Nov 14, 2019 at 10:53 AM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 11/14/19 9:20 AM, Leon Anavi wrote:
>>> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
>> shouldn't this go into the meta-webserver layer ?
> perhaps but its the browser
I will be happy to move it to a more appropriate location. Where should 
this recipe go?

I have been thinking a lot before submitting the patch and I decided to 
add it to recipes-graphics and set SECTION to "x11/graphics" because it 
is a web browser with GUI. The other web browser, links, is in 
meta-oe/recipes-support.

Best regards,
Leon
>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> ---
>>>   .../0001-config.mk-Fix-compiler-and-linker.patch   | 36 ++++++++++++++++++++++
>>>   meta-oe/recipes-graphics/surf/surf_2.0.bb          | 30 ++++++++++++++++++
>>>   2 files changed, 66 insertions(+)
>>>   create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>>>   create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
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

-- 
Leon Anavi
Software Engineer
konsulko.com


