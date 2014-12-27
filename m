Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2A704713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:27 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id w10so14560131pde.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=qxbdn8NbbbbDQuuWQg9ccxUuarTBSBWX1slZ7vo/kFc=;
	b=RCuPhAn+yBmokuXmwIY5JIg8u4Tw5ePHPt0avP7lBiiVnmubuIMqZKRa+iDWlKchS1
	2nVecB2AcDkqfplSY1HXXWA81+8o3VmVU7gCssFN7mO03/3WcCkzQaoCAhZAeterY4N6
	LqdWV4jBhgwOOHITSVjVhdnqQL+JprkQmXM/zhrlER56a0lcunJv9QFQOQf+SXtrLkWn
	fOoSfILKstVbxy9ou2h1nYzlkbMvv5luhVbKPjoYGgXg5oLpRNtcRGSfILrQxvxjHqT6
	ik3dmItyrmiOzGpoZJW83Lcx6nIxhNgT86hhNTAlOVWuvPVF9ShItks9MNIAYVHCfrU4
	YiNQ==
X-Received: by 10.68.141.204 with SMTP id rq12mr75642512pbb.7.1419700948629;
	Sat, 27 Dec 2014 09:22:28 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:55 -0800
Message-Id: <29d4fc8895056ecc24195b8136b6cf464987c80d.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 08/27] rrdtool: add missing dependency on groff-native
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:28 -0000

From: Jackie Huang <jackie.huang@windriver.com>

rrdtool needs groff-native to format the documentation.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
index b901f2e..6bc5e98 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
 
-DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2"
+DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native"
 
 SRCREV = "1850e00a17e25e93c39e608f4e2da50f29c5c712"
 PV = "1.4.8"
-- 
1.9.1


