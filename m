Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9FEECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:11:32 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.32480.1661479883427945506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TFUCZoKN;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id v4so143705pgi.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=3k8A51rGmrFRDCdEE9TrbSojXMKREF9LahLvrhaUuBk=;
        b=TFUCZoKNUcPDrcW1IBTyOoPkn4xBWbQecYEQXDnRK5aecbgCVjhJmYifBa4fEwLTjM
         dnBV1erSGRbe8D780ObYdzZA5CoCwgWxdI29PL0tqOsSic1FTPA4v78wVS7w4Cp1xsW9
         v7wcKXJI74mlp/LdE9Yp6f/EBlS+hj65/DGjo9h7ADh75BGlQMX0xAyjJJTBtZZOOjT8
         u8Isuj6taQZT+bFDk478l+thApnFimnYjDHbZ0DHHG2hlRU8i6bdk9gQnDJBdL/SuU51
         AuVBfbB0fMu5QKQL9JJ7fVLehLp8jnmFesOiANDu2rc7wh8uWbZQaAIDztcCDyMTaFog
         4CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=3k8A51rGmrFRDCdEE9TrbSojXMKREF9LahLvrhaUuBk=;
        b=EJ//aqGZHCOW/vXfjZcDZ6LvzViuD9YMe59FYnOvoRGrlsZ9z1u0RL4NpQf2mTgT/q
         HsSiqCnBiAXIvjtCy+vYV5LJ1MLeDuKl4M3/gbKz8/A/FdXlw3tvsdad3Ahn+ofCRqva
         BfRS7p7sgPmpH1BzHTTruHoKndxAvCKHk/JrFHToFZNEjnLVsLtudhaiA+7yYD6jVIT8
         IfbKzu+s0lHHL+fEIJdUuK5CZkU8R4pLqbyxrq4A7OwToLttlwRygCgrtteEtiz7z+8y
         uuCTQmwR4BXvDyfRciotCBu8PJa+zuuElpLPZO5tAx5YwxKZjMWiPUxWXUdqava/L6P2
         GQQA==
X-Gm-Message-State: ACgBeo2dPfiZvz5a5Xf9dMKzSae6lsEnCdbbyvNROU62gGr4fNsvBJ5B
	96tdH3npqFwIvz2ZwTCqDG5hbtR9IJXtoA==
X-Google-Smtp-Source: 
 AA6agR5uVFEQwVJzKCNuwExwZYDMjHBhXg7pVqVJd5voeCXw/U1CBPrtOLcF5T/sEgLlqyCL1QTi3g==
X-Received: by 2002:a05:6a00:1894:b0:537:2e86:c7df with SMTP id
 x20-20020a056a00189400b005372e86c7dfmr1840021pfh.18.1661479882301;
        Thu, 25 Aug 2022 19:11:22 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 z75-20020a63334e000000b0041a67913d5bsm250180pgz.71.2022.08.25.19.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:11:21 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 0/7] Update idevicerestore and dependent libraries
Date: Fri, 26 Aug 2022 01:32:20 +0000
Message-Id: <20220826013227.181910-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98441

This patch series update idevicerestore and dependent libraries to point
to latest commit on github to support newer iOS device restore.

Potin Lai (7):
  libplist: add libplist_git.bb
  libimobiledevice-glue: SRCREV bump bc6c44b..d2ff796
  libimobiledevice: add libimobiledevice_git.bb
  libirecovery: SRCREV bump e190945..ab5b4d8
  libusbmuxd: add libusbmuxd_git.bb
  usbmuxd: add usbmuxd_git.bb
  idevicerestore: SRCREV bump 280575b..7d622d9

 .../libimobiledevice-glue_git.bb              |  2 +-
 .../libimobiledevice/libimobiledevice_git.bb  | 19 ++++++++++
 .../libirecovery/libirecovery_git.bb          |  2 +-
 .../usbmuxd/usbmuxd_git.bb                    | 23 ++++++++++++
 .../libimobiledevice/libplist_git.bb          | 37 +++++++++++++++++++
 .../libimobiledevice/libusbmuxd_git.bb        | 17 +++++++++
 .../idevicerestore/idevicerestore_git.bb      |  4 +-
 7 files changed, 100 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
 create mode 100644 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb

-- 
2.31.1


