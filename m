Return-Path: <alistair23@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 227126B06C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 04:50:07 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id bg8so434713plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 21:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qhx1qZXauve7Bg8CsUi213SROuiPG11HJvA6uWDdwDI=;
	b=Bjn0Nx68o6SCjhlx7QLYRdHOX3fMwbdw0GsFcCdXROrX1PtOjPaLdTV3LCKel21I7G
	o/rg7qxB948MGFc1GNxKwqqu2MinCWJtB1pRzcHnm+LPycIky080DLxltw/Qkh2Ec3HV
	ulilBUPe6HoRpizGYLpfO1vum4WK4HHknhPktRyFoLO1wDISxnb4BgcYGN5lAFZDxm8j
	DZJ/kPNN0pOZ2thqCU6lWJvH0h/GZoWIYHWxFYVGD8Kb3vbmesnvPhH2FMy+eFFmMLYA
	eA3goFRmkrOpgqvb2TI4thbrL9TzaZLzIj2rkMVS0XIhvuaqI2sCqEnU/txKo7pCMKxo
	YP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qhx1qZXauve7Bg8CsUi213SROuiPG11HJvA6uWDdwDI=;
	b=Y3kvKWj7s0nygzRwV+5DyrMEoZ70llmNMWUk6CHPj9M0fuprtbNX8E9B1Ho8TWCHaN
	O8FCV/C3duHtupNlhCQSfTtGlBP4c8bxdxu0QgyIAN6RUbaaQBz4fJcf25qg6wwLSYWB
	Vg09uZOmI8L+8031ifqk9ae/JFT/IzBF2QRGeHmIqMOSb7b82+d7VuGjWQTYkMJOA118
	yHOrqVSDvNXxFqcc8dBTra/0ND+SmVfvVnMToEW4m7Q6cj5/qjQvQK5OB06l6N4WPbnV
	9dOivmOlxX1pQvWMrLwbIAa/2HflxS7t+vfRyUNmeFHCRmUv1HyFIzk5ujY/xlJMj5DC
	q37w==
X-Gm-Message-State: APjAAAX8qfa1ZjbrCMVJ5N0HIGdFUstxM9CkG5dsbptJbb4YIv6ICsU+
	cL9wL6Zo8lh6UO55Xz4wu5J25p7r
X-Google-Smtp-Source: APXvYqyKELMhARtYJlGotmzsDygnnp8SLT6LX4guWmXRkrpFMypwd6/q2tgDKaOChHfUAoUX2dGSIg==
X-Received: by 2002:a17:902:7e0f:: with SMTP id
	b15mr44271701plm.124.1553835008133; 
	Thu, 28 Mar 2019 21:50:08 -0700 (PDT)
Received: from alistairs-fedora-xps14z.alistair23.me
	([2601:646:8e00:37b2:f489:66be:93d0:139b])
	by smtp.gmail.com with ESMTPSA id
	z77sm1156991pfi.155.2019.03.28.21.50.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Mar 2019 21:50:06 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Mar 2019 21:49:56 -0700
Message-Id: <20190329044956.32426-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] meta-python: Initial commit of Python3 OBDII module
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
X-List-Received-Date: Fri, 29 Mar 2019 04:50:08 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta-python/recipes-devtools/python/python-obd.inc       | 9 +++++++++
 meta-python/recipes-devtools/python/python3-obd_0.7.0.bb | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-obd.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-obd_0.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python-obd.inc b/meta-python/recipes-devtools/python/python-obd.inc
new file mode 100644
index 000000000..f2caf6491
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-obd.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "A python module for handling realtime sensor data from OBD-II vehicle ports"
+HOMEPAGE = "https://github.com/brendan-w/python-OBD"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README.rst;md5=2988a5e913eb105fa08011135c4157d4"
+
+SRC_URI[md5sum] = "93e04f825e13b7ebc97d06b6a6407807"
+SRC_URI[sha256sum] = "4b1bac95df2faac571ebf444778e4d736d050d8ed7049023c0fc929a520eba6d"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.0.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.0.bb
new file mode 100644
index 000000000..578e38d3a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-obd.inc
-- 
2.20.1


