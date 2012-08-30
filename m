Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T710g-0005Ji-U1
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 11:25:58 +0200
Received: by weyr6 with SMTP id r6so869544wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 02:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=u4uV/3dQELHwCZo81S661ojGE+KAdpVJAQmLUJEqfhI=;
	b=QY7SMUs/fwMQDBIHdxKqEBaeWYVYylqUH0IX1iyDDeH7iQ9oEcYzvXZ2haEWB+7OHe
	ycyfyBOud7NbiN8xR2WZKnJFNOiDgKM0mYYcdAbQgyT4zofbtO738Vl+LE0kV9Dp4ClZ
	wvwRp9M/ci02Rzb0Fm9GWOiLaWUOkIyyboVC6W8GclGz0ubdNm5wDYFNoAPOMhm3HuOl
	Y+uvAoaWKPEWOi403DygC5iKdlqM+L23CvhdA4BFdeZn/qB6l9PbdN0q0uYsOUDgRhTw
	QN1BpcK5j8QTP4fkodCqnJy3H/edL9yNjP0YxokHIH02ASxNeWrt6oYPxMTD7PSUd6O0
	Resw==
Received: by 10.180.81.165 with SMTP id b5mr46546023wiy.17.1346318024097;
	Thu, 30 Aug 2012 02:13:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm3357547wib.10.2012.08.30.02.13.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 02:13:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 11:13:32 +0200
Message-Id: <f9f3477f68fe980e72d77d5095a74acf182938d6.1346317656.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <]>
 <cover.1346317656.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <cover.1346317656.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] gpsd-machine-conf: add empty recipe for BSP layers to bbappend it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 09:25:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
new file mode 100644
index 0000000..2042383
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "Machine specific gpsd config"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
+
+# empty by default
+# BSP layers can add stuff like meta-openmoko example:
+# 
-- 
1.7.12



