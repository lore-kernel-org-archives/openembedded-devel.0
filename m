Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C29CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 03:49:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4266.1778644163567449546
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 20:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UBAGXQs0;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so5330366f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 20:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778644162; x=1779248962; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1Zetk5siDZLr2FY1IMMfdzB9KuMw8c9kX6d2/wbrc8=;
        b=UBAGXQs0PT3j+3cSHg86eTBv+X74bLTBDD77qRi9dJueyab+hl+ld9MzuNtuv/XC8z
         ZNSWU8vghRaeDw8kvyicP8085FLumvwRuqFxL1YHGYknDBNcQ7hy9VQbdh9maBuTAvWJ
         Kj13uNhQFTX8maA/XjdbOgKef4k+Ii1pSuRTg/oJxvptr0V5m6itWxwC2olPac9dIPsh
         2vRtmpp5NwlelLAkFU7qeJUdjGjw0X05EVdQqEVVtzDWJaSpheHWsG8eF2mLI6840EOe
         l2WQWywdez4s7TST299SnwUF8d/Jo9o6yoaA1kXfFy1y8bH14FTNQscXit+fCUWnoqDl
         tZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778644162; x=1779248962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1Zetk5siDZLr2FY1IMMfdzB9KuMw8c9kX6d2/wbrc8=;
        b=JYb4qtna/npfzaEI0K6P+89PMbS8gy66QSvVu+5SqmqApa0MPhFIcdiXn1qe7Aqodu
         tYJb+cnZGNfmzFL3EJQNH+BkCiW7iffx7veje91CwqabakgbII9XsXGJOazoppJQNItX
         qUn+3j907LHqzSQv1Mb9NaBY2XmFqwj8M3YNg+NJUCnud3hA1YATAMkbmy1LoTuIBZei
         HSrzZwSjKqlu3XlAn1tE+iVkv4GSDB8nfoI0VkjZ5PpwEL9RwriWKMmJ7Sx91ilIstNy
         uaJZAfAWqPt8z1S6alIKI17p27WbwWj7oettTq20VEqPvrjGTyRWfaLdymlImFokTu3e
         8OGQ==
X-Gm-Message-State: AOJu0YwEci/Wx5yd8QFuMfKx0BRdsnF/PfBHQhzgau74DHhWSFxlvRnx
	XX16tf20AFGmzoP+yAS8pTsGJibhyfaN8C9NeQ/wb9mbqZHXwfvNHdol
X-Gm-Gg: Acq92OG4zg14UNylOoZF/5t2Hsfw0v7Yg23HkDvLzfn9rl1pqmCUcQGvT8zNj2dFE9d
	4arXaT3otR6noOrtW+/WhP6Im+d8jLvs2Buiout3vK+VLcIOeaa9YdIRtfXACn2h2RFDGEnXfzn
	XsJ60olF2XGlsQc8i/YXo/Hq831JExc7tKIo2V0YopRQ+qnRO6+U3q890b8N50sLHSPOYm4mHh3
	VQO3U1QKQqK7v2IOZxybqfZ9GmSCjGiBSlTCogPU8yJdSN4BCavBenaNItaFJ5E6qJaAUWWo6FE
	dz9PTUzcdltTYngLoOTSu/E6bWkBirDeIjOTg7VsdYBG0HR/c5LL081rPkaGi50VG9s/3DSJFmJ
	vCqPQyv8HLINUVwOrFV6CsFeyf/L4f+52sCPuIRNW0aJyHBHNZN6NNgSLUU/FqFaf3i2eVQCO/r
	JUJF10WcLmqcGZjtCHLxGS3GskxQ/8TSK/M5B0mtui6A==
X-Received: by 2002:a05:6000:200e:b0:439:b8b2:fabc with SMTP id ffacd0b85a97d-45c59bd6934mr1884169f8f.21.1778644161722;
        Tue, 12 May 2026 20:49:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm37651824f8f.33.2026.05.12.20.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 20:49:21 -0700 (PDT)
Message-ID: <b524d6f1-ba30-45ff-a061-37e5d715f9b2@gmail.com>
Date: Wed, 13 May 2026 05:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH 2/3] libdazzle: add recipe (from oe-core)
To: ankur.tyagi85@gmail.com, ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
References: <20260512163727.3832144-1-ross.burton@arm.com>
 <20260512163727.3832144-2-ross.burton@arm.com>
 <CADySD0FRGBe_D3Xgdcxj-xSYjmo4qXqpQWXWDvg1LE-dBDK4sQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0FRGBe_D3Xgdcxj-xSYjmo4qXqpQWXWDvg1LE-dBDK4sQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126886


On 5/13/26 01:56, Ankur Tyagi via lists.openembedded.org wrote:
> 3.44 was released in 2022 and the project is in archived state, do we
> really want to add this recipe?


There are other recipes that depend on this.

Speaking of which: Ross, epiphany in oe-core still seems to depend on
this:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/epiphany/epiphany_50.4.bb?h=master-next#n17



> 
> On Wed, May 13, 2026 at 4:37 AM Ross Burton via lists.openembedded.org
> <ross.burton=arm.com@lists.openembedded.org> wrote:
>>
>> This was previously in oe-core but is being removed as it is no longer
>> used by anything in that layer.
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  .../libdazzle/libdazzle_3.44.0.bb              | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>  create mode 100644 meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb
>>
>> diff --git a/meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb b/meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb
>> new file mode 100644
>> index 0000000000..9bca7e9dce
>> --- /dev/null
>> +++ b/meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY = "The libdazzle library is a companion library to GObject and Gtk+."
>> +DESCRIPTION = "A wide range of components from utilities for GIO, widgets for \
>> +GTK+, an animation framework, state machines, paneling and high-performance \
>> +counters are included."
>> +LICENSE = "GPL-3.0-or-later"
>> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/libdazzle"
>> +BUGTRACKER = "https://gitlab.gnome.org/GNOME/libdazzle/issues"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
>> +
>> +inherit gnomebase upstream-version-is-even vala features_check gobject-introspection
>> +
>> +DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
>> +
>> +SRC_URI[archive.sha256sum] = "3cd3e45eb6e2680cb05d52e1e80dd8f9d59d4765212f0e28f78e6c1783d18eae"
>> +
>> +GIR_MESON_OPTION = 'with_introspection'
>> +
>> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>> --
>> 2.43.0
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#126876): https://lists.openembedded.org/g/openembedded-devel/message/126876
>> Mute This Topic: https://lists.openembedded.org/mt/119281118/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


