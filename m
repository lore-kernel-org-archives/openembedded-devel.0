Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 376CB71E39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:32 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so15683304wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jnyiK9Uvb3f5bHIsPNwe4l8u9rxuv5Evb7+vdiHPbi4=;
	b=vVYphS4RomxvJZ84yHaxcwUXSe8nAmHMqzjXkCBxMwkxCWPcFKLO9OAj0sFsrbBCPF
	O6YwVE5CaYC46q3HbpQeET2qirZ21j1lEtFWc7EQPh+JO2n8Z5uV8E/bxuN/+bIKt9O3
	oE1T4ndj76dk/vmaV6KwqNsEygUzxN9ecVF5o0w1/c3Lq1azFXbgobsVwIdhTPAuThu0
	OUN/mhmmpD0bRdAUTLHtnyQ+Hd27RqwFuc4mqsbEMxMpaFjnfu+/7wZIZAPm+YfOgX1h
	3R6+2uYXO+hUDMqsqvw1HFodiTA4zHDBfXQVABpo9mx2tVsHCrKNaxGDbCc9HX1ByLOc
	5trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jnyiK9Uvb3f5bHIsPNwe4l8u9rxuv5Evb7+vdiHPbi4=;
	b=QZIPTiXjtHteFp7Olu0UCYBlcuMHJAsnFoFUzV1AzinTKGJl6yWXcsaRLGphi8QZQf
	ADWAaZPfiIACDdGuCPx1v9+jbdlqGrOumohWxslj4k5BxwViN9tU2XshWV5RBbdWy3Th
	Krtgu7VfvxAUN4q/5+3lAw0CU2svM04lX6hdFGWET6mF8n5ONwd1z/deesvuPCFfkDGV
	FwRpgIe5f4nsBy0Fe2BqaLtRo0DwhMOBjO2bMHlNwpVaSC+/a055dSCurXLaCJ/ejlg2
	Bb056il2He5/wyICSCqrCtdlGZXgBedBHdukjcAdePXPu165emzQYEXBc7muoJZs6Y0z
	vLug==
X-Gm-Message-State: AMke39mvU7cUWYEPXa6GdjUPOSLH8v86wd3k/GHGIR6HIXhUvdTgQWZzeobfuygi5coSuA==
X-Received: by 10.28.103.3 with SMTP id b3mr18974805wmc.99.1487614052909;
	Mon, 20 Feb 2017 10:07:32 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:33 +0100
Message-Id: <20170220180700.29836-18-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 17/44] ristretto: unblacklist - dependencies are back
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2017 18:07:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
index 1aaf549..7abf186 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
@@ -13,9 +13,3 @@ SRC_URI[md5sum] = "5332876b627b3237eebb76db66e2fb11"
 SRC_URI[sha256sum] = "0b4c90c585166c958d479075b98da6e28ca500bda6f4d3443f20e0a2172030ee"
 
 FILES_${PN} += "${datadir}/appdata"
-
-PNBLACKLIST[ristretto] ?= "Runtime depends on blacklisted tumbler"
-
-PNBLACKLIST[ristretto] ?= "Runtime depends on blacklisted ristretto-dev"
-
-PNBLACKLIST[ristretto] ?= "Runtime depends on blacklisted ristretto"
-- 
2.9.3


