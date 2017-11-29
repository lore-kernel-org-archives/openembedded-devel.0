Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 56E6377FF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 19:00:28 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id a16so5717453qtj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 11:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yiji6vL4+SD+sRqKM3eJIE9LuIJv6Bw7xMa1MpqG+Tk=;
	b=UyzqtCVRwddcmbED3vtZIcymXQutG2cTfHj6xhSxKJleBYOdmnQhYilFeZAwdHk2hs
	dZqXIfXis0YfNDk5WkPy3x9DhAjiliGjCjsU/H3ssaXpckVhY3cM/WnBVySMcRvkpMvC
	HJMpbPUGJ791v8UQDUB6qfe1ZANHBHQvxRLiMsTFrxPcjtWu64fsXWJz2ydnlRpcta6C
	Pb/skhn1L/MpRBmI/xyWRbxkYc/n8PkE8Bw5dQ9wVMXi52oj+2MMEhM69W2yaFkhGhDe
	8EG6GUXey+IDehh59ArKfnq59GVKCEp8I0h6zKS/nz6dLX5Zxxub1mXRKHHppmj3TPsm
	HSZQ==
X-Gm-Message-State: AJaThX6OhR0I1wO/DOyn3YKbcXEQ0NEgD2adgQqRLRFjRP4WzgS70pCD
	9RgPRCCzMbNAEQRYB3ZCah8RiKy9
X-Google-Smtp-Source: AGs4zMaj5zHfM5FBzzgKlDyay57ys7sZW/N9816+K0KwDL8smrR5HQ2okqVy49ZozsH6RC3KgB8Eww==
X-Received: by 10.200.56.72 with SMTP id r8mr6361236qtb.203.1511982030079;
	Wed, 29 Nov 2017 11:00:30 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w61sm1655132qte.55.2017.11.29.11.00.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 11:00:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 14:00:24 -0500
Message-Id: <1511982024-9542-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-itsdangerous: fix RDEPENDS to work on minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 19:00:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-itsdangerous.inc      | 5 +++++
 meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb  | 4 ++++
 meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-itsdangerous.inc b/meta-python/recipes-devtools/python/python-itsdangerous.inc
index 73951fa..84f9e77 100644
--- a/meta-python/recipes-devtools/python/python-itsdangerous.inc
+++ b/meta-python/recipes-devtools/python/python-itsdangerous.inc
@@ -7,3 +7,8 @@ SRC_URI[md5sum] = "a3d55aa79369aef5345c036a8a26307f"
 SRC_URI[sha256sum] = "cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519"
 
 CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-simplejson \
+    ${PYTHON_PN}-netclient \
+"
diff --git a/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb b/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
index 0e156be..8c99cb4 100644
--- a/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
+++ b/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools
 require python-itsdangerous.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-zlib \
+"
diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
index cd30825..a71c20f 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools3
 require python-itsdangerous.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-compression \
+"
-- 
2.7.4


