Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3ABE872D23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:17 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id p10so234392pdj.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=hhTF3lX9cuJ55TsHqmpIzYd0lIIwihjX+1eVTa2L7zc=;
	b=IPt8MggpCbfoG/x3H3WRClPQnFsqpcIxa2qewyZ25h9aj2qbfwLAfA5aaMsc4x6otk
	8rWoL+1pfHHAFgGu6IfFJiPx3TOcgSl1AE8drkYChrrvMsfQTvhHmEYxwWsbNSOc+ocZ
	XRrn36+E396nl6htsaIQB6dLUX7hShUFFxMwVxtI4jU3EplV2rzZc/M2ECckCd+ukB3E
	l/lcEe6nZagRwNorpdlIwjCDaOCBRnBoCW79K8KANOoWP/+kmwITjVCcSErtet/eESKw
	+Za2lkSRwFQ0XGsDeOVCJQFW47M/U7vLhIGdYZgcOLtyvG8Fxs6L8MVuC5D4mNvFDn4I
	SciQ==
X-Received: by 10.70.22.66 with SMTP id b2mr12438364pdf.9.1422053658608;
	Fri, 23 Jan 2015 14:54:18 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:48 -0800
Message-Id: <4799f4f42ea91ed12463fb6877509a99c5777bb3.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 08/11] meta-filesystems: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:19 -0000

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core and openembedded-layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index c0bbd78..9ed6d1b 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -8,3 +8,9 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "filesystems-layer"
 BBFILE_PATTERN_filesystems-layer = "^${LAYERDIR}/"
 BBFILE_PRIORITY_filesystems-layer = "6"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_filesystems-layer = "1"
+
+LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
-- 
1.9.1


