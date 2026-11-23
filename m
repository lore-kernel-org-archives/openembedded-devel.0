Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48027.1795411842868379214
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TuT2YIyE;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6385433eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411842; x=1796016642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Px6N9Dyv+Ww5TvtE+1DdQpbp87Qv6t3k/5eSjtG23xQ=;
        b=TuT2YIyEDjXmdnS+V4cm2sW1fWNAeu4bsNw/dKnhByZtAceb6+e2mcjTAEQK2wGsWC
         c/LEBDHSizsEqiJ2NQ4r7avkewSV4oStM45eSlJ9n2Dx422LPDtdPW+ZkhM9rWcvoUzU
         KFoffEY3L3Rse/0LUb8cgYGtReX4dgybjB+dNKqDZpLwPLZDqyKAuIgsjuC5cjGvPfeZ
         nqLvIXiO4sVg+kglY/25CDcB2KuuBqXoLKKjtpRXVtdZtV9/78Xrb2MT7Gg6M6iQ3WRp
         4MB/TfOlKP+8yRJ9i0m/X3zU4472crqdEpL4l+vke9gH48/ikbWdahPy/VFce5JNyLbR
         BfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411842; x=1796016642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Px6N9Dyv+Ww5TvtE+1DdQpbp87Qv6t3k/5eSjtG23xQ=;
        b=1hbKpk2aJwBrPRDn/iechTMI3tn4VQIcBlXxEHa0BEFQ8csZj46ohrXxCITexu9DRN
         sDy/QMlAdo68f/zRwKczzi9Ctl+SdQyxd1vrNl/9Ws7tIgL82opGK3Qv7TIa9zSKMabb
         fRuD63yEod5C3ihuXEKSIqEFxj7E5MF3W7GcOpyDrACeoRIfuMoL/7laUVe8pLcANX3Q
         H7UPcUsX7ld9wLydhk15kWFTWiZ7hjVrLuLTm86ddUnhLUxdV6oz7/A7IqV3s4Bc26eR
         ZlRBkWMwTn8AIcMpebh/oANl4sQnM6EVUSMPsA3ZyMELk+J7OQiaBvrV9ddkvSFlS8O8
         3cxw==
X-Gm-Message-State: APuU4Z/sRPTIlQM+FSA/4EZ0/hMTtbfM4kXY/fWkeSCgNplgRyLHMSKg
	yb5Z3q9JycSOSFlr1ScdBcibul1VBmLBy75itPsFXEsh0Er2Lubvkk5y8cHdGUcBuiE=
X-Gm-Gg: AZFdTZeA3BQy74yU9ZoUjRCq8WqHi9hi6xQP2Sjue72FXtoSAK5StjzX4M8M0PDw2Ey
	u5u0CiRmHYBVKNPSfGsJ7+OZvlh2DvCt25Q61kLAUVSzjeCGSwG5QfZVlnV5CZGFitq6+jmn/UE
	CwcqGU9DG54C8QJqao632sASkQfzUezOTgaGAQUWtjYMgwsUl3ii2XdgUWPvHV/Y/VUdii9EvsU
	mzGqEK8B5xZsxvw+kMEJhGL/8M7oJn8bhqI+37EBnKk3AlwX+srDzwz9+4NaCF5qo4hXCZc+/HL
	YnTColCCQrcMqsx/hIkymKfwZpRdbPX0V9jCVdLGCWw07yl5hcxq5UA9F5Ahf1od9fbJ0MQxxzP
	cXGBSRO5bcHMkskNu4b7/MsWZE761MS+Pg+L9TQ3uZDONIaExmAHp3kTD9cFKLu4QTP07zhwvJa
	gmo76eE7+JxkDHBnHW92HMuyC+GUKiUyWd93ZA8LF6/0H3DBNiE66veAsj7Tej++J/3kKOsJEJQ
	vr67d1lU1DtrBxdYuVE5u8Ojo9QVFG1cNbUMYtL78fcGLc0obLMtTijhklKSevpVszvge5L7Lq2
	wROb8+C4ONzLm9Thd79VL9vfhoCDgtTm0RcI2IaThCITmd54XQBWFYwoH5TC1x97z5pLscsOV+z
	0nSFpDfGfQuuEgBgUXji5JQT/YsV/16pZS2PkIy1kGBHvS0zSmifm4RGBeZ0iLsqGzxt3eZjoru
	5dlqytCZl9PANrNLJQ6UvloI8Dt99+WS22PiStE+fv1FbadStjCLerjbJkecdHHynoORcaGO+k4
	5YwcZ7YULqW6HL8pzxv9/9pUm/tCn3Jhm6mCC9WTfHab6E/LAqZfC3EbvPJWWpnU8FqfCLpLwaU
	gBZp
X-Received: by 2002:a05:7300:f0c1:b0:386:9b72:274 with SMTP id 5a478bee46e88-3869b7211e9mr7852901eec.39.1795411842235;
        Sun, 22 Nov 2026 21:30:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/42] drm-framebuffer: upgrade 1.0.0 -> 1.1.0
Date: Sun, 22 Nov 2026 21:28:53 -0800
Message-ID: <20261123052953.3658549-37-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132824
Content-Type: text/plain; charset="utf-8"

The -l option now also lists the device's planes with their type
(Primary, Overlay or Cursor); the universal planes client capability is
set so primary and cursor planes are reported too.

v1.1.0 is tagged on main, not on the old release branch, so fetch from
main.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{drm-framebuffer_1.0.0.bb => drm-framebuffer_1.1.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/drm-framebuffer/{drm-framebuffer_1.0.0.bb => drm-framebuffer_1.1.0.bb} (78%)

diff --git a/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0.bb b/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.1.0.bb
similarity index 78%
rename from meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0.bb
rename to meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.1.0.bb
index 8ea216e02b..1ca227d0e3 100644
--- a/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0.bb
+++ b/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.1.0.bb
@@ -5,9 +5,9 @@ SECTION = "graphics"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7702f203b58979ebbc31bfaeb44f219c"
 
-SRC_URI = "git://github.com/embear-engineering/drm-framebuffer;protocol=https;branch=copilot/create-release-v1-0-0"
+SRC_URI = "git://github.com/embear-engineering/drm-framebuffer;protocol=https;branch=main"
 
-SRCREV = "09df30960552f23d0fa7471be0caf7f095fcd522"
+SRCREV = "343b33e3ca20345fb28e2e68930271b61c490ab2"
 
 inherit cmake pkgconfig
 
