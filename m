Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BE3C46CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.14531.1701215744077810508
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JjgUiDuT;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cfbda041f3so29271915ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215743; x=1701820543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnb889ISWCQZIAg4v6FbHiJ8ipclVsLvneNeIMQl/TQ=;
        b=JjgUiDuTxCr6w8xrfwLENziGKXsNPJJUbjywFkbbtsvtP5QuE5sw8meBPtRsajeKPn
         U9ESJeN1seV19EFxG8gv/5tcFROyZADXg8X0qdyFLXcqtznJgSPQ8Ir343DE8wBq87/V
         Mq3rj+187bcjAEzHCEfoC4wdDXJGS3ad5FsR+hEsn3J7W/J1s8Rv8MyAVqd/BmffkvWs
         0OfeJJ51EpRz0YFsaIfvER42v7uNs/bRSxSm5p5UYEeEX6T62cNKrEDbJK5E8iYO6Xk+
         YisrrcXAXlN7f73Oqy+hEVsgfnSf1Ys5LNMOhxcMyWLn4K+hboDlCGFYbzYTQZ0GO69k
         f4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215743; x=1701820543;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnb889ISWCQZIAg4v6FbHiJ8ipclVsLvneNeIMQl/TQ=;
        b=YQKXbqYvN+SGwvmy0g+PCc6ztua/+5nU02eRFsn8IirZR+FLH5kWXpHleml9LY/eah
         gLGGE1g+1qQYs5CvxP6I+N3SiQdfn4X7z0YpdJoqCsqePXQYFvZMH4U14/WIAvuzvPVk
         mJ+f24VMISkb/N/BoocDr3WUfVRUXR1UE7j2Bvu4CLO8iUzjB3RgM9ehBqXZsvMtjIq/
         KR3uFAKIHMqLBUkr3W9rrNO3qfauQmgpOrhxSq+mYGH7wOqXrrlAh3lsYY9cljTcHHcF
         Ljrfa/5JbQ9/onVBEflsMDoFM5g3qw1/Vyg+/8kPwCOxkyhRJY4CZbDmw73JOqV/HxNf
         Kv8g==
X-Gm-Message-State: AOJu0Ywu44+pGkIJBKDrE4vHr9OPW7MBat/1rExv7lOREbMR8sPESIVv
	/joGt2iTjCC1+AfI4zTydTxyO7jm4QbUFA==
X-Google-Smtp-Source: AGHT+IFDkUpGZKMWAWc31g+BYOW9J759QxxIOSJr2Y7wsm9W0wblo0OPxH94ktTn5ByaQ2uti6JO/Q==
X-Received: by 2002:a17:902:dac1:b0:1cf:edd5:f783 with SMTP id q1-20020a170902dac100b001cfedd5f783mr6156985plx.15.1701215743353;
        Tue, 28 Nov 2023 15:55:43 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231127133808.1396531-1-alperyasinak1@gmail.com>
References: <20231127133808.1396531-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] msgpack-c: upgrade 4.0.0 -> 6.0.0
Message-Id: <170121574246.1187527.8059977268754215990.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:42 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107128


On Mon, 27 Nov 2023 16:38:08 +0300, alperak wrote:
> - GTest should be OFF by default. -> https://github.com/msgpack/msgpack-c/issues/1066
> 
> Changelog:
> 
> - Remove C++ requirement if test is disabled (#1055)
> - Change CMake package name of C library to msgpack-c (#1053)
> - Unified all C package, library, cmake, tarball name become msgpack-c.
> - Add additional address sanitizer for CI. (#1023)
> - Change CMake package name of C library to msgpackc (#1044, #1049)
> 
> [...]

Applied, thanks!

[1/1] msgpack-c: upgrade 4.0.0 -> 6.0.0
      commit: fe0d5e65cd8d9fef9d4e3043dfb86f747c5f14fb

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


