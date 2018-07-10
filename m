Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E6FF075512
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 20:19:37 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f18-v6so19508180qtp.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 13:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=99TnFHgWXXEqNPAMiO2jk7BE1KIXwkiebgT3ASaxC7U=;
	b=BUgacMCDlxByOdqgjvZT4PKS/ngKJKYMSPuxTKj/Idk1lfjA1fKIsi4XzO7HWQ7i8b
	1j1xq/1rU15I+V9CNfF5c/1kjSt67d+JewqFEfpidWbPd7eDgh984xjWvvT1WS1zCwyf
	S4ebtqqYDsgOY212gA7/Fp0EPQ7cNk22uaiA4bQra0RnQxhLQgimN7mRmOnP0eSDlsxp
	6whR0Due0+4tvzO6IcSBVoiN7ae7qdtNT48E1fpFwnMGI0H4qXkKnny/hi9ltNzkdcCH
	ckPsW3W/amMo7HTGBdaC3GxmrDopUMzKb3PcTQ9VHIl/SICihcpSsLjjFv2v29T4GBTx
	9YCw==
X-Gm-Message-State: AOUpUlGMb9PdKMSVkTpjQXPS21jjn+IPSEYEPTJHPct07O+Yd2gSJeF7
	Ap93qUIvyOH8DIt5goOk12Q2XjFS
X-Google-Smtp-Source: AAOMgpejRnx/iQ5ZafVCBwe8LhL0yi3c9CACB/g3ZcVLaw9o5pqI2mgtvjIBWannHJkxwx8OXNGnzA==
X-Received: by 2002:a0c:88c2:: with SMTP id 2-v6mr13641546qvo.51.1531253977268;
	Tue, 10 Jul 2018 13:19:37 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	c20-v6sm10557307qtq.30.2018.07.10.13.19.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 13:19:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:19:29 -0400
Message-Id: <1531253969-30710-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyroute2: update to version 0.5.2
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
X-List-Received-Date: Tue, 10 Jul 2018 20:19:38 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyroute2.inc               | 4 ++--
 .../python/{python-pyroute2_0.4.21.bb => python-pyroute2_0.5.2.bb}    | 0
 .../python/{python3-pyroute2_0.4.21.bb => python3-pyroute2_0.5.2.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyroute2_0.4.21.bb => python-pyroute2_0.5.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.4.21.bb => python3-pyroute2_0.5.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
index 9ec9866..ed1981e 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "9c251543c4282a2f8b1a8d6aa8afc688"
-SRC_URI[sha256sum] = "7afad28ee0a0f3e7c34adaa9f953d00560ed9910203e93f107833b6e8d151171"
+SRC_URI[md5sum] = "2f6f951e94356ae9d224f417dc6ebed2"
+SRC_URI[sha256sum] = "42bf74495d95a0196a74dd171357f660175aba2bfc23f9b5f63e3830ccbef9ac"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
 
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
rename to meta-python/recipes-devtools/python/python-pyroute2_0.5.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.4.21.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.4.21.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.2.bb
-- 
2.7.4


