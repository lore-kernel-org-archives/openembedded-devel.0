Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7FDC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:15:38 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.13324.1639412137015564796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=AYozQ57O;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.180, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f180.google.com with SMTP id 13so24335960ljj.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ztJ67rmh3BhE0M5s9swHyRmk1RgVfWLgUQD1u9Sp1OM=;
        b=AYozQ57O0Jw8ycu80EePNTsExbZDwsFYflJHZD9L6NUyx2UivxpKyVFU36tINZ3YDU
         QrICiT1UVBr3pECptc80iEt6cewS8devU2ffd6YHUX2eHT40x1Uks1QbFbvDSUDRqC3r
         sSutac2Vc9S8V/SSWGkOPpqhF8a1tFPYo5ZERpANuQWX/XvVo0wz3f1Zj21YUYTrirK4
         ueFd+zAHDMJyYNyQCueAuNmM/51i6qW1uFXBxpfIgUdxcMPKGq7jxudv7By9Tg7eikeU
         f37CGsH70pW0Q8EjectJ0o+UnFpi7wdger6P9Rh0GJNE6UnX2JzmcyraWPZ0GTRPKr2v
         dM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ztJ67rmh3BhE0M5s9swHyRmk1RgVfWLgUQD1u9Sp1OM=;
        b=sM2z95RUFal/3Sgd4vJoXWVpyBEX4PBHI2+Lv2C8VtoVHJ9HH5zXypgbCPTca738uD
         st/1ldrpPKwaD6ZTDTMvjRKz20fiS0hYqewD9/81s9BO1J6PRtYxQ3eWOs1hjj5+Oju3
         lg7PZaHYERtSwf+K96M1a1AthJNeDkkDkREm3KQO642QpneeuWN7nLM2ag/Tp9ZF1UO1
         IkQBovsc/VaB62NBxvHN8coI+HR1XfbkEUU+XitjKGlQcqx+49LLmlGFbZG3Ku57oxlR
         LxYNAOb7QQJ5euxPNg+KNbkud93i2WJyMCuCIfcXhR9wDBdPJMbQsoDpAiVn8dpm7aU8
         8s0A==
X-Gm-Message-State: AOAM531TGek7eTJAX12KNRJKA5kEsRPnrqz4bRhqtqU+oQV+Y5kBucMY
	7yBH1PQxza/GHyGldCNvfghxEg==
X-Google-Smtp-Source: 
 ABdhPJzB2p6PntCiEbwORzlST7VY2iCmQMTaLiLpoOMDVJ3SlN64eICd3wGaaQZCmwQ2lzeUYRHcXQ==
X-Received: by 2002:a2e:9699:: with SMTP id q25mr30301062lji.6.1639412134797;
        Mon, 13 Dec 2021 08:15:34 -0800 (PST)
Received: from [192.168.50.157]
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 w6sm1489183lfn.169.2021.12.13.08.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 08:15:34 -0800 (PST)
Message-ID: <81f3d2f0-6596-14d6-ba4f-78780b0dacf0@oleksandr-kravchuk.com>
Date: Mon, 13 Dec 2021 17:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [oe] [meta-multimedia][PATCH] gssdp: update to 1.4.0.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20211212183612.3489223-1-open.source@oleksandr-kravchuk.com>
 <CAMKF1sqGtF4cQd8yRpR4r-QsLCG909cKa66+4bA95+dUfD4kJw@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
In-Reply-To: 
 <CAMKF1sqGtF4cQd8yRpR4r-QsLCG909cKa66+4bA95+dUfD4kJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 16:15:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94335

Isn't it because meta-gnome is not included?

On 13/12/2021 17:09, Khem Raj wrote:
> I am seeing this failure
>
> stdio: ERROR: Nothing PROVIDES 'gtk4' (but
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> DEPENDS on or otherwise requires it). Close matches:
> stdio: ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
> stdio: ERROR: Nothing PROVIDES 'gtk4' (but
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> DEPENDS on or otherwise requires it). Close matches:
> stdio: ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
> stdio: ERROR: Command . ./oe-init-build-env; yocto-check-layer-wrapper
> ../meta-openembedded failed with exit code 2, see errors above.
> (1639376061.2: 1715.6)
>
> see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1788
>
> On Sun, Dec 12, 2021 at 10:36 AM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>   .../recipes-connectivity/gupnp/gssdp_1.2.3.bb | 20 --------------
>>   .../gupnp/gssdp_1.4.0.1.bb                    | 27 +++++++++++++++++++
>>   2 files changed, 27 insertions(+), 20 deletions(-)
>>   delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
>>   create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
>>
>> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
>> deleted file mode 100644
>> index 8f27ae292..000000000
>> --- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -SUMMARY = "Resource discovery and announcement over SSDP"
>> -DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
>> -LICENSE = "LGPLv2"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>> -DEPENDS = "glib-2.0 libsoup-2.4"
>> -
>> -SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
>> -SRC_URI[md5sum] = "ef3295a965c06ce0f683522391fbb910"
>> -SRC_URI[sha256sum] = "a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8"
>> -
>> -GTKDOC_MESON_OPTION = 'gtk_doc'
>> -
>> -inherit meson pkgconfig gobject-introspection vala gtk-doc
>> -
>> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sniffer', '', d)}"
>> -PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+3,"
>> -
>> -PACKAGES =+ "gssdp-tools"
>> -
>> -FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
>> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
>> new file mode 100644
>> index 000000000..43d2fcfa0
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
>> @@ -0,0 +1,27 @@
>> +SUMMARY = "Resource discovery and announcement over SSDP"
>> +DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP \
>> +               (Simpe Service Discovery Protocol)."
>> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/gssdp/"
>> +BUGTRACKER = "https://gitlab.gnome.org/GNOME/gssdp/-/issues"
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>> +
>> +SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz"
>> +SRC_URI[sha256sum] = "8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582"
>> +
>> +GTKDOC_MESON_OPTION = 'gtk_doc'
>> +
>> +DEPENDS = " \
>> +    glib-2.0 \
>> +    libsoup-2.4 \
>> +    gtk4 \
>> +"
>> +
>> +inherit meson pkgconfig gobject-introspection vala gtk-doc
>> +
>> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sniffer', '', d)}"
>> +PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+3,"
>> +
>> +PACKAGES =+ "gssdp-tools"
>> +
>> +FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94306): https://lists.openembedded.org/g/openembedded-devel/message/94306
>> Mute This Topic: https://lists.openembedded.org/mt/87681937/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

