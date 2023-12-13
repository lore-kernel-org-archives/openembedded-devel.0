Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D53C19774
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:29 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.31063.1702451242157426524
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FlPBbVWw;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6d089bc4e1aso2444044b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451241; x=1703056041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX4WW3vbt1/j/9eHze5dVeIMEs+8vAhAbe2B5pKu8mw=;
        b=FlPBbVWwaqcyvLMpkR5S76QImL+hC/JY9xsBNVpFGnVLT5HGT3xrBpOgKe7u2PqRrQ
         /GOaNMFIxEE2Z/hFSOtWRRBsG2AWdy1a0wUyWEUCSIXOmy8NJdtCFbXnFq6LL6bH4VLc
         +0XMSK8DKOsNK8pZYWH4tZWIOBJmTQknHujomxoi6MLWLyunqA3V7tQoQZ0O1VfGgYrK
         eqjPZ4GK9J3hkgScZmjl5Z6I6GOu7roe8QMu1N9t5zBW0ZKrYVMtmt4+we4krux6cucn
         oym7Tf4wqwomqrNKCP4SZTlbAknKsdeFn6Dk2vBCn5RqWyd4nyRKSIE6pcSs8wLjv0Ik
         nMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451241; x=1703056041;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX4WW3vbt1/j/9eHze5dVeIMEs+8vAhAbe2B5pKu8mw=;
        b=i6Bn9OMqnHiqwTtP5YhZfLUjM7eH6LcMzGR3DPMFLxLsMvXhQxyDHcOR41plTNWV2K
         sMwCaI3t/uiZlJFRlU5W3MHE0sjY61d87f1uEIzU1CZGZMRFS5o/MkyWCmYPazWGIKij
         0mLQZQ+vSwniwze2MX5rD1KxMSs5v7EpaIfAGJTovHpFyAOokWX8LH5tOagwp9ZqBJJx
         RB5lo3DGQLuqFvTzczOjYFgsRMGcoczx6zT0xB6iO0F+i3TW9GMBJQEJEJJoeX6ojMeT
         KvwIzLhy/ltAm+Yz9Dlws6Qf6SnjCiU/45GkI18aqtmzW5p7AHpKQclJjmzqfQT2Ti/X
         IYJA==
X-Gm-Message-State: AOJu0Yya48MDy074UexNibGDC1dwn2QRSbVSGEDRL1dWWFHl1RGb2+wZ
	m1uWpVoVECV748CvlyaMRJEXew37i/s=
X-Google-Smtp-Source: AGHT+IE0tyjQ72XKirWpp1yPlayJu88i08WJVXrSDPbsffMxsybhFX9niytU0dET6YdbTKfSRzAmqQ==
X-Received: by 2002:a05:6a21:360f:b0:18f:9c4:d333 with SMTP id yg15-20020a056a21360f00b0018f09c4d333mr8558559pzb.35.1702451241139;
        Tue, 12 Dec 2023 23:07:21 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206133008.316427-1-alperyasinak1@gmail.com>
References: <20231206133008.316427-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] xlsatoms: upgrade 1.1.3 -> 1.1.4
Message-Id: <170245124032.133993.13592049937541456385.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:20 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107358


On Wed, 06 Dec 2023 16:30:08 +0300, alperak wrote:
> Changelog:
> 
> * usage: add cold & noreturn attributes to function
> * Resolve clang -Wshorten-64-to-32 warnings
> * Variable scope reductions as suggested by cppcheck
> * gitlab CI: stop requiring Signed-off-by in commits
> * Build xz tarballs instead of bzip2
> * gitlab CI: add a basic build test
> 
> [...]

Applied, thanks!

[1/1] xlsatoms: upgrade 1.1.3 -> 1.1.4
      commit: f0a0c85b75af398d1c78151c7ae6172771fde2c0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


