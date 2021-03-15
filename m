Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.8.1615829023438812722
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 10:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kGTKL3x4;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id t9so6086273wrn.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 10:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OdcMi1i/xATh0saTtvhbBcnzs4jXqBLqYs+8dEsyaU8=;
        b=kGTKL3x4ot5aNQXifhENhbfYMIOrOXbeeu8coFmWLZLeqlwlbvrUzq1FI5GidqnyiZ
         AmJwQpI5yVdr46FFd7M5pqb15fEtHh2pgm7DbxULHxwvnRSQBJ/kloIp+Vox1QtA/mhH
         +Cm/IhtA6UYVG+Cl1MdCC2XIqNkKu/BA9om40TZchojesfKFmfbFM1m6z6KrSwCUXsMD
         yMeekys+hDt2ftgN4/hoijtZV5ua2H3AK+TDvHmYkNhmqCguF0otgtIb/X7lhss3fFed
         V4BvFx1NzhYmkxkp9GK9pX+i4KH8itpN/tZq8Fl+IsfbzxfANQvUcRfGJXTTyUpH8LMF
         OzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OdcMi1i/xATh0saTtvhbBcnzs4jXqBLqYs+8dEsyaU8=;
        b=qDsXI4DTGgAgljw4xKSjOuXtpx2HCIR1nVWs+EirhuhbYYjVI8DH81IvCAg6EanXKr
         gk4ttscfrA6QonTuwT2lxYDKIIAPU8FJ1nzaNXwCSjq7kPUDOCMOcJFeHFMVn0uWXY5k
         1YqrkPXT9hDRYsc60QpaggUs8wxKA8E6iqrZcOjNYUet5inMNoaG+VzjenM38d7TjHs6
         5nrq9+fWONdzWcNRUKOG1K4Dif47DJg8FAkyArKL9cJpmdHPUf22Drtr3NcqCWdoWcdr
         X0K/6H+GopAF9EqUpxgKxj+2FWTeUHWEIXRTfVdU9hxwROzFILjUaBHCnG4fQrAyPc/4
         RTTA==
X-Gm-Message-State: AOAM532JK1rYizE0PkxDsjwXEAQGucirNFM8sJxiGo3wxPkUjaQNG5SW
	iRdBE6Pwp+UgesobK3KMDXk4V6FbKwM=
X-Google-Smtp-Source: ABdhPJxjtW7HawL1Aa6EgdpzddZqLIxP0PKACUhQAM1V2HH0tPMdhV2wE0ZA8qg8lVOiL9ArELvvWQ==
X-Received: by 2002:a05:6000:1546:: with SMTP id 6mr704604wry.398.1615829021379;
        Mon, 15 Mar 2021 10:23:41 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id z25sm320520wmi.23.2021.03.15.10.23.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:23:40 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dbus-broker: upgrade 26 -> 27
Date: Mon, 15 Mar 2021 17:23:39 +0000
Message-Id: <20210315172339.1147901-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

See full changelog https://github.com/bus1/dbus-broker/releases/tag/v27

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../recipes-core/dbus/{dbus-broker_26.bb => dbus-broker_27.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_26.bb => dbus-broker_27.bb} (92%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_26.bb b/meta-oe/recipes-core/dbus/dbus-broker_27.bb
similarity index 92%
rename from meta-oe/recipes-core/dbus/dbus-broker_26.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_27.bb
index 5517883df..e64632bc5 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_26.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_27.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6a6ab82fc398d4bc31b315f4e1c08f17509e4a1969f1cc77a5706db8923c74e1"
+SRC_URI[sha256sum] = "15787bb694f128fcbd437841877a2ee0f6c6fef9e428276a35b8524cf52da342"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 
-- 
2.29.2

