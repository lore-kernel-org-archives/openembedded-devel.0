Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86640C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.14516.1701215722573537520
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUFA6Ym9;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cfafe3d46bso36332435ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215722; x=1701820522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIa8UDMlo8rlwNXegHkVkS62NGKaEmLXFuXuw/0/fV8=;
        b=fUFA6Ym9M9jxh7bhekE57cERy7M/vfIJsFracDtjkcc8XwyDwaSb1/E6Z7rL3ggjpe
         2PrlsRTpYbUZgtGA1oGvmzTSVnX/seiwL9R+RQiH5sAeHNNA+x7moR6SMaU2i9TwF0kS
         YAi7EqLHgFNIRjPaYYuvFuW4+NkErI58xXHyrGvSFFI6ADyojWdwvPaXPOnmPSUoMjK3
         r7tlp9+DhFUq0Kk+sAZf+IooHN2tH1nhlXlHb6pAut9tTK/ESbsB8X/090Ae0dbMKpJw
         9q5vb8m2AfHcx/dJxudB7e1rfpOQ8iaxBlwRBKBDWiECx2agqRYMkDtvMGhPvQkpYQkh
         +wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215722; x=1701820522;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIa8UDMlo8rlwNXegHkVkS62NGKaEmLXFuXuw/0/fV8=;
        b=V4Ox7Fn7P0GsrQ5pasj2bAQ4iMyhhFFkL6tqCrAYgmCmTjMtj/CoIDv7XkEEHhTYkq
         4Q3tIc26drV+XwF1H8mbcEU6HwvIcmNW3XNQvdTuMsOKr8WnNeHD5YYa6SI6rUkipe6S
         0+0TvWtLUcPURxx48kmRXsw0h94yiHqHKWeXXR8eH4qltNIjDHzovpcZu8bl/4BDrhP7
         idlDhFNIjsWmaEcx3Yd66gieb1trtd3kZFn2eQBYZeca2gHgB+PQnxFf09ttG79i9WGq
         t6PBcadWDiLCtVj8nYnArWsk3kB6NDwZkZ7Nr20MSDCJ1oPAqp4qki31vf85zkW+lmVk
         G1PA==
X-Gm-Message-State: AOJu0YyJIfFlWgPoUi9t+H6vMMTB/3Ave0D8465Sq0lED9uaFJreLmhB
	i9/3RhvGyBTgMb9Ah0CrNt3VTADg8M/QXA==
X-Google-Smtp-Source: AGHT+IH07wwrc0PvqwpLUK8xBO5FXLf3sazfKr9JNgo94jdY0F5Pwr7Q4KUKg5ubCew8XWJ3Mq6RMQ==
X-Received: by 2002:a17:902:f60a:b0:1ce:6669:3260 with SMTP id n10-20020a170902f60a00b001ce66693260mr24429369plg.67.1701215721660;
        Tue, 28 Nov 2023 15:55:21 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159953-28050-1-git-send-email-wangmy@fujitsu.com>
References: <1701159953-28050-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-bitstring: upgrade 4.1.2 ->
 4.1.3
Message-Id: <170121572067.1187527.8225986249983544634.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:20 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107110


On Tue, 28 Nov 2023 16:25:53 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Removed a couple of files that accidentally got included in the previous release.
> -The 8-bit float formats have been renamed 'e4m3float' and 'e5m2float'.
> -Some refactoring and performance optimizations.
> 
> 
> [...]

Applied, thanks!

[1/1] python3-bitstring: upgrade 4.1.2 -> 4.1.3
      commit: 94302d54c76a134c9205f433e7ef984887c21293

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


