Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3D07451E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jul 2018 08:06:51 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id t6-v6so4671865plo.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Jul 2018 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mfbr8VhcstlKvKMm4IearM1NSR8M2vHf/zvMnIdbh7o=;
	b=LdGTwKGy9kUXp/5IFDfVH9OWmYUUMhdc0sXnsXNiHiFZ0rhdgqqy/qP4k97RYsfo13
	MoVw0puPnzCr4z+fTdS1gu1JSRpJ7G5scX1WnDJ92dwGdGWMMKWmmbt43EKD22w+MWoN
	ZefBQWuNY+F0ewzBGuIaAgqsRGbQOXSEtkQiKyIwhpMUsWmUvah06NDHDtBRrccK7jJP
	8t5UEnATjcZZy3Wg0hDRy8bvUynLRdrfF+x3YJV42yC8ybP0E/DU0MrD97jwbOW3QVxY
	Qf1G/9AEJdk2g7us62u7VZro5uJf5FeX8z+bvvpKN8W3U3DTDRyoChEgRLtbt9VM7hcr
	gpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mfbr8VhcstlKvKMm4IearM1NSR8M2vHf/zvMnIdbh7o=;
	b=brN1noHRtDmepg42sTOzmi6rd9x2xLpzKpli2AtGPPuA6yqhKAB1nb/sp0CDp+UgFl
	lAwqk8QIyG5hlXuT3/m8CfBb/cQ1DGeNNqNoBLez5TgYaCKrz4KP4vVnAXTiGmb7o8gG
	A2PxL8wMn0++ABJ7CQ6/ESAuxQcZQettDlXHVdSdAlvfulyaMi0oZh6Hb9VDhr8UpkJG
	szHXPxPW538e7KrUugpCVCbwd7s/nr3IQOssChyd1g/BGyleAkL+u5RF3dLWsbcYu8oZ
	u38+A9FU+SfjAiizHd0vvzgI5p2Ql2JdX9MNgbfkXMe/TRg2Zqr6Lc/gCin+64cKVoQU
	GEBw==
X-Gm-Message-State: APt69E2oY0pXdXO9BlvzEJ0hwojJBAnET9JONnKJArFNcIvoKSaTYIp/
	i1nIZQaE0ejM/IilIXELuI5ACw==
X-Google-Smtp-Source: AAOMgpfWyBopp832GqswXtqOCCrlDf4+Aa/KNbZoA2AnzcY/0+vZ07Gy36CB3ViPGL94dbXluDgDQQ==
X-Received: by 2002:a17:902:e85:: with SMTP id
	5-v6mr16268474plx.318.1531037212339; 
	Sun, 08 Jul 2018 01:06:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2af])
	by smtp.gmail.com with ESMTPSA id
	r25-v6sm12166097pge.81.2018.07.08.01.06.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Jul 2018 01:06:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Jul 2018 01:06:40 -0700
Message-Id: <20180708080640.39121-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180708080640.39121-1-raj.khem@gmail.com>
References: <20180708080640.39121-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-lxml, python3-pandas, python3-protobuf: Set CLEANBROKEN
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
X-List-Received-Date: Sun, 08 Jul 2018 08:06:51 -0000

The distutils class got a clean via "setup.py clean", but these
recipes doesn't support this yet so disable clean target during
configure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb     | 1 +
 meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb  | 1 +
 meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
index ff4bc7faad..b95d7bae71 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-lxml.inc
+CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb b/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
index b5dd5e0924..c1e57189cf 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-pandas.inc
+CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
index 781d1dc4da..53d5528c4b 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-protobuf.inc
+CLEANBROKEN = "1"
-- 
2.18.0


