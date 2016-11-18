Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E3D2971A00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:06:21 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id l20so16059907qta.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 18:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+1xwzKHqD0bAU8zbjMe9kff7M3qHswJYSLJaKpyiAvw=;
	b=l7tvYfhQVAljW7yVSDzfUJv7hlxY72Xlu/dyrKcZgPNNQM/Djh4CgOIhL9dHegZGTk
	Yz2rtd1lU2VXe7vneV9mf0J18v2qRf6ohrIDzD2Yg25TUXfcT/q9rwiHybm95a0CBiOG
	1yZwqZtxbmkk5Cv504R7D2Fo16LQWsR+lHyKnch3uyAzcnx87jnjYn5Pzx/oHyNuf1i6
	sxcmAVFxQGv6QWMxhU3s4J3cSnvqVMiQgIZBDshCbUzLlTfVyz3L7DBsC5ZvximD8vAQ
	fsazN0aVGBWde1/ZStdGzfDSWyX3dqqlVUDfiHWC7YvRgy20ayV86FK9ofknVjELhLad
	O12Q==
X-Gm-Message-State: AKaTC02dwGvDnms5AHtBW2z+VBuQawElDg7sss15Ef2B3z9uDwHA44OA9O3c8+49WWPC2A==
X-Received: by 10.237.37.202 with SMTP id y10mr4694228qtc.211.1479434782509;
	Thu, 17 Nov 2016 18:06:22 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	y44sm2917806qtc.45.2016.11.17.18.06.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Nov 2016 18:06:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Nov 2016 21:05:51 -0500
Message-Id: <1479434751-30188-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyserial: update to version 3.2.1
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
X-List-Received-Date: Fri, 18 Nov 2016 02:06:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyserial.inc               | 4 ++--
 .../python/{python-pyserial_3.1.1.bb => python-pyserial_3.2.1.bb}     | 2 ++
 .../python/{python3-pyserial_3.1.1.bb => python3-pyserial_3.2.1.bb}   | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyserial_3.1.1.bb => python-pyserial_3.2.1.bb} (51%)
 rename meta-python/recipes-devtools/python/{python3-pyserial_3.1.1.bb => python3-pyserial_3.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index a4c7728..c7ab5b4 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -10,7 +10,7 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-stringold \
 "
 
-SRC_URI[md5sum] = "2f72100de3e410b36d575e12e82e9d27"
-SRC_URI[sha256sum] = "d657051249ce3cbd0446bcfb2be07a435e1029da4d63f53ed9b4cdde7373364c"
+SRC_URI[md5sum] = "7142a421c8b35d2dac6c47c254db023d"
+SRC_URI[sha256sum] = "1eecfe4022240f2eab5af8d414f0504e072ee68377ba63d3b6fe6e66c26f66d1"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyserial_3.1.1.bb b/meta-python/recipes-devtools/python/python-pyserial_3.2.1.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-pyserial_3.1.1.bb
rename to meta-python/recipes-devtools/python/python-pyserial_3.2.1.bb
index ad2b350..91a0f26 100644
--- a/meta-python/recipes-devtools/python/python-pyserial_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyserial_3.2.1.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-pyserial.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-importlib"
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.1.1.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyserial_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pyserial_3.2.1.bb
-- 
2.7.4


