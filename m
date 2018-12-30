Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0E960079
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Dec 2018 16:50:47 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q1so12419037pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Dec 2018 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0TUaZjid8PkrLsJ0akBdaYYQAmZJJDLXUwdfFEgaYZk=;
	b=bEOfoGHqguvUbwH2v+bV2KdctUI2ilBfPmPkEpXF+wi3pKNVljPeiP+enrrUau7NnO
	RojgAsvIbiqyONgjfQaV4WOHVsGjY6e1bX2xJU5TAjBhLKJGz1sw7RuJkTKzqaOfDxLN
	wsGg7ZcqvvWSbi4LPFQf38msogcVxrw5idluU53vG1sjDbZjOVXKdPjDvfE29ss60nb/
	HMXKg98yGjm80QjLMYpwGsOStjIhY4TaEeNxJ05V/yKDlsg/gLinoPTSDPbNhM5as34z
	2qK9s6KDdepDDD0fPiS4JdHD93w6iKFT8E/es8Kgf/FeDQX1y+zqjDVZfk/f9bFSkVCc
	yZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0TUaZjid8PkrLsJ0akBdaYYQAmZJJDLXUwdfFEgaYZk=;
	b=nUnJeZdHXjKdTp0cPT0koGY1U0SPMtsagSb02NMjz0RHF1S7LrXIWqLRRkEVS2FWvF
	IVARdW09A2m3yobi2EVlPvHhBpsMea9M4xiBOn8CHxzADqBgzXbW6zWKcRDOdK0OlAH1
	tXjil0kz1hGZuavnzi5UayKiSfnsBZVRPDCi/hSZKbsW3alxpyhM5LpkPLx6xExyx/mk
	vWYyqhc6UxcJrpX3UBSWDDDqDXbkMFwcmWK+a+ineeqzl/FfRSfij2faiLROPfEmKOYM
	m0olcAWNqNHuKwBzFFGigrS1M/5RHqgPbu753vHVVnpFfTmTnP4pZUWmhOcOR2iWSJvk
	OcNA==
X-Gm-Message-State: AJcUukclYLZ8PHBGnQ5vDSY/d1FIgqamrQF3bthBI2V1o6O0PnhSyaaI
	Y+xFQTVeH68gug28tc2/sEo8+eHpUp8=
X-Google-Smtp-Source: ALg8bN4Na55EZxl+DRMyX+Otbh55PwMbu+X3kUn2OyW39SqQhn/Uxvbs1CRL+FZud6m3XA/PyaELFQ==
X-Received: by 2002:a63:960a:: with SMTP id c10mr4941225pge.106.1546188648519; 
	Sun, 30 Dec 2018 08:50:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::9c8c])
	by smtp.gmail.com with ESMTPSA id
	w5sm59111465pfn.89.2018.12.30.08.50.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Dec 2018 08:50:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Dec 2018 08:50:31 -0800
Message-Id: <20181230165033.8850-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Peace Lee <iipeace5@gmail.com>
Subject: [meta-oe][PATCH 1/3] guider: add a new runtime profiler package
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
X-List-Received-Date: Sun, 30 Dec 2018 16:50:48 -0000
Content-Transfer-Encoding: 8bit

From: Peace Lee <iipeace5@gmail.com>

guider [1] is a system-wide performance analyzer for platforms based
on linux kernel. it can measure vary system resource usage and
trace thread/process activities. and it reports vary meaningful
output to analyze system status.

[1] https://github.com/iipeace/guider

Signed-off-by: Peace Lee <iipeace5@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/guider/guider_3.9.3.bb   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.3.bb

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.3.bb b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
new file mode 100644
index 0000000000..96d6c62ae2
--- /dev/null
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
@@ -0,0 +1,34 @@
+SUMMARY = "runtime performance analyzer"
+HOMEPAGE = "https://github.com/iipeace/guider"
+BUGTRACKER = "https://github.com/iipeace/guider/issues"
+AUTHOR = "Peace Lee <ipeace5@gmail.com>"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
+
+SRC_URI = "git://github.com/iipeace/${BPN}"
+SRCREV = "ac05a2ce0ab480957d642d947d8f617bd224031d"
+
+S = "${WORKDIR}/git"
+R = "${RECIPE_SYSROOT_NATIVE}"
+
+inherit distutils
+
+GUIDER_OBJ = "guider.pyc"
+GUIDER_SCRIPT = "guider"
+
+do_install() {
+    python ${S}/setup.py install
+
+    install -d ${D}${bindir}
+    install -v -m 0755 ${R}/${bindir}/${GUIDER_SCRIPT} ${D}${bindir}/${GUIDER_SCRIPT}
+
+    install -d ${D}${datadir}/${BPN}
+    install -v -m 0755 ${R}/${datadir}/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
+}
+
+RDEPENDS_${PN} = "python-ctypes python-shell \
+                  python-json python-subprocess"
+
+FILES_SOLIBSDEV = ""
+#FILES_${PN} = "usr"
-- 
2.20.1


