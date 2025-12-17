Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB18D66B81
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 18:06:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21530.1765994775443774169
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 10:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xfc1NXa1;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47774d3536dso9233745e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 10:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765994774; x=1766599574; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZUlvp6AEK5UhhWNldMTEjwEmCh1sN+ECvPBqScmlUQY=;
        b=Xfc1NXa15+D+LUjVx7AnPso/51CDEXLwkJtvmaGgq0ysyfKzxVdg3CoX66zgT5W5f5
         0A5uL+z4r25uOsDDNxcYNyf6+O2pzPr3bWxBGBJ3iCf6r2mFUmCsoJl3JRhkoqTSH9zX
         EgwyDe4APd+J6I4xpG7bEa4rWYw0iKBTIEPpgSN2E3cGPdbpJTuEMX9+BLIt/wgMAiVZ
         C1COCC1rx7hm9lsMIKoRqGGqxjMsPF4OUqD9RiztifeXs54czhHLUf5HEr2iUe2TzH5o
         ZdMPKo1dOhgsdRIuGyQA2iedSNX/tdJly7T9xdtcBlUv5ERrGwy9OwGZdrolZljasXMh
         UwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765994774; x=1766599574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUlvp6AEK5UhhWNldMTEjwEmCh1sN+ECvPBqScmlUQY=;
        b=XpI4T8ZJxhhuPKS0jCCruNtYPNDkjWC1OY2UblDYGKU/mURf6bSXudYvoAw40IQRwi
         BtzsAHCwhDffWXe1CBCkT3qLjigtI9lbRd+jQ1QE0o3ZgcchOTTf5+DQhUXgECRQYetA
         0dXeJfJFNXG2GJGlSW6qMq8nORUoUAeduekkm0uCE61/elPapnDmEV0drizH2wSf8oEF
         M89EGKwRSQ2HWFONqiyGHQ/Zdx0NXnIT5IdVIMx/2bVExL3As0CXJfNP6QOnzPxPYrkK
         C2YXFIyMQPYCCMHwYQ70oH3OUnreI63mXWjKIm8l9KFYdKMSUiiQ3RpG/uPDlESlLSTq
         wgiA==
X-Forwarded-Encrypted: i=1; AJvYcCV9XvE1g4gZ94ncP64CM7wOnZ9ndmZ8Pw8HgXQCEGrQS+NwLyUueYiiDBUA3pHS9RS75/upooMBxPz69fk/wMhRbNA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxIxb+ehL4WlXOcDmVO87pnnXABAUyJLuslwcZHFXMc50zxOAg3
	kyozLnLY/5peYVYdT/AnbkC50H1yDxHcAXC9URstgIVT2h+cTqGaDqmF
X-Gm-Gg: AY/fxX6pxpeGFdN8eICu4i0gW2F17n6q3SBzXRZdhGVqAMK9SixCDGQNjNfVOpHmXuC
	IiKCA0ArSzvW0A+c25GUiw3obw/5xyXJrPhi7f7Lzi5IGPiKnBJLLxdF4Re4UpZT6tnRy1AkVmm
	MNETubdn/Q/moUIb1FNaKzglQVSMXC3uxBOtQ7nGlx2F29h3OPzGioedicBjNUhUawXkEpPY05d
	1213BFAQQFVeBPJht3rMJMorKSYiH02DtDYQ7zQIwIrS6OvKN+T7/LJsr1U4vpqSYrsI0DOEsGQ
	Dhb4eOuKUymKCHA2Qkvycv9xJoiquWQkbz8BI9Ktp048W6fwqLVaKrxrI50PxGSQ7e7g3AeUZJq
	WZk5y+2EhJ3sfa2upYzZJtoggMLt3wTarPUJPltHfnASQ6VmH0PsDD0Pnz3KWrCHhm6PAbQkh4e
	w+LC+6UO9qQ2m4+gGTuKY=
X-Google-Smtp-Source: AGHT+IE1cvIqFwof0ql1R8fJwzF/8lS3QA3+w880ruJwLS4Cuh21mLKQ04gTG9f/OAVcXfUDfpc39A==
X-Received: by 2002:a05:600c:1d20:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-47be29a52bfmr3207725e9.3.1765994773436;
        Wed, 17 Dec 2025 10:06:13 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723d19sm5392475e9.2.2025.12.17.10.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 10:06:12 -0800 (PST)
Message-ID: <241db2c0-d701-4172-a3d6-7b000c2f5ab6@gmail.com>
Date: Wed, 17 Dec 2025 19:06:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] libtoml: add new recipe
To: rbarrau33@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251217161114.403899-1-renaud.barrau@madic.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251217161114.403899-1-renaud.barrau@madic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 18:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122727

On 12/17/25 17:11, Renaud Barrau via lists.openembedded.org wrote:
> From: Renaud Barrau <rbarrau33@gmail.com>
>
> Create a recipe for the tomlc99 project https://github.com/cktan/tomlc99
>
> Signed-off-by: Renaud Barrau <rbarrau33@gmail.com>
> ---
>  .../recipes-support/libtoml/libtoml_git.bb    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libtoml/libtoml_git.bb
>
> diff --git a/meta-oe/recipes-support/libtoml/libtoml_git.bb b/meta-oe/recipes-support/libtoml/libtoml_git.bb
> new file mode 100644
> index 0000000000..befd413d3c
> --- /dev/null
> +++ b/meta-oe/recipes-support/libtoml/libtoml_git.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "TOML parser in C"
> +HOMEPAGE = "https://github.com/cktan/tomlc99"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=95bbe2f9180443b5dcef3fb959804a65"
> +
> +SRC_URI = "git://github.com/cktan/tomlc99;protocol=https;branch=master"

It looks that this project isn't developed anymore (based on its
readme), and has been superseded by tomlc17 from the same developer.
Wouldn't it be better to use that? (This is a question from me - the
project claims to be compatible with this library, but don't know if
it's really true)

> +
> +SRCREV = "26b9c1ea770dab2378e5041b695d24ccebe58a7a"
> +
> +S = "${WORKDIR}/git"

Specifying S using WORKDIR is a fatal error in Whinlatter and master
branch - when using the git fetcher, S doesn't need to be specified
anymore 99% of the cases, the default should work.

> +
> +inherit pkgconfig
> +
> +do_compile() {
> +    oe_runmake CC="${CC}"
> +}
> +
> +do_install() {
> +    install -d ${D}${includedir}
> +    install -m 0644 toml.h ${D}${includedir}/
> +
> +    install -d ${D}${libdir}
> +    install -m 0644 libtoml.a ${D}${libdir}/
> +}
> +
> +do_install:append() {
> +    install -d ${D}${libdir}/pkgconfig
> +
> +    cat << EOF > ${D}${libdir}/pkgconfig/libtoml.pc
> +prefix=${prefix}
> +exec_prefix=${exec_prefix}
> +includedir=${includedir}
> +libdir=${libdir}
> +
> +Name: libtoml
> +Description: TOML parser in C (tomlc99)
> +Version: 1.0
> +Libs: -L\${libdir} -ltoml
> +Cflags: -I\${includedir}
> +EOF
> +}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122725): https://lists.openembedded.org/g/openembedded-devel/message/122725
> Mute This Topic: https://lists.openembedded.org/mt/116829679/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


