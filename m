Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 85C4871ABD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 18:24:15 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id r39so51938427qtr.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 10:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S39YpgVIqyn1w5qjsNIByYbcuNQ+FUQbsc57Afc9aHM=;
	b=ixrCsTf0iD3/ynh44aXtLQZKVROX2UgpQii429kMPYvhwNuvAOLk9LcelRDcMcXA3m
	dJkeBRhZlr9ID6+CsybYtdnqMoeHpaj6q8Bh5U3bcx4FGBTgBsHVon7EwhgTmy2zWSXq
	wJdn4o1CJKoYwALFtsjAePFc9bghu/hJVP5a1IsiGdJ43cABJ8LJycrlUe67Z6D9l65p
	doaCuSYKvkfHAPqDJ342rYbbH5xMz72wurJKkqYC04Yzr+zf377MATx35U0YQVSPLKpN
	M7fAacb2B5ek+4SUN0fq2JemqppMs04HhqY5Y1yPcpIknhbJ1q7qIc8+Y4zn5lwj2Qmj
	gEmQ==
X-Gm-Message-State: AKGB3mJaOXt/7y9/APuYq/8qpeKuhKzyJDms3PkkeYOTaA9G90h/A03L
	4c/+q2hQZXAyUHxsoqCAFMWAc6eG
X-Google-Smtp-Source: ACJfBou2t9OURzRD2aVJCPdQwioaXA2q5Mnme389bnfIJIfDKD58S/3lcKBMd5/iPBuFsNj862/evA==
X-Received: by 10.200.3.8 with SMTP id q8mr44184108qtg.212.1514485456231;
	Thu, 28 Dec 2017 10:24:16 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g47sm22674519qtc.69.2017.12.28.10.24.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Dec 2017 10:24:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Dec 2017 13:24:10 -0500
Message-Id: <1514485450-23196-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-netaddr: update to RDEPENDS to work on minimal python installs
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
X-List-Received-Date: Thu, 28 Dec 2017 18:24:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-netaddr.inc        | 6 ++++++
 meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-netaddr.inc b/meta-python/recipes-devtools/python/python-netaddr.inc
index 26b0f1e..486bfc6 100644
--- a/meta-python/recipes-devtools/python/python-netaddr.inc
+++ b/meta-python/recipes-devtools/python/python-netaddr.inc
@@ -6,3 +6,9 @@ SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
 SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
 
 inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-textutils \
+    ${PYTHON_PN}-xml \
+"
diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
index 30416a4..a64abcc 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
@@ -1,2 +1,7 @@
 require python-netaddr.inc
 inherit setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-selectors \
+"
-- 
2.7.4


