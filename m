Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D15377D81
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v86JTm3j032257
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:48 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:47 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:17 -0500
Message-ID: <1504725809-12825-20-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:46 -0000
Content-Type: text/plain

This resolves a failure of the yocto-compat-layer.py script.  Changing the
PACKAGECONFIG setting by just including a layer can cause problems.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-gnome/conf/enable_gnome.conf                   | 2 ++
 meta-gnome/recipes-devtools/glade/glade3_%.bbappend | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)
 delete mode 100644 meta-gnome/recipes-devtools/glade/glade3_%.bbappend

diff --git a/meta-gnome/conf/enable_gnome.conf b/meta-gnome/conf/enable_gnome.conf
index 883a6f5..7e711ee 100644
--- a/meta-gnome/conf/enable_gnome.conf
+++ b/meta-gnome/conf/enable_gnome.conf
@@ -1 +1,3 @@
 AVAHI_GTK_pn-avahi-ui = "gtk gtk3"
+
+PACKAGECONFIG_pn-glade3 = "gnome"
diff --git a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend b/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
deleted file mode 100644
index 3abacfb..0000000
--- a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-PACKAGECONFIG ??= "gnome"
-- 
1.8.3.1


