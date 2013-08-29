Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 933FF6BE66
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:07 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so345540ead.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0t6brQeX4amP4S5M+2q9C6SVDK7hmQNtsLtfwK5rjgk=;
	b=N4pqmgzxJOPkTVpVChND1BoB2sCSxWs+jrO0Ltqzmb1LcmgjyR44wzr5Q9cfFpEfIh
	CPGXW8kMLYKiwAF1Jo9FIAi/aHFCQGPY121khbsX70CrpZ+kkm0nH8a7QuyW+TEcfkZO
	Z0XlSsSK25x1/nlgq0KSRBm903DJZcjNmkrniX1hyafVozMjTQPAafBilgUPw9XfiJT7
	CDAX3I6+2c/n/fhG95Ku5+8JnYmJWtbliaZABKEvuGRck4FuOIbGiRuabzTcKmgyhmrp
	HPYCB8oaF8F4ggJA1Ow6JBjrjHM7vbURFVsr3hPkHwEkc0/q6/CvtLfCWgMJ3NAxWXcG
	8GOw==
X-Received: by 10.15.100.198 with SMTP id bn46mr5320711eeb.11.1377791528056;
	Thu, 29 Aug 2013 08:52:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm47159966eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:52 +0200
Message-Id: <b05407c77f6988d3ab9cd0b0e3313b8e52664e37.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 59/66] xfce4-clipman-plugin: Add PACKAGECONFIG for unique
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
index d3c7138..80792cf 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
@@ -10,3 +10,6 @@ DEPENDS += "xfconf xproto libxtst"
 
 SRC_URI[md5sum] = "61f3be97efa379cb358980c94e14692a"
 SRC_URI[sha256sum] = "4424447067cb2c3972c375330d2e1d19f12e59c41bd03e111c2e6e9e174a5067"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[unique] = "--enable-unique,--disable-unique,libunique"
-- 
1.8.3.2


