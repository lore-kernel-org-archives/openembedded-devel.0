Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id A63D27C056
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:31:37 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id i12so8560168pfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yqiEXX6sJdVdjq4+iVnt8h9VSyS9zOsVqFP8/iKfR8Q=;
	b=bDbo29SPQPL85cTfNPOZk6l+q9aOT3yXcfl40yqZiRJ6spGfNAxgH/5ztbWL9EYGpk
	H8ikdkskKeGwBRhlOILVfghb013dZvLDUcIyWKwWTfHnfp+AliVOC7qAMeggUTw8wNYu
	mt8p4A61rJeGla4QUxLC/K0AFeoai2AsibFCZhOwGTdDG/1b1qy2QnFjXMi2Pd4dsR/K
	vBEhG1N2h6aOLcwaCqfn7zmKwU+gElmBFhDSI4EWTpYxLjiqFa1CgrjkEkyy0lts1RmZ
	8kqsgXRKmF7folkt9gTVPx3bpi0sor2ntqbuDDZVEoNVfoIWrRrAcBH+Gc45Ccsg7LP8
	XGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yqiEXX6sJdVdjq4+iVnt8h9VSyS9zOsVqFP8/iKfR8Q=;
	b=qzt+TL8tlkV3Q1YIFb6HON4HLoTLNnQYWN+iT0T9yzrnqd6t7mHDivxh+Ly0avyOzV
	RYLLBmw0ViG18JaKjBiy+2mUOiQXrfR1ikJYFmDmaNSLq05KS5fwJMcLFGwPGxJoMCgi
	HqM8mUj6/La+9VI+yipknIiRYgu6yRan94w5Mt7iPZmO7WXtESC5bJnC0DHeZz2W1Eg0
	1wGeXpXZz2zUcL+m7eY310VN/UGCqkbSUJzp61bOmSKapzzR20VTsu1/PYGNvqCBr92C
	flrGf8YZjcjMTRWjtghM6XAU1uigFJOvoHQRFR5FNbtipYHOz1+4g/4D/ttLFHvIMmuu
	hpmA==
X-Gm-Message-State: AJcUukfoYgd8Ew+1vHaFdnh8ypsbl41gfiaVpdoMEAQlozPZsTUDIQRL
	4NVg9TmMn3PP6IBiDS1cgMY=
X-Google-Smtp-Source: ALg8bN6yNWbEsdTUSFXqxz/XuIC8EL2CJ0EfNE3Im2K7FQi/Mpo2H+r3+CPxN8k4ilazoNHVboArzQ==
X-Received: by 2002:a63:cc4e:: with SMTP id q14mr17684859pgi.291.1547328698691;
	Sat, 12 Jan 2019 13:31:38 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	4sm134935166pfq.10.2019.01.12.13.31.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:31:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:31:29 -0800
Message-Id: <20190112213132.2501-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190112213132.2501-1-akuster808@gmail.com>
References: <20190112213132.2501-1-akuster808@gmail.com>
Subject: [PATCH 6/9] meta-webserver: add pkg group and image
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
X-List-Received-Date: Sat, 12 Jan 2019 21:31:37 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../images/meta-webserver-image-base.bb       |  7 ++++
 .../images/meta-webserver-image.bb            |  3 ++
 .../packagegroup-meta-webserver.bb            | 37 +++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 meta-webserver/recipes-core/images/meta-webserver-image-base.bb
 create mode 100644 meta-webserver/recipes-core/images/meta-webserver-image.bb
 create mode 100644 meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb

diff --git a/meta-webserver/recipes-core/images/meta-webserver-image-base.bb b/meta-webserver/recipes-core/images/meta-webserver-image-base.bb
new file mode 100644
index 0000000000..a4ce10f674
--- /dev/null
+++ b/meta-webserver/recipes-core/images/meta-webserver-image-base.bb
@@ -0,0 +1,7 @@
+SUMMARY = "meta-webserver build test image"
+
+IMAGE_INSTALL = "packagegroup-core-boot"
+
+LICENSE = "MIT"
+
+inherit core-image
diff --git a/meta-webserver/recipes-core/images/meta-webserver-image.bb b/meta-webserver/recipes-core/images/meta-webserver-image.bb
new file mode 100644
index 0000000000..ce4f8a0387
--- /dev/null
+++ b/meta-webserver/recipes-core/images/meta-webserver-image.bb
@@ -0,0 +1,3 @@
+require  meta-webserver-image-base.bb
+
+IMAGE_INSTALL += "packagegroup-meta-webserver"
diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
new file mode 100644
index 0000000000..fc117850b4
--- /dev/null
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Meta-webserver packagegroups"
+
+inherit packagegroup
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = ' \
+    packagegroup-meta-webserver \
+    packagegroup-meta-webserver-http \
+    packagegroup-meta-webserver-php \
+    packagegroup-meta-webserver-support \
+    packagegroup-meta-webserver-webadmin \
+'
+
+RDEPENDS_packagegroup-meta-webserver = "\
+    packagegroup-meta-webserver-http \
+    packagegroup-meta-webserver-php \
+    packagegroup-meta-webserver-support \
+    packagegroup-meta-webserver-webadmin \
+"
+
+RDEPENDS_packagegroup-meta-webserver-http = "\
+    nginx monkey cherokee hiawatha nostromo apache-websocket \
+    apache2 sthttpd \
+    "
+
+RDEPENDS_packagegroup-meta-webserver-php = "\
+    phpmyadmin xdebug \
+    "
+
+RDEPENDS_packagegroup-meta-webserver-support = "\
+    spawn-fcgi fcgi \
+    "
+
+RDEPENDS_packagegroup-meta-webserver-webadmin = "\
+    netdata webmin \
+    "
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1


