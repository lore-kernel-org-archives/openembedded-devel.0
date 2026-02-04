Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92514E9536D
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 09:54:26 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16965.1770198863862626564
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 01:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=etoLirYN;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82418b0178cso717871b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 01:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770198863; x=1770803663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ynRVbw82ShSYoDHocmFkoc8pQLCsDSwNCYtYKI+Ufmg=;
        b=etoLirYNcvejCaP4d3Ut040A80Qmjyk2gXPB5lz/TQpI+bsNFjWdrNbmnBZjgc4xYg
         auyI4CgEmHN5llYEzRAzQk2ZLi4syPYHiUswAr2U3LCAsnV4n960+/e83gyEEpWyTdws
         w8lN0QGzPrFGY9Yh8h82nw71F7vKcfUA0iPrDYScvX+573mDwQ/YIekZ5v7J3Ky0bXrc
         JeEwhROEPR5wuFKIIJnxXKHCxPyDqGWF8YkNrMYR5S+qfYi9uNdtmyIErF90li5Lt9ot
         9+5/YEe7wGVe+7d0mhP+1VfBDFbuVl9cuNhj1un8koX42gVOV6zdw7LTjqf0Yz5F7jQm
         flxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198863; x=1770803663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynRVbw82ShSYoDHocmFkoc8pQLCsDSwNCYtYKI+Ufmg=;
        b=g8NTR77H+SOvP3J+2tVqzpMnuTsbFaYo/Fi1h1ZhByKFv0lfkVXM8m2Q6aAUrUUUy5
         jTw415xApej9qcApzObddZVppCIUhfo8GcUB+OA5JqgDdVluL2Sh9DtwyXnNo1VjoouP
         gCl3uu1+DLp2wW2i35RGfI0xHX5vYg3v2C1c3lPowNwR0s2MMalHd7+3nwtSmJvtmjj4
         VMRblZ4j5rRCNaJhANRGaNEks1KPS1o0BdNHSHw7NXdb6k1qtPTHUdUlTBE7cIrgz5QL
         ZfNLziBu3KiM/cbQFMZYq4I69Dkh6RoLyfDKcev3/8pxqzUFwigNfQQ4BIDvSnhK9pHb
         /GRw==
X-Gm-Message-State: AOJu0Yz3DcFKBdMmgBliKSMZetEwDV+mT5nd9RfXHLx7MZYSwcCVFsA8
	GEZ+3QAVjwWT0sdvW1HJ5PqYAMxYfHTfvHg1sgD/8mUw0ab1UhkX9pNlc0YAUw==
X-Gm-Gg: AZuq6aInVCq8Ghl03aQLZBD8zm8LqYoM1EZIJIcx9self9Sxr9OZm4Od9et+vbVeHzq
	AW4fUF+9HMaEcn5GgYFPYF/XPJWDjem5pxHuyQkB544SGvA5OW19/pQEJM+aPgCoLJsCwv2B6mY
	hJyueb3ncfbBcM8ICLJvehmij3RXRuJ3CfUe0vet8oz4EA4nSSxOdLP6BHGSQDFOPEOwmUpPxIi
	ZgXla/CcS7Za9BSZG88ZVPBXl20BLctwB5fDqXVg+dN1rU+dMV29DWqvQ9QlO2Uh3NRS3BnAqKM
	dtIiI6o9aqwd7chASvlSx+UKCsiPboZsL+jzz9wWyxxd/EYBs6JJC/UgFTYOv9RbW2R34A4nbDD
	qfinCeNVdqL2e0kbRWa9AcT2U3jGNgDMug6Mmf3J0UlEyWr1LMvzWPfueDQpJ2KkJp4q1b7X5tK
	beOV0vVsGRLu3DsZJmdZ9FoXg=
X-Received: by 2002:a05:6a21:6b02:b0:38d:f084:e342 with SMTP id adf61e73a8af0-39372437323mr2388810637.48.1770198862948;
        Wed, 04 Feb 2026 01:54:22 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c85a11672sm1597468a12.36.2026.02.04.01.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:54:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH] libde265: upgrade 1.0.15 -> 1.0.16
Date: Wed,  4 Feb 2026 22:54:14 +1300
Message-ID: <20260204095414.4117607-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 09:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124124

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also included tag in the SRC_URI.

This release fixes some rare decoding errors and some build issues.

Changelog:
https://github.com/strukturag/libde265/compare/v1.0.15...v1.0.16

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/{libde265_1.0.15.bb => libde265_1.0.16.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.15.bb => libde265_1.0.16.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
index 5236ce284a..40910633e8 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
@@ -8,8 +8,8 @@ LICENSE = "LGPL-3.0-only & MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https"
-SRCREV = "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
+SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "7ba65889d3d6d8a0d99b5360b028243ba843be3a"
 
 
 inherit cmake pkgconfig

