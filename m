Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0295676420
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 14:06:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so5729196wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2+mek3CdeDxt3pPY74x9NJOdL6SoGH835RMM2FwPMBY=;
	b=SO9+B3pqPl3CK8mcdeQTly6BERYcCLUmC1iamz5GINzVhP9Nw6imubxNTW68Iv+R0n
	qTVEbXiHCni+M5mgicx55COTsQ/vtIiNvYzxIFC41Isae5ulJbtMiu37CO9YARDrHsRT
	86Jv+WFg9LckSoEHGQeSWOLNm2nWYhFC1D1J7H0KAbYVFU0kNii7TKk70Cv2ePrsTrCU
	j13wDqHImyScMRQurhVMw6vUEvQ7e6z0zpySe2Bc1ioo2fde504jv9Rx5SWAxUhLhDuZ
	BxVKCUlMcnE4WFLsLBWkKJaHvUKTEF7Fq05T+Cy3ycIiNmczpgLG9X0gpWFStIbLJgok
	R/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2+mek3CdeDxt3pPY74x9NJOdL6SoGH835RMM2FwPMBY=;
	b=XEZY0AE6FgzZfDyCPJISce7sf1dZDg8qacFvbxVGtAd4aAlM/nDwOX6f8UZaMMuTDA
	xNvEfyVLxzuD7AfHhnH35G3kxi+qkPJ+NMcCP+HpbY1JqzYkGySzYyz1mq2PQ6PfLUcs
	QEF7XNa4Xhs3G8fGulzy/319BH7xEdlPUP838GoeV1p5wmH+u7CwbsNeynEtxQoB8mJs
	QaMbCk3psGsJBGs95cAIyGCpL+64NjXcg3vnK5ZLb2YB9Ec8KmZ7ABh3f1ZkMnXqbsaR
	mJ7BGqGYxHNrgQZVdKlJx1f7fLToMUMQv23bWMW4zEnZEYRpTFMZAXdhqhVnX9RWKPxg
	SXxg==
X-Gm-Message-State: AEkoouuXAp+NCx2mieAABHKDYMTFl3+6Kqde0+ZM82T2lPL0DfwVSu0hm9j193m13WjW+A==
X-Received: by 10.194.29.102 with SMTP id j6mr2194170wjh.99.1471529202378;
	Thu, 18 Aug 2016 07:06:42 -0700 (PDT)
Received: from localhost (ip4da29576.direct-adsl.nl. [77.162.149.118])
	by smtp.gmail.com with ESMTPSA id i1sm2447837wjl.9.2016.08.18.07.06.41
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 07:06:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 16:06:38 +0200
Message-Id: <1471529198-24404-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] collectd: make /etc/collectd.conf a CONFFILE
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
X-List-Received-Date: Thu, 18 Aug 2016 14:06:43 -0000

Getting your config nuked everytime you update collectd is annoying, so
properly tag it as CONFFILES.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-extended/collectd/collectd_5.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index 9ec76c8..d7ba5b7 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -77,6 +77,8 @@ do_install_append() {
         ${D}${systemd_unitdir}/system/collectd.service
 }
 
+CONFFILES_${PN} = "${sysconfdir}/collectd.conf"
+
 INITSCRIPT_NAME = "collectd"
 INITSCRIPT_PARAMS = "defaults"
 
-- 
2.0.1


