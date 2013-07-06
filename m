Return-Path: <net147@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC446B0B0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 11:34:46 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md12so2838252pbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 04:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NdhzeY/4Akx/DSufC6pjJEzjrY//ZNifK36JSg8e6io=;
	b=hXJWPDXmHnEEi9KEMf6yrR/mKXjR2jNUhZd+/yUc+0A+Lxr6N9RvMcb/e603Z2fgqO
	LeiuvtZ8+pDVpUXLTytziAZhAuaiVZd7MxAf856z2Osuu0wInWIftweTGyXWZ+RWkka9
	v+8mSRSRzkYusuhSxyAXZj4bU7THL7rIhyikU6xj5d4f4KHwh6XG1arL0gq3osjWFS5R
	p0P7bEbmk5auXahFjMsS7fAtQ8xp5FQVpyl2SdtkQ4U/CSumyoJ8d4xWdcdx3bmfBmjW
	b4ec44LkRVzk2A+FrhuGhZGVZhdTay9FGub8nb5AZmhDVmAPqafJfXlURndNoS2aCmDk
	swMw==
X-Received: by 10.66.145.4 with SMTP id sq4mr1126091pab.46.1373110487552;
	Sat, 06 Jul 2013 04:34:47 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id jb2sm11913191pbc.8.2013.07.06.04.34.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 04:34:46 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 21:50:23 +1000
Message-Id: <1373111423-1556-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] collectd: remove empty /var/run directory
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
X-List-Received-Date: Sat, 06 Jul 2013 11:34:47 -0000

The /var/run directory is already created by base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index 8641530..20df494 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -39,6 +39,9 @@ do_install_append() {
 
     # Fix configuration file to allow collectd to start up
     sed -i 's!^#FQDNLookup[ \t]*true!FQDNLookup   false!g' ${D}${sysconfdir}/collectd.conf
+
+    rmdir "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
 
 INITSCRIPT_NAME = "collectd"
-- 
1.8.3.2


