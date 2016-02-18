Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id BA7C9731A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:08:51 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b205so15249568wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 01:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1TY63J1g4EfOkHVr1Cmfvm1NCQMiOpfP9vF5oS1L+TI=;
	b=LibF57NhlEyHkgYGbRL7FmyK21oAnVrVQrup+Y5cdv99rlbc85m9VDombXw3+2n1b3
	QwYybgHowcZ+e+M49N6N9y/c1ZPKwm37OHVqcrocsJYtTGwu3HtFOmmgo6P+VwKbx6g2
	I60w9bbkgzWdPR2/mJFijg6Sa/dyXuiOa8PSfnaUSwCai85m5ndX700EM/gU9LdKa6O7
	ZWHlTeYVi/8NyC8o5h8eJ19Pqo6lCPExfMTVOMemIgZ4LAAwnCX6BbAa4W+SuJ8qp5lV
	UpDQ6+4bLhcRng0Cl3ECEwCYI2yUMFBt0Rlytg15sXSjLX2uVRGcG4ViKhw/atBPxbQ4
	ok2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1TY63J1g4EfOkHVr1Cmfvm1NCQMiOpfP9vF5oS1L+TI=;
	b=kabxQ8B/Hh5o91gMq/yIULe63JC0E7LJNL2SQGnG2OyvvPP01ueJ88pvv9s1xh8+od
	oTT7JKa8TufG3XpwYbb3pmExnXs1921O76i8kY2hcsh10T4v0wk4u0hblTHQ4JwjyM5I
	/8hKVngzPFS6UBJxT7HupJs/xtEIQY8iohIpJK94ndVG4CJsSHv+H+efIlTWN3j/6h7m
	aZej0kumARliNtekYn36M8YgrYeVLCoYRrmHYj2c95DIRRWiwnRUssps9E9qicDvaFKL
	X/9kalYIjQeaRSNytfjIj8qtGuDeu/Nk5G/ZEBSRJhsFkvoREdeqB7JyynIN3E7g2O7G
	U7Jg==
X-Gm-Message-State: AG10YOQC9qA5EN4NGFPT2LCxOM2vqSpyqcWmLJ6y+DFn4pPJqM4Ilz8n2cp+2D0pEVx6pg==
X-Received: by 10.28.179.130 with SMTP id c124mr2199261wmf.76.1455786531333;
	Thu, 18 Feb 2016 01:08:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r62sm1944583wmd.15.2016.02.18.01.08.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Feb 2016 01:08:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2016 10:09:07 +0100
Message-Id: <1455786547-6702-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-python] python-gdata: RDepend on python-xml instead of python-elementtree
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Feb 2016 09:08:52 -0000

* python-elementtree was folded to python-xml by this oe-core commit:
  commit 5f7206eba3953b7f29148ecfb791995773ee5fc7
  Author: Ross Burton <ross.burton@intel.com>
  Date:   Wed Feb 10 14:04:04 2016 +0000

    python: merge python-elementtree into python-xml

    python-xml depends on python-elementtree as the latter just contains a C library
    used by the former.  However there's no point to this split apart from
    increasing the number of packages, so merge -elementtree into python-xml.
* this is just band-aid for missing RPROVIDEs in that oe-core commit and be aware
  that upgrade-path on target is still broken (no RREPLACES/RCONFLICTS), so you'll
  need "upgrade" from python-elementtree manually on target.
* fixes:
  ERROR: Nothing RPROVIDES 'python-elementtree' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb RDEPENDS on or otherwise requires it)
  NOTE: Runtime target 'python-elementtree' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['python-elementtree']
  NOTE: Runtime target 'python-gdata-dev' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['python-gdata-dev', 'python-elementtree']
  NOTE: Runtime target 'python-gdata' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['python-gdata', 'python-elementtree']
---
 meta-python/recipes-devtools/python/python-gdata_1.2.4.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb b/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
index ea60277..2205584 100644
--- a/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
+++ b/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
@@ -14,5 +14,4 @@ S = "${WORKDIR}/gdata.py-${PV}"
 
 FILES_${PN} += "${datadir}"
 
-RDEPENDS_${PN} = "python-elementtree"
-
+RDEPENDS_${PN} = "python-xml"
-- 
2.7.1


