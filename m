Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5201BC4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:12:25 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7297.1784265143501881143
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YNeuzRnL;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ef11a0972so2725897b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 22:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784265142; x=1784869942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ia184NO2/QCB/3iQHSJo+rHZrOEbGT+d6jc9CuDj76s=;
        b=YNeuzRnLkbnYvXWjg1TNI24U3+Eg5VM/go8pXAU3jd6pBi7qDl+KKlYyaRjWHDE2r2
         Tc3V5bdD5x6KeusRidCPOG+pFemypgNw7iTnRFeQHh9wlRisteZ5WWRP7GC404BqJywI
         Ti80BTYrKXkGzaE0J1rM6KWaf0nhSOxnvWH0z3Jan/GAE/3Ss+XtOJixVUQh7LybNPGT
         jzeBWpvtRsh5IypPI46gcJ01aLrYpqfEu6XBJUjiEtvonhoA2CqulMaQ0l5LMT0ZCb1o
         /ZU2q86ooSUoy3mdhzu4kIqjZ0wFJXVldKrg6RMhmkptrItnUMFpd5l5k4orkfo9gXUF
         4WRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784265142; x=1784869942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia184NO2/QCB/3iQHSJo+rHZrOEbGT+d6jc9CuDj76s=;
        b=Z+cavH5XdNqSLTUdPKz4+DWK21SFXlByKiCO6tcdnl4NWb09EMOihysS66BCDCb9Ic
         9fyC69C1MP+TTu54w+kPbgBD7M6UpPWnuLdip6vLyGhvBgVtVps6tf5GlTlCdJUbbWMY
         e0BdlfjdjioYS+KPMoSwPnc09k7t2nZ2C4kVbRRh+fgwSsKVUEv+mvGaCdB8YK6AreNl
         RJ6VqDgUVE5A+EA06kh/CgDPnQIpUYRCdtIKCGByDANrSQRRhmxsb03ZgGln2+eHgQHn
         rLXTnaihmIr2Uw6g3JKzDN/BSVO+m69yeD2wRXMVgpqBFjkhrl2PWLYOLljJEFZfO3fV
         DmQA==
X-Gm-Message-State: AOJu0Yx33Hwa7eLMOiRE40wusUvZhbsL9BhM0MYNs7oWzzLV6KdQ8Dib
	jYP1JNOZPhHsRDZD+4IpYT6wFzNbVJOzV5htyzPhJQ31OD/YAdq5C6dKJA2sx9oU
X-Gm-Gg: AfdE7cnpJcOSbrcVlc2t76DWs03sPVGM7KAKzDL0d7wevGnjTawOxYNSO/shTi6beL+
	s+XhLgzJLfKvm7MEUSMDjSp7gscoL1rWB7NQN7cixygzq7w/v8zQSA8XoeyRSEyWvPjTZKJlGIz
	+B2ey6JG3gFr64x+G54ec8/KaudpYYpBV6ZIIOsF+FXfzKNHv5023gFojgVWzFyo8oGHlIxue0f
	vwaR6m+k+0M0SIPSFuXQuOotVzSPO1O9VVt1XBa1WVbpHGPdk3thB973oRCz3oSP2JsYJvgHq44
	QWgg6oTKoVIhDhRK0BbGgVOyFyxzD2GoYJwrLKOcBy4j4eCTToRuQwLM/sWjaP64+u0FN9tproD
	AVSpW3gcfV8/4Q0eJtAFp6oS0kqRfVRnTMd44hxPLGOLucQr+2UmUdI264afKCNj6+l+VoiSqNg
	hohKLLKL3t2MG0922uNkmx8EOhuVD0W5/v8iJANTUEnIEF/WK5kRtXNyRU86l6TWSk/EhUYnau/
	cozApyG5z5beCQoj9WZFV/JEQcqww==
X-Received: by 2002:a05:690c:6b04:b0:81e:6915:b43e with SMTP id 00721157ae682-81ef25e0e4fmr3120087b3.39.1784265142325;
        Thu, 16 Jul 2026 22:12:22 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef42c5b74sm1363417b3.38.2026.07.16.22.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:12:22 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] webkitgtk3: upgrade 2.52.4 -> 2.52.5
Date: Fri, 17 Jul 2026 01:12:03 -0400
Message-ID: <20260717051203.1867875-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 05:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128242

Changelog: https://webkitgtk.org/2026/07/09/webkitgtk2.52.5-released.html

Note that while the changelog suggests that this is just a bugfix release,
there are a lot of CVEs which have been addressed in this release.

 CVE-2024-4367, CVE-2026-39872, CVE-2026-43663, CVE-2026-43676, CVE-2026-43699,
CVE-2026-43701, CVE-2026-43705, CVE-2026-43707, CVE-2026-43712, CVE-2026-43713,
CVE-2026-43715, CVE-2026-43716, CVE-2026-43720, CVE-2026-43721, CVE-2026-43725,
CVE-2026-43726, CVE-2026-43727, CVE-2026-43731, CVE-2026-43732, CVE-2026-43734,
CVE-2026-43740, CVE-2026-43742, CVE-2026-43745

See : https://webkitgtk.org/security/WSA-2026-0004.html for details.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webkitgtk/{webkitgtk3_2.52.4.bb => webkitgtk3_2.52.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.52.4.bb => webkitgtk3_2.52.5.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb
index ce78bee5a4..622141a2a1 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://fix-ftbfs-riscv64.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
-SRC_URI[sha256sum] = "cf4076a1ca2a64788edca8c452d8ebb68d5e2965e588fe46a388a016513edce4"
+SRC_URI[sha256sum] = "8a531a9abd2215936e8a8a914c077b586c0228b31d652f205286a8ec90f3364b"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


