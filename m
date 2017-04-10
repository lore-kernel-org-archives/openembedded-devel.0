Return-Path: <andrej.rode@ettus.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id CF0B6607A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Apr 2017 21:31:31 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id c198so27856092pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Apr 2017 14:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=kqIZPRdFgPtlf2jMH9WwbJtm23ZMUMrt4daxZ1G9Ld4=;
	b=XdwWUk/KuW74DhlgJEiCCiubjzeewIuNsW3xnae8Rj2Ur2J6AjVj8ghDYTosLO8jBJ
	UABddPp0dUBjv/hKXlWu+V/kCNGBrs2rn6qyW+XsSlTJtWhQeRe5ZLwvMOgGqiCvojp8
	3yZnLwgxA7LeOU1td250Cen1gseKpEmqgCKR+ALiIRUiZe1/GIenvG2sj1ZMaa8w+SWr
	XKfxhdWxHzgrHWuilqVtebTvM6D1CjwEdNBqYDmGuPaudBbonx48a3T8utCorhY4fQKN
	OpOX7tpa2SGmmpK1FDHDOdjMWgcn7uffyx7fGDYB2wyU+NK/MCjP5xPHPNbObR8C46jN
	l1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kqIZPRdFgPtlf2jMH9WwbJtm23ZMUMrt4daxZ1G9Ld4=;
	b=NvUBkFctChrNeNQ/te2D/+83l2M5qN6YDt4aneR+ubhju7D5WOS3k+3KSEPT1QmXIO
	af5H3423vT8xBVjASs0dBB45F57W/8FpD53mMgQcSQMw++pcmd8hl/KCmz3WllyP09aQ
	eZa38ZNPislft85WHlutukNrockLOX7hooUE5EdjN9ut6VQEXWjShl//0xGZDzANLGw5
	TLrWcODZvpDhTva7YqLZkO1OKv4rZtPnFuhazB5S56CbrjN1S2Q1g617ynWMxmkXnHmk
	Sa4RV0Yl+4I810S5SVTzBRzyKo48RGq4Rzxy9ZBzz86QAsQScBLb/vLkGyR0xPq3Wn8/
	eMzQ==
X-Gm-Message-State: AN3rC/51yDD6Tywc744POk/9ZlVky9LUokkxWMGSJq2CzzmtxVmcttlisJh1ayi1sRd+w4ga
X-Received: by 10.99.148.26 with SMTP id m26mr834846pge.92.1491859892846;
	Mon, 10 Apr 2017 14:31:32 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id d1sm26395336pfa.5.2017.04.10.14.31.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Apr 2017 14:31:32 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Apr 2017 14:31:19 -0700
Message-Id: <20170410213119.18504-1-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH v2] systemd-python: add a new recipe
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
X-List-Received-Date: Mon, 10 Apr 2017 21:31:32 -0000

Adds new recipe for python-systemd, python bindings for libsystemd

Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
---
 meta-python/recipes-devtools/python/python-systemd_234.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-systemd_234.bb

diff --git a/meta-python/recipes-devtools/python/python-systemd_234.bb b/meta-python/recipes-devtools/python/python-systemd_234.bb
new file mode 100644
index 0000000..4eb2170
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-systemd_234.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Python interface for libsystemd"
+HOMEPAGE = "https://github.com/systemd/python-systemd"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
+
+PYPI_PACKAGE = "systemd-python"
+DEPENDS += "systemd"
+RDEPENDS_${PN} += "systemd"
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
+SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
-- 
2.10.2


