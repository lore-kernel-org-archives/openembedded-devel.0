Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id A6C3673724
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 14:00:18 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id a108so29840803qge.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 06:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=gM16zO8DfIp/I2ag807ZCryv79851PyzvlUhUdTwcHA=;
	b=ZJWGpNw7UxNnDFgEJRTvX8SSyKqTNBpF7wOxHxNu9w34Elpdi7EqgXGLjsDo82y2/z
	/7dKEfE+nrXvBz7aa91bnVMCE9LGKiUmz9exBdcAJ5HCDWbzbB/Bjm5LQirmdbLf64iA
	zK7dgFZ7ZAzsMPShpiC8GlKBPrMaPX1trAmyyOuDNbCI1JbiCuJpaAdN6/C99AhwWq/R
	88XRigV3jP93OGCq+4t4GdAGelBVOyN5evYF5HZBPTOEkExqj+sFcUiah6eh0rPY05LV
	RpHkHnrP2aTgnUPRj04SmAIX6z8fTQZxHvgf7mgWNVaxZgMDTQFzIb/c7QtAZG+NWu/e
	jVsg==
X-Received: by 10.140.232.6 with SMTP id d6mr36169317qhc.99.1424786418758;
	Tue, 24 Feb 2015 06:00:18 -0800 (PST)
Received: from mario.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id w8sm725588qge.25.2015.02.24.06.00.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Feb 2015 06:00:18 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Feb 2015 10:59:57 -0300
Message-Id: <1424786397-5616-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-python][PATCH] python-urllib3: add recipe for version 1.10.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Feb 2015 14:00:22 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../recipes-devtools/python/python-urllib3_1.10.1.bb    |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb

diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb b/meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb
new file mode 100644
index 0000000..89f7428
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
+HOMEPAGE = "https://github.com/shazow/urllib3"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3be3707c5f24a69709682265e29566fe"
+
+SRC_URI = "https://github.com/shazow/urllib3/archive/${PV}.zip"
+SRC_URI[md5sum] = "73935fe42b6ef51d078edbbca7c1bd55"
+SRC_URI[sha256sum] = "5fadd55b46bf826e46a482bb3d53662a8a88d8f9ea8656e351b659b8ad9bfc0f"
+
+S = "${WORKDIR}/urllib3-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-netclient"
-- 
1.7.10.4


