Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id D7EDB7FCF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:11:35 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a6so185940plm.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 11:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NS0R5YfbD46QGK2dOIYh4PUdIttp1NpiJjsq9qMclD4=;
	b=WovBcQlEebaP/vxhhUY9WSacP3qD+aqhPr3cd/daijGdTHDSL2Xrnlmfxq/IPEc1CK
	PJAkG09M4fV4vodVfzGuP+BG+a3bivsfLHq6Px4SH3D8TY+voZ/Qgab2YRf73qdHYcQa
	Bk6t/d7kD43BMu/Mv3683zHscK38Y4Zil4vFnd3DpMLohb60+sz4aBhWstz+MUJhA5hf
	b8Sk+y+jpAbprJufzKIUe2Yr8NGcVUciuu/QNKL7j5Vi/SbVT/bFAda2XNd5RaV27I5q
	99oel56lXY1Z3LkR3JJWQU/uvmryijulwTosfzNEQuoNgBDRuVf2hpvAVAj+hRMlwQTC
	M4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NS0R5YfbD46QGK2dOIYh4PUdIttp1NpiJjsq9qMclD4=;
	b=ciKyb+jMHj33p2SSfKPvM7omCfNg7qe/4ZHY4IdLDTcrvVCZDszmBCwJEQ/CRNsljb
	fx+qHaUdAPT3f60r0LzN1IVOJbiYp4VGQ8wiQalQJ7VvT8YECRp/lRHpMvlPMJSNuUHl
	xgWI4CwblgIlb5h9Skmv1mUO6F1Yamh7f3l6Dw+AEqa2uRWXQFRPtxxEjgDRjuqSYAAv
	vR9A0FMXcnOhuf0BZV7L4T+/NNC1rEmtbaB1k8Cv1C31SpOle8xwlZecq+Mbe6HhzkrV
	Go5DHc6S99xwjb01heaC3zSOJtiC7aGAAmJbtloKsLcebyoNzJ5rFDwQYA0nrMbtZX8z
	LOrg==
X-Gm-Message-State: APjAAAXB6eTneZ0v73dVTFPAIfcyjEHHM0hFwqElTG2/R49fBg35wSf8
	tFyjjDsVpyQBBjOZhhPkc0JOX9rwAjk=
X-Google-Smtp-Source: APXvYqzmQvGKzdAydkdlgAXdrQkNS8iezZ4sPyKfNn+0gZEwkgiVFAGCoD1OB3SYHe0OArv6Sj5t0A==
X-Received: by 2002:a17:90a:9d8a:: with SMTP id
	k10mr4647314pjp.91.1579720296565; 
	Wed, 22 Jan 2020 11:11:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	c19sm50595184pfc.144.2020.01.22.11.11.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 11:11:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 11:11:31 -0800
Message-Id: <20200122191134.3307089-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] iotop: Switch to using git src_uri
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
X-List-Received-Date: Wed, 22 Jan 2020 19:11:36 -0000
Content-Transfer-Encoding: 8bit

Gets python3 support
Remove python2 specific modules which are absent in py3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/iotop/iotop_0.6.bb | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.6.bb b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
index 68cc352249..3a597218db 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.6.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
@@ -4,13 +4,15 @@ DESCRIPTION = "iotop does for I/O usage what top(1) does for CPU usage. \
     a table of current I/O usage by processes on the system."
 HOMEPAGE = "http://guichaz.free.fr/iotop/"
 
-
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-SRC_URI = "http://guichaz.free.fr/iotop/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "5ef9456b26d7694abf3101a72e1e0d1d"
-SRC_URI[sha256sum] = "3adea2a24eda49bbbaeb4e6ed2042355b441dbd7161e883067a02bfc8dcef75b"
+PV .= "+git${SRCPV}"
+
+SRCREV = "1bfb3bc70febb1ffb95146b6dcd65257228099a3"
+SRC_URI = "git://repo.or.cz/iotop.git"
+
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "http://repo.or.cz/iotop.git/tags"
 UPSTREAM_CHECK_REGEX = "iotop-(?P<pver>\d+(\.\d+)+)"
@@ -22,6 +24,6 @@ do_install_append() {
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true
 }
 
-RDEPENDS_${PN} = "python3-curses python3-textutils \
+RDEPENDS_${PN} = "python3-curses \
                   python3-codecs python3-ctypes python3-pprint \
-                  python3-shell python3-subprocess python3-core"
+                  python3-shell python3-core"
-- 
2.25.0


