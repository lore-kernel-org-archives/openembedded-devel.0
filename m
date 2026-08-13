Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F21EC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:08:57 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28076.1786651728627243331
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mSoPATXn;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedf433a99so228787a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651728; x=1787256528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAdFC0cAExMmtN3Ve/EH94/ubAmukKsEWO8VJWry/vk=;
        b=mSoPATXnowhExUXDqL1M7F6Bb8pEVAKtyGUMIbiwNDDe8h+dkefYPvAfuuDIRX1A2c
         amLHdzYZwkeB/SxQ3/Ajjmsa5AT3+e5RGYh6mOCVMNmN6CW/Z7zFxEiTdlV8TDTVIbUk
         Inl7p7W2P82LrtbH8U8VMTGVteYZgF/+U0GQjmnnyDk9b4Zxcjh49lDbk4Sl7fKn7QuM
         +5E//C2riQHwmo0q8TlxRVw3Lg1kio7x/KyT1eZfX908r19IKFW8hEaC1/rzuFbYuOIO
         sh8+4OxuyqIDxXYL+8hPvuUOvwIDQWTQ7qhNHwsWbgUghukJb3KBpBHxQ1I7QLPFjOQ3
         36Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651728; x=1787256528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAdFC0cAExMmtN3Ve/EH94/ubAmukKsEWO8VJWry/vk=;
        b=srnMj/8stjrFgQA/DZqH59KBbwnldqEUvJHvFQj55Ik9CP3ZoINwWJ5C2sB9Rt0+ds
         YPNMTtDvtGQOHT+7mp5hhgWsbkZ08AzXu5txpipWXH5D+/lnbpsqu9JICmcBM6xrE0kV
         iKh/ME95JDsM/JSpvhSLJQ56sTBdNwCa58cz1YsUjzjuKHvO8IRdtE0ru0k5b4J/QEkq
         yYPzZOxDDwxcRuYzRQnCbWAo4NWJBkp1Hg0T2usVeergwRkOl72l6cbGflelQbGQNHul
         fPl6sLjc6T2CZd2d7OLi9P54VbeGRZdgRToEq57bvunJpSCYYC9ZFGMuXO6zn2F+Kq0y
         iDWA==
X-Gm-Message-State: AOJu0YyJxkRBwlSh7ZfiDz0JckK3Eqy92tYvPIcYCry7jfAl9XRhRxQP
	RWtZhAZnICyUzsMERztbWG7PqvL+fPrZjrEp1ka/FQKOzbVd2cKG84ZJMHdEn1R1
X-Gm-Gg: AR+sD12r2frR4/v2AqjEgYan5ZWNIM/vICfUF/SjG9FAR/H7F5icE3zLIsbcAU1gHtp
	AYhImemB+0dA2ytOBRaNqfNgOyC6cCEmYPStnWG0QLqRaW2ecWx2/0j7srXqTZl8QzG7iBPWZ5H
	ioGDMXvNBBdY93dlAHKJG63vuhH64zcXMr9wJ9dslCzjTiuFXuM7hQjJjqcr/8NCI0p32d5RfrG
	dfY6gt99ricxVy0X2E9qjYxvyaDFt9/zNvYIq44C8hwQX1M8sUyNJc5473MnX9AgQejrWMcPWpX
	C2yRH2ZWeebkyFGXhGBZRcSyiszLjOsjS7dIehDQ2jA0ZTNQxRbrEGZVIJ8V2guaVxNJoVwuoGH
	i4qpH24FMfGe9+ImzxrtFAFUVhYEdC2sYr7JYYp0dPU22DfKhSDIdRXsKsXj16526r/wc+XCJtE
	KYX/dVrqaSBr2sHRXRIBMBpA6r9nZw4bm5OFmF/cThVnONao1CW+qhQy7HdxWO+OtVHjKO3dxU4
	jt5vVRWMVMlCjF7YgPLvPuKWyZekboDmKN3WVQN3puz/M0Fg6gDEBbQRJCEZnMWZ5DMt6URgRb6
	kf7/1cu/KPDNTwfQSwEQxaH5sNfMO0yHWr8Mo81MGgYv1Y3sYvVLDq/m7JlDlchhMJW+xdb+7S4
	JG2hmcoUjLPJitvY+962hXKyM9U8z5r0FvsLKwrhibPe2lA==
X-Received: by 2002:a05:6a20:a10c:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3cc719d29fcmr380772637.4.1786651727830;
        Thu, 13 Aug 2026 13:08:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 05/80] python3-hpack: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:19 -0700
Message-ID: <20260813200834.1302829-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128949

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/python-hpack/python3-hpack_4.2.0.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.2.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.2.0.bb
index 1688f9a877..0e189fa0d3 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.2.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.2.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "0895cfa3b5531fc65fe439c05eb65144f123bf7a394fcaa56aa423548d
 
 inherit ptest-python-pytest pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "python3-logging"
 RDEPENDS:${PN}-ptest += "python3-hypothesis"
 

