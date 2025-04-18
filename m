Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E138DC369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 08:51:15 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.8028.1744966268574451518
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 01:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kj6rk+so;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so252376866b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 01:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744966267; x=1745571067; darn=lists.openembedded.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnOxoiP8tN1ddXpMr0mOSxjjlKV1fnHGgBWvbLuwPZM=;
        b=Kj6rk+so2eaShxN8yu9ZHDLDitnk1vO5auUwJuhNOgqAnVJh5ByOhmpNaxVZsL8ZZc
         tFZgbym4R2P3+5/AEM+8T79quK0OVBvtW/7Ru677QD60ZXUIKus35uff7TeE0kUUsuvs
         xzkX+UDUS1iqcmEecF9v4awhItL+swkho/drsUnn/V8N3Cvn6LzUvAExkVGlSyftHiwa
         iDjTVww3k6tRUfl1zW+ErMbq28qPgo1V5VA5+oaacXo8eHKhqy46shJOtT6zqKgVuCGY
         tc6/Cz4VI/eA7lQ/W0K+XZFzjaxBt7wjK4H1O8lJJrv3JihI7kHQHAkihlIr93Yxv0HQ
         sZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744966267; x=1745571067;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnOxoiP8tN1ddXpMr0mOSxjjlKV1fnHGgBWvbLuwPZM=;
        b=aGmW4CeLHzV9ns0F576ap1L0cHlkFAwShdO8E/T3/liAvznWMALj6jWGCTcCdKvVrM
         pNjou38q72GynbK/hGP6nXNYM47BgQSY0UHQqJztjfw/xuQeSlSBfBUC/9zsd8cjb5eK
         IjEJvdAOfPNCBayxNZ5dFAdBCR9SkcIwHZi0zjn+6E9N3Gtl0s1T9+vpd+rK8IwseKMn
         6xFwigKN83s1LaHGELN3rWHsMXaRxoO6gul1r6NJPhuBW/VyFVv90xghpiqbaccrvgOA
         PGqh0oAynoHeJHO3mzSBwwfrvp+KDU4a5rG9UAV2YT3yLYa/Qs7p4xQevnrHHkEpeP2d
         Qf0A==
X-Gm-Message-State: AOJu0YwWkdNeuaWQSr2sKYNlz/h5qZFw3aGmt1zor1Z9aBiFOmFsV6JX
	CxAa5mexUoo/s6CwTbVVoQjlNgkMlPEfmN08t5rw/k4Bh5WbEXPA
X-Gm-Gg: ASbGncsILmJJQ8tUbAyeljQKqzlm62LK4yE2n7Vdxar2Mbjta7Ujk2gk8gD3NK6ADr2
	JffJbPNg2LbilUqn4QweIgutoZWeddOUbpcm+whFWZ50MWzgJru4dEbGGMM1KiPEt1MhdRNThvO
	tpKhk6DDUl13I0FrJvvX4WCU71L+pnK+wwUXxw6RPBE0Ipjnp+1Hfg0Nz5bLJSvYsB3vSqBYXgO
	r+HU/Y/Pz1oiL+5zwqyqOu/8btMFDUZvuzjrRKtADF9i2Hr3Fb91GjTJOk4x/Q6pyFMuzTp5XxN
	skz70MeSSKpratBS1SNGgubmHncQb07z1RDlX1LmNjPQI5ZkY9ouoyRu+9DInC3m4WXk0BlFFlb
	X81k3N8mFMLp30rLDwRYO/jAWdK8544SkmYrxNP5YCeXrs13aag==
X-Google-Smtp-Source: AGHT+IH0Ed3/vHmzAgQGtM6yXGFKp7pRC79abIZQ/VheWKvDRInqtBR1gC4I4vltj9mKB0X/0wnX0g==
X-Received: by 2002:a17:906:7949:b0:acb:6746:8769 with SMTP id a640c23a62f3a-acb74b0d460mr164768366b.18.1744966266631;
        Fri, 18 Apr 2025 01:51:06 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef49ff9sm93736966b.158.2025.04.18.01.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:51:06 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:51:03 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap] can-utils: Upgrade 2023.03 -> 2025.01
Message-ID: <aAISd7n7umT8UHQ9@alb3rt0-ThinkPad-P15-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 08:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116945

Hello,

I notice that master already include can-utils_2025.01 however scarthgap
is not.

Is there any specific reason why we don't update to can-utils_2025.01 in
scarthgap branch?

I found that using 2023.03 on scarthgap the following command will always show the
same msec:
candump -tA can0
due to that cast:
https://github.com/linux-can/can-utils/blob/cfe41963f3425e9adb01a70cfaddedf5e5982720/candump.c#L237

Let me know, If not I can share you changes for that.

Regards,
Alberto

