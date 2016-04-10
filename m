Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F8CE771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a140so16802557wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uDVMsHiJQko8p3qdIrZ7AF9huHwsTnNro/eqTMPITvo=;
	b=H5xHEdYO5qL4AeUsg9cJoGYNTngKJFc8zi1i4a+R3iJ2fm8sGU4Ud4P6azIp+eZz0M
	WUwJAXEHfW1b2DJAvnPATgO3wSleOuUlfOB8Tr49ZX7SA0GbJA947ipWdMho39URK/5B
	FHANkWLfbell//z4MdFcdpzL51XCJIZgj1xbln8/HTwqtdPortDOIIR5QgqGutRR64uc
	3XW1R5mK8BZXiWWdfSpiB93jE7E7tIdJALCe4Tt6pjQlo+VYWfkmf0iFmC2tJArLgtOV
	MwjWTozMB8J2umCrmj9IjuxwXkGEVbi4Olfzd5i6LIh/HvYwBi7Yx8MKnapP3iLbVuw7
	r58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uDVMsHiJQko8p3qdIrZ7AF9huHwsTnNro/eqTMPITvo=;
	b=MZ/5VcJX0SJwALs1/ussPFdL1fJUt3BxrYNsGzULEr7PXJRmSotPVpEQTSOhtG+oDH
	gYR3J1yQ04hWq0MPULXmdZHZyJ3kk2B/Vtni7TEGp1olZMS6igOkTUvP5jbSgaE1Fq/Y
	dEo2d7SquL09dzOQxXcYrk+lvz6fSr2In31jD+4lDQsI+NDK8jJHSYhISH/T7XwtxI13
	ncSW/EriEN/QgJz42j6brMgW/naT8YR7VPoiip5mKnnl8TGVMdWaS8ItrWxyANiQttjK
	3nZFLIGiEzbLun0yx8NKKKKvoeLEnPLsVHKKn28L3GX4j+1oHPpd+RShykEaAntQh3qN
	D7bQ==
X-Gm-Message-State: AD7BkJI1P6RIySor3P51fYfnWg/Qzy9fcMwnZI1pUU6TgHlpeNutLHBUlzRKboZr2pkW1Q==
X-Received: by 10.28.150.207 with SMTP id y198mr13801511wmd.11.1460317327070; 
	Sun, 10 Apr 2016 12:42:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:25 +0200
Message-Id: <1460317290-4787-27-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 26/31] qtwebchannel: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwebchannel_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index eb4475b..7d923d8 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "3fa1c9d2cf5e00e7431d042e7955a6dd75e6e2b1"
+SRCREV = "92d903d92b430222cd3f89eab08d61d947e5abea"
-- 
2.5.5


