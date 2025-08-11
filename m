Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F9BCA0EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 16:23:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.52569.1754929411483208215
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Aug 2025 09:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L89k632M;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-459e7ea3ebeso17332155e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754929409; x=1755534209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxLoG2Ct+mu0sMY1do+itRt5EqFadEHGW1pdehsV2As=;
        b=L89k632MIHNk46rOWXXprea7swImVjmx0zp/2bi5e2blQX3GcaJyPRvb7z9LLO23yX
         gx1M0+apB+AdsvHBVbn2/DW5sjdrKyMZRG3goxHxmJ4pZFcVKRpTdwa+ECraZnSuJbpT
         TKbqgFcXAEBcJ9ty6wE9eKgNyRcl400ZE9+m/CdmJJzXgosLc3kg4VYX1LwAgeKfNhg8
         8LBFqSArGIaHL2ogZfWrLn3PxOV3MICR/4U1aUaUqb7yrWoj+JGv+Ps1DWXlfg+re6Jv
         lORHullKBPT9Kg/OBB3a1Ws0tFg2bAEB1qKN76bcxZjIZhpp8p94sPzCmk311Xmc+iQZ
         PE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754929409; x=1755534209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxLoG2Ct+mu0sMY1do+itRt5EqFadEHGW1pdehsV2As=;
        b=baA1E7Pfm1MMsx1iKysqcgh2NPPHcNfCN/ItbZMgzlg8XqMAc/NdFvU1hTY1dairJr
         o/iFPAHkCbllIDstECiYy1YzUh4UXXrMY+v3lNmcym2i9Zv0+rNINRXkaHowMCsRA4Fd
         p4U7oY1CEmci74YHq/811KnW4ASAWShcMF9Agi8novT2C8a6KoVedkNnz2v53XtI3d/Y
         GJ21kaUGm0bWZ3UnsqI5g9KqrrPDXihB1rPmDNtEIHoksNemhGuIqTL8k02O/DwGSJ6l
         QFfM2iHAT/sB9L++mj4+TqZaEjpYMig6hkXy2MlHqqn5aGE+mvdDUff1q0Fra5Lkj2tu
         hRNw==
X-Gm-Message-State: AOJu0YyMraysVEImbV3PwsD6vwjL54BQy6YB0H8rni4W9yd5VVrtpDuj
	9XuIorSZ0svA0NEZWCph4Hk0pUWF9VViFcqceGj0NziC4Q4AeO2HDqTZp+dROg==
X-Gm-Gg: ASbGnct90ptePmNvztAV6FMwZER9sD1VDmZZL0tX7b4QXoTyztKU/c5RF7766+DQtI9
	QHGG3xb/3abiEIwqWACX/zWIOrqHRxnAfjxfy6Ux+txRpsng+3CqmdsS3huSAZc1rb3Kz2CUBwb
	LVoL9ESrmk3x/qSlPvc0/EaumVq1Q/969zVjiqRktnHRZq3LbFQxFDhCvweScHfnMQYIohmzI+y
	VkLjxMRlcPgith7G42rHKEoSv8BszX1gX57AZ0wcTpth+GhluDfajtHHCmSY6H067DKrcfPXW/P
	ijBkzQHHJJgn9XXYchoJNGuNW0trZkA11Oq7F2WLmxy1vKXE6jNN+cjL6oSB3ccjLSmSufqwPOh
	Pc7oxlompn0YbERKhY2wFi+xBpU5etXfr5fwFxJTzPID3uGw=
X-Google-Smtp-Source: AGHT+IFBt+Bl6JXPnKkKYUA53Cx4nJPYYJhhYcOPYYOOLsCFpIJSqz8xSKTqfUT00j3EJEulTYHhow==
X-Received: by 2002:a05:600c:4f48:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-45a10ba8306mr3607555e9.13.1754929409254;
        Mon, 11 Aug 2025 09:23:29 -0700 (PDT)
Received: from Unimatrix04-Noble.. ([2a02:b027:11:5644:f634:e4b6:c161:2b33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5885eb8sm265271385e9.29.2025.08.11.09.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:23:28 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] mosquitto: bump to 2.0.22
Date: Mon, 11 Aug 2025 18:23:25 +0200
Message-ID: <20250811162325.201977-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 16:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118910

From: Gianfranco Costamagna <locutusofborg@debian.org>

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../mosquitto/{mosquitto_2.0.21.bb => mosquitto_2.0.22.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.21.bb => mosquitto_2.0.22.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
index dcbcbadd59..ae28093e19 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://3238.patch \
 "
 
-SRC_URI[sha256sum] = "7ad5e84caeb8d2bb6ed0c04614b2a7042def961af82d87f688ba33db857b899d"
+SRC_URI[sha256sum] = "2f752589ef7db40260b633fbdb536e9a04b446a315138d64a7ff3c14e2de6b68"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.43.0


