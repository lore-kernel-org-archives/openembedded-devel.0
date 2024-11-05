Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746B5D2C120
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.19625.1730817425297492001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MlMovGU3;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3314fc5aacso3199822276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817424; x=1731422224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICCU4bNRCL9DeNqWQqiyIN9lopYNE9riD7h9c2Vhl5A=;
        b=MlMovGU3Otvg5dof3WpSyu3/4XZ1pxLlfOhcF+onEu0sMaSySxVYAGOoMFzpiLjmIc
         AdOPyZF2dirNaa76653SsZvnTFKSwAlvyXeWIZdRZjwuTlAvqZMizUv06G9OIEgg3vcz
         O4Vs41/PckyRFC7nnElC02mUfBhym3rOOUB3wrFlRHB4s28tXNLxki43F6DZOO7oT+1d
         zDx9iqzgNpsYc+s7cAFmYmURo+2jOrizfjGGjamocUTwOHO7cafl5Ms0IgmP81Sp2xae
         Bzu6mL3qvZcaRfI2wxmGi/eWCzaJqiH6VgPdj/e9EdVSRMus+We9tWX9TV8cAYVGVKTS
         DVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817424; x=1731422224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICCU4bNRCL9DeNqWQqiyIN9lopYNE9riD7h9c2Vhl5A=;
        b=BCpdSv/V72bbSRLeNl/UmBrZf3dhJVwof9GqiFkS0ya8qvSkfrd6Rf2cm9owehV7H9
         k4wyNyHAiGl9l0W4FF/7dusNQxm+8Q1LIrN/Zxpr9ArJQfS66xZl1JFxs0YQ1cLYte0p
         Bmlpfbi+xsjW6IXkGy/PK/FEvi/M6pYoGScQLf8qOcQXAOVpV9lzzSTgpVk2M8ZZg08s
         wjdquH5PQpm5SUdf43nUrG6b5btAiW3hpGRqmr2ZW+1kBwKwtB7Bh5XgQStk6Ae/I/XB
         Oqy4LQcGBeUvZvhRDOffj+Tw12Cwnq4MoOaGTfl2/zkrfOUcYPiAWPRvYUDOff3T3ISz
         dWTw==
X-Gm-Message-State: AOJu0YzmL1oVrEPa1X6fCt/1ASWmGJAz3CWZ5fYPkRCnJRB4YzIKp9wN
	fQXs5VFHDtPvm/oeJLvvkBN40LPbFjebKGI+mCP5pTclkb+UvMGNC3Xp+A==
X-Google-Smtp-Source: AGHT+IFhrxdHvZq33XIVIuuotPHZV8AcZwQVWjX5hdT3cbAdeBKS93pgH/6/poqX+hhU58+ZcmKZTw==
X-Received: by 2002:a05:690c:fc7:b0:6ea:95f5:25fb with SMTP id 00721157ae682-6ea95f52fc9mr70917677b3.3.1730817424359;
        Tue, 05 Nov 2024 06:37:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 55/90] gpsd: condition the runtime dependence of pyserial on the pygps
Date: Tue,  5 Nov 2024 09:35:20 -0500
Message-ID: <20241105143638.2301245-56-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113473

From: Jose Quaresma <quaresma.jose@gmail.com>

The python3-pyserial dependency was introduced in [1].
It is provided by the meta-python layer and so make it conditionally.

Fixes:

| NOTE: Resolving any missing task queue dependencies
| ERROR: Nothing RPROVIDES 'python3-pyserial' (but ../meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb RDEPENDS on or otherwise requires it)
| NOTE: Runtime target 'python3-pyserial' is unbuildable, removing...
| Missing or unbuildable dependency chain was: ['python3-pyserial']
| NOTE: Runtime target 'gpsd' is unbuildable, removing...
| Missing or unbuildable dependency chain was: ['gpsd', 'python3-pyserial']

[1] https://git.openembedded.org/meta-openembedded/commit/?id=1266c912afa0abf118eaa5d152a0641c87665fbd

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index f893ac359b..e3b2f8bf69 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -27,6 +27,7 @@ CLEANBROKEN = "1"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} usb"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
 PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
+PACKAGECONFIG[pyserial] = ""
 PACKAGECONFIG[usb] = "usb='true',usb='false',libusb1"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
@@ -147,7 +148,7 @@ FILES:python3-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py ${libdir}
 RDEPENDS:python3-pygps = " \
     python3-core \
     python3-io \
-    python3-pyserial \
+    ${@bb.utils.contains('PACKAGECONFIG', 'pyserial', 'python3-pyserial', '', d)} \
     python3-threading \
     python3-terminal \
     gpsd \
-- 
2.43.0


