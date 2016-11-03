Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7279F71ABD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 08:20:43 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n85so4135791pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 01:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ru/EkTiYR0+4vqxyVi7HEgUfOD/bXMOybnRwfFjkq1Q=;
	b=StBbG7M58AMxdAvQ+LcKa14jSUWKRZuro3FZM2AUQ7DR20LSRgUbrbAu/gqiw/Nrpy
	WeJ+6+a4drPKYDNyKFVg5leO9uPb1gbz+uFienyKfhCmjvdIToTxCAdFMMvEzuoApeeC
	bp7tbAxR4sJCwtyIRosW+wKp2Br/zwGpFdgvx2cLpHbmG90KU4kUmQorwgQ076yWk3g6
	9Sv0nBpLObVcesAKkxrzSxxVmn7K43cOiwi7eE1Ev9/9jfNmKfRU1sR2gCOsYLcNy5nK
	kpfWCsdfnfl79CTiMoLHlKudev3pJSrFvEqRHH6ipk6pu+hIOjoDu0IWcsKUrV/Buuul
	B7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ru/EkTiYR0+4vqxyVi7HEgUfOD/bXMOybnRwfFjkq1Q=;
	b=Bjx1spL4ILLKUhThNZOZ9jp6IvTaDpe3jUp8YuLumJa410wVAe8Z0DO6jwS4qFwENt
	USI2GBDe4q0ie51gGVV74TxZgxqiueTGxW4oT6XTaZleaN5Cjnk+tdNBf7mvTu7qP7/p
	bXadzj2ovrhS8y1AgSpJr58r16v8NwFc2Uy10JtTR0mTbV0sYBo/2rVntsj5BLSuzgoC
	CamqG5VPXuf4G1543KSngb0CGzGRfwTRJL6hvvWjrjAjcSzQAG08X/BSu/0vaFoAhpwL
	uypxhCE9V2FMAIEy1nDCz6mBJZ6qLI+VlL0s+7Hvv/0yL0meS5+6jPjtEfjwgvsaq+kr
	am8A==
X-Gm-Message-State: ABUngvdwL5XA3i08KUipgvHKPnMAsxWthHKvyq+g2vHlDIzz7jwWJ3nU9Qc+lBAkSkTUiQ==
X-Received: by 10.99.149.6 with SMTP id p6mr12206204pgd.21.1478161245551;
	Thu, 03 Nov 2016 01:20:45 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y2sm10386225pfk.54.2016.11.03.01.20.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 01:20:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 01:20:32 -0700
Message-Id: <20161103082038.6331-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH 1/7] meta_oe_security_flags: Disable PIE for s3c64xx-gpio/s3c24xx-gpio/cpufrequtils
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
X-List-Received-Date: Thu, 03 Nov 2016 08:20:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index b0d30a3..93f35e2 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -6,3 +6,6 @@ SECURITY_CFLAGS_pn-rrdtool = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-llvm3.3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mozjs = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-openldap = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-s3c64xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-s3c24xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-cpufrequtils = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.10.2


