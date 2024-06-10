Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9FEC27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 18:34:52 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.27312.1718044489567974655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 11:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=wmS6RYKm;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.173, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebe785b234so12022311fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718044488; x=1718649288; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EkN3NGDRkv3C/+qkqT123hIMcxmd9JtrTzq4PW73KBU=;
        b=wmS6RYKmgU60i5t2KHdLsiINflC+ZWjHlOKkg3Y/OL0iyNQszVOOZiMXS9wqzqBpe+
         yAIwO4L7nFusJOTFKKZEsSzr84kXvvoF48QE9Idr3W6O8h5c4gCOjOcLOe+ze0vuVvK+
         kqNwALlxtWCZapbB9jgkYugFYYtF6ab36P/WmzqrCxhhl6kV7q85isxP52UxU2QSETNw
         pZARqPtcGfVe34Yxzsdl+KbkEvqe1Ld9fuJbh+1RbE/amwO/YV+/Lc5zcN7xtORI6lC6
         KJBIGHE3p+4em6AoWDRdLPo2j3pd9Zo0emNznM6cVgdNmAHHf3ch4O/JyBu2emPCiDIZ
         vWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718044488; x=1718649288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkN3NGDRkv3C/+qkqT123hIMcxmd9JtrTzq4PW73KBU=;
        b=gYXe/qBNGdGl7J1YIbscx8atxSzd49l8JiPZSF6R9+P8suLoRPhuBeKBJGYP8Pn2FX
         M11FtXhlKt+tlvEaX2cpEM+ymkza1uCaodUsZhJQHd++HKe4QVom5P/ouMxJ+lI9+V6b
         cauu2uT3/gHRxtrNdXRhU8WG6sXDFQXAbmlWkPIWZPLoErPtVvnkUSCdNuga811OnmKy
         hioqf3MqRNoEpudtIrhAJ6+Hc+oXqBZ3EnSIb9LZHfTnrv2dK4S091BsSMb5+AZt+iUJ
         WgWyIR/mz7Oq5vmXOSSw/J77q+JFz6ORQgssuC/sI26WCXikclSCm0wtjmhDOSQo+z2L
         o5cA==
X-Gm-Message-State: AOJu0Yz9QFdDXIIY+03XZU6Ja8WKV26yzBHy+x2h4Q7IG3W90zgWDj66
	faOgWJwn6SQFB/GeOmFtvpZ35UMX8J0gH2u9ZLyffDXzF6HnCcpArw0BaX1+IBxntkoVXFM294g
	q0j8Pf61w/kxfWPePsWzLZHhE0jlqcfpIPg+ChA==
X-Google-Smtp-Source: AGHT+IG5qDjsS8mPyGM9Y2CAJnDO9ut9o266IkZF+BnbIYRIBzQSAjOMvta7+qqKdKWbwONVZzlDO8bMqMTTpJLcMgI=
X-Received: by 2002:a05:651c:2126:b0:2eb:d95f:10cb with SMTP id
 38308e7fff4ca-2ebd95f1686mr51327931fa.41.1718044487579; Mon, 10 Jun 2024
 11:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240610182058.2286377-1-raj.khem@gmail.com>
In-Reply-To: <20240610182058.2286377-1-raj.khem@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Jun 2024 20:34:36 +0200
Message-ID: <CAMRc=Mc3e8PdFPHRCcPMvE4Js+utpwN-oXzaHy2w9976tWa7ig@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod-1.x: Disable ptests and fix build
 on musl
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 18:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110802

On Mon, 10 Jun 2024 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
>
> libgpiod-1.x is still in use by some BSPs e.g.
> variscite SOMs, so we can not get rid of completely
> so give some time to move away from 1.x and disable
> ptests as they need older version of catch2 which is
> being removed
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

TBH I still support v1.6.x as this is what Debian stable still ships
with (and will continue to for some time) so how about dropping only
C++ tests?

Bart

