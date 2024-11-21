Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C423D78762
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 14:13:53 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.11567.1732198432244773856
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 06:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e04og+CJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82A6B60008;
	Thu, 21 Nov 2024 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732198429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+3N0hqmIfxGWh4o7JqpeN3QhczoUwdY9gQjrYejczGg=;
	b=e04og+CJIFpKToHc2xAyu/zWbS3mFn3c7BXDMAnB1ZVRNOZl28HCMEj9cjgce0ZxpAaDzG
	aooNeuObdy9x9mL+F0LsIGRtX5T2o8YXj87isF5TRSvBNbCupUcreyzUQQ0ivhagfv1b9U
	327nPrs9HTtt1kpG/KtrCkK7LPOdS0Rl7bZ5f9JUhmAV3g5lP5FXR5kXzzjB5k3BwakTZ5
	+/e8pgbCgXGi4R0imVaoPCpCS1MZTpmAs86UFT+wrS8YUJOrS0EGuhBrSHuq6rDBh4GImC
	Xs6vWKRHR/+bciU9OqMNn2DkLxR1zYYYMW5XeLqK8INZg2sJwec0bsNsg+tfBQ==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-python][PATCH] python3-mlcommons-loadgen: add a recipe for version 4.0.1
Date: Thu, 21 Nov 2024 15:13:47 +0100
Message-ID: <20241121141347.365171-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 14:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113972

From: Thomas Perrot <thomas.perrot@bootlin.com>

The LoadGen is a reusable module that efficiently and fairly
measures the performance of inference systems.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python3-mlcommons-loadgen_4.0.1.bb        | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.0.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 8ee1cdc10152..8daf5894a53c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -236,6 +236,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-mccabe \
     python3-meh \
     python3-meld3 \
+    python3-mlcommons-loadgen \
     python3-mock \
     python3-monotonic \
     python3-mpmath \
diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.0.1.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.0.1.bb
new file mode 100644
index 000000000000..06eedaea5216
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_4.0.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "MLPerf Inference LoadGen python bindings"
+DESCRIPTION = "The LoadGen is a reusable module that efficiently and fairly \
+               measures the performance of inference systems. It generates \
+               traffic for scenarios as formulated by a diverse set of experts \
+               in the MLCommons working group, to emulate the workloads seen in \
+               mobile devices, autonomous vehicles, robotics, and cloud-based \
+               setups."
+HOMEPAGE = "https://mlcommons.org/"
+BUGTRACKER = "https://github.com/mlcommons/inference/issues"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=1;endline=14;md5=2c6e34309ef8d57d59ce119f63bc1b76"
+
+DEPENDS = "python3-pybind11-native"
+
+inherit setuptools3 pypi
+
+PYPI_PACKAGE = "mlcommons_loadgen"
+
+SRC_URI[sha256sum] = "0e7059b289ea2aabb3e9ad1179bbce89703294570ee59c07cf30d52f1b38f732"
+
+# Because the pyproject.toml contains invalid requirements.
+INSANE_SKIP += "pep517-backend"
-- 
2.47.0


