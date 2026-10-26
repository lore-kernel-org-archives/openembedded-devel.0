Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7764.1793057210976387458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JT8LcXS4;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35d0be18c71so500849eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057210; x=1793662010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PINjX3JySLaD2zR5S8lAY+io+l/rmyso5tk1zqJjpc=;
        b=JT8LcXS4lSkRA3wrrvzjw8fHhmYlW3NVe11I7ABjCM4kzm+UwyhUV2FBh9OHEQm014
         OryTaUezpNu9iVSrlgT2DpMUoLu9rLV1O32OMkPNEQ0aIBzdLBX0nDHRBczBH9RHKiEz
         T5/k2tB6mO4PeGq707lQF2HcpCx49qzUFA8KP4WFXsdOdIOVvQdGUIWcogFcnNaLTUMT
         j3JIFbhbJ5eVi3z2FBuRmO39oeOxpx8koTZPmoUy39DOMzzIFG98emqLtqY1nMA6VmRh
         aZwpc/nwMeh4T+eKi0ttlDbnqJ9O0kN4vzErG8aT+3yySG9Dqwv7BhKTwQQxqv3D/4/0
         JzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057210; x=1793662010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PINjX3JySLaD2zR5S8lAY+io+l/rmyso5tk1zqJjpc=;
        b=olt+tV5RvnWl8u0VVXW0PdgaYUdpbaLnIvHvN1mmVq7Uw/awO8sh3PMdzQW8z8TpKc
         xAuXTsrg2R9FCvGJsL0tjwi9jFANXyuAeY6pvn2ER7FcgPQHblhkmPx7PQevi6PQ2oNb
         BKY7Knt3Xk8C/t2A8E1gB6tsgOuwVss+X3WXAmSdkLFyn97wh4El/GYJbG3/Rxtar6h1
         lOLBX+DceKQRSzxhbEQ0kosPZund6VkI2YNBrMAV8X+uc9QEzwZmxHlaBm/iCht2IrNn
         MUsHRlIFa3aTCgAWGoFTBPEJ5jJT7WxYv+Gs5eo2pzRbnfBsDSFOWEVQk0STl4NlmINn
         R+Rg==
X-Gm-Message-State: AFq9FYK/C2g1CBnKIAUzDsMhEs9keUDoktpUFmLmojwmJZaMH068pb6I
	6QVinCNaW4LS/Msj0xMbKHHpoHFmHd/YjRuGPecgp8148ut14GEuriHty5zYag==
X-Gm-Gg: AYBFou3Jg0FUU0zFWMOZlGZ3tC6AgHDaFELcblzedzumnT+kZjJIyDvjATFWubdkImn
	3/cp8esKnWmm/+S7aLuXY98z48iaoob+PkqngVPnpY9hf6Rl+xXiOPhl/uyfTAHFUBa0eUpAf9O
	YLtgGLXmH6cWNDYk2d9nWJrjJhJVB4AG4iAPmSKMNbXT+fPYTroJ6jMhvifBzatPJro1XWOfHx5
	K0JAR7Vye+QYAOpUSaVrs/cT3ixvroDiBGEB7IPNJPAdqZibvjEE+oIVtjqZOWRcHP073oUSyqI
	jtdZt1RsF/Tdt9tYxp3mIM8ovMk+pw75RzG6zmgFs2T+1OlVzsWUdpX4yN/8wmi6lxWaStkgIJc
	UHdmczaAwLp0eXQenjQTgxsJDi6UmrXLXDQiR5as6Gjf7zXwpgVDdRaHHIrisJ+GE5AHkq56km/
	PKGISuZy5K+IXe6MtpUQb80JsvA0woH+6H3fmIXJaYuO7FLVVAMYgEVQN3DnUKBPLkZPzS/HlCG
	mF5jO5QsdjytmETWjToXWvdhn1KidYH+AgP3SbDcSLorHY8w2t0kszbZ7QWFNxLlcqqxGr/EOQM
	wTa9U8BzJwaU
X-Received: by 2002:a05:7023:a8a:b0:14e:37c7:2b20 with SMTP id a92af1059eb24-1a3c5e708c3mr1527840c88.20.1793057209552;
        Mon, 26 Oct 2026 16:26:49 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 9/13] btop: upgrade 1.4.7 -> 1.4.8
Date: Tue, 27 Oct 2026 12:26:21 +1300
Message-ID: <20261026232625.1275411-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131449
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/aristocratos/btop/releases/tag/v1.4.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/btop/{btop_1.4.7.bb => btop_1.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/btop/{btop_1.4.7.bb => btop_1.4.8.bb} (93%)

diff --git a/meta-oe/recipes-support/btop/btop_1.4.7.bb b/meta-oe/recipes-support/btop/btop_1.4.8.bb
similarity index 93%
rename from meta-oe/recipes-support/btop/btop_1.4.7.bb
rename to meta-oe/recipes-support/btop/btop_1.4.8.bb
index 79e9a31e88..513e9cb1b5 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.7.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.8.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 
 SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "6e39144aaf5a6bc01b9f795010b0914431067183"
+SRCREV = "cf1da5900b1e9eaa1c20fd7148dd812b43340b8a"
 
 inherit cmake
 
