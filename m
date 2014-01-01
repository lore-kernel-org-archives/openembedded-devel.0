Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8481F6A413
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:57:26 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so5889643eaj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+uWPXEPJub+LcGiUuRfB76UQSqGyzLGI7ZSRLaMe9N0=;
	b=rEwj288wmtaOoN/RoB0qo1US3C2BTK/yBMZf1eyZfUUy5tW7WDrpd++AvBIpPXFYQ5
	YpaxMSnof7EkQhk1TdiFw0hJ0SMi9DpP7oukzImGePbWkquCT24Q7WWsmd6QiD/W5vLr
	B3A8Pv2mwMz32t5q/o+8GbgpZcOhZmh3e3gve5ZC7Iqq/kFD0VXTUKH2SY7ikGKQRpvQ
	Pp4aI13yb8ei4Twmgmn3AqpZ6SDwU5+cOBYbYqBXMtmQEviUJkrtJcooDGDpDtty43bs
	RAvsgeAbF46DzVmfc88Tw+GDq3G1C7pfzeB7fcsiit/1K23kRH1EzKsI9HhrmfvGBIum
	AXEg==
X-Received: by 10.14.149.139 with SMTP id x11mr10930682eej.35.1388581046862;
	Wed, 01 Jan 2014 04:57:26 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm126867602eed.14.2014.01.01.04.57.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:57:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2014 13:57:19 +0100
Message-Id: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-oe][WIP][PATCH 1/8] ktap: upgrade to 0.4
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
X-List-Received-Date: Wed, 01 Jan 2014 12:57:28 -0000

* tag v0.3 (and its SRCREV) doesn't exist in any branch so latest bitbake refuses to fetch it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/ktap/{ktap-module_0.3.bb => ktap-module_0.4.bb} | 0
 meta-oe/recipes-kernel/ktap/ktap.inc                                   | 2 +-
 meta-oe/recipes-kernel/ktap/{ktap_0.3.bb => ktap_0.4.bb}               | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/ktap/{ktap-module_0.3.bb => ktap-module_0.4.bb} (100%)
 rename meta-oe/recipes-kernel/ktap/{ktap_0.3.bb => ktap_0.4.bb} (100%)

diff --git a/meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb b/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
similarity index 100%
rename from meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb
rename to meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
diff --git a/meta-oe/recipes-kernel/ktap/ktap.inc b/meta-oe/recipes-kernel/ktap/ktap.inc
index 278b63e..7e60453 100644
--- a/meta-oe/recipes-kernel/ktap/ktap.inc
+++ b/meta-oe/recipes-kernel/ktap/ktap.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.ktap.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE-GPL;md5=eb723b61539feef013de476e68b5c50a"
 
-SRCREV = "c507eeca662ff00bf67f8c94df35254e0966f214"
+SRCREV = "c8401e07c89cdec9a5f673da4ddb12b7982b522b"
 SRC_URI = "git://github.com/ktap/ktap.git"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-kernel/ktap/ktap_0.3.bb b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
similarity index 100%
rename from meta-oe/recipes-kernel/ktap/ktap_0.3.bb
rename to meta-oe/recipes-kernel/ktap/ktap_0.4.bb
-- 
1.8.4.3


