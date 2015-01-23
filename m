Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id C6AF172CD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:06 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id eu11so27425pac.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=zCENHDuV3Sa77HxcX0K+LjARag5ZD0ZmiPQ3QBmFYN4=;
	b=koGPJoUftZRkEZTVDRfaOkpMs0+nP2YqcQU3YmdTyv9yJB1znseo+8WjdFVdTvln8a
	vkwszMjpShvW4CI1JLoAxh+cICHm6lqsC6qy1dCC59y3W8/R+SwLfnuFPp2N1LDhOhqI
	QnP5dwcR5v09P4xYGCeIOVZcZAggbrmBxq59nwmitbUUHEVwz5zaCkRRdzQacYNMrUQ6
	gS6/Y4iUG2Fl0Rs7tTPsyXbAJNSJ27KKYEW5PKi1q1Cn9xKcz1MuClckg2Exg4VRPyYv
	4P2pUGighnqbjY3y7VtQeYfuFQJR6b5ZhXfrOIzEl/tFsbyQdpJkFQIh5wBJkDTiRGrM
	gMUQ==
X-Received: by 10.70.14.229 with SMTP id s5mr14812518pdc.143.1422053647244;
	Fri, 23 Jan 2015 14:54:07 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:42 -0800
Message-Id: <c1fd02e8cb751d9ec9852b712bc8f2a03bbb006c.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 02/11] meta-gnome: Add LAYERVERSION and LAYERDEPENDS
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
 meta-gnome/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 902ab8f..58e12a9 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -7,3 +7,9 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 BBFILE_COLLECTIONS += "gnome-layer"
 BBFILE_PATTERN_gnome-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_gnome-layer = "7"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_gnome-layer = "1"
+
+LAYERDEPENDS_gnome-layer = "core openembedded-layer"
-- 
1.9.1


