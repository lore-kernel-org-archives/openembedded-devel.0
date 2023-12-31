Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD0EC47077
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.198923.1703983127371919500
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEhukbt2;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28c467446f0so3247073a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983126; x=1704587926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwe/x1dMJyjhE8jNI20hNG98RbiFn0936oHMiD7xEOE=;
        b=CEhukbt2EOus432nQvIfEzwiFX84OmsASxXVOtRzGRhAUhvw2GASHDGleuTMB4Mm06
         kUIY3qGU7WKMI4W1KU+8KVOQCjkk7TGfK53OvTv4Ri0vbtzxi67jNTsZti24FqWOufpb
         ggh0IqtfkgwTvdl+Q+29mXhaBfNwlI3iTspk7DsQRgXcl7bftrxrZGLPblC4ecO+r1ih
         3/GaVRU4rskpUjw4YgU6wt1fNV5H9Stweg5i12cIgteGefMs33+i/h2KpfGJ4aOQQmrA
         i/xH4zzm8VQ9P7T6F3HrdxIZ4IrwAT6N+M92ZB0+osQEVUkjvh4GQnOVhYQS7MEg645J
         UKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983126; x=1704587926;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwe/x1dMJyjhE8jNI20hNG98RbiFn0936oHMiD7xEOE=;
        b=AtbkWcIH1vmta1z5IdB6I3trxywglbyNeSanKgrpbNRyzOz1zyI8WSQKphQGH9VYKM
         edTinWG2b2VROX9e7Ao5S/kI4Y52R6VR0/wn+mt5rhoMr0dou96UV3jv9wO50kMARYGJ
         5RIywGTw3B0CdIlWLt3a6vRdyqo4O54J34/iN2oDiEKL+f044pUW9dZRlEGH7APx9c4V
         D9i69RPzriOKXZAJz00+EBYSmiiS5AY1mzxw9TU67NHqYQDFh6iz4zwYNeUOCF4M1uU7
         4ijF4brjqfNGd0c7RRc7qGVQUfkpY5wxL82SG6sKWn+RLjm1eiE0ojdvjQ1Uze5UQmfx
         MfOg==
X-Gm-Message-State: AOJu0YyTD6M7q7/y7TYIDP8HWGSN7S7e9tTGhVO3FP6rSnJFzUkIw1HY
	c1Q4a4eBOaDIhDSxc2ujuBMx0cviAEU=
X-Google-Smtp-Source: AGHT+IFuRMDpCfbnfzHAEkKkJIaAv/Z4rGutxHMRNppigPwJnMeooatisZ+jdBkyNYzICLl9J3Iv7w==
X-Received: by 2002:a17:90a:928e:b0:28b:e9c1:b81d with SMTP id n14-20020a17090a928e00b0028be9c1b81dmr17278535pjo.26.1703983126584;
        Sat, 30 Dec 2023 16:38:46 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
In-Reply-To: <46cae1fba005a8ec9bbd21ac6a50500dfa1dfb79.1703696315.git.joerg.sommer@navimatix.de>
References: <46cae1fba005a8ec9bbd21ac6a50500dfa1dfb79.1703696315.git.joerg.sommer@navimatix.de>
Subject: Re: [meta-oe][PATCH] i2cdev: New recipe with i2c tools
Message-Id: <170398312590.873206.7532428426055962097.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:45 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107943


On Wed, 27 Dec 2023 17:58:35 +0100, joerg.sommer@navimatix.de wrote:
> The main part is the tool lsi2c to scan the i2c bus, like lspci and lsusb
> do.
> 
> This recipe also ships a static library *libi2cdev.a*. Because this library
> contains the file *smbus.c* which is *GPL v2+,* and a static library can't
> be linked dynamically to satisfy the LGPL, the whole recipe is marked
> as *GPL-2.0-or-later.*
> 
> [...]

Applied, thanks!

[1/1] i2cdev: New recipe with i2c tools
      commit: 813fb0def8a8bca81706496dd6f106692616a11f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


