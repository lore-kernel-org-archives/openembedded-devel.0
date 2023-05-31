Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25642C7EE3A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:23 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.11449.1685531602677100480
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AE1FTfjS;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-565aa2cc428so47386427b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531601; x=1688123601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWMtoKwoYkTX35zBZH9HCFeNL+TxfTTDzVXL3Teftvo=;
        b=AE1FTfjSvlPe0/gq1Y9aiHYevqCmfzmbzu2KT60Ln335qgfyZJCXLfGCzFgO2mLh3e
         zEG2/q48lXg+prhzhugcDBD3Ku+ExExLk95F4UQw7hcTTnHOvSDR9fBd3b9AktXhn0ac
         AeSSGAmEp5DYQE6SX4wYUvXbXwiqSA/G7Pw/Mwe1RJJMRr/3rS5u3fK7vVz0w85Ut4m2
         0EnUiFx0zB4fKROaDGHHhkXajCeetcAolZIekkj/Th4V1g/ejha27lQ2LdxdTP6mSEeF
         wlYbVLT61KUEae2d3gGon+7rvhTyJwtfjRVtH3pqyq3B2iuNIllB+UHHu5YZB2Gr/k7o
         O6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531601; x=1688123601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWMtoKwoYkTX35zBZH9HCFeNL+TxfTTDzVXL3Teftvo=;
        b=S4XhTnwLaUCsUnBgamKzo1Ca5kLRhXDkG7mmYKwtJJqILxqMUTV1UrI/kEEAapwEB7
         E/u+qToWMktrATU2v7P9sNsiaLhMzbqnen4c5T6qRx5zVKaUOf66/1JNfY24VuxGp8Pm
         /fVWzY4VYuyBLAQGu0lelJ8TPGIkqUWWRTobd1WptfMJQ4BFA1PF8MVR49smrW/4Qza/
         v/o7TI+i7qs6vjRHOZwjan7LLAv9888M9PuoqthK/IcQWCZDY+OB8EEPp1e1UIVLpLbB
         KJ4X5d9pszvTKwt9jj3NquxdQ5cAdMT/BZP064sWHV7rMc29tikUmGWc3lA4n7uNGsFh
         Sc3A==
X-Gm-Message-State: AC+VfDx04aRPhnbm+m6RywSM0r1ia+1zV+ihnaW+uxWiPChBzeHxRW4H
	m2O8P8UrzKkxC2PLjw2TF6k6onZOsuU=
X-Google-Smtp-Source: ACHHUZ7NOrw97XCb4DTcSITYhOuRrxzFVeHzbFjrdXJeylt7MoHinIjqo9dN0qpe+QcDvgvy3Y/vvw==
X-Received: by 2002:a81:4ed2:0:b0:568:98b3:6b70 with SMTP id c201-20020a814ed2000000b0056898b36b70mr5347157ywb.34.1685531601443;
        Wed, 31 May 2023 04:13:21 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 13/36] libusbgx: check scripts in /etc/usbgx.d
Date: Wed, 31 May 2023 07:12:46 -0400
Message-Id: <20230531111309.2454603-13-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103042

From: Ming Liu <liu.ming50@gmail.com>

Sometimes an end user might want to change some values in
/sys/kernel/config/usb_gadget/ at runtime, for instance, a product id
or serial number must be read from /proc/device-tree, and so on.

Support that by letting gadget-start run all scripts in /etc/usbgx.d
after importing the schemas.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
index 9e22671a9e..e80cb2c340 100755
--- a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
@@ -6,6 +6,10 @@ for i in $IMPORT_SCHEMAS; do
     /usr/bin/gadget-import "$i" /etc/usbgx/"$i".schema
 done
 
+for script in $(find -L /etc/usbgx.d -type f -exec test -e {} \; -print 2>/dev/null); do
+    $script
+done
+
 for i in $ENABLED_SCHEMAS; do
     configured_udc=$(eval 'echo ${UDC_FOR_SCHEMA_'"$i"'}')
     if [ -n "${configured_udc}" ] && [ -e "/sys/class/udc/${configured_udc}" ]; then
-- 
2.25.1


