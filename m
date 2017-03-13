Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A94E776B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:30:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D3Ul2U024297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 20:30:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 12 Mar 2017 20:30:47 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Mar 2017 11:29:21 +0800
Message-ID: <20170313032921.8669-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170313032921.8669-1-kai.kang@windriver.com>
References: <20170313032921.8669-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] lmsensors: update SRC_URI and S
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
X-List-Received-Date: Mon, 13 Mar 2017 03:30:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Rename source tarball in SRC_URI and update S for lmsensors.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index dbc05a8..53af6ca 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native rrdtool"
 
-SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
+SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz;downloadfilename=${BP}.tar.gz \
            file://fancontrol.init \
            file://sensord.init \
            file://0001-lmsensors-sensors-detect-print-a-special-message-whe.patch \
@@ -15,6 +15,8 @@ SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
 SRC_URI[md5sum] = "1e9f117cbfa11be1955adc96df71eadb"
 SRC_URI[sha256sum] = "e334c1c2b06f7290e3e66bdae330a5d36054701ffd47a5dde7a06f9a7402cb4e"
 
+S = "${WORKDIR}/lm-sensors-${@d.getVar('PV').replace('.', '-')}"
+
 inherit update-rc.d systemd
 
 RDEPENDS_${PN}-dev = ""
@@ -29,8 +31,6 @@ SYSTEMD_PACKAGES = "${PN}-sensord"
 SYSTEMD_SERVICE_${PN}-sensord = "sensord.service lm_sensors.service fancontrol.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-S = "${WORKDIR}/lm-sensors-3-4-0"
-
 EXTRA_OEMAKE = 'EXLDFLAGS="${LDFLAGS}" \
         MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \
         LIBDIR=${libdir} \
-- 
2.10.1


