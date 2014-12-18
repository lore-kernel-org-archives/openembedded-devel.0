Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id AE73D727D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:20:05 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so1453569wgh.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0ZoqcI1gYZ1LGzqECu+BuejQ4lwGQxRQm8IkIBpPW6Y=;
	b=fQd+SeWI4/NQyw4TYdNmmugMkyp/M46NObaLa+IBRKxars6WaBXWz2IKIpS7Jncflz
	CoW8ipVODNjpSBosgETkcIgR3cTZecaa5dxeYzzMViXwjpikgpfYqYiWzHUAllAffCzI
	AZ850HDcpI4LC4o6Qf9mkTFPP8Wz9Qnl5CQk60OPAQKcNPU/CVOG2fLERgRQOIhFiTKe
	L/OTty6B+5j7WbuoRxbWq5+l9EKYoqgdX+lygHBAnauwJx/deh/uD5uVEjbNDhwyzDK8
	GjCNXi/5XTIPXpG0782Ry1y2k9DV0c3VsnmzVhn4qmv8CZtZYSbqYL2c7pJmywKhZhyH
	z+lw==
X-Received: by 10.180.86.38 with SMTP id m6mr4527172wiz.65.1418905198005;
	Thu, 18 Dec 2014 04:19:58 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pl1sm9769708wic.16.2014.12.18.04.19.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:19:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:19:47 +0100
Message-Id: <1418905190-27541-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.0
In-Reply-To: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418905190-27541-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH 5/8] python-prettytable: import from meta-openstack
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
X-List-Received-Date: Thu, 18 Dec 2014 12:20:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-prettytable_0.7.2.bb             | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb

diff --git a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
new file mode 100644
index 0000000..fdc13eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -0,0 +1,25 @@
+# Imported from git://git.yoctoproject.org/meta-cloud-services
+
+SUMMARY = "Python library for displaying tabular data in a ASCII table format"
+HOMEPAGE = "http://code.google.com/p/prettytable"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
+
+SRCNAME = "prettytable"
+
+SRC_URI = "http://pypi.python.org/packages/source/P/PrettyTable/${SRCNAME}-${PV}.zip"
+
+SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
+SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+do_install_append() {
+    perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
+    for f in $perm_files; do
+        chmod 644 "${f}"
+    done
+}
-- 
2.2.0


