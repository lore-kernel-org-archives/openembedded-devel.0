Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C5DCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 21:13:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.725.1760476390860671824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 14:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OeABxg1d;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso43176825e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760476389; x=1761081189; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/M2rtPcOlC1fNO7kn9zPF7e6jPVLon0MDoyT8WDuSY=;
        b=OeABxg1dT12SUcTElFJyPK+4TCTKOndTYFwOcKOmhE+beQm51cOIP5RtR+VIS/BkZY
         p678RQOcHRhv6zKOFaXGYo+AH7dFjkgzGUsKV9vhFxYf1vgZTYvnLmmycUNmsYQXWFdf
         kTfd16IVujH5bliprAzaFS4qEcuVFTe2l1cR9Vn6K1hL/my3+bpljOJlP0kXEI/S3IGM
         GAyEL3Mke3QA334XEt6NvVZ4RPAGtbiJbV8UoAYwPVGJK8oVl8Uv0ICKXu0DQDhzjtdI
         wyTbxybrfaEkEGYd4BKVxPiMlsvMXZDYo7kOy/1ipAJMpYn0L8jM75EBZaBlJPOzFCvc
         dPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476389; x=1761081189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m/M2rtPcOlC1fNO7kn9zPF7e6jPVLon0MDoyT8WDuSY=;
        b=Fz0GvrKgC+kuDxXOwBMxEJ+cUGIATtrOda5Jklt8uHV3enio1GzOrMc2Qmmq+L5BaH
         0NmZ1gmHRSZvm4XtQslE4VQeOMrXF/qB9PtksXGjBynH6eNTuvIxLprH88nQ99kD3p4n
         B4pOtLLrGuLp2XL+0tb61ikyuSLgOSu+lyM4D2pLNaO/PsS28c4y+4UaHmqhh6J9SvyO
         auvJc2NXBnb+gkiactqFEJxWO+aC+NMKbsGpHUnP5XLCKqnu+AX05uWaaHLRAr+Q9Jga
         HZXu6FaJ3gFFU7aWAkIAR6ldX1e3EtW+ROkd/JTGK2/STS9J/HFBYTn4OjFdI/zrJUV5
         a2+g==
X-Forwarded-Encrypted: i=1; AJvYcCWP3YJ9DqyxebTaH9KRd5UyIXhpeFzkn/epUjzCkhgrUGgsJwp8xtZCZF9vZ19CiAYE0JEroNNOggp3T+W3XKGhupg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQ4iHVB7yzw/hjBMB3SJQN56BBd/9QyyJmImyQHTCrve1v+beu
	PCiYdHIW1wYLI4yrCthnjuTd6vNAE9H3T2wLv4AVB536hMxFLCHdfdAb
X-Gm-Gg: ASbGncsgrqn/dxNhjsyoIq2lsuMzvFRivfjcqe2LsjDKc0Rij71d7ko2M1xJZ3X/ALK
	7Qi+eF90/KUfQPXR2iXoXO4ug1Bx0HXWEdAU9WBAP2YU6Hbar09eRXKZ6JkhXmCKXvn5n1fukyl
	g+NHybAaY0Cl3YxnYAMIa02CvdEl+9+QqgQYwd65VYlspckW+X4hrZuHYqdSrvGSas6XGxzvvX6
	k5jwTvoRVWOE2JyrO+903vfZtadTSi8ULX+2oQpl2TCSvE2Fx9fHZpXr751Mt1uUL4EreZrQjDO
	xkPo8uMAMq4um/OIpU9NPTvVazeWlenMVRGGWXo/u8XnHqrYhMHL3R3C/pC+89oVYTVbBSgKhJv
	OyZAxfXxwX6SLdtmKs8atBjrDh04yx9itAzqlph7sb2tfLuub11+eqxkGivVPjIhIlPwW6AY=
X-Google-Smtp-Source: AGHT+IEo2wPWXCo1C31FLAmmnSKSQAjyf0mcoA5QXfqOrAZUZWBlyIX5P5gMHY9uYSmn65xFBC08Sw==
X-Received: by 2002:a05:600d:4205:b0:46e:74bb:6f6 with SMTP id 5b1f17b1804b1-46fa9af914bmr180184175e9.22.1760476388995;
        Tue, 14 Oct 2025 14:13:08 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426d0d9050bsm23720845f8f.13.2025.10.14.14.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:13:08 -0700 (PDT)
Message-ID: <aaad9854-c024-40ec-a8d6-c69fc2f90b7b@gmail.com>
Date: Tue, 14 Oct 2025 23:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 18/18] jasper: upgrade to 4.1.2
 release
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
 <20251014205402.1487867-18-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251014205402.1487867-18-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120654

On 10/14/25 22:54, Ankur Tyagi via lists.openembedded.org wrote:
> Bugfixes including CVE-2023-51257
> https://github.com/jasper-software/jasper/compare/version-4.1.1...version-4.1.2
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../recipes-graphics/jasper/jasper_4.1.1.bb   |  2 +-
>  .../recipes-graphics/jasper/jasper_4.1.2.bb   | 35 +++++++++++++++++++

It looks like the original recipe (v4.1.1) wasn't deleted

>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
>
> diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
> index 5281980ecb..d6d5b5de32 100644
> --- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
> +++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
>  
>  SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
> -SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
> +SRCREV = "ff633699cb785967a2cb0084d89d56e53c46e416"
>  
>  CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
>  
> diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
> new file mode 100644
> index 0000000000..d4dae1f22a
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "Jpeg 2000 implementation"
> +HOMEPAGE = "https://jasper-software.github.io/jasper/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
> +
> +SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
> +SRCREV = "ff633699cb785967a2cb0084d89d56e53c46e416"
> +
> +CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
> +CVE_STATUS[CVE-2023-51257] = "fixed-version: patch is already included in sources"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake multilib_header
> +
> +do_configure:prepend() {
> +	JAS_STDC_VERSION="$(echo __STDC_VERSION__ | ${CPP} -E -P -)"
> +}
> +
> +EXTRA_OECMAKE:append = " -DJAS_STDC_VERSION=${JAS_STDC_VERSION}"
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl', '', d)} \
> +		   jpeg"
> +
> +PACKAGECONFIG[jpeg] = "-DJAS_ENABLE_LIBJPEG=ON,-DJAS_ENABLE_LIBJPEG=OFF,jpeg,"
> +PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=ON,-DJAS_ENABLE_OPENGL=OFF,freeglut,"
> +
> +do_install:append() {
> +    chrpath -d ${D}${bindir}/jasper
> +    chrpath -d ${D}${bindir}/imginfo
> +    chrpath -d ${D}${bindir}/imgcmp
> +    chrpath -d ${D}${libdir}/libjasper.so.*
> +    oe_multilib_header jasper/jas_config.h
> +}
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120651): https://lists.openembedded.org/g/openembedded-devel/message/120651
> Mute This Topic: https://lists.openembedded.org/mt/115760534/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


