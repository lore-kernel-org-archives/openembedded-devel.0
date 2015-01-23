Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3B172D23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:10 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kx10so27760pab.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=erAd0klpd0N8F+Y9rTxsb+K/x6C2gcjjrxiXXgBm5kE=;
	b=Tg70w2+3IPsAvSOh9cnGFRYGVRjJY9UcgD/UnJqg0TRywUHBAg3T8qvkCLqEkLhO+e
	gTOm8EAgl9fMd6vn+8qTHIoeZaEHUDtcGGS51TLZh0ZTP8KcPaTDfQigtm34OO/k/gbB
	rdA5AZKWZ2dfeKxrI08obzMwphXbl0x2TAe296NSIJnTmW9u390S+Sj4m5Yy0fytNpby
	qBgQy9Srtf/gTyIyiVo30neEY8R1zWnV7aa1mcsVv4XnXQbUzjO15zvqFHKgZmDxEb4W
	85se0EMXnfa1fskagXVKOtcskgP/8mRodj0fst3/2piv1qQ3T6xxpXTvYH4kI+8+yheR
	Naxg==
X-Received: by 10.68.196.99 with SMTP id il3mr15169615pbc.158.1422053651109;
	Fri, 23 Jan 2015 14:54:11 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:44 -0800
Message-Id: <cdb7d7d41a6981bb2be5fd1eee8385724cf7769e.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 04/11] meta-python: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:10 -0000

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core and openembedded-layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 4e8eca3..55169e4 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -7,3 +7,9 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-python"
 BBFILE_PATTERN_meta-python := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-python = "7"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_meta-python = "1"
+
+LAYERDEPENDS_meta-python = "core openembedded-layer"
-- 
1.9.1


