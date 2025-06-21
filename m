Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F0DC71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 19:40:15 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.13794.1750534812372205448
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 12:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hwkLxEwI;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so4397863a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 12:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750534811; x=1751139611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uGMiJhVKolkpO4RQvgVObfHAe53JLSE0Y/LBgOIsgj4=;
        b=hwkLxEwIfk16vvdd+gPYa8CMRZg2F+NzViZFsVi1saPvggOEzm7twQ+DWwVafES0yL
         oUZyDn12TpMduUhvU/W069sHUGwPuayWrYDZ07H9H2nGgdMIrKlH69CWmIV1yCfc56VL
         cZ8IEradBgRhcJAUZSkcTYDw5Mnu6YGD667HbLr5S9yAN3GHSk6+QdNk/TmRdYVFaBuT
         Xyi96xIoW1XCQAm545LN8kYiDHmXk3m1VtE+kfI9Cr1mQMQ7GJ0dfXCCoFjRHm80uYj0
         ntDu2v9Pf+v4HdIibQj8gNjkeNWUCSHXzYRbBQCxcWGbY2ZnA+bR0gzxEabXRlYBpAww
         yK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750534811; x=1751139611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGMiJhVKolkpO4RQvgVObfHAe53JLSE0Y/LBgOIsgj4=;
        b=fm8tUjFD/x2F170UAaus0SyPP/J3BdXqp27dv3yLSy+lyV1V1oIeGWlIX8jJJ8kVnW
         1MzXPzNDdKEtmPkjbcLsjfzRmP1nCLWEyNASkR22310YAPtNJ3b3YVZZTWym5HQBwnBu
         Sv0QiM4Qp3zk3vru8TglbhGpyNKQwKb2RGPkfAfy73/xP++03HkbsoJgBxVrT6zAce3F
         9R4mVZ0cwXw8nKN0rw0I0ZKah4upE7eSYokuQIvzPBdNJiu22UoKjz7FkxhwHTnZYzlU
         4XM6wfa/YtxcR3aR6rynBZ3ivE2yjAiOuiOcD7ByyMIPB4b6A8qpPcJxF9VGZqTLrE87
         0teA==
X-Gm-Message-State: AOJu0YyPRirE4SyDshc+rTV1q5Agmj1l7lpFXvzOsORWb8/aRKS+Fbdq
	OKMNvEAtNdMgFzmuXoj5YGDkYpyH/O3Y27JO2Gc0aIwn4wLc2Pe4QZu+7aAHfg==
X-Gm-Gg: ASbGncvI4IqTBmdohmkZyNwDRLPC/BhEp8GPGCl+dwuXYRcHaav5M3utkDP/2RNbZqB
	szLoOoMAApfdO50rcyxaMFa5gxxl+guPVG3jKHD1zs0g2TojBE0DVs+9b6cHlDx6jfpWTE7FSUH
	uJjqRkXtjg/us2+/BOQi6KaNZa/d+iLHl9YZksf7Uv9x+ff+PtE6Mes0p3a5QrNfHVY5eqSbYuI
	JQILgV1YTWmAqksGY1oc2TXUwu4LaTf7fKlRBNVZOBlDu0EguU4I2uNyaQ3A4Siy4KsZu2ZGo/C
	TnAH5ooO9Hyw9YtMtOjHlOF+OTg0tTi1NuD2K83E33LDdQyyc0/BfDDDfsisKcfM48uKIndkzOT
	90A==
X-Google-Smtp-Source: AGHT+IHRILNeDh4AXGBYwarEHOs4rLc2SAHfPaVUi/n5EdTY9y6gauyHu3LsR0ROUk8U/esuxQCHgQ==
X-Received: by 2002:a17:907:2684:b0:ad8:9811:c0c2 with SMTP id a640c23a62f3a-ae057cbacc1mr633493666b.61.1750534810363;
        Sat, 21 Jun 2025 12:40:10 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209fe9sm425756666b.172.2025.06.21.12.40.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:40:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nodejs: ignore QEMU_OPTIONS for native signature generation
Date: Sat, 21 Jun 2025 21:40:09 +0200
Message-ID: <20250621194009.350944-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 19:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118011

NodeJS recipe uses qemu to run some target binaries during compilation
in qemu, in case the build machine's and the target machine's CPU
bit-width are different. The task that generates some helper scripts
(do_create_v8_qemu_wrapper) is executed before do_compile.

In case the target machine changes, that also changes the value of
QEMU_OPTIONS variable, since that is always derived from the target
machine's properties, even when the current recipe is class-native.

This also means that in case the target machine changes, that invalidates
the do_create_v8_qemu_wrapper's sstate cache (along with the very costly
do_compile), for both target and native builds.

However for native builds qemu isn't used at all, since the target and build
CPU are the same, their bit-width matches too.

To avoid unnecessarily invalidating the sstate cache of nodejs-native
when the target machine changes, add QEMU_OPTIONS to BB_HASHCONFIG_IGNORE_VARS
in order to exclude it from the signature generation.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
index 4bc829f140..bf2bae27f1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -47,6 +47,10 @@ CVE_PRODUCT += "node.js"
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
+# Changing qemu options can incorrectly invalidate sstate, even though it is not used.
+# Exclude it from signature generation.
+BB_HASHCONFIG_IGNORE_VARS:append:class-native = " QEMU_OPTIONS "
+
 def map_nodejs_arch(a, d):
     import re
 

