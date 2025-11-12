Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C6BCD37B7
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6303.1762976157174633261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S3RAhg6J;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so757483f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976155; x=1763580955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uscjXrZYUPuv1MuTtGVAy4TDdRG6871MnZgPgGdpMpk=;
        b=S3RAhg6J/rf/ef1idTw7UG/FEyF6MLOLh5zEcX7iGHY0kkocZWaCkycMERPTKkCo1N
         1wKpTdmyJVIR0QIL2A5BkrW7h2S+25TBGo6jmCl+XsQmVrX+ELrUKsFvHRLkwb9PA82/
         BhFv5Gu7+GN8wqiGVosOjLnrD95QzrRpVX9eyJtvPQ7BuXGPyMuta9mk9XrIVPOfsK3r
         0plKI56UD30mXiC/NF+X00ZQCScnN1DE0VmzXuky1shQP9an0MnWsnjmNdMzvzarytFe
         GhvMF3ggxk3Nl7nogyB13IwGWWYCh0ecq+jX4z21o4M6SUAtyruHNsTxHEZ0ZqoXJxyq
         Kl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976155; x=1763580955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uscjXrZYUPuv1MuTtGVAy4TDdRG6871MnZgPgGdpMpk=;
        b=a2m11oXSHsC8U91BSiulw+SxnjxSdVlfRgDDBgdqBPkmwnSOyVAaLg3GC/KnpJUh7o
         WOPXcbrmItnhuWyBWZPaYVRAeMoKdX1hxg+9CB71GBBlEVtCHCcWYKXHpZdAxePxWU/p
         nSLHJx5zX/JyQXz0sPCfjEI5cWXvpyza8/SiY8BRzQ6wo//k10mXnepAEw6Pd/BckvGM
         SJ4G1/LkAXs8xAFja5xgchdUkWCtTRy2XDeWztZYUmc7en2X43URfbiWGUsOPBg33Z3C
         iY2rQ4Fepdnk4WuE7WJoJhjJaDTOv3N3PV095qN5t96FT6Iz0R3ofI7m3j8X3PWJNRr6
         WetQ==
X-Gm-Message-State: AOJu0YxYcH02Z2n+LQ+82IEnZ2IZ+XaTW6uFCje70q4n27SjYkMXD53Y
	4i3ozUyHyK9I+gzmpiFAaroc935L+9i+LgVVCKnGb/mihwJ5LaVCAUYbtoRvVx/Q
X-Gm-Gg: ASbGncuW+7icv/7mAwDhXLbghUSEfpcAHIX2Ubi+DNUToUkLo0uVBUHs8D/oWZ9VzkA
	qXK2185EfjqqDJKppCoc8EzNRn4Ptff3kEbv+/bSC6aPs0ZkaY6SRIGBGkTafJ0MKxrn9s4sKhI
	DWF57+shW6yZNBaIhQxABuwhzenMUNNQxEdAzQyYioYZ3gThSlkF7teOurANjcBCQ6wCfkQzc3A
	iicfxAk3TcuuHUOsaR67lWfKqAlKFyiMR3b0v8AGKkWVzNXeLStdw+KtPXMxDhtJ/mKZwV+ebm/
	Ue8ENwTd1FI4DKiQ50s1/fvVTDRS8i1Ms4BvCZ9gGC+M3IMBZDHWrPEEfySOEryBYXp9DJUN6qg
	MWch86vL5YfLCTrefxRs85RYYiHGdNMEFM30AQA1BdqlAOm6hgNKro9Rp/ZU/cqy9nVp2STkjVN
	2GjjuwqoXEbwnGLbDLCT0=
X-Google-Smtp-Source: AGHT+IFkPHWOZ9+NhiRY4NYypTfoT312VBiVipJJHA3r5JhC0aO0GvpzXdzXoqR/F/1KCt+7/0qQlg==
X-Received: by 2002:a05:6000:4310:b0:429:bfbb:5dae with SMTP id ffacd0b85a97d-42b52814d8dmr617768f8f.17.1762976155497;
        Wed, 12 Nov 2025 11:35:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 17/21] wifi-test-suite: correct SRC_URI
Date: Wed, 12 Nov 2025 20:35:37 +0100
Message-ID: <20251112193542.1589821-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121578

The commit from the recipe got got detached from the master branch - use nobranch to
avoid fetching failure.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fcd57a086d3e2833d2230441c9ce4e03707243da)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
index 490f8324b4..2c05d74aa7 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
@@ -9,7 +9,7 @@ SECTION = "test"
 
 S = "${WORKDIR}/git"
 SRCREV = "2da947374c8324f88a0e2155aeba4cf75464b0d8"
-SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;nobranch=1;protocol=https \
 	file://0001-Use-toolchain-from-environment-variables.patch \
 	file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
 	file://0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch \

