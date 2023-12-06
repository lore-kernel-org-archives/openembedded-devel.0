Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451FBC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 11:30:07 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.29213.1701862205667573759
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 03:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VY83rhXw;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3333131e08dso739074f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 03:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701862204; x=1702467004; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MukC81aVTDydkty4qgZEwPjS5qU5VUsZe0pGN6mSfUU=;
        b=VY83rhXwNHPweybyPKuvKixqyhS0z/bTdtpYW7HgJiL00wK4tvMvtMdtnLLeelZGgl
         QwhH340CA1IOTQHoSZiVLMCICuqgG/rj+kgjKfpO3mhNkl6sk4Rbcvw0Jh4Dc1bRye7D
         vBI46Dal8xLEhv75kS9tWVg+YoGpus4wSIuzj3WLNjZhOo2OZ4PnC9LzbUYrRxu8m/Cn
         z6zHvaPs4kr3FZ035JLLGGdXdpwOPv0lG5OlZaI/xmGmkkUIeMGwqz/8VL6iuJMzQLmG
         4YGZWsSjOiqeotonuc6WvSxAEqn/lAjKPqgBHp6zOQVaz938H4407WI0EDPBsSlMCVbb
         zq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862204; x=1702467004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MukC81aVTDydkty4qgZEwPjS5qU5VUsZe0pGN6mSfUU=;
        b=rddBBbUK/92ksXkxGMSfSISJaThTNiX6fP1zEUiUs4fE5d601QqXjjGDCQ+jhoqQHj
         WVFMLY3tL5XoVhIbEcFXjMP6zkjvMm8Hgl7WP+KDsrGISoSezXk7LGjXRw7sI00zppMa
         L7c04gW73a8b/piqO5iEln7hauqgf71CXQseBaAzIWzvv86r6QITZl9KJE6r18sRCGCE
         UemGwkoJUbRY7Smef7+8BOXaLm4xsU3TPHv8bWyf4CCJoPtiZM47B+OmHUgof/k680es
         XNYltmRwga5QBWsFQcH5yhWyXiZQX3GnkK1bINGYfwwnFswtCJv1uWFVk7BVeF3GKZoy
         plBQ==
X-Gm-Message-State: AOJu0Ywcup7arQbj22EJLyh0d/4hRnyJLjeer/5PbM43OQI76r178HhN
	U6Ys50ri2HEa04N3EEmeyns=
X-Google-Smtp-Source: AGHT+IHXMa19/zyl00IE63rd2LezZw6elI19i8k8dwCmlwGiNwUwdZfN0RFvWcHvIBQa8GCuzXAeCA==
X-Received: by 2002:a05:600c:5493:b0:40b:5e21:bdc8 with SMTP id iv19-20020a05600c549300b0040b5e21bdc8mr484233wmb.87.1701862203517;
        Wed, 06 Dec 2023 03:30:03 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id j8-20020a170906474800b00a1db175d37csm743081ejs.177.2023.12.06.03.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 03:30:03 -0800 (PST)
Message-ID: <048f1bd7-4986-4fbf-bdf8-55d7b8557bc8@gmail.com>
Date: Wed, 6 Dec 2023 12:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][PATCH v2] zenity: Upgrade to 3.99.91 (4.0 RC2)
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
 =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
References: <20231206063902.152089-1-zboszor@gmail.com>
 <3AC073BC-F68F-4A45-A6F2-0E8E2E15261F@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <3AC073BC-F68F-4A45-A6F2-0E8E2E15261F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 11:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107239

2023. 12. 06. 12:09 keltezéssel, Ross Burton írta:
> Why are you upgrading to a release candidate?

Treat it as an RFC.

I wanted to build a GTK4-only image.
See my other patch against update_gtk_icon_cache to fix the do_rootfs fallout.

>
> Ross
>
>> On 6 Dec 2023, at 06:39, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>>
>> zenity 4.0 now uses GTK4 and GTK4-based webkitgtk.
>>
>> The perl based gdialog is no more, its subpackage would be empty.
>> Don't try to generate this subpackage.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>> v2: Fix GTKIC_VERSION so gtk+3-native is not built and pulled
>>
>> ...to-avoid-pointing-to-build-system-s-.patch | 28 -------------------
>> .../{zenity_3.44.2.bb => zenity_3.99.91.bb}   | 16 +++++------
>> 2 files changed, 7 insertions(+), 37 deletions(-)
>> delete mode 100644 meta-gnome/recipes-gnome/zenity/zenity/0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch
>> rename meta-gnome/recipes-gnome/zenity/{zenity_3.44.2.bb => zenity_3.99.91.bb} (62%)
>>
>> diff --git a/meta-gnome/recipes-gnome/zenity/zenity/0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch b/meta-gnome/recipes-gnome/zenity/zenity/0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch
>> deleted file mode 100644
>> index e054ff744..000000000
>> --- a/meta-gnome/recipes-gnome/zenity/zenity/0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -From c8be0d5e7d17930d819635df6570fa5331a5dedd Mon Sep 17 00:00:00 2001
>> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
>> -Date: Mon, 10 Jan 2022 20:18:00 +0100
>> -Subject: [PATCH] Harcode shebang to avoid pointing to build system's perl
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=UTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>> ----
>> - src/gdialog.in | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/src/gdialog.in b/src/gdialog.in
>> -index 2fc4633..f891861 100755
>> ---- a/src/gdialog.in
>> -+++ b/src/gdialog.in
>> -@@ -1,4 +1,4 @@
>> --#!@PERL@
>> -+#!/usr/bin/env perl
>> -
>> - # gdialog -> zenity conversion wrapper
>> - #
>> ---
>> -2.31.1
>> -
>> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.99.91.bb
>> similarity index 62%
>> rename from meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
>> rename to meta-gnome/recipes-gnome/zenity/zenity_3.99.91.bb
>> index 92b9f6655..34d335d28 100644
>> --- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
>> +++ b/meta-gnome/recipes-gnome/zenity/zenity_3.99.91.bb
>> @@ -3,25 +3,23 @@ SECTION = "x11/gnome"
>> LICENSE = "LGPL-2.1-or-later"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>>
>> -
>> inherit gnomebase pkgconfig itstool gtk-icon-cache features_check gettext
>>
>> DEPENDS = " \
>>      desktop-file-utils-native \
>> +    help2man-native \
>>      hicolor-icon-theme \
>> -    gtk+3 \
>> -    gtk+3-native \
>> +    gtk4 \
>> +    gtk4-native \
>> +    libadwaita \
>> "
>>
>> ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>> +GTKIC_VERSION = "4"
>>
>> -SRC_URI[archive.sha256sum] = "3fb5b8b1044d3d129262d3c54cf220eb7f76bc21bd5ac6d96ec115cd3518300e"
>> -SRC_URI += "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"
>> +SRC_URI[archive.sha256sum] = "e8c80ae1e2a4d7b2eb39c4fb8c4b14814530f37997b49f4c184bf2f7124d84d2"
>>
>> PACKAGECONFIG ?= "webkitgtk"
>> -PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk3"
>> +PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
>>
>> -PACKAGES =+ "${PN}-gdialog"
>> -FILES:${PN}-gdialog = "${bindir}/gdialog"
>> FILES:${PN}-doc = "${datadir}/man ${datadir}/help"
>> -RDEPENDS:${PN}-gdialog += "perl"
>> -- 
>> 2.43.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107235): https://lists.openembedded.org/g/openembedded-devel/message/107235
>> Mute This Topic: https://lists.openembedded.org/mt/103008696/6875888
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross.burton@arm.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


