Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9836371E53
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:04:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1DA4eT4000379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Feb 2017 02:04:40 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 02:04:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 02:04:26 -0800
Message-ID: <7409ff5520c93603b627cd0c67bec1f57e27f038.1486980187.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] gnome-disk-utility: add dbus-glib-native to DEPENDS
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
X-List-Received-Date: Mon, 13 Feb 2017 10:04:40 -0000
Content-Type: text/plain

Fixed:
make[3]: dbus-binding-tool: Command not found
make[3]: *** [udisks-daemon-glue.h] Error 127

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index dced48d..c167214 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -3,7 +3,10 @@ SUMMARY = "GNOME disk utility"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
-DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart gnome-doc-utils intltool-native gnome-common-native libgnome-keyring"
+DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui \
+    virtual/libx11 libatasmart gnome-doc-utils intltool-native \
+    gnome-common-native libgnome-keyring dbus-glib-native \
+"
 
 PR = "r4"
 
-- 
2.9.0


