Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565AD10706EA
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 16:38:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13255.1773506324130585937
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 09:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dl4kQFOg;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so37192365e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773506322; x=1774111122; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBBz5e+ACVXdiKssjLaPbCoOTt2KnQgg4eCF+/JORdE=;
        b=dl4kQFOgnnvwmDUjCsk1AiSxyfI7Ff+or8uN5O7tna6P7vfahxTMWzJ4IKrM6wW0O7
         gbsBoB0K69agAjd8xdYEyOExGZw+dWOtHnQDu5+fGm4DIAMSZnJ5rj3DnGyzgjRNbahf
         F2/zWjYtM3Otp8ullX356mPMJ87Y43b1Am3nEJWaIiogWR2sR9lUJA/Pgl0r8/zAJuiO
         GqHmg2GgG+Na+IyLqS3qGfbK8gROXVMcDR6/9RlIJzZAm1y+OFNwUPg4W/DQatgwXY6Y
         EMtROOZSr8VpfOegUfPHUfp7lzUckHOna8wzo4icPlnljtPTBGclWGTF6bc2o0OmklSA
         xaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773506322; x=1774111122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBBz5e+ACVXdiKssjLaPbCoOTt2KnQgg4eCF+/JORdE=;
        b=FZ4K1MvbTk/Us2JHdOtyEI5GJ9RedxEWgrS3QI9XrUlAGrZBhPgk2TKqu0pt1jiusJ
         3GimRhYXDMQAHKz0rAnana9EhH3jljIEbJzEDcAA7SC/mt9wIAhOQJStTMlHq/BaA60s
         mCWM/93JAZ6esY+q1CRwTAVujQ/RikhIaCvXpULhSjtblEuqje8hyaKJETBqK8H7DK8B
         8ABWiyIw0LMXzS/bECjdd/yKWIoPCyHNyMobSqgueFff6jz0GzzSxRvc7JtzYjbX2/O9
         jOpLdiLw6mxMbIZX20Upp/hMFUEmHYBUiu6rX46DLA07c0dEHTrX6wInvxtUmyBUdANg
         peMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsMaio/lqUfwpuge8S7jWaV82SgiJpOlNK60LMtLM5BFztAClgzdD3UT2y5CkSV447hQtDEIIo4nHUmBYXArVt2X8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyftEWoOqSENmPF51TKp3Kp+YIPcdMWk0Ok7YpgTydyGR/Sic72
	v2Dhqv+WYY5tUiJLw8wNsjVADmmw3pf2DG76hQX3VZ35v3Ct4egqOBB6
X-Gm-Gg: ATEYQzwIO3fl0kfP7Z5uHzN6MiUStNFlW8N9OqAX9CEp8e3UEBiij3SmFxCCZb7D/hg
	uYLW4Y2QA6yqvr8+DZ9rqFzRmcCHgEa1Y3jdPS/ZSotLTSTCTtVErJoQa4r9xmjHt70Ywi/lIjd
	VYcGclHy5pFQ034HjU8RZkxFvvD7hDtUKc7s5zgqbG2nHWAiCGgn5tddgvLqHsLXTa2AYMioYE7
	IWbKxM8AOdMDDl0ovZgRoGDIbXCTrlnr6X8v2Ibm1SJTYr+3JMm1/C+2BIi1vipmgs9/zICbH9q
	Rb+r6+7s732uTHTTIudqNVhgVHpTZAeO5ZueYNQRiSH25vrl3qCLmYXdOw07Vvt9OO0gq85zeNW
	nT7E+GmzMNr5Ulz10e4cGxe85zfYDvYa5ljKYQgbNGRcL0r0rxIECIRSH3eqpodVi4qr+MuiAUd
	k3GO7Iu1WQryJqxiPr3wAwg9FQ1OSUwg8=
X-Received: by 2002:a05:600c:354b:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-48556703401mr118780175e9.18.1773506322237;
        Sat, 14 Mar 2026 09:38:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm681408495e9.10.2026.03.14.09.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 09:38:41 -0700 (PDT)
Message-ID: <8224d8e4-1c44-4569-b895-b9e72fc3bf8e@gmail.com>
Date: Sat, 14 Mar 2026 17:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 11/14] python3-grpcio: upgrade 1.76.0 ->
 1.78.0
To: andrej.kozemcak@siemens.com, openembedded-devel@lists.openembedded.org
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
 <20260309100630.404637-11-andrej.kozemcak@siemens.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260309100630.404637-11-andrej.kozemcak@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 16:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125209

My machine is complaining about two things:

1. The build backend has changed:
python3-grpcio-1.78.0-r0 do_check_backend: QA Issue: inherits
setuptools3 but has pyproject.toml with setuptools.build_meta, use the
correct class [pep517-backend]

2. Compilation fails with an error (using the tip of oe-core):
https://gist.github.com/OldManYellsAtCloud/9f2afef89616c308bcb1c97bf3cc247c

(Possibly fixing the first issue would also fix the second one, haven't
tried)


On 3/9/26 11:06, Andrej Kozemcak via lists.openembedded.org wrote:
> Changelog:
>   https://github.com/grpc/grpc/releases/tag/v1.78.0
> 
> Changes for python:
> - aio: fix race condition causing asyncio.run() to hang forever during the shutdown process.
> - Migrate to pyproject.toml build system from setup.py builds.
> - Log error details when ExecuteBatchError occurs (at DEBUG level).
> - Update setuptools min version to 77.0.1.
> 
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  .../{python3-grpcio_1.76.0.bb => python3-grpcio_1.78.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-grpcio_1.76.0.bb => python3-grpcio_1.78.0.bb} (94%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
> similarity index 94%
> rename from meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
> rename to meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
> index 037614da3e..092df4c78f 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
> @@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
>  SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
>             file://abseil-ppc-fixes.patch \
>             "
> -SRC_URI[sha256sum] = "7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73"
> +SRC_URI[sha256sum] = "7382b95189546f375c174f53a5fa873cef91c4b8005faa05cc5b3beea9c4f1c5"
>  
>  RDEPENDS:${PN} = "python3-protobuf python3-typing-extensions"
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124983): https://lists.openembedded.org/g/openembedded-devel/message/124983
> Mute This Topic: https://lists.openembedded.org/mt/118218628/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


