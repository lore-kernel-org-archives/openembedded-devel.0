Return-Path: <bkylerussell@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFAA60750
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Feb 2018 21:13:46 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id t4so9252134plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Feb 2018 13:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PG5zWEAZDoqNV//UQ3FOrk2286UCLt7ErEPZipQWr4s=;
	b=fp/GolFDStYIsmcv76Bg5gaHEts4INxCzcVjJKKgKCQRkDndXUQihJVjQvcEna7AzE
	R1A8J+BdfL+9yvM8nw4XEmbQA7KS7XspWaWMppuMgz3P0SS1IldDondF9vP+uvfy2uJa
	KGK41X6itiMHOWK/5nluVkJvNMeyg87C5DeBG3580ChWqvhbju2rMOBtQVDp80iBGEGK
	fWcdJ114LkOr3oApGVzmV+s0U6V9gZVVOMFquwQA4kKqGK1pLAKJikONaoAlwaKT9Q2A
	1SkwPqgi5MM+hpBzy236R6tETuJvfousAsH93JfTIrd7hPh8Kh+/ymBvHWh2aZ2I+npg
	b1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PG5zWEAZDoqNV//UQ3FOrk2286UCLt7ErEPZipQWr4s=;
	b=i4tlwbQ2249L8MN+ObYcNN2j8CC6tRK52ZndZCwpmgKyQ26aEYVCyRJuh2haXZQPdU
	zdt9QJ8emjLi/A7pY3ScJewlJIAX01Elhc43iz99/D4PcNERba5SxFVsELEUi3SCUfVn
	BhTuvzUx7HJBBTauy5VA7JNbSr5Q4O18NRM3hKx+i7IJtzoKTUmlU0EK1nZbFw+GiC12
	ulG6yx28CfcFrHJrrhFm0gpMeGtfkykAsr40VnwiQvpc+fGXe44Z6GcR3PZ5nIZDpX+C
	yPOcBYoDRmoHEfxIUjPeagdMRMcwHadKMLwfTddYhRjFF8zMvMl8rOm9lCdyiEGaExhr
	RIRw==
X-Gm-Message-State: APf1xPCXFsSBWye+nHrTi116TRNy+5IXNlBpWiX7/AKOY7HpW6cLFHTh
	fVIFi4rCXIPaxnwFe4t3WwI4Fw==
X-Google-Smtp-Source: AH8x226YNfzpYcUBLwW04bn6JmBtCMzMwnb2zPZFXrq1tK11M5DQIMuSnXHGuz+xWmZTV0iHBHXwtQ==
X-Received: by 2002:a17:902:57d8:: with SMTP id
	g24-v6mr309206plj.381.1518642827207; 
	Wed, 14 Feb 2018 13:13:47 -0800 (PST)
Received: from brrussell-Latitude-E6530.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	l64sm38372352pfi.46.2018.02.14.13.13.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Feb 2018 13:13:46 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Feb 2018 16:13:33 -0500
Message-Id: <1518642813-23093-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] dhcpcd: update to 6.11.5
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
X-List-Received-Date: Wed, 14 Feb 2018 21:13:46 -0000

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 .../dhcpcd/{dhcpcd_6.11.3.bb => dhcpcd_6.11.5.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_6.11.3.bb => dhcpcd_6.11.5.bb} (84%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.5.bb
similarity index 84%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.5.bb
index cb3b5c2..885c6c0 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.5.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://dhcpcd.c;endline=26;md5=77c40d671aff804ca91ea99556da8
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d4f2f3ed4964197dee7767219c33a9df"
-SRC_URI[sha256sum] = "5abd12c4df2947d608f60a35227f9bf8ae8ab9de06ce975cdab1144d8f229b06"
+SRC_URI[md5sum] = "2465624b62c1154f0e89dc69c42c849b"
+SRC_URI[sha256sum] = "6f9674dc7e27e936cc787175404a6171618675ecfb6903ab9887b1b66a87d69e"
 
 inherit autotools-brokensep
 
-- 
2.7.4


