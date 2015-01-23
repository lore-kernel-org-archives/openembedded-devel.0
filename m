Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2D00D72CD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:15 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so75117pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OX/s7CBsnM52SCfCIrdi2+3hxgcMzIcnT+b4cfXw31Q=;
	b=AG8Wrcf6E07UzsUcB4M13Sdzg3JtxESmoTmS/7VpoDdtzSpdPsqMEA9wtEkVVpG1f9
	aoPvM4Pd3/4L6gPSlomULWaA+zv1XQRyEoUtKVAxBRS3YSb3uLF4f1zhsGtPl7Tsole6
	E0pgEvL015wLQuemXXmOdiscEEwWLGb8Og+rQIWdG0sEpmBtzPqXlBcJtdudqhlI6sUT
	8IV2eiilc0wVikilsNcuTCnyf4GouEDacNYuXs42xcgawu4DSCqOZAbLJ43imadRPcb1
	MEmLS/4cHJFB4CFx0rQv16UKn+FaI704lvaa48LbReQiIQRqQsd+Bv0DVrnZw3eAccev
	qXxQ==
X-Received: by 10.70.43.105 with SMTP id v9mr15182174pdl.158.1422053656787;
	Fri, 23 Jan 2015 14:54:16 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:47 -0800
Message-Id: <fe66fc1852268561879c78713156c766aa1c6c45.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 07/11] meta-efl: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:16 -0000

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core and openembedded-layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-efl/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
index 53f4ff4..ed132aa 100644
--- a/meta-efl/conf/layer.conf
+++ b/meta-efl/conf/layer.conf
@@ -8,6 +8,12 @@ BBFILE_COLLECTIONS += "efl-layer"
 BBFILE_PATTERN_efl-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_efl-layer = "7"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_efl-layer = "1"
+
+LAYERDEPENDS_efl-layer = "core openembedded-layer"
+
 E_MIRROR = "http://download.enlightenment.org/releases"
 E_RELEASES = "http://download.enlightenment.org/rel"
 E_SVN = "svn://svn.enlightenment.org/svn/e"
-- 
1.9.1


