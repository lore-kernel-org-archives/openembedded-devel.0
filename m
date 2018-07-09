Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C7CF774A25
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 10:49:35 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id z13-v6so20233454wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 03:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6yqOHRjzC+VSwrdd/xvzkH1NMxgmm2nZSlqqWKnQVOM=;
	b=q4lQ8A3E9GTqha8zySOFhnae3bTG5WVmUqBInw5fbCDq6MN3bNlzElQWWOoSeOoxI8
	QSxqxwiBqb4LDpnirkbb+hs768t+9gGQyVDq13GQpi0BO5fCMhcO/YRX5jgqOD1tHoHU
	U2l6mDNYxLnlmKSwbhXSilDi30j+xa2VeoeSM11TTTx8f4c2b7G312HGr3CivamVUW5h
	jfvdf/75xG8Sag3kEnuCXrATfo2MhQLCvHf42+X7Mnkq0PVs+04/IFlOUXXbft1FIGuJ
	jLg4ig8CZhiNm+8VP6O/4xlLjOd+ETf18vyPyYVrejEkv9m4dWzKR4AIX66kKuwR/GEO
	/p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6yqOHRjzC+VSwrdd/xvzkH1NMxgmm2nZSlqqWKnQVOM=;
	b=cS7TZG1fMYWjh/86VDfajAcskWboB8VEVrozPQBNCAq3ch4GJmGy9XQLVAZhsz2LU5
	UY2JJ+OeW7O8tCKgflnzXs9UVusqdFu1cC8mTxIXtRe/PwWJl2TW1QnCVDocQRExRM1G
	8hMzoqS7dAnf1djclM0AhW75OLZB73S0jJzfVhe8wS/WHKawrDwd/B1ZxXjB2XFLBay8
	dAyC1ABgB4Vpdt5vGiRDig9jP5RSVh/dpmt7X8DsfgQBUMo2jF0HfqijpA7ObG0MF+a7
	wnic/2qKpI0xISD81qu3XmrKzkvpDfcQv0oSjQ/hSPJJyPX4EMNHZSEMiCxE6oy1AFqF
	OP7A==
X-Gm-Message-State: APt69E1kV2HJJqyqZg9vtFUgh/X90OeYpOmIH0ER3Xk8mUPRoA2333ew
	nU1sniPzxoyR3BnaDaYU+nkE4Z9k
X-Google-Smtp-Source: AAOMgpcW4EYSZQmgAmgnFjUMAprdrNoxZT+P3HXwzZl17G+PohLtmWAj7/E/JvCBs5FxbJq9uGRnfw==
X-Received: by 2002:a1c:dacb:: with SMTP id
	r194-v6mr6481138wmg.56.1531133376256; 
	Mon, 09 Jul 2018 03:49:36 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i95-v6sm18283527wri.63.2018.07.09.03.49.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jul 2018 03:49:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 11:49:32 +0100
Message-Id: <20180709104933.24607-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH meta-python 1/2] python-protobuf: disable clean
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
X-List-Received-Date: Mon, 09 Jul 2018 10:49:36 -0000

The distutils class does a 'setup.py clean' but this breaks the protobuf build:

| Can't find required file: ../src/google/protobuf/descriptor.proto
| Generating google/protobuf/descriptor_pb2.py...
| ERROR: python3 setup.py build_ext execution failed.

Disable the clean to work around this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-protobuf.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index 6a0568ae62..421775d394 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -25,3 +25,5 @@ RDEPENDS_${PN} += " \
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
+
+CLEANBROKEN = "1"
-- 
2.11.0


