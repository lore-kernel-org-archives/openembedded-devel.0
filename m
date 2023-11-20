Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72808C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.43641.1700452275259247444
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+/T/bfr;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6cb7951d713so530532b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452275; x=1701057075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWxDcGODUvl484P6xZ4PYQ5YvpyBto5HfNDCvNGWy5w=;
        b=j+/T/bfrV94mRHjCRqRjYWsDrwaJQgnaWTA58rsl7/K5GiwRg15RscENH6O3bRZGp6
         vJgkF8QQiHfQncfVgIUvdri9vLPvR8t21Dti6TSzhKxkO206YrdlrNzZtCzkoJ2moZrf
         TiDKDulgJM8OYdB9wDMwANh/lrjdpJzip4E5rJVWxuvKnW6ugXd+M7Xnh5c5TqevQOVa
         rY18K1X4g1iiARXaPZ3eeNEfhokLcRD15ExrdUpLRdp1HjfZOEhxsyh9dTSTSb38Toef
         QJkWA2y/pVmWMryIYF7Kcy43lwun8AxAAmpmpmQjSSS9d5GL98TrAwGorFneLsptZR2T
         qHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452275; x=1701057075;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWxDcGODUvl484P6xZ4PYQ5YvpyBto5HfNDCvNGWy5w=;
        b=L1JbTP52qZXTZirZ8bCUhY4ecTC7h38lKbhUs/qUZlbwsM/Gnf2GViwKNhXAv5mSXd
         wzw6KXO3eb9vgoNzw/mOMOZOpWO1hy1onFcAsTLqRhW2+mPw0mEFG66ON5do9ML6eQN5
         zxGI/2C+TcupFDZIV5YjsGOZix1g/hJSbuYBBK8lpvuhXUaQVjcRkpeE+KsNR9uNWH2L
         ZlM9WOx4W7HKkR/4k3DX4H9ujkq+Mqt4bgJaX1865i9Skz7UYNT/JOsCu3ynNRnqbpb0
         d5xOGxXgSvjG2GACypIt3QRMBwOy5ObucbIQMXGtKSBuu6Usv5lAOcFxEBy5+l4Zinol
         19tA==
X-Gm-Message-State: AOJu0Yz2IBL4pOUBG1H7Ym+smMbsUa6yWP6Rn9d+FGJNjpK6VlFlEqfe
	kTyfeXcAzXLPNCDFr3O9hbZ5x+/fFisxyQ==
X-Google-Smtp-Source: AGHT+IEdKkiHe0MqKBcYKKTbOnSUR7QP0mRLLZXuk8Yn8j1RNOclGHH1mmW/1hJSekTBMWUQYFMk6A==
X-Received: by 2002:a05:6a00:4c1b:b0:68f:c078:b0c9 with SMTP id ea27-20020a056a004c1b00b0068fc078b0c9mr9027014pfb.11.1700452274626;
        Sun, 19 Nov 2023 19:51:14 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116094031.150008-1-alperyasinak1@gmail.com>
References: <20231116094031.150008-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] irssi: upgrade 1.4.4 -> 1.4.5
Message-Id: <170045227372.1416826.16720386692518710744.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106930


On Thu, 16 Nov 2023 12:40:31 +0300, alperak wrote:
> Changelog:
> 
> - Add workaround for Perl 5.38.0 bug that breaks the Irssi locale and glyph rendering (scripts.irssi.org#857, #1498)
> - Fix Perl scripts broken by Perl 5.38 (scripts.irssi.org#851, #1474).
> - Document workaround to fix linker errors when building with meson on Apple
> - Fix meson using wrong filenames on Apple, leading to broken Perl support
> - Fix /upgrade not accepting
> - Improve compatibility with Perl5-IDEA
> - Fix logic in how own actions are printed for other protocols
> - Fix crash on old PowerPC Mac
> - Fix wrong prototype of library function used in terminal handling
> - Minor cleanups
> - Minor help and documentation fixes
> 
> [...]

Applied, thanks!

[1/1] irssi: upgrade 1.4.4 -> 1.4.5
      commit: 26c41ade8305c7a871087cf3aec8d0f69b8b530f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


