Return-Path: <prvs=1507a981f=alistair.francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id CAD897EA65
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 17:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568223471; x=1599759471;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=1V6MpztfDEQ8njRcvJ97QQVRLWaL56klcFZtforvcTY=;
	b=KQc7LsfI+e04p1aeQdr/8qIHtBNgdSJR8gjbfqPNqjqKiphD/bsDj5Gv
	DizaETKO0syxKoeLjrGCcE5rqCUTocVxgPn2lHrtZ632eZc3lJvhbP4D5
	12WDoTlu7PpsoanV3i+2tG0mGSEYvE/XGBoNeKYHji1IypjyTdeayWS9j
	8PKzsxbT1KetKimQljreQFYdEfNBwpuWABW1r+Q4LnhlRWDRCugea1wxP
	s6KW89EfhfzXpf08erC2aG4sZYqYPVtcnSJloupdgI10Mo3LwIGvr+Ep0
	gzER2QxqfDgOat2/cLET2LBYF0PxoVU4LCfLwH7xoJHFZEeYYK3lMJcCx A==;
IronPort-SDR: L+TmMji+8191TBbchYb+LrrwAHjiYooCrNfNOM4iU/7jfF8w741MQ2Rnej894WsZKY492EWiXA
	M7d2c4lwCMNfgg9IemwDJHC9v6rxrfdjNVeIK13i2sPyFdEdWb5jod3KdIb0xIR4deJauo67QA
	9eb1Bn1tNKdiRnqWzfk6xNxMWp1EZpJaPl0yn7N1A8sRBADGgp5aajDxhcLG3Pgx1RxX7dsRoV
	1WmYsKraja2XPdjYIPH8YQalsW9xozLHH7jZkVq6qjr7K0iEslOvWkZ47l8A5IvbkoZFvI9KoE
	BhY=
X-URL-LookUp-ScanningError: 1
X-IronPort-AV: E=Sophos;i="5.64,494,1559491200"; d="scan'208";a="218717327"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2019 01:27:55 +0800
IronPort-SDR: F/HSQgu8a/BQEjU/83ifv//V3AyqYNhNWehfDActXOXUuJ31EmiI8nsey6qb1UwvjPqrW7k8JR
	QmKMFI+uWMj+mxA/qGGrkQVItD8uowt4/iuxoPkbHiTmJrFzkmBgAC1+o1gV8m8Zg4hP8V8s6C
	AF1xpRfzzdzHbs5q+K2hgQbn2dbOEtupXc5qZJPA2WMchR8DqVSqRQbFVYhzCIG5vg3ELHqXfY
	eYtVxh9tB+FpDvoQobiXJ8ACaX8C09SoeHmgR/yHHPlU8fy29TEpdlM3GzYpPwlMTwbGufesIJ
	x000INxSAMGaPf9WueBbOiXO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 10:24:26 -0700
IronPort-SDR: qKhTuYrCrtRaAU9lGXQlt+ItozztxfnjXMo2jkWAZsW9OE4UYJz/YLS44kAlwDlIPf1Sg9DK4e
	69G5/FsCvZE76HlbruWWZAbU0ee531SxUmJl3aa6NSpXycJDaIzUWO8BG+heJwm6awJ2U8qd57
	G1Y8sgpTzthlo023OzXh7V15Wg2hpkcOwqbv2MA6FVRhega48Fmk+v0gF8VnedLMttSUrX5DWN
	3ajftbpnH0LSPxabp2GSNp3fbPGnKYGvObqJb2GlUa1JG6J+03tmQFBInR2GMp6dHk5QW9VQs6
	jD0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 11 Sep 2019 10:27:41 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Sep 2019 10:23:38 -0700
Message-Id: <20190911172339.11778-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] python3-requests-future: Initial commit of 0.9.5
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
X-List-Received-Date: Wed, 11 Sep 2019 17:37:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python/python3-requests-futures_0.9.5.bb       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb b/meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb
new file mode 100644
index 000000000..b94929d8c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Small add-on for the python requests http library. Makes use of python 3.2’s concurrent.futures or the backport for prior versions of python."
+HOMEPAGE = "https://github.com/ross/requests-futures"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e1e50798d0afe0e1f87594c6619a2fa5"
+
+SRC_URI[md5sum] = "e20dc6f063c70888a7f8225e349b6682"
+SRC_URI[sha256sum] = "33aa8a3b7892850701707d7e094b1e1ce7c4f7a36ff2a1dcc2da4e01a1a00f7e"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    python3-requests \
+"
+
-- 
2.23.0


