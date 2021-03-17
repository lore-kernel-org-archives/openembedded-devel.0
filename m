Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.1577.1615997619482969279
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 09:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TtvMvUnq;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id a132-20020a1c668a0000b029010f141fe7c2so1481360wmc.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Mar 2021 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3X8IqiTkrRk4EElVWETuXbn3Nj6i3t/mX6J+XxJk4cg=;
        b=TtvMvUnq+scw70coc7R2vaLOhvbJFkA8RtIV+sRpBgyDqKPeAcNWb3vUriPFDS7d/r
         8jOZxJNHg57+2BJc4jdbPFmUdKF9Hr3bGMMvgUWFP4ENgGs2Le/JA9KKxVqfT2UWsvUv
         69cUzXG046c8PCk0FbIP70OPRIzmULueh/8+ma2oZAr3iXPTxHLABBP1hvfNh1Qwx6ed
         YbYuGs/y6373ZHhEPAhWvjhNYXw/z0QltXlaxPDCqvy8aEaHXRiQAc2EVwiRfGnmDbBG
         HGi/1zF4zmGVNDlu9cBulgn8YKZb4TF2cWj4jjRA8pBfivKRzsRKrd/gWCexITOQOmsj
         whxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3X8IqiTkrRk4EElVWETuXbn3Nj6i3t/mX6J+XxJk4cg=;
        b=txez8UfME8xdFvFpylvgtLRhsFyvWQGJD3jy6xlha15L8gm8OlV4DNPeB1E2ddwZCR
         fYJZ8a6ADLGHQrZgkzw/bzrdjmFfPyyBIPGq3JNn1vMNrgniQqF3wr1tuq3XRas2TQzY
         cFw19IZQg4CwDMBKamQXWCRa4JyjdpdYAh5H0C06KO6bHTqozrG3r3AAycesEGCoNiPU
         FLMcwJLahVcMqBCB/4I+yUbXWjjH4C7dubQlTdQX9HO/ChSaRTf9EzIZn4locaVhd1qf
         EDmDCZHytR9Hb7DX12Q/8ALPHMILRcFHA1979JFJez1GNCGREQHAWCJv91GIvNKCxxwl
         fK3w==
X-Gm-Message-State: AOAM533P4HIcZaIkVIErQMa5YI0ar4dY2OIkMbZPP860SKGBy3X9RRQy
	cR3bas1Dz10YiGE+rvDEmaOWPvy3st1w1g==
X-Google-Smtp-Source: ABdhPJzrOkWKYn8v/QP6O/CmkjZDVzxBfoHntj7I/DvdzWAD6o+aFoD/CMQSpNxr4wt0XTe7lL9Nqg==
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr4299372wmh.56.1615997617546;
        Wed, 17 Mar 2021 09:13:37 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id p18sm5816032wrs.68.2021.03.17.09.13.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:13:37 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dbus-broker: upgrade 27 -> 28
Date: Wed, 17 Mar 2021 16:13:35 +0000
Message-Id: <20210317161335.1680086-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

See full changelog https://github.com/bus1/dbus-broker/releases/tag/v28

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../recipes-core/dbus/{dbus-broker_27.bb => dbus-broker_28.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_27.bb => dbus-broker_28.bb} (92%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_27.bb b/meta-oe/recipes-core/dbus/dbus-broker_28.bb
similarity index 92%
rename from meta-oe/recipes-core/dbus/dbus-broker_27.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_28.bb
index e64632bc5..a35f5c64c 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_27.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_28.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "15787bb694f128fcbd437841877a2ee0f6c6fef9e428276a35b8524cf52da342"
+SRC_URI[sha256sum] = "abb8b54434faeeb6bf59a70ebf0732e851a50bd922995ba5928e8c28c18b05ea"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 
-- 
2.29.2

