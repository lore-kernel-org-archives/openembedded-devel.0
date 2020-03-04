Return-Path: <leo.yan@linaro.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 641EA612C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 12:28:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so2163978wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 04:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=VZNeT+x4p0BiyfWnECR6MJA0VMThCSnKCkND0dwxfoI=;
	b=VqLeV0IrFhVdsVf0DNkGOC0Z7FBRBx0LHDpaLxhJvAPJlJ3cNwC9ntJEcGSvYsW/6S
	gSL8jFMMgd4PBQTyCukQ2k0OYqRpW3lyEXKFNjxrs8P/RFx6F2oHekxF00jct4fGq2sL
	2MBLk2pxFMWC0467SFsxnk51Zi4p/9jJl5anf33acqGZzPiDBtrScZ6jd8v2Ur7VZ8lg
	fTrLqMfO4jsglfcUOkUCu/pKk/C0RQxm7fn6FCwwkqdIrN8CV31IBdpZwHCEyiEXwWBJ
	8Pu8VForMvGam98DwB7hPSlVc1ebilftw46c1eGmxrmeLQmJ2pCPTh9GFR0k/dQdDRZL
	vvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VZNeT+x4p0BiyfWnECR6MJA0VMThCSnKCkND0dwxfoI=;
	b=N+D9J5tCVROzwfuFsVRnsKcQuRq8rqpzZn1s6Yqb/DG3wE3kFiwBMIpCk+6PAbBpmx
	43hs4YEGzCDF9Rp5DvLiJhPfXxWIoxmiqxYccNZV6r5pobDkJHrXZbBj2rRAcNTtNhso
	qWTJ+P+Pc4e8dfvLC4PHgxueDpJSEum6mGTuRJ3IRB4Y8musRtVJdXysna1jAS4s8QyM
	Ig8rBLKkhOJaK8tq3+1w9poan1c4L3Lbha7yLaZx/HVfhT46IC/pRmn8OOvevCKUHGtU
	4K8PinhpSjgF2LPeT7A0mJD1cb2eXh4FqiRh7D1+jw5TPoXpOd1B+j1aPTdTvvtCyUUf
	oZcg==
X-Gm-Message-State: ANhLgQ2IO95GGjqui8bX1qBD8lDV8vo62qqICius8Pq4U9ynukkRKi1O
	LmE+7LCZtcR+10VFwnbqKHGsfg==
X-Google-Smtp-Source: ADFU+vtQa+Gnb78JkaoN4PwGzD/Xm4NsuSVSdrvlynvGcS5C9zI5o+4V/opARcfsR+7mjybt8VTdlA==
X-Received: by 2002:adf:a19c:: with SMTP id u28mr3872449wru.221.1583324900230; 
	Wed, 04 Mar 2020 04:28:20 -0800 (PST)
Received: from hackbox2.linaro.org ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id y8sm3948990wmj.22.2020.03.04.04.28.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 04:28:19 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mike Leach <mike.leach@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed,  4 Mar 2020 12:28:11 +0000
Message-Id: <20200304122811.16655-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v1] OpenCSD: Support for Arm CoreSight decode lib
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
X-List-Received-Date: Wed, 04 Mar 2020 12:28:20 -0000

This recipe is to support OpenCSD, which is an open source
CoreSight trace decode library and utility.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/opencsd/opencsd_git.bb

diff --git a/meta-oe/recipes-devtools/opencsd/opencsd_git.bb b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
new file mode 100644
index 000000000..0c3b4837d
--- /dev/null
+++ b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "OpenCSD - An open source CoreSight(tm) Trace Decode library"
+HOMEPAGE = "https://github.com/Linaro/OpenCSD"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
+
+SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
+SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
+
+EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
+                CROSS_COMPILE='${TARGET_SYS}-' \
+                CC='${CC}' \
+                CXX='${CXX}' \
+                LINKER='${CXX}' \
+                LINUX64=1 \
+                DEBUG=1 \
+                "
+
+do_compile() {
+    ( cd ${S}/decoder/build/linux; oe_runmake ${EXTRA_OEMAKE}; cd - )
+}
+
+do_install() {
+    ( cd ${S}/decoder/build/linux; oe_runmake PREFIX=${D}/usr install; cd - )
+}
-- 
2.17.1


