Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3E5C6FA8A
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 04:32:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.6530.1663216359667649011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 21:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PVi1cYMi;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id v1so17170835plo.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 21:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=JQOnBfxtpwt3cFVmCV8WPdtPVjGBrpzX3W2/6RyYWCY=;
        b=PVi1cYMisv7lDVwF7+DF8B1l6i5luJhj42jLjalwdcCug/5U0onatYFreazbXKgJ2f
         312k6g6NbSijnBT1t03NsL/mAZf64tZgiXQdc7AyyqjyjaTUlSh7O7C/9iywoSNnK6bC
         btJQI/YQQfmQ/qffAh9Met7Cjpfp8IqlrZm+AhkoA44KLt080wpqB1sjxYqaMBULA7Jd
         fmfRz+o+YDx0qEpAR9eQyC/46HdhZABaCIK/fqcBIV26xeoLWxELDa0r+9aooeZ6IywV
         NV8R+HrMXns1AQ9CfdyE7bByqJOe+K0dt2f9J1p4BA/H8nZd+Sk1c1zyee3PLqlSGpxK
         QA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=JQOnBfxtpwt3cFVmCV8WPdtPVjGBrpzX3W2/6RyYWCY=;
        b=5RPVUec+D4gDAF3vub3u3IPTxoojdeMz6H1OGWGlQrD+WS/ax2zPaVwzxXhXUESixx
         HoJ3mWaOekLFm/68Xx3laKjwfuuhemVnyNAN8QxGw9k0JKTu9qK1sYX8GX4f5b17Nwes
         RhhXSAyly+/hilSDdvC5vNNE/6huSjPLSIOPw1MEZjNZyxbr2+gUXw7y/5H/tjxwYj7G
         suUKZiC4Wd5fjw3P7ZtQHH5lDGPEgZPT0QW4IJZNSfynnyuOstCPfMHneQ6mEHm2kKhH
         8tVYmuWtjrOz4o5MM0HJeDpMXo9r6JOxgy0IlObfmsRTx93MfyWzhBpwMykEw9XhlfsF
         8rKw==
X-Gm-Message-State: ACrzQf2WfkTpgp0gI4vhFlXv0m34m3l5YiGqf/i0IuCb6TvOoGqWlz8h
	Hekh413Jz3ZCa7aIgrYZNgtTWKX2BlVJmQ==
X-Google-Smtp-Source: 
 AMsMyM5NvBPfrIm8BwK5F16Uz/SKyoM2yhL8Kpj/J+WRxsbwPGYKQYgETtEIsUlDezKbFjqClNksng==
X-Received: by 2002:a17:90b:384b:b0:200:71b8:ae00 with SMTP id
 nl11-20020a17090b384b00b0020071b8ae00mr8414907pjb.125.1663216358773;
        Wed, 14 Sep 2022 21:32:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ec90])
        by smtp.gmail.com with ESMTPSA id
 a3-20020aa795a3000000b00540f2323f67sm11403760pfk.95.2022.09.14.21.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 21:32:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] fwupd: Drop sqlite3 from default deps
Date: Wed, 14 Sep 2022 21:32:35 -0700
Message-Id: <20220915043236.899718-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 04:32:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98811

sqlite support is controlled by a packageconfig which will add it when
needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
index 3b5aa3483b..2e9921d37d 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "A simple daemon to allow session software to update firmware"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
+DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-fwupd-Drop-unsupported-xml_declaration-parameter.patch \
-- 
2.37.3


