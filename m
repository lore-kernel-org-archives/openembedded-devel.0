Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4E277D67
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTle7027111
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:47 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:46 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:16 -0500
Message-ID: <1504725809-12825-19-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 18/31] enable_gnome.conf: Move the AVAHI_GTK setting
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:45 -0000
Content-Type: text/plain

This is a distribution wide setting, so just including the layer should not
affect other layers.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-gnome/README                 | 5 +++++
 meta-gnome/conf/enable_gnome.conf | 1 +
 meta-gnome/conf/layer.conf        | 2 --
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/conf/enable_gnome.conf

diff --git a/meta-gnome/README b/meta-gnome/README
index 0c4fbd2..14cf415 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,3 +1,8 @@
+To enable gnome, you need to add the following to your system:
+
+require conf/enable_gnome.conf
+
+
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
diff --git a/meta-gnome/conf/enable_gnome.conf b/meta-gnome/conf/enable_gnome.conf
new file mode 100644
index 0000000..883a6f5
--- /dev/null
+++ b/meta-gnome/conf/enable_gnome.conf
@@ -0,0 +1 @@
+AVAHI_GTK_pn-avahi-ui = "gtk gtk3"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index fce5627..58e12a9 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -13,5 +13,3 @@ BBFILE_PRIORITY_gnome-layer = "7"
 LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer"
-
-AVAHI_GTK_pn-avahi-ui = "gtk gtk3"
-- 
1.8.3.1


