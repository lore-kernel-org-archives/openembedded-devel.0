Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411C0C43217
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 20:13:41 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.3918.1668802414179572527
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 12:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WL+icfZM;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id a22-20020a17090a6d9600b0021896eb5554so317354pjk.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 12:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wCtx2CJ05X/2RlO5Idt2E/1bBlgOVq1AkpBZsmX0iRM=;
        b=WL+icfZMHOB8Znn+k/LmVGy801/rMDN7TgXsLkOQn3vRrhpa5j1ZO0gAzywkor21L8
         QwJmQV7dBqzSvaSqGPRj3x/KwyHbONEgNJZWg3t37vd0irohuVdkz/Oe0TZkE+JUZ4K9
         vgo739cTRmVhQWNZDi+1qpn1xnV8hjlMQtr9PDvRxllrxUkHWJU0xOS7UI/DM8GSdzoa
         2aARhFCfAVX0vk6+eK8Ddh0fEYVCEAHGgScUN+z66S5OeS5ZBZFmyIfeST6MLM8DotrU
         ZeJGHSXGlhVI9QI2EgNbRPZH6Dfukrm98PMB72FTlfWNzfpPeAQLP+/xc06eeQE1f+QC
         qq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wCtx2CJ05X/2RlO5Idt2E/1bBlgOVq1AkpBZsmX0iRM=;
        b=xtLvh1250iQOG+XlDxNKwT4Zo2Eqr1OG8gMvBz3LJoi5dVIZKVxhqtIWF0I/MdAgtj
         9cv6I5GnhTW2d/2Ue75vicDF4QWeVwQT+slUAMQOo5W6k7vPA14wnX0bwHgTkVUnhtTE
         01RpyfP2yOcnEnoN4wkypqwsYp/2TGOBYHwToNR+gRT0BG3xe9Xri2BGl5jVN+WFkEmz
         5tBkLNyY+jA2RxiGKpqQzpuVgLGL12/Ot9tzjuspDlug5//irBQ1++f1R+/HNsJCgwlF
         YUfseAZ6H1Ho+JomNgTRn7CZRcNhI6xG83lUWseYAmeg+xnmXS0Fqyg/6SSiBRuMI1oA
         tscw==
X-Gm-Message-State: ANoB5pnO58M9Z7E257UNEVUm24LGTer29D5poZougS+49NBVmxEPQT8O
	xnMCQLNj0Rlj7GaIdOAdSx47x/PlLdPgXA==
X-Google-Smtp-Source: AA0mqf5vR6C6t8sTQwWhF1U4Ws2xJgCvotSHNW9Yma/F3Tf4BOxK/+9derpqg7RVaIrnBibKEsBb5g==
X-Received: by 2002:a17:90a:39c5:b0:212:d686:f99f with SMTP id k5-20020a17090a39c500b00212d686f99fmr15211176pjf.109.1668802412970;
        Fri, 18 Nov 2022 12:13:32 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:b88b:808f:8d53:97bd])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902d50700b001869efb722csm4132722plg.215.2022.11.18.12.13.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 12:13:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 0/3] meta-perl updates
Date: Fri, 18 Nov 2022 12:13:21 -0800
Message-Id: <cover.1668802119.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 20:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99617

Once https://lore.kernel.org/openembedded-core/a4f847dcc056026082099ae4977bf6a8e8bd89bc.1668793524.git.tim.orling@konsulko.com/T/#u
merges, libtest-warnings-perl will move to oe-core.

Upgrade libio-socket-ssl-perl and add libmozilla-ca-perl dependency.

The following changes since commit c4829fa338dae008c75cfffd4a712813a99c33c4:

  Nodejs - Upgrade to 16.18.1 (2022-11-18 11:10:25 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/recipe-upgrades
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/recipe-upgrades

Tim Orling (3):
  libmozilla-ca-perl: add recipe for 20221114
  libio-socket-ssl-perl: upgrade 2.075 -> 2.076
  libtest-warnings-perl: move to oe-core

 meta-perl/recipes-perl/libio/files/run-ptest  | 16 -----------
 ....075.bb => libio-socket-ssl-perl_2.076.bb} | 26 +++++++++++------
 .../libmozilla/libmozilla-ca-perl_20221114.bb | 22 +++++++++++++++
 .../libtest/libtest-warnings-perl_0.031.bb    | 28 -------------------
 4 files changed, 40 insertions(+), 52 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libio/files/run-ptest
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.075.bb => libio-socket-ssl-perl_2.076.bb} (70%)
 create mode 100644 meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20221114.bb
 delete mode 100644 meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.031.bb

-- 
2.30.2


