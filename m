Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE32C4332F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:36:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.14606.1700058994590714323
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=gbmhw/n3;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4079ed65582so53347175e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 06:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700058992; x=1700663792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GkCtfRc9wzSPc7mMZo1v/gjhpNxwrUMkU3Bp0ZTluAs=;
        b=gbmhw/n3zsztKtLH5DFoSj2WysyE7jZXBCuLyrO3/ZU5NK9lp3T2FAQlrMBSFPQ5/V
         2FiQYySPhxgBXc010bnLqFtLb3naJgZC3GdmV0PXyeEhbTnt0+xA+YppqkqsTxKcV1qg
         YO/IsrIQgWrrDg+8tQeX5muj8tW3K9w6LAx/PThka+zccUHbof+8nfcSEacTuOrmewQI
         NT/ZmxDJSbGMxM2r1t4JgNcMaUDo9BM6x/hL3H/zuC96ER7XM6TpriUszq1ikkYQBr7H
         nVJ0K0zyMdh+YJGiaLrKFNsCRhE8JF0l/yO1NblguoVztt3w6pOpBc2EeJY1XDPbBLnl
         3zCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058992; x=1700663792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkCtfRc9wzSPc7mMZo1v/gjhpNxwrUMkU3Bp0ZTluAs=;
        b=sSeGav2geQWYsjJcVL9IzTje1k2fpIGhKVORfDv4vuJtk+i0MpM41zZ8ZWKY4e7cpO
         MaBNnM7HZJZYZ9XFT+z5ePRDXwPENc0+Zh+bBHSFTUNUYeAiZGsScm4hcsuok6kOViji
         LL4XHUhbSNvTnbnMqVN7HKiOee8qhgvC+l7vc7SW54PI+lkqZlWaC5alZ7Vp5fSGsxFL
         WjsESWZBhuEqHIHPauOKnkSwFOHM4rWaaSlZiJzNCzXNWZ8QscHVP0IQ742jn2bypo+0
         4KZiI6BwEu/B4/09wCHaKqXkOjFi25B6qnbicSVpuX9o5RJD4vyW5wkFplIZ+rLA0KUb
         sujA==
X-Gm-Message-State: AOJu0YztstmTVOnP6OAG1mpv5N4Mhi4C3rtccro3AVLLkduFpFZqgWLY
	tr2bTTuhwT5baUrk6AXv0cL4Ry2XolKmsd1SMwc=
X-Google-Smtp-Source: AGHT+IHCbDrPbCJBKjw3JIPdLw74Y35Pd+73/m8/B1iMiUVzlfPCNUs/UuC3mUl7/TwLO/yxmzs6oQ==
X-Received: by 2002:a05:600c:1516:b0:408:fe93:a2f7 with SMTP id b22-20020a05600c151600b00408fe93a2f7mr10580312wmg.37.1700058992317;
        Wed, 15 Nov 2023 06:36:32 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d680a000000b0032d893d8dc8sm10790709wru.2.2023.11.15.06.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:36:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-multimedia][PATCH] juce/projucer: Backport a fix for the compilation under recent GCC
Date: Wed, 15 Nov 2023 15:35:19 +0100
Message-Id: <20231115143519.643477-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106762

This backport fixes this error:
  note: 'std::exchange' is defined in header '<utility>'; did you forget to '#include <utility>'?

Note: The fix is on version >= 7.0.0

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-multimedia/juce/projucer.inc      |  3 ++-
 ...nclude-utility-for-GCC-12-compatibil.patch | 23 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/juce/projucer/0001-StandardHeader-Include-utility-for-GCC-12-compatibil.patch

diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
index feb356463..b60cba1dd 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -18,7 +18,8 @@ DEPENDS:append:libc-musl = " libexecinfo"
 SRCREV = "2f980209cc4091a4490bb1bafc5d530f16834e58"
 BRANCH = "master"
 SRC_URI = "git://github.com/WeAreROLI/JUCE.git;protocol=https;branch=${BRANCH} \
-"
+           file://0001-StandardHeader-Include-utility-for-GCC-12-compatibil.patch \
+           "
 
 S = "${WORKDIR}/git"
 PV = "6.1.6"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer/0001-StandardHeader-Include-utility-for-GCC-12-compatibil.patch b/meta-multimedia/recipes-multimedia/juce/projucer/0001-StandardHeader-Include-utility-for-GCC-12-compatibil.patch
new file mode 100644
index 000000000..ae77aeef1
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/juce/projucer/0001-StandardHeader-Include-utility-for-GCC-12-compatibil.patch
@@ -0,0 +1,23 @@
+From 85822fcb87dd531d5e8ed1c8230c67bddb56f66d Mon Sep 17 00:00:00 2001
+From: reuk <reuk@users.noreply.github.com>
+Date: Wed, 6 Apr 2022 15:43:09 +0100
+Subject: [PATCH] StandardHeader:  Include <utility> for GCC 12 compatibility
+
+Upstream-Status: Backport [https://github.com/juce-framework/JUCE/commit/ce8aff22c31c4d932a8414bc6f6185381dc970db]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ modules/juce_core/system/juce_StandardHeader.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/modules/juce_core/system/juce_StandardHeader.h b/modules/juce_core/system/juce_StandardHeader.h
+index fe164cdd3..cda6bbe86 100644
+--- a/modules/juce_core/system/juce_StandardHeader.h
++++ b/modules/juce_core/system/juce_StandardHeader.h
+@@ -64,6 +64,7 @@
+ #include <typeindex>
+ #include <unordered_map>
+ #include <unordered_set>
++#include <utility>
+ #include <vector>
+ #include <set>
+ 
-- 
2.30.2


