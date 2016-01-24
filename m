Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDEC770C9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:03 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id 6so8254099qgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=v/w9kjhENxPAGF5k3zCkRM6F92pVdGnLP9zHnfbksGc=;
	b=SKNPhA/Kt30swMjwo25wOVGqik8EQ+D8yMIEFRoNsNKkqWGcytfWImak4t2TcdSdkY
	t4ojegXSw495u9/9XhOjTTbZXjRozEAdswrPCJMKyu80rrF0OwRbhk4DDiYiTiNZ/VAb
	r/33lzUcWlG67GY7RczkYvUoklPeL9PEh5BI+/8O/FQDhSvDHV3UliUxw+TO6XTGGpf4
	QdHb5D84ApqBnivgX6kHIQnGRV4SPVwHSgIJYkygiG42/pBpMdX7Vs3ldqG3MlrAq5pF
	dFz3VVx2oPR0vOtf5UAhD6ZUNyyv1p4MwAMm7MVNQ+eZHf9tLfcitxB/vXtgtw02MjXO
	VmRA==
X-Gm-Message-State: AG10YOQkE4UKSmZ1psyFh1sokq3Nz4hf3Cgg0GkiXmWS7wRkF2mpYYUkie54GKXTWd/IOw==
X-Received: by 10.140.97.2 with SMTP id l2mr15175910qge.30.1453641483945;
	Sun, 24 Jan 2016 05:18:03 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:40 -0500
Message-Id: <b3d60406238ad674fe140d551aae678d0b0c6545.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 07/13] python-pyserial: update to 3.0.1
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
X-List-Received-Date: Sun, 24 Jan 2016 13:18:03 -0000

---
 meta-python/recipes-devtools/python/python-pyserial.inc   | 15 +++++++--------
 .../{python-pyserial_2.7.bb => python-pyserial_3.0.1.bb}  |  0
 ...{python3-pyserial_2.7.bb => python3-pyserial_3.0.1.bb} |  0
 3 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyserial_2.7.bb => python-pyserial_3.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyserial_2.7.bb => python3-pyserial_3.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index 0fd6747..fb87969 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -1,19 +1,18 @@
 SUMMARY = "Serial Port Support for Python"
 SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c557c64905dac5b725980b9505bf8d7b"
-SRCNAME = "pyserial"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0051a0dc811ee3fdb17a2fd0be44f3ad"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+PYPI_PACKAGE = "pyserial"
 
 # FIXME might stop packaging serialwin32 and serialjava files
+SRC_URI[md5sum] = "c8521e49f8852196aac39431e0901703"
+SRC_URI[sha256sum] = "969cb6405d1d87f8960cf9c10f597ae58f85da2fb9769dba96f4aeeaade54656"
+
+inherit pypi
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-stringold \
 "
-
-SRC_URI[md5sum] = "794506184df83ef2290de0d18803dd11"
-SRC_URI[sha256sum] = "3542ec0838793e61d6224e27ff05e8ce4ba5a5c5cc4ec5c6a3e8d49247985477"
diff --git a/meta-python/recipes-devtools/python/python-pyserial_2.7.bb b/meta-python/recipes-devtools/python/python-pyserial_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyserial_2.7.bb
rename to meta-python/recipes-devtools/python/python-pyserial_3.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_2.7.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyserial_2.7.bb
rename to meta-python/recipes-devtools/python/python3-pyserial_3.0.1.bb
-- 
1.9.1


