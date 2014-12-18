Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id AF409727D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:19:59 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id l2so1457403wgh.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XsjS2P4GXugiDPXA4speLmQjp9DRKivZQWsV6a7HgWI=;
	b=TZ8we7CCb6MRt+BlBh3WB7coftABoGT9C8miqekcjuewiBgW7qezJtXVGS1ljKftoV
	R86FKa4/+zuhhvGbjy2D2fUaBNA5mK0Zqp9vPiB1fwEIljpSmuYTK6dkxizGyvET33pR
	MPNFisaCvXwmB5tndupINwCFTFNcSMJlLwiS0qwk5dNXFanfNqFVg6dNyKj6LXfH9Fx5
	ds4oZqm5f33fynVIS2hHq6xI+VNrQ+nE2nnAYH1vQ1XIIrdIl24Lc+jEPRKk9kxG5vpy
	dVMLFKJDGkCWqOEC7nMgWbZsbYz0luy5hGFMxG57m3127kid9yRjAlVAVr8llHGI/X7f
	YHtw==
X-Received: by 10.194.190.19 with SMTP id gm19mr3775090wjc.51.1418905200495;
	Thu, 18 Dec 2014 04:20:00 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pf4sm8733561wjb.36.2014.12.18.04.19.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:19:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:19:49 +0100
Message-Id: <1418905190-27541-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.0
In-Reply-To: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH 7/8] python-pyparsing: import from meta-openstack
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
X-List-Received-Date: Thu, 18 Dec 2014 12:20:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-pyparsing_2.0.1.bb  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyparsing_2.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.0.1.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.0.1.bb
new file mode 100644
index 0000000..06d6d40
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyparsing_2.0.1.bb
@@ -0,0 +1,18 @@
+# Imported from git://git.yoctoproject.org/meta-cloud-services
+
+SUMMARY = "Python parsing module"
+HOMEPAGE = "http://pyparsing.wikispaces.com/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
+
+SRCNAME = "pyparsing"
+
+SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.zip"
+
+SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
+SRC_URI[sha256sum] = "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
-- 
2.2.0


