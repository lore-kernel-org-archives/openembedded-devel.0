Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E273877EA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:58:45 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id g21so13427603lfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ufYDgcruFK12Lf5iGmSi1MouUiep5VyAEh2L2Fx7pB8=;
	b=auSlcy4vdX8NhtqJakm7wV7OOrRo6pI0imJdEpkVGbHplmqkQqHsOBh/+d1UX8J0sz
	g3WPxCW2D1tN2J5v2j9Ee1z46juZ/4jNlqU9v27GQCBE/khRH/XDeX3Uw8bXOGdHpTr1
	xKVU5yFLx8KPoGix6z48mg4oExOQ0sd3vOsPsvq3aO0rpZOXd+0U1tPWpxD3PcM5rz8J
	aJg6/ZJfKO6+sn9G5bczWYaV/mXPbasMR/EMaWJHyl7Epuc3xmvDlqAgbfoKAXIkahXJ
	5E866Jxj+53L2FCfpVIeTWR0D0E6w/lAB2VitqH+4Lbf9DTTx/gp/WDFV1X4yy1wQiRd
	6P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ufYDgcruFK12Lf5iGmSi1MouUiep5VyAEh2L2Fx7pB8=;
	b=A9sxiKw+nB+EQbfo/m17mRZuXgtDuJK01eD6X3OI/WCIoC1zJ9xrTT8CCgSWSyZcYG
	5K+7pyNgBzMGjvrX7mZw2TS0YDM+5pgfwYGFjLpIcTq2ufZ/5L9o9K4X7dUXWKF2RAy4
	aT7Yn6SXyWpDLILLMgrSMjPlDu3LbUutWKYkTjUYQnkSX3NsobyfIyYGfXB+nwmVNeM+
	QP9fzvDAazUhyHjoBkaUZVJdnFSJQVRFQTQNn5Ppa0Gi1+ycorWu7/r69IsPPglGA/7v
	VBzMoOUJtoS+EJDdK+OF8IyIecCFhyxjA3tklhP125W5ZXrCxTJllajVROvtD1Ist/Fq
	BsaQ==
X-Gm-Message-State: AIVw111WVER6OA47uvws7INTQSaPHqoBaEBd4To7MbxtBXuzP0ZU9m2D
	4KdhTE+rasipsAZR
X-Received: by 10.28.232.141 with SMTP id f13mr10400056wmi.59.1499763526160;
	Tue, 11 Jul 2017 01:58:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k45sm9532187wrk.45.2017.07.11.01.58.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 01:58:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 10:59:22 +0200
Message-Id: <20170711085922.21020-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH][meta-multimedia] kodi: Fix build on arm
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
X-List-Received-Date: Tue, 11 Jul 2017 08:58:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 0b39116a1..5a9fa9801 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -134,6 +134,7 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 LDFLAGS_append_mips = " -latomic"
 LDFLAGS_append_mipsel = " -latomic"
 LDFLAGS_append_powerpc = " -latomic"
+LDFLAGS_append_arm = " -latomic"
 
 EXTRA_OECONF_append = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
-- 
2.13.2


