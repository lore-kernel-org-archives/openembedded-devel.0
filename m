Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 74FF972CD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:14 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id fp1so228527pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=xp0di8KvU9XjuP3y/yHBRl5SUZmU5+jChRi5imntlD8=;
	b=kMdAgb2x5q6KcyxevO9CGzZU9V6f8fgpQSq9mW5hz4CJEx1UMC9zrINTUbN5tBPWBX
	N+PUOybyRdMcaP6r8FmI8brDY0PBFxhxn3yifJsHeUwX4rPT6eCL9TR2nVzudbE0mQOt
	Hh4nXbSLxregh4sV4eLnlTtpM3perUMAD929023ErHBaqiFMZYb7VCZsBLyDxS66TiAF
	1lqkBClkeaT9zSsPZKDZ6QvOEe9WXTAxl60yEyVt6PfkjyGd71RH3rxRYY+6eodcS8Kl
	vPwAHpsHyBjryU8+KW4F/MnzdnPxFcK9TgMUR6QPgeAlp7HMxQKIepbAK3r9kqAjagMr
	qd8Q==
X-Received: by 10.70.88.9 with SMTP id bc9mr14832601pdb.145.1422053654947;
	Fri, 23 Jan 2015 14:54:14 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:46 -0800
Message-Id: <f07404fd8f30fff363c0be790ff30d628c205f59.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 06/11] toolchain-layer: Add LAYERVERSION and LAYERDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Jan 2015 22:54:14 -0000

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 toolchain-layer/conf/layer.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain-layer/conf/layer.conf b/toolchain-layer/conf/layer.conf
index ca81eb1..b377f12 100644
--- a/toolchain-layer/conf/layer.conf
+++ b/toolchain-layer/conf/layer.conf
@@ -23,3 +23,8 @@ BBFILE_PATTERN_toolchain-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_toolchain-layer = "6"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_toolchain-layer = "1"
+
+LAYERDEPENDS_toolchain-layer = "core"
-- 
1.9.1


