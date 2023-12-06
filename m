Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C700FC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:44:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.44731.1701895481379446572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IwPVsVh/;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso3213845e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 12:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701895479; x=1702500279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTvMzEjHyHnDCLgvJ3zv3DJL6EbimfzQlkNTibdLQh8=;
        b=IwPVsVh/E0+PyX63n3C236KSpRzElQtfIhbZ+GYbEmrDE9wc32tCWZFe+unhOE5qAe
         S8NCYv5GGXb/Bg5cEoBknYBnm95i3UatoaEN9Ork8EQezLIADccCqnqpyNI9USLmur6e
         Hokri1oIcUqzxXBTaN6nbMIBxV4tVEPlQeavuNtCuwMhmXDCu9JVMMk/1J6AjgqHEnWq
         eTIJw+9bbUdmwdEi/Wx3erMNQjBEjwsJEQrz14J9VDJZVqCBm7ucohFvrisUM8kK54np
         zvJlCBM3ZAukJfFL2hq0tfGOfuYL0g4oAaRvGxEZv/hgnPT0sIQi/WKVpcex9XyoACRF
         D/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701895479; x=1702500279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTvMzEjHyHnDCLgvJ3zv3DJL6EbimfzQlkNTibdLQh8=;
        b=YlIE8Crya/j6uDz930kcACQ2eH1wv213lDp+Oubw03hjKOJZwMMMiQkBfWaZuo5cqI
         kV+HqKJ2BgyoGJcqFtzxZHQkWP4JaqSFKxPFu4o8aXm0XBbkLxBnI1G+a0YgWcqvgcOJ
         HotvCdlLsvy5DgaUcXBR4Xlj8WHLDKf+PCihHvl2uUD66cOF/P4xjd45uqup3VO8IjC7
         tUujR/SCnPZsfm8+8SiajTJ1rYdp9mJMUVbshmAWNMsDcnRwcg8vTZssqFncNCgzy87D
         e/atbK7bBRXcFuMwqWIaWI5EQNqBnUwBPxO38OSAeu4EUmsu2htHImLs9KIv0Bm3EBvS
         4eHQ==
X-Gm-Message-State: AOJu0YzODrTAVHTiU6hyRmA5N/e2+62k+ptLvgh2AxXALtmEVbhILj88
	fNWW8lgh2U2ekKAu741Cd+UQhvCIPYvzzQ==
X-Google-Smtp-Source: AGHT+IH2eV7dceEBVsLtOiTl2OvHJsLes6zJyAIA2UxXbEjTFr9xUwg9f8dPnOz6fWGMT0n3gH8fcw==
X-Received: by 2002:a05:600c:3c8e:b0:408:3f61:cb4f with SMTP id bg14-20020a05600c3c8e00b004083f61cb4fmr1042222wmb.23.1701895479009;
        Wed, 06 Dec 2023 12:44:39 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b003fee6e170f9sm686476wmo.45.2023.12.06.12.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:44:38 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xcursor-themes: add recipe
Date: Wed,  6 Dec 2023 23:44:33 +0300
Message-Id: <20231206204433.458785-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 20:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107266

Default set of cursor themes for use with libXcursor

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-data/xcursor-themes_1.0.7.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-data/xcursor-themes_1.0.7.bb

diff --git a/meta-oe/recipes-graphics/xorg-data/xcursor-themes_1.0.7.bb b/meta-oe/recipes-graphics/xorg-data/xcursor-themes_1.0.7.bb
new file mode 100644
index 000000000..9ebd2d12f
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-data/xcursor-themes_1.0.7.bb
@@ -0,0 +1,11 @@
+require xorg-data-common.inc
+
+SUMMARY = "Default set of cursor themes for use with libXcursor"
+
+DEPENDS:append = " libxcursor xcursorgen-native"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
+
+SRC_URI[sha256sum] = "95bae8f48823d894a05bf42dfbf453674ab7dbdeb11e2bc079e8525ad47378c8"
+
+FILES:${PN} += "${datadir}/icons"
-- 
2.25.1


