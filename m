Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 08EA165D92
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 13:54:42 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id p10so2880904pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZbcOlKNLS2v/e09uulp5kGOE+P8BHW9ZjyucgUvsf5o=;
	b=SJfFfKevjFuq37Dnve+OoBMsGJGb+PyayUh1x1DTUXEmpIL3F6CImq3uPElL7E/8vB
	p9wS711H0cMLMQBi0O2kSDDh2keWErjOJ+diNPkURfBzroxolB5btlwWSAbT4z4oNpG5
	VMKkdp/QNtV/lnESYwHw4JtO4+CMR9W1aEsnL8RtK/VvWlBQJRKGtqC95W8nrVv30Bnj
	0zq1LX4NGgXACDeunW7s4Qt9FCf1sYtjeMyesE0djokTmTZA0ef5vvMDmgO6adcVmw2M
	oqUkULtdpFhvAdWcDBJO4tWzSoAe2sdRDqN/vFdcmIJ2JzLLu0pOHLg1NKEZoeTyBdJ5
	ZhZQ==
X-Received: by 10.68.130.229 with SMTP id oh5mr2676599pbb.121.1398002083915;
	Sun, 20 Apr 2014 06:54:43 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vm3sm43182247pbc.45.2014.04.20.06.54.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 06:54:43 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Apr 2014 00:01:23 +1000
Message-Id: <1398002483-26092-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH v2] qtlocation: add packageconfig for geoclue and gypsy
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
X-List-Received-Date: Sun, 20 Apr 2014 13:54:45 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtlocation.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/recipes-qt/qt5/qtlocation.inc b/recipes-qt/qt5/qtlocation.inc
index 70a4375..41f2d19 100644
--- a/recipes-qt/qt5/qtlocation.inc
+++ b/recipes-qt/qt5/qtlocation.inc
@@ -2,3 +2,19 @@ require qt5.inc
 
 DEPENDS += "qtbase qt3d"
 # qtsystems qtmultimedia
+
+PACKAGECONFIG ??= ""
+# older geoclue 0.x is needed
+PACKAGECONFIG[geoclue] = "OE_GEOCLUE_ENABLED,,gconf geoclue"
+PACKAGECONFIG[gypsy] = "OE_GYPSY_ENABLED,,gconf gypsy"
+
+do_configure_prepend() {
+    # disable geoclue tests if it isn't enabled by PACKAGECONFIG
+    sed -i -e 's/^\(qtCompileTest(geoclue)\)/OE_GEOCLUE_ENABLED:\1/' ${S}/qtlocation.pro
+    sed -i -e 's/^\(qtCompileTest(geoclue-satellite)\)/OE_GEOCLUE_ENABLED:\1/' ${S}/qtlocation.pro
+    # disable gypsy test if it isn't enabled by PACKAGECONFIG
+    sed -i -e 's/^\(qtCompileTest(gypsy)\)/OE_GYPSY_ENABLED:\1/' ${S}/qtlocation.pro
+}
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
-- 
1.9.1


