Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id C96A675158
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 10:07:52 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id d50so545709qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2018 03:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SupRdxLrnlrE6zbErhwUbUhqIAd7BVG02wljQ0hzPlk=;
	b=j9a0xVUM2d8XTXHCMTtq4F3YS6SzUw7yeRXLLcmSzN7/xgSgmD6/TKoI3FziN2vNlD
	55vNHy61jY9YIwgdIDdOI/2TE8tmuW/x++CXGP5eToYxvnBfSXhhmnSkqHkYczrK8p+n
	D9f+LlaPNkQ8UQlykg5BWskhhmpM3rRZen3IC57jny+Hml13974G5K/Aznn6ulqUafoH
	ZMi6iJ0RiOyf4FvlQ3jmzECCvVmQ3HU7h34yPu491sHYIaov8fFy5a8BIKinAQHqvPJv
	eK8F+5kFp/Nw1wwQEjwvgrCMsJwb9tKggfThfEJQdhvA38nf7wf+xUXg+M8nK877kHFN
	djnw==
X-Gm-Message-State: ALQs6tDrBt9Jy5MUBXdXdSfQ1g3RGTZtXSKVurrPWBtfsBWDeDCuKs+S
	K9o6VTTo9P2t9P1Eg73QTHNz7MQz
X-Google-Smtp-Source: AIpwx4//vGk/eegZHn3qytiSQW2yi7S/p+GH5Fur4QU0kD3YTVkWSIIOowCbBsVPOqMs8xN/iq772w==
X-Received: by 10.200.0.158 with SMTP id c30mr38827680qtg.336.1523009273216;
	Fri, 06 Apr 2018 03:07:53 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id k43sm8026410qtc.5.2018.04.06.03.07.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Apr 2018 03:07:51 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Apr 2018 11:07:49 +0100
Message-Id: <20180406100749.30058-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-pybluez: add python3 version
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
X-List-Received-Date: Fri, 06 Apr 2018 10:07:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This was missing so far.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../recipes-devtools/python/python-pybluez.inc        | 17 +++++++++++++++++
 .../recipes-devtools/python/python-pybluez_0.22.bb    | 19 ++-----------------
 .../recipes-devtools/python/python3-pybluez_0.22.bb   |  2 ++
 3 files changed, 21 insertions(+), 17 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pybluez.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pybluez_0.22.bb

diff --git a/meta-python/recipes-devtools/python/python-pybluez.inc b/meta-python/recipes-devtools/python/python-pybluez.inc
new file mode 100644
index 000000000..ed72716b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pybluez.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "Bluetooth Python extension module"
+HOMEPAGE = "http://karulis.github.io/pybluez/"
+SECTION = "devel/python"
+
+RDEPENDS_${PN} = "bluez5"
+DEPENDS = "bluez5"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
+
+inherit pypi
+
+SRC_URI = "https://pypi.python.org/packages/c1/98/3149481d508bee174335be6725880f00d297afebe75c15e917af8f6fe169/PyBluez-0.22.zip"
+SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
+SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
+
+S = "${WORKDIR}/PyBluez-${PV}"
diff --git a/meta-python/recipes-devtools/python/python-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
index eab9c5420..3158f4b64 100644
--- a/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
+++ b/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
@@ -1,17 +1,2 @@
-DESCRIPTION = "Bluetooth Python extension module"
-HOMEPAGE = "http://karulis.github.io/pybluez/"
-SECTION = "devel/python"
-
-RDEPENDS_${PN} = "bluez5"
-DEPENDS = "bluez5"
-
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
-
-inherit pypi setuptools
-
-SRC_URI = "https://pypi.python.org/packages/c1/98/3149481d508bee174335be6725880f00d297afebe75c15e917af8f6fe169/PyBluez-0.22.zip"
-SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
-SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
-
-S = "${WORKDIR}/PyBluez-${PV}"
+require python-pybluez.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
new file mode 100644
index 000000000..9712a7608
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
@@ -0,0 +1,2 @@
+require python-pybluez.inc
+inherit setuptools3
-- 
2.16.2


