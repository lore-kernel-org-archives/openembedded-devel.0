Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id CE47E795D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:42:18 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id s12-v6so5511063wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6yqOHRjzC+VSwrdd/xvzkH1NMxgmm2nZSlqqWKnQVOM=;
	b=IDKliG87GhKx15uyeK8FOTFEkysdzdoTeuUE3mcrHlg4qOgz3lZuyjMwZhiTP0SSht
	UPAaUBd2oJjixrmpc7K2TZ+U2RXEKewMDULcUCnMQRSoYBIiy5upE2+QjnVuVB2fLIyh
	1nX7wD/JcLdCpz1nx579lttNEVuIj5sQT+BpnaU0fJRADHnQHNhhfQms/g0HRzDF9Lyi
	PBzkPO3N+AJqyiBe+pYCBjVVOpbc3xwDWHgQ/LFSp3zzfxFSlOmwRUgDklzljM8rA23x
	K9un9bbOQNKfiB7AhSnasbREFHmCfQaOwXXSW/klUZBVxgP9V3cdtS17hz2Qz0/8CkL+
	7ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6yqOHRjzC+VSwrdd/xvzkH1NMxgmm2nZSlqqWKnQVOM=;
	b=gbhRUAe9oZ8i17wqx8a1cSIyGbqhh4ZDIlRfoiEVLF7EwqQcb1wVZOCJub7NJ93jLE
	DknmZUBpwB04l8/NCCGxisWOVzh5U9sOFP/aguK+MpTps7zJWGnl2wh8YH6E9pbKAvqT
	daz+4pZeEjfNHC+uxMtlsRJlW5QXlTO1pEfiRDCELZ7s+6FSTB47L5ACZYW7WRZTOD/F
	2sr3tDTxMEvZTUZFIkCJns4pDPfxT0C0flNOIntufYg0sC2Px2y/PZs3lVsa5f0EtXqI
	0BcXSDkYJMJaTCMsZ0IliWE/ZSEQYXBLbplirWcug4IX+ulLjqRtiTgRxvsinVLS2sZn
	mjow==
X-Gm-Message-State: APzg51AXZlOTa+np2uA+yqvT8A0hMZXvZCTJuKJSbL1vP4q7dTA8Cpqy
	7iGYes4E36qfEao2WyvbT69gZEneJhI=
X-Google-Smtp-Source: ANB0VdaRbFtC0uQiL87PlAzM5aYBNncPCbQ1eaoCt2hGVUexpa5W2XWoAE5F8VQkGY9IN+kysCUjFw==
X-Received: by 2002:a1c:8ac4:: with SMTP id
	m187-v6mr4977147wmd.80.1535726539207; 
	Fri, 31 Aug 2018 07:42:19 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	139-v6sm7414989wmp.4.2018.08.31.07.42.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 07:42:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 15:42:16 +0100
Message-Id: <20180831144216.5212-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python-protobuf: disable clean
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
X-List-Received-Date: Fri, 31 Aug 2018 14:42:19 -0000

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


