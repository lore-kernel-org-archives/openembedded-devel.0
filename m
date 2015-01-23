Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 965CD72D23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:20 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id p10so234541pdj.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=hqQe+crAWNf74K3nA5kWCwTMkrifDzmr5bkcdI+oKRA=;
	b=VAOTQPL6q2W7KbipufeDBeOvjWrseQ5j7qcAWCKmgsrPki8uYdz3pXXbMA+IisMfvn
	QcoJM2qFM1aJcL4iDXue7piEo44e6hF3g68MjgCAmJYAz1lsrDCJnSaXdFQFyLgnbw8J
	xszOeQosyvk7ICR3ffAYG8F1lKvbIEDbGImpeQICMitZa/v84zbVyDbxZeDHwvr373bv
	o8K+5DvlrSw1okX4cbxzN7hXJBtwU1stKKwHRbEKO2cHbQL/6fzAh9l5qnaWKk+28BM8
	VymeZwFFJmcmUhnNjW0xIwn70s1lF3iwaHKrzjwIR7R4A9tTr6LyrIxAvod9r67dosk0
	SAKg==
X-Received: by 10.68.179.226 with SMTP id dj2mr15032202pbc.100.1422053661069; 
	Fri, 23 Jan 2015 14:54:21 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:49 -0800
Message-Id: <d3d6e7214be541847dfb166b69eb72082a9efb0f.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 09/11] meta-gpe: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:20 -0000

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core and openembedded-layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gpe/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
index 6c018b1..00f3929 100644
--- a/meta-gpe/conf/layer.conf
+++ b/meta-gpe/conf/layer.conf
@@ -7,3 +7,9 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 BBFILE_COLLECTIONS += "gpe-layer"
 BBFILE_PATTERN_gpe-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_gpe-layer = "7"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_gpe-layer = "1"
+
+LAYERDEPENDS_gpe-layer = "core openembedded-layer"
-- 
1.9.1


