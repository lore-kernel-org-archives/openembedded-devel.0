Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3A0C25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:49:14 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.42595.1717264147563174358
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C2wn8b75;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6c57fa82fdbso1082876a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Jun 2024 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717264146; x=1717868946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7hNyR3NvnnweMFbindO/vElk2PBzXcUwtmUAapJiq7I=;
        b=C2wn8b75fH7tXaS29D29jpfodqeIC+5TJoydBGaZvx7i/2x0o6oN71rZJ9+drKyH9L
         wcq1gQU9FOl9czQc9DXkcTwzE2jz718Xrmz2s6NXsjr03XeDdjX+qLlL00LtRgi0Uayq
         I+ZppXfJalR8G7iMRDIC6mWN7NBt8lFBb27rIpkDKhiNF6CFJNfCFR9WnibSIy5+oGLA
         8qwUVfKdQjOpHRSosArDnQ9vM9D3IgiUeDZkP+yChp4xe2NASWckcck+JGViuYMa/Vvw
         jG38NWJ5xbhUPeonBbhLf6Dpx1VuF5wvQky9mM1HX9uj5TGdm6851z/Khpk3m44GEfE0
         Hulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717264146; x=1717868946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hNyR3NvnnweMFbindO/vElk2PBzXcUwtmUAapJiq7I=;
        b=DiQABSp0uMrC1S8h/+UZcEWDvvKgzjPLssbtV98f1p17W4rHGsAimtusvU+UBFOG6W
         o3QC/V4LDDCl68dP7z1nciYoCSQz8oJxyd6c2hif18dtpEZu+NoVMGLAnRfKvkDqcvsq
         A5MLkhmHBuh1mjHy/gurm0gOmerYSRNIV1lFqa+qI9sVK9TKX2cOImCkIDCCB1/0j6fo
         0aaIgOXM8AQFEBc933R6WMI+flSH2jc2trucIfDfqCR2wyTge0pKF9N+kuxt47Xolo++
         oXdCmgh+7LgPnj4p6ROb/01Rn3JUMzjZ3nX+PxOPrCn6ZmMkjxlfME6EsNLbbZ9JprR7
         L7mQ==
X-Gm-Message-State: AOJu0YwlgjYV1gVNhHAs3ae1F81PwY+P1KRvppK+My5DAvmtCgMJeese
	++ItkBPYfpaXqALxSmFSnI7YxNumB4Hb90SjzOvdVg3nFaNEr4/PkMUjTw7ENYI=
X-Google-Smtp-Source: AGHT+IGsGGiDj3wqzei/CXKyGN875L9oXEc22B80lf/XNtwlw4o41afEKWtW13xvIV0SgRvxaw3jxA==
X-Received: by 2002:a05:6a20:8420:b0:1b2:1ae6:2ccc with SMTP id adf61e73a8af0-1b26f17caf5mr5974891637.7.1717264146535;
        Sat, 01 Jun 2024 10:49:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6d8c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a77afb24sm5444493a91.46.2024.06.01.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 10:49:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++-libsystemd: Upgrade to 255.6
Date: Sat,  1 Jun 2024 10:49:03 -0700
Message-ID: <20240601174903.3990426-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Jun 2024 17:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110660

Fixes build with kernel-headers from 6.9+ kernel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...us-c++-libsystemd_255.4.bb => sdbus-c++-libsystemd_255.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-libsystemd_255.4.bb => sdbus-c++-libsystemd_255.6.bb} (98%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.4.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
similarity index 98%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.4.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
index 3b44e02376..ceb422325c 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.4.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
@@ -10,7 +10,7 @@ inherit meson pkgconfig
 
 DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
 
-SRCREV = "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
+SRCREV = "5810c25792d4268282dd3892af1a253b690423c9"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://static-libsystemd-pkgconfig.patch \

