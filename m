Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 499EA71B2A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 May 2017 00:40:31 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id x64so44719977pgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DanITqHEsLs9JMjoHL773BWN+V7+PBR1u7Sa9LSeFsE=;
	b=VVXdC3MWq5/dbP4qv9zrH6q6FaUJ38VOXftmn0GTmrIH1avGdWvkFDlRk1STryaQVQ
	nbjKhs7MuCbUl4kC1CEbNJV2Sp1upJ8tvvm0QWfvX2XNhLnpw0KVwO5r6SBSN1Io4hO5
	O/MTwF7VXKD7fl5I1S2QDdxYPmWmBXnMnx0kx2kiDrn7R8EMwtWPWCv2Z4+FypdYbhmJ
	T+g7lgdnXEO9sxxssAZMpQaAHU8H1Yt7u/fwY0KhDG3F6TEFQXzBGm9Pd44ZGKeoskwh
	BmVnjE4yxc+qgONB9iCHvzkwWSgEohLZWKNWIWFpNQ2G2Uc8by/QcNRpCvCTzlUGsdis
	f7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DanITqHEsLs9JMjoHL773BWN+V7+PBR1u7Sa9LSeFsE=;
	b=Iqa30os9RBdjDEATDU+ZAfn6fIDoeclYmVVBm1Eb8ES/mM0bIp7oAZe2yxx5muz/x1
	nxTT8/mV82bVZzFk3dzWvzvSyEGJ+Giln2BrpRgDgqUPR9nTRmpgS6syFp8J4159pxam
	rpOkVnfA/govAsHi7UNSaUFRDM0BDw7l90mqyLjp3jsDn90DdxZ8znbNyxgBTteTYOMj
	6YtstsfoTXFHjixH1VMLUdImtepvzI74E0jnN/Qj6tY4NhpHb7OuwzRfJbqaWOCbKtgo
	/EmHIqQdf03p86GZr0oPZF+TNEW12dX7LS44+P4hhoc05RIDBcpxUFy5i4AhgEEUCzMO
	OGuQ==
X-Gm-Message-State: AODbwcDAaIwxt61506gqRhaaSM6i2yxZhZsj3/E8OkhVF6lQytyoTkvi
	dULOtXfStdwBMJMH
X-Received: by 10.99.95.88 with SMTP id t85mr13276390pgb.50.1495240833002;
	Fri, 19 May 2017 17:40:33 -0700 (PDT)
Received: from tyrael.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	r73sm16232198pfa.65.2017.05.19.17.40.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 17:40:31 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 17:40:19 -0700
Message-Id: <1495240819-6409-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Cc: tico.timo@gmail.com
Subject: [meta-python][PATCH v3] python-sdnotify/python3-sdnotify: Add new recipe
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
X-List-Received-Date: Sat, 20 May 2017 00:40:32 -0000

python-sdnotify/python3-sdnotify is a pure python implementation for
systemd's sd_notify mechanism.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../recipes-devtools/python/python-sdnotify.inc      | 20 ++++++++++++++++++++
 .../recipes-devtools/python/python-sdnotify_0.3.1.bb |  2 ++
 .../python/python3-sdnotify_0.3.1.bb                 |  2 ++
 3 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-sdnotify.inc
 create mode 100644 meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-sdnotify.inc b/meta-python/recipes-devtools/python/python-sdnotify.inc
new file mode 100644
index 0000000..661ee6d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sdnotify.inc
@@ -0,0 +1,20 @@
+HOMEPAGE = "https://github.com/bb4242/sdnotify"
+SUMMARY = "A pure Python implementation of systemd's service notification protocol (sd_notify)"
+
+DESCRIPTION = "\
+  sdnotify is a pure Python implementation of the systemd sd_notify protocol. \
+  This protocol can be used to inform systemd about service start-up completion, \
+  watchdog events, and other service status changes. \
+  Thus, this package can be used to write system services in Python that play nicely with systemd. \
+  "
+
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc8213e"
+
+SRC_URI[md5sum] = "a182c1ef47e1c6c965771aa3029da16f"
+SRC_URI[sha256sum] = "e69220d4f6cbb02130f43f929350a80cf51033fde47dcb056fbda71e2dff2d5a"
+
+do_install_append() {
+	rm -r ${D}/${datadir}
+}
diff --git a/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
new file mode 100644
index 0000000..39ae3fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools pypi
+require python-sdnotify.inc
diff --git a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb
new file mode 100644
index 0000000..377af12
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3 pypi
+require python-sdnotify.inc
-- 
2.7.4


