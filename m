Return-Path: <leon.anavi@konsulko.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 323156D545
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 18:29:07 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id g3so16197236ljl.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 10:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=uen4DcNfehvkMTFRHiItbROtXYxBA433EavSMe9dJiE=;
	b=n4CVBhliwbd0aRuwVOPKzS1qCgjLgzQoW2WXqzM7Cmtiij4it3FmXWLapidTmucLag
	PCfrs0zRLXpZK+nEhtC9FWL4YJNvtz5CCaaKcb7boPpaJkQK2S1pwUivTWOy/LsmrQP2
	XOTny6Radzi+H2nHYyiW9bKvlT84u73xJ7iyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=uen4DcNfehvkMTFRHiItbROtXYxBA433EavSMe9dJiE=;
	b=akw1KzsDbS226ghxgxlyfO3XQzs0f31Q4zxPSMEyC7GHd2/5AipdJczepzfSdH9rnw
	8wmSGEU2x5ve3J1WHwWaYjzpkecuhupjgmZwVpa4kpTGWVjxv4on4FJiu+A1ytwXz7cW
	JG6sHfng1BzegIcF0KGcYWsy+A6ZnvYXFXUVSq4UsMxjk9u9nQsfgGQJIHQdOH7e8eCJ
	Fp5RaGky7BcODEMpI63c3mgZ52hxYBp4U5ayq4bl4RLjzy3TcCo+LdbliFVlKPyC00gz
	uUFuNJ5VbDJwu1MfMhhw0DKOP/fd+3eN4qxAEyrn0qeNuHnZf7Ent4FR0+aptgw7fbQA
	kmPw==
X-Gm-Message-State: APjAAAW5PNxO/ViOmBInG7Cqp9mu3OH28kEzgYReA2ku7rz6O29N4VZt
	kvxEl48XKupjizKJMoukNLX+p/bqgUk=
X-Google-Smtp-Source: APXvYqzxi/DdriGfIsbqiJHVyLAtRYRzGZYCA6wPtoQLRyzKHSxtnqVnEw8WyQlHPcbzUpAKjRyVuQ==
X-Received: by 2002:a2e:2a05:: with SMTP id q5mr5581745ljq.170.1574015347367; 
	Sun, 17 Nov 2019 10:29:07 -0800 (PST)
Received: from [192.168.4.166] ([78.130.245.67])
	by smtp.gmail.com with ESMTPSA id
	q11sm7133452ljm.107.2019.11.17.10.29.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2019 10:29:06 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1573997112-20833-1-git-send-email-leon.anavi@konsulko.com>
	<8ECFF12A-D752-410D-B1AA-24BD1A4384C3@gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Message-ID: <183978e3-aeef-dc14-e5b5-9cfa6e5027ed@konsulko.com>
Date: Sun, 17 Nov 2019 20:29:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8ECFF12A-D752-410D-B1AA-24BD1A4384C3@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv3] surf: Add a simple web browser
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
X-List-Received-Date: Sun, 17 Nov 2019 18:29:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Alex,

On 17.11.19 г. 16:42 ч., Alexander Kanavin wrote:
> Why is there a dependency on both gtk 2(obsolete) and gtk 3?
I must have overlooked it. I've updated the patch. Thanks!

Thanks,
Leon

>
> Alex
>
>> On 17 Nov 2019, at 14.25, Leon Anavi <leon.anavi@konsulko.com> wrote:
>>
>> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>> .../0001-config.mk-Fix-compiler-and-linker.patch   | 41 ++++++++++++++++++++++
>> meta-oe/recipes-graphics/surf/surf_2.0.bb          | 26 ++++++++++++++
>> 2 files changed, 67 insertions(+)
>> create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>> create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
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
>> index 0000000..d57efa6
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
>> +DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0"
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
>> +    install -d ${D}${bindir}
>> +    install -m 0755 ${S}/surf ${D}${bindir}
>> +}
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


