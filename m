Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517C5106B519
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20834.1774441279823459936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZApbbsdD;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso23122155e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441278; x=1775046078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJN1yqQfi5asSoTv618Xr7UKiHQoZJS5mbvQm1nByYA=;
        b=ZApbbsdDbEO/9TiPUPzu9tIAiSyUrz5J128zNbZRfhW82z1ehErtlzklQNVRypW13A
         +jh/vtwxNz15cbEetoPrIMOPfT006Pwl5HQPVa9vp1LUAu1VB2J8GkewuudfSWXZkueP
         Cts9CLYkD+ew8cBvtqHe9EKbhmbIAHgACjSY+wYyglJUUVm/VfURojnS2CZdOpiFyJ8y
         Yw1pePa/pPVfDeVAB7CSxJgmPgh9O+ZD58871TwQ01PiOmDolQ8qndzwAlFbHh7O8McF
         /Ndpd6WVJG4RboAYp2z1wif7PacxH5cn01bG5ysSrB67Dg7eU/Acay0JqWmZKRPpc7Dn
         9oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441278; x=1775046078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wJN1yqQfi5asSoTv618Xr7UKiHQoZJS5mbvQm1nByYA=;
        b=BsFHcmnj93x0hHazVB2Z5AqakajBmWaDjRL/J+40LcLaL2hNi1NAsT+GYT5M556JHg
         xEi9FxClnHuzWfVHAQLCJV0lZk6ZbA4hcyoeDMP2o5qGHCzLCBpv1YI35sEC8ixOyBaP
         G82OY8Zj41qecXbdxafZlJ25e/Vo96fm/HCVdSR1d0pscyI0ioEo0TDSQputuLg5MIoF
         vZHri1BkqBy4N8yOQgqZ4yBnsI8Uj/+eXD1VhCNOJBFSbKbpb+A7+40Z4bueGwE/ERbI
         sAgSYK9PHpDTkQKInQOZ/VTncP31g9TFQ8xqqeW5P52JUsamj1bg2YU31KHlRF0pZ/0Z
         SBLw==
X-Gm-Message-State: AOJu0YytMwYYCSblyRPMdbAag3KofX0x+pnnSRKS10BU7sm50EO/Xavp
	4qE/dP0vQhJamlC/rZuxNscrjpxe5UMuQf5l2wcXOSs3E3LltZ27Q/3LZOyYXw==
X-Gm-Gg: ATEYQzxdSV5c31woBrKk+qMw9rDK9z9IBrKGCT1LkB/9lbHRm57DW9PJevmkG80hggE
	iZ0jd9XVmwxpllN4sSDhqwC8EQjb/vPNxO2DJodJ/hmjgFiVhL71EgjM/imDJAcP/GY5RCE4jMX
	MNPmaha0njl6wXTgSASjo+aeDM/QmjRCZe29sOIicvCjhL++J2uaE09XhUhx/yrp90zd/h7yJSW
	RZQwhn6MXSHC0SU2prFu2L6llYaCluAyqJuS/IUV5gtc8G1zIp94JTY9RXeFnbHaNq+2QEeNl7V
	Y8TDvBCAped71RbqTylMzD6NsXEAM/YhDPRMbm/cwixVbqTHC+Sr+3+dXdoxYGF5n++QX2x3iqb
	UjPEMasjL/e9/Uh+jv8Z92XFXiNfXcSKd7mfsOD9HthPJjmWIM/nxTA/x9FzrTG3eSO8MbSDVnI
	KYcUz4X2JE4qS8pg==
X-Received: by 2002:a05:600c:3d90:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-48715fc38f3mr49188575e9.4.1774441277857;
        Wed, 25 Mar 2026 05:21:17 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:16 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 12/15] fontforge: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:38 +0100
Message-ID: <20260325122046.1211090-13-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125619

Use PYTHON_DIR and PYTHON_DIR_NATIVE for the correct build and
target library names, respectively.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index 8d65f69354..d6d70aed9d 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -34,8 +34,8 @@ PACKAGECONFIG = "readline"
 PACKAGECONFIG[readline] = "-DENABLE_READLINE=ON,-DENABLE_READLINE=OFF,readline"
 
 CFLAGS += "-fno-strict-aliasing"
-LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
-BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
+LDFLAGS += "-l${PYTHON_DIR}"
+BUILD_LDFLAGS += "-l${PYTHON_DIR_NATIVE}"
 
 PACKAGES =+ "${PN}-python"
 
-- 
2.53.0


