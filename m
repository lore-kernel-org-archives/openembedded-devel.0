Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75561CD98C5
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:17 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81023.1781014876883357012
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JVcAYoWn;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-307631dbfedso12119714eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014876; x=1781619676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mpOfc2ckMrkCNcfEej4Yu6rnqI93AiWzcT3rDzxQ4Q=;
        b=JVcAYoWnmD278BJXO+WmqerTnHF9RbVDgzDT0+c3RrwUTTUmDgGcMCMV1Qga0U+1+C
         xBpkk+5AuzUo+6M9Z9RltlD+xPKJKHYypv3TjDnosOpJifDgBB7yrsbrRy7MphubfQmC
         m7PN/uwCqRScI9Q8fx0dLA3NgzJagnn8KMajz+TbixtQR9d8TK0c6y0XMdQihgMTUaa4
         tnpXZuhKH+3TQlw5onbAC31Ql262ORGdi6+f6fqTOEs1ZbS5+cSlkRs3clan2fm3DQ+l
         vvFw1oCZT3D/Meac97qhs8Ne5iH0XDNPDJ5ZD9CDIIXoNas13QXjGVeH/vmEds5VHcc4
         4I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014876; x=1781619676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1mpOfc2ckMrkCNcfEej4Yu6rnqI93AiWzcT3rDzxQ4Q=;
        b=Z+WEhRXLePPY+MDwoOS0knRq9DdO57fi/esWJjaceN3bjlKYaeV4Trn0fXtyb+4CyA
         zxCHowYdZ52ecq3hcNae8OleLUAD+VbV5rOSUpSpHJ3M7/M317YnirVBgoACrIsJTUzi
         49KBSjEEIM76cFyVLLt6jk1glZQ2OIiPcibH1XphJI0yT9t4qBTFUcK7f5OwkI0/bBDD
         obLfFEr2yBHkPUxx7O8aXBjg7GHnRrf0Ugqzu7ypItG5A2j3kEKS+K0W7txuQPdyMKXv
         XeJVYtsEgTrtQ0VuilDrgHWWtYJOdoIsuc5S05bVkCd5A84gWdIcYVfcZhgcghIiJ49z
         daEw==
X-Gm-Message-State: AOJu0YworYeEFXUeP2N71I5HEjvPjJ/4icdMAXxgRDKoLf91ZTqrKyrW
	4d4GhKydmTJaymPyc+0OisiRZLIQbxUmF6s7TroKrfWucvsz7i1pzvMoEI8jCtFi47KwAA==
X-Gm-Gg: Acq92OGD7rhDSXFbBhjXqVEcKcvQNDmY0BdOBxTmmvTYf83j35Q/nckUsDhGxCBmutT
	AQogtgp4PH+LOeUVaflV9qZnQ4+Pd3Ro6OqAU8bprWoghjo+8sMW99QxfZHYyYqhYWjbD6hhGzf
	CV5nLFWdO3nYogln3YzRGZN16LiM9fckdYp1GvgdF+5B9e5GvM2/tGt8MinEPeWBH0spPciVtGg
	rBePKB+727lwjKKe1do7xksGLq8SZSqXzGqdfSxmTWdiICF009NGcwRUotLK9AK7OzgC7ng2Pnt
	wsYuvcQKUIuA8PkTK3h+S4aXSHWb9kW8xX278xJnFlINJgiN4x4ToLmI3sAgeGZUK+WbaKpj5Bf
	nm1338mNQYB1HRE9jBnXjbAbk5GCbJ+NRFv4PMFaG7YFX7f0bLhcL7J4ml4Wyh4HFmuNOpeDMnj
	2fm0m5IK/1nAZwfOvIMofpD0RZcAXtSvxFZCm+MDX7bDwk9ntUjY0kodTX3WkRznZRtUNWfhfPJ
	yjU1xeaAD42k1Ztg+uB8Bfw91EtLfTeERk6Es2qteCQ/oJ/g4MxPi0OlER9LOi3ZR0M56Urgg+M
	T/ZcOnAdyjxgWAM2ZVoNGWevdvfAkhI1mH3Wz8r+DpDqahaOYEM=
X-Received: by 2002:a05:693c:2c11:b0:2ed:e16:6b4d with SMTP id 5a478bee46e88-307d635fc55mr2843889eec.35.1781014876182;
        Tue, 09 Jun 2026 07:21:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/11] font-misc-misc: upgrade 1.1.2 -> 1.1.3
Date: Tue,  9 Jun 2026 07:21:02 -0700
Message-ID: <20260609142105.1439225-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127495

Upstream now ships the release as .tar.xz (no .tar.bz2), so set
SRC_URI_EXT accordingly. The COPYING license checksum is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{font-misc-misc_1.1.2.bb => font-misc-misc_1.1.3.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-font/{font-misc-misc_1.1.2.bb => font-misc-misc_1.1.3.bb} (81%)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.3.bb
similarity index 81%
rename from meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
rename to meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.3.bb
index ed314ab3c0..959a7c9795 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.3.bb
@@ -13,4 +13,5 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"

-SRC_URI[sha256sum] = "b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "79abe361f58bb21ade9f565898e486300ce1cc621d5285bec26e14b6a8618fed"

