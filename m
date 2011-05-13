Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKotz-00073O-9N
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 11:43:19 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1839226fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=kyBfDpYC/AX7X5rnxWpTmpAQSZJZc1q+fW3iznYS8SY=;
	b=RywzDDiVMOKXLe1St5/+DtSd67zqo6CTpOWWTdD7dyV5E8U0TCKQSaaTokriXEr2o4
	9e4C2mFn4bs7HlAt7GbBNd15p5PMKrjW62uJfaWMTXECCTsO4LmIRMapnIBjP9u7UR40
	GI1JQ8P7GhaNkbgm9br9MmL0m1H1wiBAKihxs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hXMFa0d+itxy1Pxn8skxVrOQqH3qBt2RoO+wXxllaY5cdYPOZ/OOuUQ5NcBvbiOWfr
	N5Sab7e8JFiEXQje++6RNB5Nr82FufKGFz9XbvOVvpWFvfha++Imclzz/K06kbb4brqs
	TccS6YlKDaCV1nCwTCKcTm2UBOoTMf9d2lxfU=
Received: by 10.223.76.212 with SMTP id d20mr1495733fak.5.1305279632519;
	Fri, 13 May 2011 02:40:32 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c3sm772508fav.27.2011.05.13.02.40.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 02:40:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2011 11:40:08 +0200
Message-Id: <1305279609-31395-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
References: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] xinput-calibrator: add 0.7.5 from meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 May 2011 09:43:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xinput-calibrator/xinput-calibrator_0.7.5.bb

diff --git a/recipes/xinput-calibrator/xinput-calibrator_0.7.5.bb b/recipes/xinput-calibrator/xinput-calibrator_0.7.5.bb
new file mode 100644
index 0000000..4024883
--- /dev/null
+++ b/recipes/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
+LICENSE = "MIT/X11"
+LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
+DEPENDS = "virtual/libx11 libxi"
+
+inherit autotools
+
+RDEPENDS_${PN} = "xinput"
+RRECOMMENDS_${PN} = "pointercal-xinput"
+
+SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz"
+SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
+SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
+
+S = "${WORKDIR}/xinput_calibrator-${PV}"
+
+do_install_append() {
+        install -d ${D}${bindir}
+        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+        install -m 0755 scripts/xinput_calibrator_get_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
+}
-- 
1.7.5.rc3



