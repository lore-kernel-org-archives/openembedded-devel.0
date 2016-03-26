Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7413F6FF97
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:23 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id y89so8548789qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ciFV73m3IqlpsnUZ/jfTiRLPLCEmXqQF0Qo/uPnc40s=;
	b=RlfFm97oEssGsaeE8o3RDCSoNzumWYbExH2R9b9n79YjXoNlNODSB2R9UMeYGCM+71
	v6O/OQCfuycRIEItaF1Yvsk+xIbAOAWUDxP7GtMA9g6CwRmjJJlD9ojO5KkunqBysxVw
	B/wabPU4E2Sf/wL0oARPVwMiPBvueqBdGFB1W+lQ49d8Fw2EdbnGRCnyqyveVNVaXJqB
	VKcL/Qd+6lu9R72RiOjRSpRFcpIhcLC3mfNQrzGouGvU6cDy3VofaHRJMPj016RW7BKG
	IeMto0Ww31aj4zZnCTRAIN1dsNrXYHEtTEcoLKXqx3Ffj+22AI3WpxsSPSAc2pWiZ7uq
	0ujQ==
X-Gm-Message-State: AD7BkJIkdY4nGPNMsYYTNlhbnt4EXBsKEc21qsol+vjlOjZHKCUgFd0d0SsMQgZTU0nylg==
X-Received: by 10.140.251.70 with SMTP id w67mr23683880qhc.99.1458997523882;
	Sat, 26 Mar 2016 06:05:23 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:45 -0400
Message-Id: <76049e6eb2c6279cd27161448bdbbb8cdaa6eadf.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 25/30] python-pytest: update to 2.9.1
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest_2.7.0.bb | 10 ----------
 meta-python/recipes-devtools/python/python-pytest_2.9.1.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pytest_2.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb b/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
deleted file mode 100644
index 91b58af..0000000
--- a/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Simple powerful teting with Python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
-
-SRC_URI[md5sum] = "14cde91b1106c937c48497728ea37dc6"
-SRC_URI[sha256sum] = "91dc842785417208d57e5e8dc8bb40f57316c45da24a50c53b49cb8d045519d6"
-
-RDEPENDS_${PN} = "python-py"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb b/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
new file mode 100644
index 0000000..ca53dc4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Simple powerful teting with Python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
+
+SRC_URI[md5sum] = "05165740ea50928e4e971378630163ec"
+SRC_URI[sha256sum] = "0d48d27a127644fbe7c8158157e08b35f8255045d4476df694b91eb3a8147e65"
+
+RDEPENDS_${PN} = "python-py"
+
+inherit pypi setuptools
-- 
1.9.1


