Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.13458.1596178997309916478
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 00:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bC3H535p;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id mt12so6518302pjb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 00:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=diGtqGsuMEcd39Duw4bexRrhArZYD7xn/gWgJPxu6xg=;
        b=bC3H535ppiMNeSCqO/P+RhFap2ZHsNWo7B0Y5r8nKgyU4fdceL9HzUUxtk2JKRKvw9
         JQFOn8zczmVaXUOLkTDFg1RQvmUtA53UAeu4BPclV+veNucgnuU70I+ynSC2b2iMviWT
         koRnZ0PKWzRiX5TkvfkR2U1IsQC/P7LHqxPClGXqs0Nh78Ivftcan6CHEy74Yog2gvjN
         YgfAdmaxSXnzqpu+tD1ri9RAocvZyFOvdG2x5HsJGkoO6nOQStD6tp+9PKGj9pWz/2O8
         g1zP7aJ33f99k0nlUEBzZ7rxMqsjv0IMaN1O5pLwImVo4CuLF4FMvGjlmGNPCFNLmOLt
         hUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=diGtqGsuMEcd39Duw4bexRrhArZYD7xn/gWgJPxu6xg=;
        b=RrPwDSWZTk7ifxYqGpKmzctZKGclWTFZEuPnI5EHLPDY+7U0irukO1pDe+Ksd0queA
         R3p+x3Y5hIfPFZoBKEpP7RdFpIwVC6Y+5OWxYRt9yFnAljaobVUKYshy+hqk1HfVd1V8
         2V4TA5uTDmJMWlzoeHw/mTeEoEI5HHKJlsBapSKYBVWOILNjVsJLVl/9CK6sC7Tj1ba6
         ynwyCEwN153W9cKBlrZNfm9hNvMCJ1cAwMdfRXvqLfcyzBwMSqiSfZ157RP/Lql3X3ge
         kjicXxMEMgFhuQKHzQs4ILmDghBoblyRlBGeYcV9SgfExdHG0qcVqZ2bOxJ4/rD0B27F
         c/AA==
X-Gm-Message-State: AOAM5312/hCMJOqjLtbPn8MljtPsy1Qhsp0elRk56hbkNJoKriECJEVF
	PCTlMCQlSlkE15SIc84poSZdrl23sBw=
X-Google-Smtp-Source: ABdhPJz3fjFUUgoFcpsrdt+CY8kxd7hdp3YAl39J3ylQnegCaJSoX5OqzMCpGeiWBDW6UAQvatckMw==
X-Received: by 2002:a17:902:8349:: with SMTP id z9mr2616182pln.46.1596178996531;
        Fri, 31 Jul 2020 00:03:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id d65sm8414561pfc.97.2020.07.31.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 00:03:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] gerbera: Upgrade to 1.6.0
Date: Fri, 31 Jul 2020 00:03:13 -0700
Message-Id: <20200731070313.2929565-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200731070313.2929565-1-raj.khem@gmail.com>
References: <20200731070313.2929565-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add needed dependencies this version demands

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gerbera/{gerbera_git.bb => gerbera_1.6.0.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_git.bb => gerbera_1.6.0.bb} (83%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb
similarity index 83%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb
index c96e4c52e9..ff82658173 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https \
 "
 
-PV = "1.3.2"
-SRCREV = "42b035ea9098c02af503d6391a0ed56d973aaf23"
+SRCREV = "b219e22f09e346dd048f614a01ca2cbc55edd940"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "expat zlib curl libupnp e2fsprogs sqlite3 libnsl2"
+DEPENDS = "expat fmt spdlog pugixml libebml libmatroska zlib curl libupnp e2fsprogs sqlite3 libnsl2"
 
 SYSTEMD_SERVICE_${PN} = "gerbera.service"
 
-- 
2.28.0

