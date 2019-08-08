Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A93C77F395
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 09:33:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x789WPER014739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2019 02:33:01 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 02:32:40 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 8 Aug 2019 05:32:09 -0400
Message-ID: <20190808093210.149215-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808093210.149215-1-kai.kang@windriver.com>
References: <20190808093210.149215-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 1/2] xfce4-datetime-setter: add recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 09:33:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Because xfce4-settings turn back to its official upstream, it missing
function to set date and time. Add it from Andreas's repo on github.
It depends on dbus service org.freedesktop.timedate1 which is provided
by systemd, so add systemd to RDEPENDS.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfce4-datetime-setter_3.32.2.bb            | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb

diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
new file mode 100644
index 000000000..7a28b6101
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "A fork of (early) gnome-control-center datetime panel for XFCE. \
+It is based upon GTK3 and embedds into recent xfce4-settings."
+HOMEPAGE = "https://github.com/schnitzeltony/xfce4-datetime-setter"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+
+DEPENDS = "glib-2.0-native libxfce4ui"
+
+SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https"
+SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
+
+S = "${WORKDIR}/git"
+
+inherit gettext meson
+
+FILES_${PN} += "${datadir}/icons/hicolor"
+
+RDEPENDS_${PN} = "systemd tzdata"
-- 
2.20.0


