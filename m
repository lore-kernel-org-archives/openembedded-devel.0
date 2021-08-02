Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.15374.1627874991771484911
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 20:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ro97IPMM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627874990; i=@fujitsu.com;
	bh=WrNqtMTXrZ965B5xFg1i1Nfir5OyhKYefhHIA0Ybtl0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ro97IPMMBm82ZLldTQDcqtZuCR57eB+Gk/oLo7GfaZ1achGlB+ncNZ55xywgnKIF3
	 H51h+/syEzrCnNciG+LHv1kZmnWypXeoN+rmEcDQppQTf7r5mhUppAPEHVGYW3Nc6Y
	 brKBOD5JU20QOx2uVtBtXs1x3/cFRULuqkVC7pL1R1TuYqXYJcB9C/9z5B2d1lV+R1
	 hpvVezqe1cnf/qhBdMIkUmmwjZx+JVTeh8zJxeQgSDQ7hQmaC0y6NpTl+Phh5U1KS/
	 Cf4MrhQR0MNVjkMVUb14AOm4EIwWb2WJY/Wafz00oXkjfswieMNml7D1TQ1eZ3Wlqw
	 8TyDt4vvDXMgw==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 4D/43-07317-DA667016; Mon, 02 Aug 2021 03:29:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYors2jT3
  RYO5bcYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNUSwtLwXGOivVzehgbGD+ydzFycQgJzGKS
  OL71NBOEs5tR4lPzd5YuRk4ONgFdiXOP17KD2CIC+hJLZ+9hBrGFBTwk3iyYwQZiswioSMw7s
  ZQJxOYFiv948hOsXkJAQWLKw/fMEHFBiZMzn4DNZBaQkDj44gVQnAOoRlFi9nR5iPIKideHLz
  FPYOSZhaRjFpKOBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tTXWNDE31Eqt0E/VSS3XLU4t
  LdA31EsuL9Yorc5NzUvTyUks2MQLDKKXg8PUdjLdef9A7xCjJwaQkyhvSxpIoxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYLXN5U9UUiwKDU9tSItMwcY0jBpCQ4eJRGING9xQWJucWY6ROoUo6KUO
  O/JFKCEAEgiozQPrg0WR5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMWgIznycwrgZv+Cm
  gxE9DiqRmsIItLEhFSUg1Mc7+n2vRtv2Op/83uvOev8ogfsVtPhD9pqDl579FG3lnm2nNPsXp
  dWpxe8pX98dKvISp3PZP3vlM92MDLHM/vV8RWuKz/2avEKOZX0rNWCTBaX5vM6eYzgWvJpYM/
  tuQsmsNhFOAalXfu7h6Jq+ySl+I2/7ziNKW0PilD3I5DYl3mEdmLb1eZPe64YhPgHhrtM21h4
  ZtWu9XFYfd7dbfb7ZV2evr7s+vO8lsbDj4X85749LL9AZsZizk5JF0v7/5w153dRuPPTgvlHq
  7fJqlK1zfkOctq7rNudHugdnPnNTXpo5u4z0z9kPWre/t/te/iih+qV4vtk2liNpd8bajltEl
  sVuf8x+pXHvzeqZJQpsRSnJFoqMVcVJwIAAPzqJAeAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-267.messagelabs.com!1627874989!284113!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24527 invoked from network); 2 Aug 2021 03:29:49 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Aug 2021 03:29:49 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1723Tm0x027199
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 04:29:49 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 2 Aug 2021 04:29:47 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-gast: upgrade 0.5.0 -> 0.5.1
Date: Mon, 2 Aug 2021 11:29:41 +0800
Message-ID: <1627874981-94902-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-gast_0.5.0.bb => python3-gast_0.5.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.5.0.bb => python3-gast_0.5.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.5.0.bb b/meta-python/recipes-devtools/python/python3-gast_0.5.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gast_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.5.1.bb
index 9908950dc1..eda18602fb 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.5.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI[sha256sum] = "8109cbe7aa0f7bf7e4348379da05b8137ea1f059f073332c3c1cedd57db8541f"
+SRC_URI[sha256sum] = "b00e63584db482ffe6107b5832042bbe5c5bf856e3c7279b6e93201b3dcfcb46"
 
 inherit pypi setuptools3
 
-- 
2.25.1

