Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E17CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 21:09:51 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.25829.1758748183343804755
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 14:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XEWyxtGg;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-72ce9790acdso3834877b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758748182; x=1759352982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Df07PnUCGRciJXMqrx5zMnC6UYhno3dkQzcZECJJYc=;
        b=XEWyxtGgM1CltBIvxAW2KMA/FtZHksi/9MR56Npz9CI3t+MmqXii6kpLUSmhIiNHe8
         oNQSaphtB4Xpa64O1TJOK6dTgvuKj2U8wRcHPFHYZ4WYj0qlPT3eZRM2BkswjHVmFHKb
         afNxTYQK9zXBev8Cym4AMoMd86IZuEyAvyQBUGFyR2OSeIB0ayk1cqOv66gZAG0DVZIT
         EXXNhfFZHKV4KjgzUS1WJIcWTmrLOPShMbK/ekuW+LE7HS+Fess4NMfq04qEhfL0b3CY
         qwtO2KrgjhijJHhhY59IQC04EjolxrmIjmkO+z+TB+/X0QHKKdgdjfk9CWjoUyPIq0fV
         oOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758748182; x=1759352982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Df07PnUCGRciJXMqrx5zMnC6UYhno3dkQzcZECJJYc=;
        b=SnREKVONplzzhslcIAzCHYmvaEcH7K719oMUvRFFbVniJR+BWyHjCzk+QlS9VIOQXq
         VN90LNCXQDofoaTu/5hWl1RrT1S4CQ0zTDIhzK3sdAarlkuwMXBMc57IpqPZk+L3mUrS
         U/byfqfIV7lVJ0TUuipIi388lzBpwd6x2NvITtTy52c26iwXx8AojPMd1BhyuWigDNt6
         RjjNfukIGubcTmxPJDEpBc5DpHkvrRgWvCwCc3xP8bjlWELqJD95l3ocJ8SbuzQtq193
         rDlw8Rj4NJrfZtcNed1tlBO116CQ2+5aEi4XyispkRqU8VDmXFnmo54o9jNhES7GkAR2
         llaw==
X-Gm-Message-State: AOJu0Yzs84Qk+mQj9XakUYXA1PNYpSQpSXdqcRRbDDrdH8cAeFf7nQtS
	mjkMi5w86w774I/vyPPRBHUxi5YecAOM4SREImg6NKZb55e3mMindoD6yVl0CKQK
X-Gm-Gg: ASbGncvWQInmrTFb55IMOANwafOEYGxiIN5Dya7yZp94iVF5rAheyZeB5eKtW989QQe
	VZ4Cjr2TxUiwS3rQVxFJICS9jqrXfgyiubQgvxY/2sf8APCer2TJtc+pIf3TeCSzzx5EBJA3zMd
	hgESrmYlXgPpFRoIYVVYpzHKuvmzob8aZ1asEfQCvqEcfnWrSUtjESCIodi1D10n/ne5yowMNgD
	/rtOR6YV0dbLnOMJFqIUbt0h52cU4gVB+6PM6QE43t96YYbXKYTPiZB7GTtQxwtOX5C937F8JM+
	0r94CyUszC1gW9rK7Lf+SNg/FQK99eqIvREPAaRdiYkM0zj5POgR2Eo7ZdpaTNDOH33kG3mu9EM
	BEEIQdw6LoFa0sf/iaiAMpM+UoV1z
X-Google-Smtp-Source: AGHT+IG3isLTxK0TtHTyU1Ea4VIMt9NoPdEG2VPKc3cvC22mdNMOBrlPfMM/K0Yy3AQuNt9cvq3P9g==
X-Received: by 2002:a05:690c:6087:b0:727:4967:3880 with SMTP id 00721157ae682-763ecfd7802mr13072197b3.0.1758748181726;
        Wed, 24 Sep 2025 14:09:41 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-765c96af656sm7737b3.73.2025.09.24.14.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 14:09:41 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.19.0 -> 22.20.0
Date: Wed, 24 Sep 2025 17:09:30 -0400
Message-ID: <20250924210930.1465859-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 21:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119845

Chagelog: https://github.com/nodejs/node/releases/tag/v22.20.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                                | 0
 ...oe-cache-native_22.19.bb => nodejs-oe-cache-native_22.20.bb} | 0
 .../nodejs/{nodejs_22.19.0.bb => nodejs_22.20.0.bb}             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.19 => nodejs-oe-cache-22.20}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.19.bb => nodejs-oe-cache-native_22.20.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.19.0.bb => nodejs_22.20.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.19/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.20/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.19/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.20/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.19.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.20.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.19.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.20.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.19.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.20.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.19.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.20.0.bb
index c638228c34..acbe9442da 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.19.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.20.0.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "0272acfce50ce9ad060288321b1092719a7f19966f81419835410c59c09daa46"
+SRC_URI[sha256sum] = "ff7a6a6e8a1312af5875e40058351c4f890d28ab64c32f12b2cc199afa22002d"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


