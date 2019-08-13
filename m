Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1C5560017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:24:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D9Ndh0027694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:23:50 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:23:29 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:15 -0400
Message-ID: <20190813092118.113213-14-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 13/16] xfce4-session: 4.13.3 -> 4.14.0
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
X-List-Received-Date: Tue, 13 Aug 2019 09:24:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-session from 4.13.3 to 4.14.0.

* remove dbus from DEPENDS that xfce4-session ports to gdbus. gdbus is
  provided by glib-2.0 which in the dependency chain alreay.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-session_4.13.3.bb => xfce4-session_4.14.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.13.3.bb => xfce4-session_4.14.0.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.3.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.3.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb
index 2c881a270..6b4cafd00 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb
@@ -3,7 +3,7 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 
-DEPENDS = "dbus libwnck3 libsm libxfce4ui virtual/libx11"
+DEPENDS = "libwnck3 libsm libxfce4ui virtual/libx11"
 
 inherit xfce update-alternatives distro_features_check
 
@@ -15,8 +15,8 @@ PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
 SRC_URI += " \
     file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
-SRC_URI[md5sum] = "94eca4dd2280910292abf9692304ce2c"
-SRC_URI[sha256sum] = "eaed34f29aa044d878d60dcb7293a542f48248919e3dcd8df98215121cb6d362"
+SRC_URI[md5sum] = "635361f99a01b2d26c430a520b6d1314"
+SRC_URI[sha256sum] = "14fb6db74eb69eb400673856ba307a0e57f577cf77c3561a5910151e3d52043f"
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-- 
2.20.0


