Return-Path: <paolo.valente@linaro.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1426C0C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 16:04:56 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id a184so4162614wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GR2R1WV73/HMimpcXGCAhScVv5aHg2dbJv65qBF5D8c=;
	b=gx+shdXm43q2wk+fcT44JTsOW0XGItWYze0QWg3XZv5ZCNDYT6FCrqmPioI5Szbfng
	Bi5d63JuJQzEXzIcOwtvInasB56VomrKK6mH3WPpgKrHX89HIQjkgxHSa9LcDZ6h7zYs
	i26BY1mLyuKTHU6IyjnsuKY64Px/BEuKJ7cf1dQ5Yz1ocLUk9VwZAYaOB1Db33n73Svx
	RthK9OdPV770RYIfhxV27yOWWemofqfyaCBQEtzeKvtUKRCYMzgviVt7fDr5EYcC9+j6
	SHBSGNTskBbmBH8s8Y+xj/YQvsRnVG28QVKoQj/tg8ptqHFvY+5248gsaIu39FbMtjkC
	d2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GR2R1WV73/HMimpcXGCAhScVv5aHg2dbJv65qBF5D8c=;
	b=BY++309aSDqRCLGY6ZTFCU7iUk1RCpvaUwK/B1bQECcvUGeXGQob7V2YwdrNgmI5T8
	J96/5J6y4dcRSzaekCzqo2iMO4Zt1O8kJpD/Num3YJzp4QGodoj7nvfmxRmjAQVQkR8R
	SgmzccrB9N4T0gBApJgSAOLA/yRYxuImiNGTSLDo/1+PdPSGsYXw8PwXPajJnZG2uumc
	wKYpdbgo2Zds9IoMJkhAQCvohjWhxj6g8zXdUgkz2R++ZfVrcHpnQwJ/cN+ao62IdqjD
	5HvrZPi5oJIYJy4/XXJ2Txse2y6mDVNEmVUTQ8mDNpDlAWzq4SmC6lAq0xyuu/VCCM5H
	BnpQ==
X-Gm-Message-State: APjAAAWX3TNBCKO+BMGJjSSe5sgcfqsui+EtCBRpzBhfJ6gZmx5BQ9Tk
	x7okT8AAwPPB57kKzKDHi+0YAISa648=
X-Google-Smtp-Source: APXvYqxTaYTfJDQSr1gRrChEtV1wIykWxzLrxYnb1HusiOkpEedykXTfeFPTJv789ILyy0klVCdyJg==
X-Received: by 2002:a7b:cc19:: with SMTP id f25mr526446wmh.8.1553789096511;
	Thu, 28 Mar 2019 09:04:56 -0700 (PDT)
Received: from wifi-122_dhcprange-4.wifi.unimo.it
	(wifi-122_dhcprange-4.wifi.unimo.it. [155.185.122.4])
	by smtp.gmail.com with ESMTPSA id
	t69sm5162335wmt.16.2019.03.28.09.04.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 09:04:55 -0700 (PDT)
From: Paolo Valente <paolo.valente@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Mar 2019 17:04:50 +0100
Message-Id: <20190328160450.92438-1-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] s-suite: push SRCREV to version 3.1
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
X-List-Received-Date: Thu, 28 Mar 2019 16:04:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index 8bd0afc49..47d21d36c 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
 
-SRCREV = "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
+SRCREV = "d05006865f68829fa7603bdb92bd51649f5ba1b6"
 PV = "0.0+git${SRCPV}"
 SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
 
-- 
2.20.1


