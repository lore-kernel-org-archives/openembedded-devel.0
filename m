Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0AC6067D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 19:15:39 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v123so11081349qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 12:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=OxxBP0hFnbDlrTcADWyErDTUwjiyzhJLdaVH2odnIGA=;
	b=2B4yAJM+i419cuSMlIms7wAy0oP099VLaZW+YZqE4qLK+e6zA2p7Np7KhdvA9Bl2lK
	3BkuuNVi/leVmdkBMPIcPioKiNHmHDW2HmFftuH2L50zHXrPvTc7lUGwK039Euif9Sat
	cbTzc0GJoGSHxqMcW8WeutvMbTpp1tHx1ZWjf91pFBCMUyG52pZ6BgQIcIfYscnxXJ02
	sjBYzs6GGpWu2nZqHC4YyEfRjFzERGKLCEpQQUAqpL6UlkOXJSYQVJx8bxfpcr1kBNXS
	AM8kUknkRsIlAqqEc2avSTy1KIqNvuV1rItiP4kS8Zn/ptBfqkx8Vcj/594PHL70FXB8
	rsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=OxxBP0hFnbDlrTcADWyErDTUwjiyzhJLdaVH2odnIGA=;
	b=SO1CweDWMRvBXOGRQYSC5TzjEuQO4HShpZOwr7RNIwPLYEzLLPjv5WhRnY4z5tmuYu
	+iFVLxiYAJha2YcOAdb9J1bdGy9erszhYo5KVgikpQ6dO+vfkArviKoGZauNuRhTXNi4
	6J8fc/GF27B3ym5sCBGUNXwlktMMF8yu5rafpBWXMKxywyQF5KZJ+gGQjbnY/EpsbkNK
	QFCV9xTpKhX+k8OrefVZl/JzLOaxE1q/oKCAeumG+3WBjyTDmacnypElNzznuodKc1+T
	AFvE7Cy1+vEsuILmRwjs4GFNd3RBIrtaP4HPU5lWuWfwPWrqQi9BftJrYGXYn5BiJbph
	4nRQ==
X-Gm-Message-State: AEkoousS5SeHzHUVaWz1FzBTs4s/mEq9gbw0QSiO8u5iWYbncVTuxUBvWTuLg5l0w/FEug==
X-Received: by 10.55.162.67 with SMTP id l64mr30856150qke.277.1471979740518;
	Tue, 23 Aug 2016 12:15:40 -0700 (PDT)
Received: from berton.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id l6sm1900844qkd.10.2016.08.23.12.15.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 12:15:39 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Aug 2016 16:15:20 -0300
Message-Id: <1471979720-10313-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH] geis: Add python3-argparse module to RDEPENDS
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
X-List-Received-Date: Tue, 23 Aug 2016 19:15:40 -0000

Python module argparse was removed from python3-misc package, so we
need to add new python3-argparse package to RDEPENDS.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index f71d324..281dc3d 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -29,6 +29,7 @@ EXTRA_OECONF = "--disable-integration-tests"
 
 FILES_${PN}-bin = "${bindir}"
 RDEPENDS_${PN}-bin = " \
+    python3-argparse \
     python3-compression \
     python3-core \
     python3-crypt \
-- 
2.1.4


