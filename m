Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D01DD1118D
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 17:43:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13.1764178974038252496
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 09:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pk27NrfD;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so50812f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 09:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764178972; x=1764783772; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zB+gcgt676CSXznz51A66SHfnDBtSD5ThyzHqgC0plw=;
        b=Pk27NrfDEYeuZzcqyG5F3MC1QU6uAJLvPIJHUtOsr/E2a8rsgG3ee3OjH35YH3zi1E
         nazsLVZkhvHkeLT1l7mwUpipU0fJnOtciv08bBjdlvfhGjMR/1QwM91eFJ6XQH7aftsT
         VvmtpBmklYcaq304iEqsPgujIBQXqDwO8Xa9lY71dCILgi62jCT7z/UKnQMbIGVx0l/J
         hpfqJ+IVSh+9LOGWvGJqjEH6w33Q2WwmjdSdN4F9HAGD5clx7bMpnt06B8v39Dk3QZTF
         Ak3u2ClRPay4mHpO68EJ3aq7tnokbtRleJBZp/DXiivUPEAMlNTnNauDMdCFJoHTPtWk
         OtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178972; x=1764783772;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zB+gcgt676CSXznz51A66SHfnDBtSD5ThyzHqgC0plw=;
        b=S0Sl6TVHFBP+rQuF4v9XzNNOtzJOV6kL2gIeSNRaxXjDsMpOO8p2ELJQliL+N6AbNs
         qmrUG/hxfimlGOW3BBPWMz5SipHotGQqeUrJwKky2gGYG/bGxGbCKZah4dqJA8789s7i
         FfvMafb1LUkzda3yGmO9rptwgbmhi7C+pDh1tIJPsdqjasjYh6bulhZUzCOUgViU5CVy
         qPlpAWKuIqrk/QlMB6F8yQ2HAqLRblZ21LXvo9vFyKOe6HkNlLOJN4j1vw2XomekdE4s
         3wBZJ8FvHp55lJwWmNmXYt8RDZ7budv8p9fUqpj4l/CwupXLCAgz3GbXlgsWpxXJi+ym
         ry4A==
X-Gm-Message-State: AOJu0YytYmX0GZ02cUAXL9bcuHCeSPbZF8m8nE+8EZvJW2YWOMeso4xl
	JKQcctNSnbcaZLhrm4Zn+0YhoO11/cgGApDg5S932ceb5z/DsG+nFVVtnaGhHg==
X-Gm-Gg: ASbGncvp2b9SgmrhIsJGxg00ETeos51vuZx8+26KGH2oeV11BJQmfOcP7HWGCf901hr
	Qf/vzEvYi6IdM+PnWxtQlXFfAEx2c5tYOYnf/XvX4OrszUJsLLt2dPrqpR4nHjkPvkgDQJXr8iv
	QZHszyAWPL3TQBd4OhOTka2u1rvEIX5zdHhBBsV7y3eMtyo1zFhtcY8aC9CveWa79v4DM0gKvyY
	Ws+/TBqhGpndcZBh74FOY5S4rdSOK2wM8vAuwQA9eGg5ddvobvNCHeWhv1udAAKoSlXcVH1aDdV
	1Orfh5XUUSYlCz50EYuwLrIXNbqc/tkIQCpSj1y1yXyZiONn8xzTWRVwxQTdSICmbn4Y6LJSq43
	+otE6Sn+/zH9syUy0svw1iKAxCKkh7G7GmxPaANggGFWHFEbG+VBv1nl3vFiQfyfmQGL7AOdC92
	HXUqyXbDhsB51vRkPKEj4hSlsVH5Mq0g==
X-Google-Smtp-Source: AGHT+IHDmqYTV4FlcEptwHfyKav4LCAb6W1yPCLF1lbpHI/GsCquhdzAAvVpYbOaHk44rhvmz2B/Jg==
X-Received: by 2002:a05:6000:1885:b0:42b:30f9:79c9 with SMTP id ffacd0b85a97d-42e0f34a077mr7838812f8f.37.1764178971988;
        Wed, 26 Nov 2025 09:42:51 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e574sm41436843f8f.3.2025.11.26.09.42.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:42:51 -0800 (PST)
Message-ID: <acab1ff7-bfc9-4be9-a5a4-6ad099ac05e2@gmail.com>
Date: Wed, 26 Nov 2025 18:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 5/5] breakpad: correct SRC_URI branch
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <20251108143141.3117797-1-skandigraun@gmail.com>
 <20251108143141.3117797-5-skandigraun@gmail.com>
Content-Language: en-US
In-Reply-To: <20251108143141.3117797-5-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 17:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122081

ping

On 11/8/25 15:31, Gyorgy Sarvari wrote:
> master was renamed to main
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> index 0e51289507..e7cb29289d 100644
> --- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> @@ -28,7 +28,7 @@ SRCREV_lss = "9719c1e1e676814c456b55f5f070eabad6709d31"
>  
>  SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
>             git://github.com/google/googletest.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/testing/gtest;name=gtest;branch=main;protocol=https \
> -           git://github.com/protocolbuffers/protobuf.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
> +           git://github.com/protocolbuffers/protobuf.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/protobuf/protobuf;name=protobuf;branch=main;protocol=https \
>             git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/lss;name=lss \
>             file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \
>             file://0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch \


