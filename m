Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.30365.1611161033881064727
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 08:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o5PlHMPn;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id 7so16483741wrz.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 08:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OazCD8ylR9scCgVdLVViCOHT4v4ydLdj0DCA5DfsDeg=;
        b=o5PlHMPnqBvhgAdlsOvt/mCPr4HXA5Nuz7EVxqVV/HP/CVwcllfKV7DLX4PtVOxhXt
         dwcZRj/95HKILKJSpdN35gKgooOFBWT8y4RDl5xw1fiChI/H0sUDunbKnYz10G/39FDg
         qhg/g3q7rrcQqYIv5x1Rgbdunsb9StexdHvjSyZRMcRC+5MlMyzpqq2AaUsul8wo50MK
         rE1UO32zEgf6TnjsAXycWfTb6+mZYCkSt1n+PGl+QM6wmpZtHjgrcjwUmjLTVs7C8uJF
         wO4eYZWO9bpoOoWsgbil/uNmkfkl54ZnkB1IpvhJ9vMEO/ZuP6UmZYGRRSJIs8+RruH1
         WmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OazCD8ylR9scCgVdLVViCOHT4v4ydLdj0DCA5DfsDeg=;
        b=gGbtWTPKSKP9hBN4xHtc2GaBw2EnvjE1QBuTHaFOjsIYewosOrsjgGSTQyBZk1g9xa
         dKvq2c5wXtfQeH1J737laOe4GuY1+LOrz+omjCshlD7iHrUNPTstKH+upkp16QOkuDLq
         DjWAYzey9BdQanhfjSrHqtg2jmHgAIZ8aO9znpZr7U5LvR6z9SABctVk/yNYHuLv8yFg
         hNZ2wHnpJgwVFNKkOoSBnqf9SUHXWrVYs9NG8ZEUtcSXFm6nbqyG79yJKPcu5W03w955
         zvB5oxWZmb+SxYAkRz16BhBzyZ8d9egSu94/UITKHuE6W3I0WGqYyPTYmnv81gYMe7Zi
         BDOw==
X-Gm-Message-State: AOAM530+7mat8xqAPO2TkruenPWqn3vYGoItd1oHKUSbf9dRhb5uXN5B
	KXqZPiIHp0QUbeAaL4MFxuXv926nlzu40A14
X-Google-Smtp-Source: ABdhPJz/uQHf2sfYtnuLmZa7yQbt7CzRR4pdx3tPcG09fsWU2fNL2uYckKHT5mE3b2suqTUNpqkDBg==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr10335658wrt.94.1611161032010;
        Wed, 20 Jan 2021 08:43:52 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id q6sm4662456wmj.32.2021.01.20.08.43.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 08:43:51 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dbus-broker: update to v26
Date: Wed, 20 Jan 2021 16:43:49 +0000
Message-Id: <20210120164349.945256-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../recipes-core/dbus/{dbus-broker_25.bb => dbus-broker_26.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_25.bb => dbus-broker_26.bb} (92%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_25.bb b/meta-oe/recipes-core/dbus/dbus-broker_26.bb
similarity index 92%
rename from meta-oe/recipes-core/dbus/dbus-broker_25.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_26.bb
index 8b6825029..5517883df 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_25.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_26.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a54fc5192280caf5824b82cb40f295c1195ad73c71bea5bd60218afb9df5bb29"
+SRC_URI[sha256sum] = "6a6ab82fc398d4bc31b315f4e1c08f17509e4a1969f1cc77a5706db8923c74e1"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 
-- 
2.29.2

