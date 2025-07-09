Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47584C83F15
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:36 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.3027.1752082292677698751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JW74ryeL;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b6a349ccso106311e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082290; x=1752687090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAjilhC+HhC8jZGVkpZ6NgFfXdxPNJ+yhk220h+Jr9s=;
        b=JW74ryeLOiFhG/0Pd0szDamtUvq3WNaZVE1jX7sR5MjaFLGUp311UGQRNygTzk7YT+
         iMpCCDqVcd6/EL/AlgCoAZGefkriKx234l2oZG1uhPt4m4upPa1QTyx8abqFfW5gG4Gg
         Bofz1TJ94BTwhKvPFjtDPN0484Kn/ustMUr1B01E/RiPbdHdVv1hN7WiDko8reea/6mZ
         cUTxX66r5rLUBqs5evUmJ5UJPslYHsSXjptnLjR6bbuYKNhcxYH7R+8WA1nlqNOIbfQe
         bgG7/4/pdaWsPse6sLUkDWCPbQHjda/K6U5kIxqL2aZndWbHz2hroiPtl8qq+4/pWhJI
         AghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082290; x=1752687090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAjilhC+HhC8jZGVkpZ6NgFfXdxPNJ+yhk220h+Jr9s=;
        b=IrBW1VBAvpMjViJ0VQXHk4/cWDe+f237OTvv8W+mA+Ju6Knl41jgNNq3zqO06JHuHx
         ffF0SIwok5tOT5T2kw1Gpr69X/VWPnJeC9nfA2iheCJZZy5bTHLAOvTcx2UrTlPREBGO
         xUnSuI2JROOL4HYvG4/KBW4Bl7hsNp1OvWTRaFNWW1/E5oy31nwAM5mclEnEaPZB/4yk
         bN/q7kVGz1f/8auyyypH47wzK7xnWM1yOUqK4uaoHRmri7fC8LY57wnxdmgfJQAvaICY
         //LtC10miBvbdZ58kgvHtCfi6lS/xIsAk+mqlJM2/pKz7YOQTlelYjTK4Ysgh07u5A6Y
         xmFQ==
X-Gm-Message-State: AOJu0YxnfDEwg3xAbmCOL44CzVZ0WyX/8RaYTfbndmX3iry9EWD2z//S
	PRinSpfkKabDPepxPpPZq793V5m9qUNk0H7x2iVYeKFXG9OrqSIKURBqfoPg8w==
X-Gm-Gg: ASbGncueYR4AqOylbxBKias2U0t+Ack2eSgPj5ab+cDlwD2wi+QzEsE3rbWuwHlOzft
	WXMvZPYum6LYcx93RsHzbOGSVYFGS/EsrF4e2IWIGxZKFeLtq19TKSQ02JMI0FgD3CWJE1kma3n
	VXesWc4Es2uUTXc8iBluOwDGBbHIgFJQX183f7W7njESb3DZuPNQ58DUHPLy+74jQIIalBES/hu
	WumRaH9C8sTNKeaPi6ZHMlY3WPLrgNqF81PfOmI9QhCO3KeNluWuPRpaG2U0S6eVx0zKuir4522
	rIo9OANsVd4GvoUz2dUuCRZccIkaJaEO4XlbTf2UwTAqltyHrUfvqDald3JIAUjrS5BhjWIVuca
	WXFY=
X-Google-Smtp-Source: AGHT+IF5/JMyasVzeGnuEI1ntBRkXWMI0Go5FwRfc5ZI2dEbPpsAkNO95mx2jxD1B5xjhmChLDXouw==
X-Received: by 2002:a05:6512:3d02:b0:554:e7f2:d759 with SMTP id 2adb3069b0e04-55900087a75mr273332e87.28.1752082290175;
        Wed, 09 Jul 2025 10:31:30 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:29 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 17/20] msgpack-cpp: Upgrade 6.1.1 -> 7.0.0 to allow CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:51 +0300
Message-ID: <20250709173054.605430-17-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118371

Changelog:

https://github.com/msgpack/msgpack-c/blob/cpp-7.0.0/CHANGELOG.md

Fix:

| CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../msgpack/{msgpack-cpp_6.1.1.bb => msgpack-cpp_7.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-cpp_6.1.1.bb => msgpack-cpp_7.0.0.bb} (90%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_7.0.0.bb
similarity index 90%
rename from meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-cpp_7.0.0.bb
index 3457964609..5b296a20cd 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_7.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                    "
 
 SRC_URI = "https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/msgpack-cxx-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5fd555742e37bbd58d166199e669f01f743c7b3c6177191dd7b31fb0c37fa191"
+SRC_URI[sha256sum] = "7504b7af7e7b9002ce529d4f941e1b7fb1fb435768780ce7da4abaac79bb156f"
 
 UPSTREAM_CHECK_URI = "https://github.com/msgpack/msgpack-c/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


