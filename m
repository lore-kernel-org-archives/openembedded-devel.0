Return-Path: <paolo.valente@linaro.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id DCBC67EE52
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 11:53:21 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x1so13365736wrr.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6LD5Bji91zXXyI2GDy50qlPS2Vvyf9+V+RZRzFV8olg=;
	b=mYcRWVvyBGAX82lyaoyWlawZSufYBhuCVDBQRhJ8uXaVBp7T4RQTzd7RQolZCVIxrE
	tNl2DAkznjReixFCFooY6NuwnlK7GdMbZqHngffJsKedaReIGF39qjmUoRTEqP21YOz/
	lFAVgorrHqdvxmhPw/btzf3UXnHrT+1uBo8QczFrU3gxVCWBTkXm174b/mHLBO/xDkhT
	VtFMOg1Jv6oCMT7nTOQiIes3zCa07aJ04qKqzjJ9YmrlcKKc6SWCPNxaoP0xPM+IHxpb
	kAtpzTNJI6QiqC04J8+Yt8LOa/qAMAFiIlhDTg1t8YKvX5JACoHdrMHtYLBnTPgAZlbI
	4c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6LD5Bji91zXXyI2GDy50qlPS2Vvyf9+V+RZRzFV8olg=;
	b=eoKXpKfexXtIH7StBBA2Inx3eO/QUefx/zxHV9Jsj2/s+Qmo77y25EH2KT1PpDh0ck
	jNttKbL3pQ6dKVexaK3SY/38TRzb5dhKxKWog5RqRzFL7lW++MYRJQ5oj69dOWdwRY9F
	PAaSezD3+kwPVOHxj+f1HqtN+PHijuruJ7VL00SH0kBAz8ExQgKGWt+tkIuLE9M7+iOW
	gOe3yvqgi642yvFtzeBNWPUYGXu6fX/HVpRU23EzZHYApWflxmUTPsa5n7nhdYUVZ9kV
	mclkdwuwDNxo7YmQSZuqeyB+rHnHszSiXQqEK8/JTA6dILG6LKQBf1lMcv8EKbAnFGBd
	xx8A==
X-Gm-Message-State: APjAAAVVVkssWoRSImCHerFtgn0y8gS8zxpPwyFtWA2OrSR/dKz6+jR0
	FT7aYAKuFa6BLVRoor6iUBn01TvHKuk=
X-Google-Smtp-Source: APXvYqyFL7AMvkexBkqQhWIrI+RI8OKvy8ylIukhPv6bh/uJMYWk5XrJW3Rzrcv6MYPk8QpTRpTv9w==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr20585529wrn.11.1563450802507; 
	Thu, 18 Jul 2019 04:53:22 -0700 (PDT)
Received: from localhost.localdomain (146-241-85-178.dyn.eolo.it.
	[146.241.85.178]) by smtp.gmail.com with ESMTPSA id
	t6sm26764962wmb.29.2019.07.18.04.53.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jul 2019 04:53:22 -0700 (PDT)
From: Paolo Valente <paolo.valente@linaro.org>
To: raj.khem@gmail.com
Date: Thu, 18 Jul 2019 13:53:11 +0200
Message-Id: <20190718115311.36772-1-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: ulf.hansson@linaro.org, openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] s-suite: push SRCREV to version 3.5
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
X-List-Received-Date: Thu, 18 Jul 2019 11:53:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index 741142c50..8c49b4674 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -2,8 +2,8 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
 
-SRCREV = "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
-PV = "3.4"
+SRCREV = "3b9eef2259a70f412ab02fbe6b3a4d313d09c38a"
+PV = "3.5"
 SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


