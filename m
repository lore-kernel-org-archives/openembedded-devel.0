Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id C97706C0EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 19:19:07 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id n8so7171743plp.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s5Hkj2dT3YX8kpsrVuidpqq4S6GWf1PDIN0Y5W8TBjU=;
	b=IBBfflHeXVWVyn+BGD2UAN311M5l0Lc+g4AzdxKzt+majywgig/vo/Ui7u7D9/+Ayl
	Kbmm74FYCoXtzo5/8aeLap3VlNqFKW4U9Zjm2eEiidW+syXyDYws8CIEV/jmExrVPOKJ
	IUL5bHPMFJyG2v3RVg1dGqCxKk/wSId3cxMGThu93IBXPCyZ4hdogFUabewssYSeSht0
	RB6csS2Uhwxswrs3GjYNqB91k9caX3YdV2a7u+TsNiTTUTaLnoItvIE8Di2nAkdedi0Q
	hWIHthukXJ6fWdqqLs5VSJaZByxzftgJnUibMw2tx/VlPfBrY5TwAwbHnvBWAzDd0kbT
	U//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s5Hkj2dT3YX8kpsrVuidpqq4S6GWf1PDIN0Y5W8TBjU=;
	b=T2FEJOVANggN9OE+VN2/CxoIfuAeTKaFJCOb3OJ/76gKlJbPq78h9shm75Di/Od8yc
	+jScvvu24BO2gg6d67AMxK5IJRmfIjBs1DsOHRpaEF+PYyDljGQc9RChrRAoRYtFvRg8
	J9OoB8HFMFtGo2HeJZEdU/9G10eSIvlOPjO4ek74/l7Ox0oIrNV0JqZ3cFuNuxhOrm2J
	qW6NO3jjxOo7VMAdbT8/6MN/C0lnBsH+I8mgo5sOaZNmQUZnSIwSAl6r2HqRFfYjp6vB
	iQtfkhSFyR1MlpbCZn00W9pVCkrchb08+joLCOcIrPToF0Ll868eoGQOcmntKSmBm6IO
	CKuA==
X-Gm-Message-State: APjAAAX6FLyPHOsCUTem8sEix3/aoIqbozuHXAnZbaQLgv1z23OPa43v
	g6DZ/XmgGUnpTNZsgUaNE1rbrUCblN8=
X-Google-Smtp-Source: APXvYqzZAGtglvRnMTC01/bSZ2+0SkaZHtdk+nbKVLWiuV9mCZnfzPhhPX9pDsSmXeKALipfr5pBNA==
X-Received: by 2002:a17:902:2808:: with SMTP id
	e8mr352913plb.317.1556651947862; 
	Tue, 30 Apr 2019 12:19:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5848])
	by smtp.gmail.com with ESMTPSA id
	e1sm47631543pfn.187.2019.04.30.12.19.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 12:19:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 12:19:00 -0700
Message-Id: <20190430191900.15061-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cpupower: Inherit bash completion class
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
X-List-Received-Date: Tue, 30 Apr 2019 19:19:08 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: QA Issue: cpupower: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/cpupower

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index 9289738716..5798440e93 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 DEPENDS = "pciutils gettext-native"
 PROVIDES = "virtual/cpupower"
 
-inherit kernelsrc kernel-arch
+inherit kernelsrc kernel-arch bash-completion
 
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
-- 
2.21.0


