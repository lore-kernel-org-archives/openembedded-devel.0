Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8DE72CD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:12 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id fl12so205081pdb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Luz6ptzvH6WrlWKQTzZ3b30YXu5uti9I+y4ZKbvmVQI=;
	b=UCUukLif24hr647G3MREVIrKgza7IintHZZGyht1k8Dvd3yPTN+0wREM/rhQ1CFcCN
	TNsSIp3vgrOU7FhITFkNEHB3YxX9b5xeLi/MKYdSf9B/pAOLOZmQ67Ze/O8VI7ZRtNz1
	iruYhn7SGURAFBvRnrWgtAmcX7Z4CKvm2fzq5rKG5yr5L1rlmLEY3TO7ThI8QJSHSl8X
	ret275iGRvvu6s+bHkothOduJ8tDik/4g2OsTPJR78y3ybw40w5vgKRl71KwwqZyoNRO
	zqvuHLm/9OgpV5Mvg+5PvrsYgFr+BiCDAfFVb74yAaz7R1TUQpRvG8wtzy0epTR5btxb
	iy7g==
X-Received: by 10.68.131.3 with SMTP id oi3mr14922091pbb.27.1422053653129;
	Fri, 23 Jan 2015 14:54:13 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:45 -0800
Message-Id: <dd4223b6fe84b57427265ab20391d86b938da4b6.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 05/11] meta-ruby: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:13 -0000

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core and openembedded-layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-ruby/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ruby/conf/layer.conf b/meta-ruby/conf/layer.conf
index 6c2369f..b526a5d 100644
--- a/meta-ruby/conf/layer.conf
+++ b/meta-ruby/conf/layer.conf
@@ -7,3 +7,9 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 BBFILE_COLLECTIONS += "ruby-layer"
 BBFILE_PATTERN_ruby-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_ruby-layer = "7"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_ruby-layer = "1"
+
+LAYERDEPENDS_ruby-layer = "core openembedded-layer"
-- 
1.9.1


