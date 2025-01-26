Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D55FC0218D
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 11:37:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.28687.1737891453980229279
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jan 2025 03:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SLJWQGd6;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so1758417f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jan 2025 03:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737891452; x=1738496252; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ILGWR8juHsNlTvc2SjIbX7xxNoEXN71t0mEGBM/3XpI=;
        b=SLJWQGd6BTHkoP4CDXO8e0nQIjVgOtYax6N86EYtDB+5QfNvvMBs4C/K9ohKFxZ3vh
         QR7264qTsJP/PpGQFxR/zxe+CnAX672UX0MAMmRVceB2dZqVABVhA7/K+dNM/q1NRP1v
         rYy+o9Ncin55+VipZwNICPDVKdZYRwNsI/zRNouDyX43QUVMnh3QnG4T0pnEofVfHzxE
         v2rSlK+K4SH3jRFnys2h625N5dLR1ppULQxL0iiNQUNUqBSB4H+7rn7mcOVbFAb0I/D+
         MuFhKMBhxSXZVhnLPz2nVYY1jnJbs980//7KDrvU5SYDB4+LBtejNcJYDHsN21aazInI
         3I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737891452; x=1738496252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILGWR8juHsNlTvc2SjIbX7xxNoEXN71t0mEGBM/3XpI=;
        b=BoLn1Ggsaqi5jwPYhJoe6Db7NDDOdro0sJRv3fI4TO/jPc5sdG6kHn7pcbNrq+kLXD
         Az8JvJ70zD2tqyH0JIa7iAaJGGLazoSqqZkm1jPR+6rify46EAKIE6Kbn6/Qdr4ZotVC
         isK7mo/0Gilv1N3eVfg6fM5olvfSAQs4RfWrJNm+Qr8RXRPWjKDHKBBE/R2i6r1V+1eh
         WNCHa14uL9yXh7YXcZOvamofpE525OPvqe14/qcQa0EMEPUhqEgGytkanqiVkkLU+4Z+
         bT9U/5Yu6tSh1bia1mxzgzzCbjqoTFsWpVniAUKWfZ3ReSFl9XCbqvWycAcoGGhEqYMW
         7SWg==
X-Gm-Message-State: AOJu0YwuLkZa7gHT883JeoZO4wEmeF/gEdACmqo0ySrRBZ3rxWa1bAqw
	KwsSdpiIzOLpGp4ooJQlKdsm+3bxikMjVeEGO/98Ki5vBjrniFZSpq2P8A==
X-Gm-Gg: ASbGncvCCJVKoQpwRFkm6whrNtvUEvn3t5jhqQpNYSMCQf4MzycwuN4pGNgw0M+F9Oa
	taNrsK3jvxEeOTFNd/mJ7NlE5bCbfmt+dVr3aWTyLJvKgWq0vdsbomMVijKYhI0Lz2ECdQF9Nic
	7kCbhzAPCar3PkodR4h9qMn43eTV7aEzucNVpkgY9S36GWXIR+Uskh3R95zykmNxtWaYEIGG7vR
	TUtaSILLwddAwF4bOih3n4RgMk0yVVhmyBicb+EbsyyDFQ9MstiyF1pA5eDRFbzCJDxypg1mB7j
	y//Mb0P6TzSK
X-Google-Smtp-Source: AGHT+IEMCHWZBDRQIAx/JF2YYj0ao66o4l38L/sFTCY3d6jrbZrSvNzEEl4y7uCvX02jTQ/JjXiVKg==
X-Received: by 2002:a05:6000:2aa:b0:385:fc97:9c76 with SMTP id ffacd0b85a97d-38bf5654fc8mr35010840f8f.3.1737891451988;
        Sun, 26 Jan 2025 03:37:31 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1baf3esm8053945f8f.75.2025.01.26.03.37.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 03:37:31 -0800 (PST)
Message-ID: <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
Date: Sun, 26 Jan 2025 12:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build
 output
To: openembedded-devel@lists.openembedded.org
References: <181E3AF09E1F8B4D.4788@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <181E3AF09E1F8B4D.4788@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Jan 2025 11:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115101

> -ERROR_QA:remove = "buildpaths"
> -WARN_QA:append = " buildpaths"
> +BUILD_LDFLAGS:remove:class-target = " -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
> +                                      -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
>
If this patch isn't shot down and you are trying to build this, there is a
chance that it will fail: that's because BUILD_LDFLAGS is excluded from
base config checksum, so your sscache might conflict with the actual 
recipe state.

If you want, can send a v2, including a PR-bump, or something along the 
lines.

